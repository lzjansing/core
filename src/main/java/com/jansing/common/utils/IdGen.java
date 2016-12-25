package com.jansing.common.utils;

import java.io.Serializable;
import java.security.SecureRandom;
import java.util.UUID;

public class IdGen implements Serializable{
    private static SecureRandom random = new SecureRandom();

    public IdGen() {
    }

    public static String uuid() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }

    public static long randomLong() {
        return Math.abs(random.nextLong());
    }

    public static String randomBase62(int length) {
        byte[] randomBytes = new byte[length];
        random.nextBytes(randomBytes);
        return Encodes.encodeBase62(randomBytes);
    }

    public String getNextId() {
        return uuid();
    }


    public static void main(String[] args) {
        System.out.println(uuid());
        System.out.println(uuid().length());
        System.out.println(uuid());

        for (int i = 0; i < 1000; ++i) {
            System.out.println(randomLong());
        }

    }

}
