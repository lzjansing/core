package com.jansing.common.utils;

import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by jansing on 16-11-4.
 */
public class StringUtil extends StringUtils {

    public static String replaceHtml(String html) {
        if (isBlank(html)) {
            return "";
        } else {
            String regEx = "<.+?>";
            Pattern p = Pattern.compile(regEx);
            Matcher m = p.matcher(html);
            String s = m.replaceAll("");
            return s;
        }
    }

    public static String toHtml(String txt) {
        return txt == null ? "" : replace(replace(Encodes.escapeHtml(txt), "\n", "<br/>"), "\t", "&nbsp; &nbsp; ");
    }

    /**
     * 缩写字符串，超过最大宽度用“...”表示
     * todo 测试，如果字符串中包含<></>
     *
     * @param str
     * @param length
     * @return
     */
    public static String abbr(String str, int length) {
        if (str == null) {
            return "";
        } else {
            try {
                StringBuilder e = new StringBuilder();
                int currentLength = 0;
                char[] var4 = replaceHtml(StringEscapeUtils.unescapeHtml4(str)).toCharArray();

                for (int i = 0; i < var4.length; ++i) {
                    char c = var4[i];
                    currentLength += String.valueOf(c).getBytes("GBK").length;
                    if (currentLength > length - 3) {
                        e.append("...");
                        break;
                    }

                    e.append(c);
                }

                return e.toString();
            } catch (UnsupportedEncodingException var8) {
                var8.printStackTrace();
                return "";
            }
        }
    }

    public static String abbr2(String param, int length) {
        if (param == null) {
            return "";
        } else {
            StringBuffer result = new StringBuffer();
            int n = 0;
            boolean isCode = false;
            boolean isHTML = false;

            for (int temp_result = 0; temp_result < param.length(); ++temp_result) {
                char temp = param.charAt(temp_result);
                if (temp == 60) {
                    isCode = true;
                } else if (temp == 38) {
                    isHTML = true;
                } else if (temp == 62 && isCode) {
                    --n;
                    isCode = false;
                } else if (temp == 59 && isHTML) {
                    isHTML = false;
                }

                try {
                    if (!isCode && !isHTML) {
                        n += String.valueOf(temp).getBytes("GBK").length;
                    }
                } catch (UnsupportedEncodingException var12) {
                    var12.printStackTrace();
                }

                if (n > length - 3) {
                    result.append("...");
                    break;
                }

                result.append(temp);
            }

            String var13 = result.toString().replaceAll("(>)[^<>]*(<?)", "$1$2");
            var13 = var13.replaceAll("</?(AREA|BASE|BASEFONT|BODY|BR|COL|COLGROUP|DD|DT|FRAME|HEAD|HR|HTML|IMG|INPUT|ISINDEX|LI|LINK|META|OPTION|P|PARAM|TBODY|TD|TFOOT|TH|THEAD|TR|area|base|basefont|body|br|col|colgroup|dd|dt|frame|head|hr|html|img|input|isindex|li|link|meta|option|p|param|tbody|td|tfoot|th|thead|tr)[^<>]*/?>", "");
            var13 = var13.replaceAll("<([a-zA-Z]+)[^<>]*>(.*?)</\\1>", "$2");
            Pattern p = Pattern.compile("<([a-zA-Z]+)[^<>]*>");
            Matcher m = p.matcher(var13);
            ArrayList endHTML = Lists.newArrayList();

            while (m.find()) {
                endHTML.add(m.group(1));
            }

            for (int i = endHTML.size() - 1; i >= 0; --i) {
                result.append("</");
                result.append((String) endHTML.get(i));
                result.append(">");
            }

            return result.toString();
        }
    }

    /**
     * 下划线分割转驼峰字符串（首字母小写）
     *
     * @param s
     * @return
     */
    public static String toCamelCase(String s) {
        if (s == null) {
            return null;
        } else {
            s = s.toLowerCase();
            StringBuilder sb = new StringBuilder(s.length());
            boolean upperCase = false;

            for (int i = 0; i < s.length(); ++i) {
                char c = s.charAt(i);
                if (c == 95) {
                    upperCase = true;
                } else if (upperCase) {
                    sb.append(Character.toUpperCase(c));
                    upperCase = false;
                } else {
                    sb.append(c);
                }
            }

            return sb.toString();
        }
    }

    /**
     * 下划线分割转驼峰字符串（首字母大写）
     *
     * @param s
     * @return
     */
    public static String toCapitalizeCamelCase(String s) {
        if (s == null) {
            return null;
        } else {
            s = toCamelCase(s);
            return s.substring(0, 1).toUpperCase() + s.substring(1);
        }
    }

    /**
     * 生成三目运算返回结果
     *
     * @param objectString jsGetVal('row.user.id')
     * @return "!row?'':!row.user?'':!row.user.id?'':row.user.id"
     */
    public static String jsGetVal(String objectString) {
        StringBuilder result = new StringBuilder();
        StringBuilder val = new StringBuilder();
        String[] vals = split(objectString, ".");

        for (int i = 0; i < vals.length; ++i) {
            val.append("." + vals[i]);
            result.append("!" + val.substring(1) + "?\'\':");
        }

        result.append(val.substring(1));
        return result.toString();
    }
}
