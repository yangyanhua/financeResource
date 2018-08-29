package com.ztcf.controller;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ztcf.service.XiaoliangService;
import com.ztcf.entity.Xiaoliang;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;


//@RestController
@Controller
@RequestMapping("/xiaoliang")
public class FinanaceController {

    @Autowired
    private XiaoliangService xiaoliangService;


   /* @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   //true:允许输入空值，false:不能为空值

    }*/
    @ResponseBody
    @RequestMapping("/findbyDate.do")
    public  Map<String,Object> findbyDate(@RequestParam(value="start",required=false) Date start,
                                      @RequestParam(value="end",required=false) Date end

    ) throws ParseException {
        Map<String,Object> map =  xiaoliangService.findxlList(start, end);
        System.out.println("end----"+end);//null
        System.out.println("start___"+start);//null
        return  map;

    }

}
