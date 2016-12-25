package com.jansing.common.utils;

import java.sql.Timestamp;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAccessor;

/**
 * Created by jansing on 16-11-21.
 */
public class LocalDateTimeUtil {
    private static final ZoneId defaultZoneId = ZoneId.systemDefault();
    public static final String DEFAULT_PATTERN = "yyyy-MM-dd HH:mm:ss";

    public static String format(LocalDateTime localDateTime, String pattern) {
        if (localDateTime == null) {
            return "";
        }
        return DateTimeFormatter.ofPattern(pattern == null ? DEFAULT_PATTERN : pattern).format(localDateTime);
    }

    public static String formatDateTime(LocalDateTime localDateTime) {
        return format(localDateTime, DEFAULT_PATTERN);
    }

    public static String formatDate(LocalDateTime localDateTime) {
        return format(localDateTime, "yyyy年MM月dd日");
    }

    public static String formatTime(LocalDateTime localDateTime) {
        return format(localDateTime, "HH:mm:ss");
    }

    public static String formatHourMinute(LocalDateTime localDateTime) {
        return format(localDateTime, "HH:mm");
    }

    public static String get(String pattern) {
        return format(LocalDateTime.now(), pattern);
    }

    public static String getDate() {
        return formatDate(LocalDateTime.now());
    }

    public static String getTime() {
        return formatTime(LocalDateTime.now());
    }

    public static String getHourMinute() {
        return formatHourMinute(LocalDateTime.now());
    }

    public static String getDateTime() {
        return formatDateTime(LocalDateTime.now());
    }

    public static TemporalAccessor parse(String str, String pattern) {
        return DateTimeFormatter.ofPattern(pattern == null ? DEFAULT_PATTERN : pattern).parse(str);
    }

    public static TemporalAccessor parse(String str) {
        return parse(str, null);
    }

    public static LocalDateTime transfer(Timestamp timestamp) {
        return timestamp == null ? null : LocalDateTime.ofInstant(timestamp.toInstant(), defaultZoneId);
    }

    public static LocalDateTime transfer(java.util.Date date) {
        return date == null ? null : LocalDateTime.ofInstant(date.toInstant(), defaultZoneId);
    }

    public static String past(LocalDateTime localDateTime) {
        LocalDateTime now = LocalDateTime.now();
        boolean isBefore = localDateTime.isBefore(now);
        LocalDateTime before = isBefore ? localDateTime : now;
        LocalDateTime after = isBefore ? now : localDateTime;
        Duration duration = Duration.between(before, after);
        if (duration.toDays() > 0) {
            return formatDate(localDateTime);
        }
        if (duration.toHours() > 0) {
            return duration.toHours() + " 小时" + (isBefore ? "前" : "后");
        }
        return duration.toMinutes() + " 分钟" + (isBefore ? "前" : "后");
    }


}
