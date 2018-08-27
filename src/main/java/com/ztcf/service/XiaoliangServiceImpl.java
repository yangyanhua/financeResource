package main.java.com.ztcf.service;

import main.java.com.ztcf.dao.XiaoliangDao;
import main.java.com.ztcf.entity.Xiaoliang;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class XiaoliangServiceImpl implements XiaoliangService {

    @Resource
    private XiaoliangDao xiaoliangDao;
    /**
     * <!-- 获取销量信息 getXiaoliangList-->
     */
    @Override
    public Map<String,Object> findList() {
        // TODO Auto-generated method stub
        /*创建一个集合来接受数据库数据*/
        List<Xiaoliang> xlist = new ArrayList<Xiaoliang>();
        /*创建一个map集合来装月份和销量这两个数组*/
        Map<String,Object> xmap=new HashMap<String,Object>();
        /*接受数据*/
       // xlist=xiaoliangDao.getXiaoliangList();
        //模拟数据库查询获取数据
        Xiaoliang  x1= new Xiaoliang(5,"2018-04-24",1);
        Xiaoliang  x2= new Xiaoliang(12,"2018-04-25",1);
        Xiaoliang  x3= new Xiaoliang(13,"2018-04-26",1);
        Xiaoliang  x4= new Xiaoliang(11,"2018-04-27",1);
        Xiaoliang  x5= new Xiaoliang(11,"2018-04-28",1);
        Xiaoliang  x6= new Xiaoliang(13,"2018-04-29",1);
        Xiaoliang  x7= new Xiaoliang(14,"2018-04-30",1);
        Xiaoliang  x8= new Xiaoliang(15,"2018-05-1",1);
        Xiaoliang  x9= new Xiaoliang(12,"2018-05-2",1);
        Xiaoliang  x10= new Xiaoliang(14,"2018-05-3",1);
        Xiaoliang  x11= new Xiaoliang(15,"2018-05-4",1);
        Xiaoliang  x12= new Xiaoliang(9,"2018-05-5",1);
        Xiaoliang  x13= new Xiaoliang(12,"2018-05-6",1);
        Xiaoliang  x14= new Xiaoliang(11,"2018-05-7",1);
        Xiaoliang  x15= new Xiaoliang(11,"2018-05-8",1);
        Xiaoliang  x16= new Xiaoliang(16,"2018-05-9",1);
        xlist.add(x1);
        xlist.add(x2);  xlist.add(x3);  xlist.add(x4);  xlist.add(x5);  xlist.add(x6);  xlist.add(x7);
        xlist.add(x7);  xlist.add(x8);  xlist.add(x9);  xlist.add(x10);  xlist.add(x11);  xlist.add(x12);
        xlist.add(x13);  xlist.add(x14);  xlist.add(x15); xlist.add(x16);

        /*创建装载月销量数组*/
        int[] xxdata=new int[xlist.size()];
        /*创建装载月份数组*/
        String[] xdata=new String[xlist.size()];
        /*定义数组下标*/
        int i=0;
        /*遍历数据库数据*/
        for (Xiaoliang xiaoliang : xlist) {
            /*将销量放入数组*/
            xxdata[i]=xiaoliang.getXcount();
            /*将月份放入数组*/
            xdata[i]=xiaoliang.getXname();
            i++;
        }
        /*将两个数组存入集合中*/
        xmap.put("xcount", xxdata);
        xmap.put("xname", xdata);

        return xmap;
    }

}
