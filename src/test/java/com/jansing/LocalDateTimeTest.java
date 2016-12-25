package com.jansing;

import com.jansing.common.utils.LocalDateTimeUtil;
import org.junit.Test;

import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

/**
 * Created by jansing on 16-11-21.
 */
public class LocalDateTimeTest {
    private static final ZoneId defaultZoneId = ZoneId.systemDefault();

    @Test
    public void test01() {
        LocalDate today = LocalDate.now();
        System.out.println(today);
        System.out.println(today.getDayOfWeek());
        System.out.println(today.getDayOfMonth());
        System.out.println(today.getDayOfYear());
        System.out.println(today.getMonth());
        System.out.println(today.getChronology());
        System.out.println(LocalDate.MIN);
        System.out.println(LocalDate.MAX);

        System.out.println("--->throw Exception if out of boundary");
        System.out.println(today.withDayOfYear(365));
        System.out.println(today.withDayOfMonth(30));
        System.out.println(today.withYear(1));
        System.out.println(today.withMonth(1));

        System.out.println("--->withXxx注意，超过最后一天的取最后一天");
        System.out.println(LocalDate.ofYearDay(2016, 31));
        System.out.println(LocalDate.ofYearDay(2016, 29).withMonth(2));
        System.out.println(LocalDate.ofYearDay(2016, 30).withMonth(2));
        System.out.println(LocalDate.ofYearDay(2016, 31).withMonth(2));
        System.out.println(LocalDate.ofYearDay(2016, 60));
        System.out.println(LocalDate.ofYearDay(2016, 59).withYear(2015));
        System.out.println(LocalDate.ofYearDay(2016, 60).withYear(2015));

        System.out.println("--->of月份从1开始");
        System.out.println(LocalDate.of(2016, 1, 1));

        System.out.println("--->相对于纪元的天数");
        System.out.println(LocalDate.ofEpochDay(-2));
        System.out.println(LocalDate.ofEpochDay(-1));
        System.out.println(LocalDate.ofEpochDay(0));
        System.out.println(LocalDate.ofEpochDay(1));
        System.out.println(LocalDate.ofEpochDay(2));

        System.out.println(LocalDate.of(2016, 1, 1).atStartOfDay());
        System.out.println(LocalDate.of(2016, 1, 1).atTime(1, 1, 1));
        System.out.println(LocalDate.of(2016, 1, 1).getEra());

        System.out.println(LocalDate.parse("2016-01-09"));
//        System.out.println(LocalDate.parse("2016/01", DateTimeFormatter.ofPattern("yyyy/MM")));
        System.out.println(LocalDate.parse("2016/01/9", DateTimeFormatter.ofPattern("yyyy/MM/d")));
        System.out.println(LocalDate.parse("2016/01/19", DateTimeFormatter.ofPattern("yyyy/MM/d")));
//        System.out.println(LocalDate.parse("2016/01/1", DateTimeFormatter.ofPattern("yyyy/MM/dd")));
        System.out.println(LocalDate.parse("2016/01/01", DateTimeFormatter.ofPattern("yyyy/MM/dd")));
    }

    @Test
    public void test02() {
        System.out.println(LocalDateTime.now());
        System.out.println(LocalDateTime.MAX);
        System.out.println(LocalDateTime.MIN);
        System.out.println(LocalDateTime.of(2016, 1, 1, 1, 1));

        System.out.println(LocalDateTime.of(2016, 1, 1, 1, 1).minusDays(-1));
        System.out.println(LocalDateTime.of(2016, 1, 1, 1, 1).minusDays(0));
        System.out.println(LocalDateTime.of(2016, 1, 1, 1, 1).minusDays(1));
        System.out.println(LocalDateTime.of(2016, 1, 1, 1, 1).plusDays(-1));
        System.out.println(LocalDateTime.of(2016, 1, 1, 1, 1).plusDays(0));
        System.out.println(LocalDateTime.of(2016, 1, 1, 1, 1).plusDays(1));
        System.out.println(LocalDateTime.of(2016, 1, 1, 1, 1).isAfter(LocalDateTime.of(2016, 1, 1, 1, 0)));

//        System.out.println(LocalDateTime.parse("2016", DateTimeFormatter.ofPattern("yyyy")));
//        System.out.println(LocalDateTime.parse("2016-09", DateTimeFormatter.ofPattern("yyyy-MM")));
//        System.out.println(LocalDateTime.parse("2016-09-09", DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        System.out.println(LocalDateTime.parse("2016-09-09 11", DateTimeFormatter.ofPattern("yyyy-MM-dd HH")));
        System.out.println(LocalDateTime.parse("2016-09-09 11:21", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
        System.out.println(LocalDateTime.parse("2016-09-09 21:11", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
        System.out.println(LocalDateTime.parse("2016-09-09 11:11:11", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
        System.out.println(LocalDateTime.parse("2016-09-09 11:11:11.333", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS")));
        System.out.println(LocalDateTime.parse("20150428060511.095863-000", DateTimeFormatter.ofPattern("yyyyMMddHHmmss.nnnnnn-000")));

        System.out.println(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(LocalDateTime.now()));
        System.out.println(DateTimeFormatter.ofPattern("yyyy-MM-dd HH").format(LocalDateTime.now()));
        System.out.println(DateTimeFormatter.ofPattern("yyyy-MM-dd").format(LocalDateTime.now()));
        System.out.println(DateTimeFormatter.ofPattern("yyyy").format(LocalDateTime.now()));
    }

    @Test
    public void test03() {
//        System.out.println(new java.sql.Time(1));
//        LocalDateTimeUtil.transfer(new java.sql.Time(1));
//        System.out.println(new java.sql.Date(1));
//        LocalDateTimeUtil.transfer(new java.sql.Date(1));
        System.out.println(new java.sql.Timestamp(1));
        LocalDateTimeUtil.transfer(new java.sql.Timestamp(1));
        System.out.println(new java.util.Date(1));
        LocalDateTimeUtil.transfer(new java.util.Date(1));
    }

    @Test
    public void test04() {
        System.out.println(Duration.between(LocalDateTime.of(2016, 11, 1, 0, 0), LocalDateTime.now()));
        System.out.println(Duration.between(LocalDateTime.of(2016, 11, 1, 0, 0), LocalDateTime.now()).getSeconds());
        System.out.println(Duration.between(LocalDateTime.of(2016, 11, 1, 0, 0), LocalDateTime.now()).toMinutes());
        System.out.println(Duration.between(LocalDateTime.of(2016, 11, 1, 0, 0), LocalDateTime.now()).toHours());
        System.out.println(Duration.between(LocalDateTime.of(2016, 11, 1, 0, 0), LocalDateTime.now()).toDays());

        System.out.println(Duration.between(LocalDateTime.of(2017, 11, 1, 0, 0), LocalDateTime.now()));
        System.out.println(Duration.between(LocalDateTime.of(2017, 11, 1, 0, 0), LocalDateTime.now()).getSeconds());
        System.out.println(Duration.between(LocalDateTime.of(2017, 11, 1, 0, 0), LocalDateTime.now()).toMinutes());
        System.out.println(Duration.between(LocalDateTime.of(2017, 11, 1, 0, 0), LocalDateTime.now()).toHours());
        System.out.println(Duration.between(LocalDateTime.of(2017, 11, 1, 0, 0), LocalDateTime.now()).toDays());

        System.out.println(Duration.between(LocalDateTime.of(2016, 11, 21, 17, 0), LocalDateTime.now()));
        System.out.println(Duration.between(LocalDateTime.of(2016, 11, 21, 17, 0), LocalDateTime.now()).getSeconds());
        System.out.println(Duration.between(LocalDateTime.of(2016, 11, 21, 17, 0), LocalDateTime.now()).toMinutes());
        System.out.println(Duration.between(LocalDateTime.of(2016, 11, 21, 17, 0), LocalDateTime.now()).toHours());
        System.out.println(Duration.between(LocalDateTime.of(2016, 11, 21, 17, 0), LocalDateTime.now()).toDays());

        System.out.println(LocalDateTimeUtil.past(LocalDateTime.of(2016, 11, 1, 0, 0)));
        System.out.println(LocalDateTimeUtil.past(LocalDateTime.of(2017, 11, 1, 0, 0)));
        System.out.println(LocalDateTimeUtil.past(LocalDateTime.of(2016, 11, 21, 17, 0)));
    }
}
