package com.jansing;

import org.junit.Test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by jansing on 16-11-22.
 */
public class StringTest {

    @Test
    public void test01() {
        String text = "abcdefg\nabc";
        String reg1 = "abc";
        String reg2 = "cd";
        String reg3 = "";
        String reg4 = "a";

        Pattern p = Pattern.compile(reg1);
        Matcher matcher = p.matcher(text);
        while (matcher.find()) {
            System.out.println(matcher.group());
        }
        System.out.println();
        matcher.usePattern(Pattern.compile(reg2));
        while (matcher.find()) {
            System.out.println(matcher.group());
        }
        System.out.println();
        matcher.reset();
        matcher.usePattern(Pattern.compile(reg2));
        while (matcher.find()) {
            System.out.println(matcher.group());
        }
        System.out.println();
        matcher.reset();
        matcher.usePattern(Pattern.compile(reg3));
        while (matcher.find()) {
            System.out.println("-" + matcher.group());
        }
        System.out.println();
        matcher.reset();
        matcher.usePattern(Pattern.compile(reg4));
        while (matcher.find()) {
            System.out.println(matcher.group());
        }

        System.out.println();
        String text2 = "https://www.taobao.com/market/3c/shouji.php?spm=a21bo.50862.201867-main.13.FMwncO";
        String reg21 = "(?<=/)[^/]+.php";
        Matcher matcher2 = Pattern.compile(reg21).matcher(text2);
        while (matcher2.find()) {
            System.out.println(matcher2.group());
        }
//        System.out.println(text.matches(reg1));
//        System.out.println(text.matches(reg2));
    }

}
