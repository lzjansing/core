package com.jansing.common.persistence;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.jansing.common.utils.IdGen;
import org.hibernate.validator.constraints.Range;

import java.time.LocalDateTime;

public abstract class DataEntity<T> extends BaseEntity<T> {
    protected String remarks;
    protected Integer useable;
    protected Boolean isNew;
    protected Integer valid;
    protected LocalDateTime createDate;
    protected LocalDateTime updateDate;

    public static final Integer YES = 1;
    public static final Integer NO = 0;


    public DataEntity() {
        this.valid = YES;
    }

    public DataEntity(String id) {
        super(id);
    }

    public void preInsert() {
        this.setId(IdGen.uuid());

        this.useable = YES;
        this.isNew = true;
        this.updateDate = LocalDateTime.now();
        this.createDate = this.updateDate;
    }

    public void preUpdate() {
        this.updateDate = LocalDateTime.now();
    }

    public String getRemarks() {
        return this.remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Integer getUseable() {
        return useable;
    }

    public void setUseable(Integer useable) {
        this.useable = useable;
    }

    public Boolean getIsNew() {
        return this.isNew;
    }

    public void setIsNew(Boolean isNew) {
        this.isNew = isNew;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public LocalDateTime getCreateDate() {
        return this.createDate;
    }

    public void setCreateDate(LocalDateTime createDate) {
        this.createDate = createDate;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public LocalDateTime getUpdateDate() {
        return this.updateDate;
    }

    public void setUpdateDate(LocalDateTime updateDate) {
        this.updateDate = updateDate;
    }

    @JsonIgnore
    @Range(min = 0, max = 2)
    public Integer getValid() {
        return this.valid;
    }

    public void setValid(Integer valid) {
        this.valid = valid;
    }
}
