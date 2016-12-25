package com.jansing;

import com.google.common.collect.Lists;
import org.apache.commons.io.IOUtils;
import org.junit.Test;

import java.io.IOException;
import java.util.List;

/**
 * Created by jansing on 16-12-17.
 */
public class ProcessBuilderTest {

    @Test
    public void test01() throws IOException {
        List<String> command = Lists.newArrayList();
        command.add("ls");
        command.add("-lia");
        ProcessBuilder processBuilder = new ProcessBuilder(command);
        Process process = processBuilder.start();
        List<String> results = IOUtils.readLines(process.getInputStream());
        results.stream().forEach(e -> System.out.println(e));

        processBuilder.command(new String[]{"pwd"});
        process = processBuilder.start();
        results = IOUtils.readLines(process.getInputStream());
        results.stream().forEach(e -> System.out.println(e));
    }

    @Test
    public void test02() throws IOException, InterruptedException {
        long start = System.currentTimeMillis();
        ProcessBuilder processBuilder = new ProcessBuilder(new String[]{"/bin/sh","-c",
                "soffice --headless --convert-to pdf:writer_pdf_Export /home/jansing/wen/file/doc/1.docx --outdir  /tmp/"
        });
        Process process = processBuilder.start();
        System.out.println(System.currentTimeMillis()-start);
        IOUtils.readLines(process.getInputStream()).stream().forEach(e-> System.out.println(e));


//        Runtime runtime = Runtime.getRuntime();
//        Process process = runtime.exec(new String[]{"/bin/sh","-c","soffice --headless --convert-to pdf:writer_pdf_Export /home/jansing/wen/file/doc/1.docx --outdir  /tmp/"});
    }




}
