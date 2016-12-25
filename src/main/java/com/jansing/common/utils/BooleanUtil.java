package com.jansing.common.utils;

/**
 * Created by jansing on 16-10-29.
 */
public class BooleanUtil extends org.apache.commons.lang3.BooleanUtils {

    public static Boolean parse(String str) {
        return org.apache.commons.lang3.BooleanUtils.toBooleanObject(str);
    }

    public static void main(String[] args) {
        System.out.println(parse("false"));
        System.out.println(parse("False"));
        System.out.println(parse("f"));
        System.out.println(parse("no"));


    }
}
