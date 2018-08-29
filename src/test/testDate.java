
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ztcf.entity.Xiaoliang;
import com.ztcf.service.XiaoliangService;
import com.ztcf.service.XiaoliangServiceImpl;
import junit.framework.TestCase;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class) // 指定spring 整合junit测试的一个类对象
@ContextConfiguration("classpath:applicationContext.xml") // 指定工厂配置文件的位置
public class testDate  extends TestCase {

@Autowired
   private XiaoliangService xiaoliangService;
    public static void main(String[] args) throws ParseException {
        XiaoliangService xiaoliangService=new XiaoliangServiceImpl();
       SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        Map<String,Object> map = xiaoliangService.findxlList(sdf.parse("2018-08-05"), sdf.parse("2018-08-07"));
    System.out.println("LIST----"+map);

}
   /* @Test
    public void test1(){
        List<Xiaoliang> list = xiaoliangService.findxlList();
        System.out.println("LIST----"+list);


    }*/
}
