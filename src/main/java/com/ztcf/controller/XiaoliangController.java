package main.java.com.ztcf.controller;

import main.java.com.ztcf.service.XiaoliangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;


@RestController
@RequestMapping("/xiaoliang")
public class XiaoliangController {

    @Autowired
    private XiaoliangService xiaoliangService;

    @RequestMapping("/findAll.do")
    public Map<String ,Object> findAll(){

        Map<String, Object> map = xiaoliangService.findList();
        return  map;

    }

}
