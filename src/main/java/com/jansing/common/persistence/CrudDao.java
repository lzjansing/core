package com.jansing.common.persistence;

import java.util.List;

/**
 * Created by jansing on 16-11-6.
 */
public interface CrudDao<T> extends BaseDao {
    T get(String var1);

    T get(T var1);

    List<T> findList(T var1);

    int insert(T var1);

    int update(T var1);

    int delete(T var1);
}
