package com.jansing.common.persistence.interceptor;

import com.jansing.common.persistence.Page;
import com.jansing.common.utils.Reflections;
import com.jansing.common.utils.StringUtil;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.MappedStatement.Builder;
import org.apache.ibatis.mapping.SqlSource;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;

import java.sql.Connection;
import java.util.Properties;

/**
 * Created by jansing on 16-11-8.
 */
@Intercepts({@Signature(
        type = Executor.class,
        method = "query",
        args = {MappedStatement.class, Object.class, RowBounds.class, ResultHandler.class}
)})
public class PaginationInterceptor extends BaseInterceptor {
    public Object intercept(Invocation invocation) throws Throwable {
        MappedStatement mappedStatement = (MappedStatement) invocation.getArgs()[0];
        Object parameter = invocation.getArgs()[1];
        BoundSql boundSql = mappedStatement.getBoundSql(parameter);
        Object parameterObject = boundSql.getParameterObject();
        Page page = null;
        if (parameterObject != null) {
            page = convertParameter(parameterObject, page);
        }

        if (page != null && page.getPageSize() != -1) {
            if (StringUtil.isBlank(boundSql.getSql())) {
                return null;
            }

            String originalSql = boundSql.getSql().trim();
            page.setCount((long) SQLHelper.getCount(originalSql, (Connection) null, mappedStatement, parameterObject, boundSql, this.log));
            String pageSql = SQLHelper.generatePageSql(originalSql, page, this.DIALECT);
            invocation.getArgs()[2] = new RowBounds(0, 2147483647);
            BoundSql newBoundSql = new BoundSql(mappedStatement.getConfiguration(), pageSql, boundSql.getParameterMappings(), boundSql.getParameterObject());
            if (Reflections.getFieldValue(boundSql, "metaParameters") != null) {
                MetaObject newMs = (MetaObject) Reflections.getFieldValue(boundSql, "metaParameters");
                Reflections.setFieldValue(newBoundSql, "metaParameters", newMs);
            }

            MappedStatement newMs1 = this.copyFromMappedStatement(mappedStatement, new PaginationInterceptor.BoundSqlSqlSource(newBoundSql));
            invocation.getArgs()[0] = newMs1;
        }

        return invocation.proceed();
    }

    public Object plugin(Object target) {
        return Plugin.wrap(target, this);
    }

    public void setProperties(Properties properties) {
        super.initProperties(properties);
    }

    private MappedStatement copyFromMappedStatement(MappedStatement ms, SqlSource newSqlSource) {
        Builder builder = new Builder(ms.getConfiguration(), ms.getId(), newSqlSource, ms.getSqlCommandType());
        builder.resource(ms.getResource());
        builder.fetchSize(ms.getFetchSize());
        builder.statementType(ms.getStatementType());
        builder.keyGenerator(ms.getKeyGenerator());
        if (ms.getKeyProperties() != null) {
            String[] var4 = ms.getKeyProperties();
            int var5 = var4.length;

            for (int var6 = 0; var6 < var5; ++var6) {
                String keyProperty = var4[var6];
                builder.keyProperty(keyProperty);
            }
        }

        builder.timeout(ms.getTimeout());
        builder.parameterMap(ms.getParameterMap());
        builder.resultMaps(ms.getResultMaps());
        builder.cache(ms.getCache());
        return builder.build();
    }

    public static class BoundSqlSqlSource implements SqlSource {
        BoundSql boundSql;

        public BoundSqlSqlSource(BoundSql boundSql) {
            this.boundSql = boundSql;
        }

        public BoundSql getBoundSql(Object parameterObject) {
            return this.boundSql;
        }
    }
}
