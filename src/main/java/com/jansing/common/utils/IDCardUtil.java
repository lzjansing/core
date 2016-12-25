package com.jansing.common.utils;

/**
 * 18位身份证号规则：
 * 6位地址码+8位出生年月日+3位顺序号+1位校验
 * 其中
 * 地址码：户口所在县（市旗区）的行政区域划分代码，按GB/T2260的规定执行
 * 顺序号：男奇女偶
 * Created by jansing on 16-12-10.
 */
public class IDCardUtil {
    private static final int[] WEIGHT = {7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2};
    private static final char[] VALIDATE = {'1','0','X','9','8','7','6','5','4','3','2'};
    private static final int LENGTH_17 = 17;
    private static final int LENGTH_18 = 18;

    public static char getID18ValidateCode(String id17){
        if(id17==null || id17.length()<LENGTH_17){
            throw new IllegalArgumentException("计算错误，参数长度小于"+LENGTH_17+"位");
        }
        int sum = 0;
        for(int i=0; i<LENGTH_17; i++){
            sum += Integer.parseInt(String.valueOf(id17.charAt(i))) * WEIGHT[i];
        }
        return VALIDATE[sum % 11];
    }

    public static boolean checkID18(String id18){
        if(id18==null || id18.length()!=LENGTH_18){
            throw new IllegalArgumentException("检验失败，参数长度必须为"+LENGTH_18+"位");
        }
        return getID18ValidateCode(id18)==id18.charAt(17)?true:false;
    }

}
