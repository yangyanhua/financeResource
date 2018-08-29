package com.ztcf.controller;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.ztcf.service.XiaoliangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.ParseException;
import java.util.Map;


@RestController
@RequestMapping("/xiaoliang")
public class XiaoliangController {

    @Autowired
    private XiaoliangService xiaoliangService;

    @RequestMapping("/findAll.do")
    public Map<String ,Object> findAll() throws ParseException {

        Map<String, Object> map = xiaoliangService.findList();
        return  map;

    }

}
