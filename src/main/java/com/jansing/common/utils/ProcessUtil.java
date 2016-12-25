package com.jansing.common.utils;

import java.io.IOException;

/**
 * Created by jansing on 16-12-17.
 */
public class ProcessUtil {



    public static Process exec(String[] args) throws IOException {
        ProcessBuilder processBuilder = new ProcessBuilder(args);
        return processBuilder.start();
    }
}
