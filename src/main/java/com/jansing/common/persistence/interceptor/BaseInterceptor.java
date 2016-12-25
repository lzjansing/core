package com.jansing.common.persistence.interceptor;

import com.jansing.common.config.Global;
import com.jansing.common.persistence.Page;
import com.jansing.common.persistence.dialect.Dialect;
import com.jansing.common.persistence.dialect.db.MySQLDialect;
import com.jansing.common.utils.Reflections;
import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.plugin.Interceptor;

import java.io.Serializable;
import java.util.Properties;

//import com.tssup.faith.common.persistence.dialect.db.DB2Dialect;
//import com.tssup.faith.common.persistence.dialect.db.DerbyDialect;
//import com.tssup.faith.common.persistence.dialect.db.H2Dialect;
//import com.tssup.faith.common.persistence.dialect.db.HSQLDialect;
//import com.tssup.faith.common.persistence.dialect.db.OracleDialect;
//import com.tssup.faith.common.persistence.dialect.db.PostgreSQLDialect;
//import com.tssup.faith.common.persistence.dialect.db.SQLServer2005Dialect;
//import com.tssup.faith.common.persistence.dialect.db.SybaseDialect;

/**
 * Created by jansing on 16-11-8.
 */
public abstract class BaseInterceptor implements Interceptor, Serializable {
    protected static final String PAGE = "page";
    protected static final String DELEGATE = "delegate";
    protected static final String MAPPED_STATEMENT = "mappedStatement";
    protected Log log = LogFactory.getLog(this.getClass());
    protected Dialect DIALECT;

    protected static Page<Object> convertParameter(Object parameterObject, Page<Object> page) {
        try {
            return parameterObject instanceof Page ? (Page) parameterObject : (Page) Reflections.getFieldValue(parameterObject, "page");
        } catch (Exception var3) {
            return null;
        }
    }

    protected void initProperties(Properties p) {
        Object dialect = null;
        String dbType = Global.getConfig("jdbc.type");
        if ("db2".equals(dbType)) {
//            dialect = new DB2Dialect();
//        } else if("derby".equals(dbType)) {
//            dialect = new DerbyDialect();
//        } else if("h2".equals(dbType)) {
//            dialect = new H2Dialect();
//        } else if("hsql".equals(dbType)) {
//            dialect = new HSQLDialect();
        } else if ("mysql".equals(dbType)) {
            dialect = new MySQLDialect();
//        } else if("oracle".equals(dbType)) {
//            dialect = new OracleDialect();
//        } else if("postgre".equals(dbType)) {
//            dialect = new PostgreSQLDialect();
//        } else if(!"mssql".equals(dbType) && !"sqlserver".equals(dbType)) {
//            if("sybase".equals(dbType)) {
//                dialect = new SybaseDialect();
//            }
//        } else {
//            dialect = new SQLServer2005Dialect();
        }

        if (dialect == null) {
            throw new RuntimeException("mybatis dialect error.");
        } else {
            this.DIALECT = (Dialect) dialect;
        }
    }
}
