package com.jansing.common.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by jansing on 16-11-6.
 */
@Transactional(readOnly = true)
public abstract class BaseService {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());

}
