package com.ztcf.service;

import com.ztcf.entity.Xiaoliang;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;
public interface XiaoliangService {
    Map<String,Object> findList() throws ParseException;

    Map<String,Object> findxlList(Date start, Date end) throws ParseException;
}
