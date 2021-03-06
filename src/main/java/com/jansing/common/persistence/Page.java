package com.jansing.common.persistence;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.jansing.common.utils.StringUtil;
import com.jansing.common.config.Global;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

/**
 * Created by jansing on 16-11-4.
 */
public class Page<T> {
    private int pageNo;
    private int pageSize;
    private long count;
    private int first;
    private int last;
    private int prev;
    private int next;
    private boolean firstPage;
    private boolean lastPage;
    private int length;
    private int slider;
    private List<T> list;
    private String orderBy;
    private String funcName;
    private String funcParam;
    private String message;

    public Page() {
        this.pageNo = 1;
        this.length = 8;
        this.slider = 1;
        this.list = new ArrayList();
        this.orderBy = "";
        this.funcName = "page";
        this.funcParam = "";
        this.message = "";
        this.pageSize = -1;
    }


    public Page(int pageNo, int pageSize, String orderBy) {
        this.setPageNo(pageNo);
        this.setPageSize(pageSize);
        this.length = 8;
        this.slider = 1;
        this.list = new ArrayList();
        this.orderBy = "";
        this.funcName = "page";
        this.funcParam = "";
        this.message = "";
        if (StringUtil.isNotBlank(orderBy)) {
            this.setOrderBy(orderBy);
        }
    }

    public Page(int pageNo, int pageSize) {
        this(pageNo, pageSize, 0L);
    }

    public Page(int pageNo, int pageSize, long count) {
        this(pageNo, pageSize, count, new ArrayList());
    }

    public Page(int pageNo, int pageSize, long count, List<T> list) {
        this.setPageNo(pageNo);
        this.setPageSize(pageSize);
        this.length = 8;
        this.slider = 1;
        this.list = new ArrayList();
        this.orderBy = "";
        this.funcName = "page";
        this.funcParam = "";
        this.message = "";
        this.setCount(count);
        this.list = list;
    }

    public void initialize() {
        this.first = 1;
        this.last = (int) (this.count / (long) (this.pageSize < 1 ? 20 : this.pageSize) + (long) this.first - 1L);
        if (this.count % (long) this.pageSize != 0L || this.last == 0) {
            ++this.last;
        }

        if (this.last < this.first) {
            this.last = this.first;
        }

        if (this.pageNo <= 1) {
            this.pageNo = this.first;
            this.firstPage = true;
        }

        if (this.pageNo >= this.last) {
            this.pageNo = this.last;
            this.lastPage = true;
        }

        if (this.pageNo < this.last - 1) {
            this.next = this.pageNo + 1;
        } else {
            this.next = this.last;
        }

        if (this.pageNo > 1) {
            this.prev = this.pageNo - 1;
        } else {
            this.prev = this.first;
        }

        if (this.pageNo < this.first) {
            this.pageNo = this.first;
        }

        if (this.pageNo > this.last) {
            this.pageNo = this.last;
        }

    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        if (this.pageNo == this.first) {
            sb.append("<li class=\"disabled\"><a href=\"javascript:\"><i class=\"fa fa-angle-left\"></i></a></li>\n");
        } else {
            sb.append("<li><a href=\"javascript:\" onclick=\"" + this.funcName + "(" + this.prev + "," + this.pageSize + ",\'" + this.funcParam + "\');\"><i class=\"fa fa-angle-left\"></i></a></li>\n");
        }

        int begin = this.pageNo - this.length / 2;
        if (begin < this.first) {
            begin = this.first;
        }

        int end = begin + this.length - 1;
        if (end >= this.last) {
            end = this.last;
            begin = end - this.length + 1;
            if (begin < this.first) {
                begin = this.first;
            }
        }

        int var5;
        if (begin > this.first) {
            boolean i = false;

            for (var5 = this.first; var5 < this.first + this.slider && var5 < begin; ++var5) {
                sb.append("<li><a href=\"javascript:\" onclick=\"" + this.funcName + "(" + var5 + "," + this.pageSize + ",\'" + this.funcParam + "\');\">" + (var5 + 1 - this.first) + "</a></li>\n");
            }

            if (var5 < begin) {
                sb.append("<li class=\"disabled\"><a href=\"javascript:\">...</a></li>\n");
            }
        }

        for (var5 = begin; var5 <= end; ++var5) {
            if (var5 == this.pageNo) {
                sb.append("<li class=\"active\"><a href=\"javascript:\">" + (var5 + 1 - this.first) + "</a></li>\n");
            } else {
                sb.append("<li><a href=\"javascript:\" onclick=\"" + this.funcName + "(" + var5 + "," + this.pageSize + ",\'" + this.funcParam + "\');\">" + (var5 + 1 - this.first) + "</a></li>\n");
            }
        }

        if (this.last - end > this.slider) {
            sb.append("<li class=\"disabled\"><a href=\"javascript:\">...</a></li>\n");
            end = this.last - this.slider;
        }

        for (var5 = end + 1; var5 <= this.last; ++var5) {
            sb.append("<li><a href=\"javascript:\" onclick=\"" + this.funcName + "(" + var5 + "," + this.pageSize + ",\'" + this.funcParam + "\');\">" + (var5 + 1 - this.first) + "</a></li>\n");
        }

        if (this.pageNo == this.last) {
            sb.append("<li class=\"disabled\"><a href=\"javascript:\"><i class=\"fa fa-angle-right\"></i></a></li>\n");
        } else {
            sb.append("<li><a href=\"javascript:\" onclick=\"" + this.funcName + "(" + this.next + "," + this.pageSize + ",\'" + this.funcParam + "\');\">" + "<i class=\"fa fa-angle-right\"></i></a></li>\n");
        }

        sb.append("<li class=\"disabled controls\"><a href=\"javascript:\">显示 ");
        sb.append(this.pageSize);
        sb.append(" 条，");
        sb.append("共 " + this.count + " 条" + (this.message != null ? this.message : "") + "</a></li>\n");
        sb.insert(0, "<ul class=\"pagination\">\n").append("</ul>\n");
        sb.append("<div style=\"clear:both;\"></div>");
        return sb.toString();
    }

    public String getHtml() {
        return this.toString();
    }

    public long getCount() {
        return this.count;
    }

    public void setCount(long count) {
        this.count = count;
        if ((long) this.pageSize >= count) {
            this.pageNo = 1;
        }

    }

    public int getPageNo() {
        return this.pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo>0?pageNo:1;
    }

    public int getPageSize() {
        return this.pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize <= 0 ? Integer.valueOf(Global.getConfig("page.pageSize")).intValue() : pageSize;
    }

    @JsonIgnore
    public int getFirst() {
        return this.first;
    }

    @JsonIgnore
    public int getLast() {
        return this.last;
    }

    @JsonIgnore
    public int getTotalPage() {
        return this.getLast();
    }

    @JsonIgnore
    public boolean isFirstPage() {
        return this.firstPage;
    }

    @JsonIgnore
    public boolean isLastPage() {
        return this.lastPage;
    }

    @JsonIgnore
    public int getPrev() {
        return this.isFirstPage() ? this.pageNo : this.pageNo - 1;
    }

    @JsonIgnore
    public int getNext() {
        return this.isLastPage() ? this.pageNo : this.pageNo + 1;
    }

    public List<T> getList() {
        return this.list;
    }

    public Page<T> setList(List<T> list) {
        this.list = list;
        this.initialize();
        return this;
    }

    @JsonIgnore
    public String getOrderBy() {
        String reg = "(?:\')|(?:--)|(/\\*(?:.|[\\n\\r])*?\\*/)|(\\b(select|update|and|or|delete|insert|trancate|char|into|substr|ascii|declare|exec|count|master|into|drop|execute)\\b)";
        Pattern sqlPattern = Pattern.compile(reg, 2);
        return sqlPattern.matcher(this.orderBy).find() ? "" : this.orderBy;
    }

    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }

    @JsonIgnore
    public String getFuncName() {
        return this.funcName;
    }

    public void setFuncName(String funcName) {
        this.funcName = funcName;
    }

    @JsonIgnore
    public String getFuncParam() {
        return this.funcParam;
    }

    public void setFuncParam(String funcParam) {
        this.funcParam = funcParam;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @JsonIgnore
    public boolean isDisabled() {
        return this.pageSize == -1;
    }

    @JsonIgnore
    public boolean isNotCount() {
        return this.count == -1L;
    }

    public int getFirstResult() {
        int firstResult = (this.getPageNo() - 1) * this.getPageSize();
        if ((long) firstResult >= this.getCount()) {
            firstResult = 0;
        }

        return firstResult;
    }

    public int getMaxResults() {
        return this.getPageSize();
    }
}

