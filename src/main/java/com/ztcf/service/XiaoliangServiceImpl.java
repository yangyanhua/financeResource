package com.ztcf.service;

import com.ztcf.dao.XiaoliangDao;
import com.ztcf.entity.Xiaoliang;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class XiaoliangServiceImpl implements XiaoliangService {

    @Resource
    private XiaoliangDao xiaoliangDao;
    /**
     * <!-- 获取销量信息 getXiaoliangList-->
     */
    @Override
    public Map<String,Object> findList() throws ParseException {
        // TODO Auto-generated method stub
        /*创建一个集合来接受数据库数据*/
        List<Xiaoliang> xlist = new ArrayList<Xiaoliang>();
        /*创建一个map集合来装月份和销量这两个数组*/
        Map<String,Object> xmap=new HashMap<String,Object>();
        /*接受数据*/
       // xlist=xiaoliangDao.getXiaoliangList();
      SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        //模拟数据库查询获取数据
        Xiaoliang  x1= new Xiaoliang(0.05,sdf.parse("2018-07-24"),1,20000);
        Xiaoliang  x2= new Xiaoliang(0.25,sdf.parse("2018-07-25"),2,19800);
        Xiaoliang  x3= new Xiaoliang(0.15,sdf.parse("2018-07-26"),3,69800);
        Xiaoliang  x4= new Xiaoliang(0.15,sdf.parse("2018-07-27"),4,19800);
        Xiaoliang  x5= new Xiaoliang(0.14,sdf.parse("2018-07-28"),5,29800);
        Xiaoliang  x6= new Xiaoliang(0.25,sdf.parse("2018-07-29"),6,19800);
        Xiaoliang  x7= new Xiaoliang(0.11,sdf.parse("2018-07-30"),7,59800);
        Xiaoliang  x8= new Xiaoliang(0.16,sdf.parse("2018-08-01"),8,39800);
        Xiaoliang  x9= new Xiaoliang(0.12,sdf.parse("2018-08-02"),9,19800);
        Xiaoliang  x10= new Xiaoliang(0.2,sdf.parse("2018-08-03"),10,29800);
        Xiaoliang  x11= new Xiaoliang(0.15,sdf.parse("2018-08-04"),11,19800);
        Xiaoliang  x12= new Xiaoliang(0.11,sdf.parse("2018-08-05"),12,69800);
        Xiaoliang  x13= new Xiaoliang(0.13,sdf.parse("2018-08-06"),13,19800);
        Xiaoliang  x14= new Xiaoliang(0.25,sdf.parse("2018-08-07"),14,79800);
        Xiaoliang  x15= new Xiaoliang(0.1,sdf.parse("2018-08-08"),15,59800);
        Xiaoliang  x16= new Xiaoliang(0.13,sdf.parse("2018-08-09"),16,19800);
        xlist.add(x1);
        xlist.add(x2);  xlist.add(x3);  xlist.add(x4);  xlist.add(x5);  xlist.add(x6);  xlist.add(x7);
        xlist.add(x7);  xlist.add(x8);  xlist.add(x9);  xlist.add(x10);  xlist.add(x11);  xlist.add(x12);
        xlist.add(x13);  xlist.add(x14);  xlist.add(x15); xlist.add(x16);

        /*创建装载月销量数组*/
        double[] xxdata=new double[xlist.size()];
        /*创建装载月份数组* 保存为字符串格式*/
        String [] xdata=new String[xlist.size()];
        //创建装载销售额的数组
        double[]amountdata=new double[xlist.size()];
        /*定义数组下标*/
        int i=0;
        /*遍历数据库数据*/
        for (Xiaoliang xiaoliang : xlist) {
            /*将销量放入数组*/
            xxdata[i]=xiaoliang.getXcount();
            /*将月份放入数组*/
            SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd");
            String str = sf.format(xiaoliang.getXname());
           xdata[i]= str;
           //将销售额放入数组
            amountdata[i]=xiaoliang.getAmount();
            i++;
        }
        /*将两个数组存入集合中*/
        xmap.put("xcount", xxdata);
        xmap.put("xname", xdata);
        xmap.put("amount", amountdata);


        return xmap;
    }

    @Override
    public Map<String,Object> findxlList(Date start, Date end) throws ParseException {
        /*创建一个map集合来装月份和销量这两个数组*/
        Map<String,Object> xmap=new HashMap<String,Object>();
        List<Xiaoliang> list = new ArrayList<Xiaoliang>();

        /*接受数据*/
        // xlist=xiaoliangDao.getXiaoliangList();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        //模拟数据库查询获取数据
        Xiaoliang  x1= new Xiaoliang(0.05,sdf.parse("2018-07-24"),1,20000);
        Xiaoliang  x2= new Xiaoliang(0.25,sdf.parse("2018-07-25"),2,19800);
        Xiaoliang  x3= new Xiaoliang(0.15,sdf.parse("2018-07-26"),3,69800);
        Xiaoliang  x4= new Xiaoliang(0.15,sdf.parse("2018-07-27"),4,19800);
        Xiaoliang  x5= new Xiaoliang(0.14,sdf.parse("2018-07-28"),5,29800);
        Xiaoliang  x6= new Xiaoliang(0.25,sdf.parse("2018-07-29"),6,19800);
        Xiaoliang  x7= new Xiaoliang(0.11,sdf.parse("2018-07-30"),7,59800);
        Xiaoliang  x8= new Xiaoliang(0.16,sdf.parse("2018-08-01"),8,39800);
        Xiaoliang  x9= new Xiaoliang(0.12,sdf.parse("2018-08-02"),9,19800);
        Xiaoliang  x10= new Xiaoliang(0.2,sdf.parse("2018-08-03"),10,29800);
        Xiaoliang  x11= new Xiaoliang(0.15,sdf.parse("2018-08-04"),11,19800);
        Xiaoliang  x12= new Xiaoliang(0.11,sdf.parse("2018-08-05"),12,69800);
        Xiaoliang  x13= new Xiaoliang(0.13,sdf.parse("2018-08-06"),13,19800);
        Xiaoliang  x14= new Xiaoliang(0.25,sdf.parse("2018-08-07"),14,79800);
        Xiaoliang  x15= new Xiaoliang(0.1,sdf.parse("2018-08-08"),15,59800);
        Xiaoliang  x16= new Xiaoliang(0.13,sdf.parse("2018-08-09"),16,19800);
        list.add(x1);
        list.add(x1);
        list.add(x2);  list.add(x3);  list.add(x4);  list.add(x5);  list.add(x6);  list.add(x7);
        list.add(x7);  list.add(x8);  list.add(x9);  list.add(x10);  list.add(x11);  list.add(x12);
        list.add(x13);  list.add(x14);  list.add(x15); list.add(x16);
        int startindex=0;
        int endindex=0;
        ArrayList<Xiaoliang> list1 = new ArrayList<Xiaoliang>();
        for(int i=0;i<list.size();i++){
            if(list.get(i).getXname().equals(start)){
                startindex=i;
            }
            if(list.get(i).getXname().equals(end)){
                endindex=i;
            }
        }
      //  int j=0;
        for(int i=startindex;i<=endindex;i++){
            list1.add(list.get(i));

        }

        /*创建装载月销量数组*/
        double[] xxdata=new double[list1.size()];
        /*创建装载月份数组* 保存为字符串格式*/
        String [] xdata=new String[list1.size()];
        //创建销售额数组
        //创建装载销售额的数组
        double[]amountdata=new double[list1.size()];
        /*定义数组下标*/
        int i=0;
        /*遍历数据库数据*/
        for (Xiaoliang xiaoliang : list1) {
            /*将销量放入数组*/
            xxdata[i]=xiaoliang.getXcount();
            /*将月份放入数组*/
            SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd");
            String str = sf.format(xiaoliang.getXname());
            xdata[i]= str;
            amountdata[i]=xiaoliang.getAmount();
            i++;
        }
        /*将两个数组存入集合中*/
        xmap.put("xcount", xxdata);
        xmap.put("xname", xdata);
        xmap.put("amount", amountdata);

        return xmap;
    }
    
    /*@Test
    public void test1(){
        XiaoliangServiceImpl xiaoliangService = new XiaoliangServiceImpl();
        List<Xiaoliang> list = xiaoliangService.findxlList();
        System.out.println("LIST----"+list);
        
        
    }
*/
}
