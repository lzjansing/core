package com.jansing.common.persistence.dialect;

/**
 * Created by jansing on 16-11-8.
 */
public interface Dialect {
    boolean supportsLimit();

    String getLimitString(String var1, int var2, int var3);
}
