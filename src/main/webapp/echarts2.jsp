<%@page contentType="text/html; utf-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core"    prefix="c" %>
<%@ taglib prefix="width" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="height" uri="http://www.springframework.org/tags/form" %>
<html>
<head>

    <script charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
    <%--第一步:引入ecahrts.js文件--%>
    <script charset="utf-8" src="${pageContext.request.contextPath}/back/echarts.js"></script>
    <script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/My97DatePicker/WdatePicker.js" defer="dp"></script>
  <%--  <script src="http://echarts.baidu.com/doc/example/timelineOption.js"></script>--%>
</head>
<body>
<!-- 第二步:为 ECharts 准备一个具备大小（宽高）的 DOM -->
<form>
    <table>
        <tr>
            <td  align="center"width="40" style="font-size: 10px" bgcolor="#00bfff">全部</td>
            <td  align="center"width="40"style="font-size: 10px" bgcolor="#00bfff">渠道</td>
            <td  align="center"width="40" style="font-size: 10px" bgcolor="#00bfff">账户</td>
            <td  align="center" width="40" style="font-size: 10px" bgcolor="#00bfff">计划</td>
        </tr>
    </table>
<br>
    <form  id="form1" action="##"  method="post">
          <input  name="start"  style="background-color: #b8eecf" onClick="WdatePicker({dateFmt:'yyyy/MM/dd',maxDate:'%y-%M-%d'})"  id= "start" type="text"   size="10">
            至 <input   name="end"  style="background-color: #b8eecf"onClick="WdatePicker({dateFmt:'yyyy/MM/dd',maxDate:'%y-%M-%d',minDate:'#F{$dp.$D(\'start\')}',})"  id= "end" type="text"   size="10">
         <input name="button" onsubmit="return false" type="button" id="dp" value="查询" onclick="findxl()">



        <input type="checkbox" value="gs" onselect="true"  fontSize="3px">分公司</input>
        <select name="gs">
            <option value="bj">北京</option>
            <option value="cs">长沙</option>
        </select>
        <input type="checkbox" value="yx" onselect="true"  fontSize="3px">营销方式</input>
        <select name="yx">
            <option value="bj">手动拨打</option>
            <option value="cs">渠道</option>
        </select>

    </form>
</form>
<select id="select">
    <option value="1">消费</option>
    <option value="2">沟通</option>
    <option value="3">产出</option>

</select>
    <div id="main" style="width: 800px;height:300px;position: relative;left:20px"></div>

        <br> <br>
<form   >
    <div   style="position: relative;left:670px" >
        <input id="export" value="导出" type="submit" style="background-color: #b8eecf">
        <select>
            <option>自定义</option>
        </select>
    </div>
    <table border="1px" width="800px" height="150px" style="position: relative;left:20px">
    <tr>
        <td>日期</td> <td>资源数</td> <td>接通数</td> <td>同意加微信</td> <td>加成功数</td> <td>有效沟通数</td> <td>新单数</td> <td>新单额</td> <td>升级数</td> <td>升级额</td>
        <td>接通率</td> <td>同意加率</td> <td>加成功率</td> <td>有效率</td> <td>新单成交率</td> <td>升级率</td> <td>新单产出比</td> <td>升级产出比</td> <td>总产出比</td>
    </tr>
    <tr>
        <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td>
        <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td>
    </tr>
    <tr>
        <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td>
        <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td>
    </tr>
    </table>
</form>

<script>

    var myChart = echarts.init(document.getElementById('main'));

    //发送ajax查询数据
    $.ajax({

        //url:"${pageContext.request.contextPath}/back/echats1.json",
        url:"${pageContext.request.contextPath}/xiaoliang/findAll.do",
        dataType:"json",
        type:"post",
        success:function (result) {
            // var time=result.xname;
            // console.log("time----"+time);
            //13位时间戳转换为10位的
            //var str2int = parseInt(time);
            //var timeStampSec = (str2int/1000);
            //console.log("timeStampSec----"+timeStampSec);
            // var timestamp = String.format("%010d", time);
            // var xname=changeDate(result.xname);
            //  console.log("xname----"+xname)

            //var dt=time;
            // var tstr = JSON.stringify(time);
            // console.log("tstr----"+tstr)

            //设置当前echarts表格的配置
            // 指定图表的配置项和数据
            // var base =+new Date(2018,07,24);
            //  var oneDay=24*3600;
            //  var date=[Math.random()*300];
            //  for (var i=1;i<20000;i++){
            //   var now= new Date(base+=oneDay);
            //  date.push([now.getFullYear(),now.getMonth()+1,now.getDate()].join('/'));
            //  data.push(Math.round((Math.random()-0.5)*20+data[i-1]));

            //  }
            var option = {
                backgroundColor: '#b8eecf',
                /*   dataZoom:[{
                       startValue: "2018-07-24"
                   },{
                       type:"inside"

                   }],*/
                title: {
                    //text: 'ECharts统计图'
                },

                legend: {//图例
                    data:['广告资源产出占比'],
                    //data:['日期'],


                },
                tooltip:{
                    // trigger:"axis",//提示框，该列所有坐标轴所对应的数据
                    axisPointer:{
                        type:"cross",
                        label:{
                            backgroundColor:"#ccc",
                            borderColor:"#aaa",
                            borderWidth:1,
                            shadowOffsetX:0,
                            shadowOffsetY:0,
                            textStyle:{
                                color:"#222"

                            }
                        }
                    },
                    /*  formatter:function(data){
                          return data.xname+"<br/>"+data.xcount+"%";
                      }*/

                },
                grid: {
                    left: '10%',
                    bottom:'20%'
                },

                xAxis: {//x轴线坐标
                    // type: 'time',
                    axisTick: {//去掉轴线上的分割线
                        show: false
                    },
                    //  show:true,
                    // splitLine:{//坐标轴
                    //    show:true
                    // },
                    type:"category",
                    // boundaryGap:false,

                    /* dataZoom:[{
                         startValue: "2018-07-24"
                     },{
                         type:"inside"

                     }],*/
                    //  data:result.xname,

                    data:result.xname,
                    axisLabel:{
                        show:true,
                        interval:"0",
                        rotate:20,
                        margin:24,


                        formatter:"{value}日",


                        textStyle:{
                            color:"#808080",
                            fontFamily:"sans-serif",
                            fontSize:4,
                            fontStyle:"italic",
                            fontWeight:"bold"
                        }


                    }

                },
                yAxis: {

                    show:true,
                    //show: false,//隐藏y轴
                    splitLine:{//坐标轴分割线
                        show:true,

                    },

                    axisLabel:{

                        formatter:"{value}%"
                    }
                    /* data: ["0%","0.05%","0.10%","0.15%","0.2%","0.25%"]*/
                },//Y轴线坐标

                series: [{
                    name: '广告资源产出占比',
                    type: 'line',
                    data:result.xcount,
                },


                ]

            };
            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);

        }
    });

    $(function() {

        $('#select').on('change', function() {
            /*初始化init echarts表格*/
            // 基于准备好的dom，初始化echarts实例

            var val = $(this).val();
            console.log("select-value____"+val)
           if(val==1){
               console.log("select-value1____"+val)


             if(val==2){

                 console.log("select-value2____"+val)
                 //发送ajax查询数据
                 $.ajax({
                     //url:"${pageContext.request.contextPath}/back/echats1.json",
                     url:"${pageContext.request.contextPath}/xiaoliang/findAll.do",
                     dataType:"json",
                     type:"post",
                     success:function (result) {
                         // var time=result.xname;
                         // console.log("time----"+time);
                         //13位时间戳转换为10位的
                         //var str2int = parseInt(time);
                         //var timeStampSec = (str2int/1000);
                         //console.log("timeStampSec----"+timeStampSec);
                         // var timestamp = String.format("%010d", time);
                         // var xname=changeDate(result.xname);
                         //  console.log("xname----"+xname)

                         //var dt=time;
                         // var tstr = JSON.stringify(time);
                         // console.log("tstr----"+tstr)

                         //设置当前echarts表格的配置
                         // 指定图表的配置项和数据
                         // var base =+new Date(2018,07,24);
                         //  var oneDay=24*3600;
                         //  var date=[Math.random()*300];
                         //  for (var i=1;i<20000;i++){
                         //   var now= new Date(base+=oneDay);
                         //  date.push([now.getFullYear(),now.getMonth()+1,now.getDate()].join('/'));
                         //  data.push(Math.round((Math.random()-0.5)*20+data[i-1]));

                         //  }
                         var option = {
                             backgroundColor: '#b8eecf',
                             /*   dataZoom:[{
                                    startValue: "2018-07-24"
                                },{
                                    type:"inside"

                                }],*/
                             title: {
                                 //text: 'ECharts统计图'
                             },

                             legend: {//图例
                                 data:['广告资源产出占比'],
                                 //data:['日期'],


                             },
                             tooltip:{
                                 // trigger:"axis",//提示框，该列所有坐标轴所对应的数据
                                 axisPointer:{
                                     type:"cross",
                                     label:{
                                         backgroundColor:"#ccc",
                                         borderColor:"#aaa",
                                         borderWidth:1,
                                         shadowOffsetX:0,
                                         shadowOffsetY:0,
                                         textStyle:{
                                             color:"#222"

                                         }
                                     }
                                 },
                                 /*  formatter:function(data){
                                       return data.xname+"<br/>"+data.xcount+"%";
                                   }*/

                             },
                             grid: {
                                 left: '10%',
                                 bottom:'20%'
                             },

                             xAxis: {//x轴线坐标
                                 // type: 'time',
                                 axisTick: {//去掉轴线上的分割线
                                     show: false
                                 },
                                 //  show:true,
                                 // splitLine:{//坐标轴
                                 //    show:true
                                 // },
                                 type:"category",
                                 // boundaryGap:false,

                                 /* dataZoom:[{
                                      startValue: "2018-07-24"
                                  },{
                                      type:"inside"

                                  }],*/
                                 //  data:result.xname,

                                 data:result.xname,
                                 axisLabel:{
                                     show:true,
                                     interval:"0",
                                     rotate:20,
                                     margin:24,


                                     formatter:"{value}日",


                                     textStyle:{
                                         color:"#808080",
                                         fontFamily:"sans-serif",
                                         fontSize:4,
                                         fontStyle:"italic",
                                         fontWeight:"bold"
                                     }


                                 }

                             },
                             yAxis: {

                                 show:true,
                                 //show: false,//隐藏y轴
                                 splitLine:{//坐标轴分割线
                                     show:true,

                                 },

                                 axisLabel:{

                                     formatter:"{value}%"
                                 }
                                 /* data: ["0%","0.05%","0.10%","0.15%","0.2%","0.25%"]*/
                             },//Y轴线坐标

                             series: [{
                                 name: '广告资源产出占比',
                                 type: 'line',
                                 data: result.amount
                             },


                             ]

                         };
                         // 使用刚指定的配置项和数据显示图表。
                         myChart2.setOption(option);

                     }
                 });

             }
           }
        });
    });



    function  findxl(){
        var start=$("#start").val();
        var end=$("#end").val();

        console.log("start---"+start);
        console.log("end---"+end);

       // console.log( $('#form1').serialize());
        $.ajax({
            //发送ajax查询数据
          //  async: false,
            url:"${pageContext.request.contextPath}/xiaoliang/findbyDate.do",
            //dataType:"text",
            data: {start:start,end:end},
           // data: $('#form1').serialize(),//Date:start,
            type:"post",
            success:function (result) {
                //设置当前echarts表格的配置
                // 指定图表的配置项和数据
                console.log("result+++++---"+result)
                var option = {
                    backgroundColor: '#b8eecf',
                    title: {
                        //text: 'ECharts统计图'
                    },

                    legend: {//图例
                        data:['广告资源产出占比'],
                        //data:['日期'],


                    },
                    tooltip:{
                        // trigger:"axis",//提示框，该列所有坐标轴所对应的数据
                        axisPointer:{
                            type:"cross",
                            label:{
                                backgroundColor:"#ccc",
                                borderColor:"#aaa",
                                borderWidth:1,
                                shadowOffsetX:0,
                                shadowOffsetY:0,
                                textStyle:{
                                    color:"#222"

                                }
                            }
                        },


                    },
                    grid: {
                        left: '10%',
                        bottom:'20%'
                    },

                    xAxis: {//x轴线坐标
                        // type: 'time',
                        axisTick: {//去掉轴线上的分割线
                            show: false
                        },


                        type:"category",
                        data: result.xname,
                        axisLabel:{
                            show:true,
                            interval:"0",
                            rotate:20,
                            margin:24,

                            //   data: [result.date.data] ,
                            formatter:"{value}日",
                            textStyle:{
                                color:"#808080",
                                fontFamily:"sans-serif",
                                fontSize:4,
                                fontStyle:"italic",
                                fontWeight:"bold"
                            }


                        }

                    },
                    yAxis: {
                        show:true,
                        splitLine:{//坐标轴
                            show:true
                        },
                        //  data: result.sales.data,
                        axisLabel:{

                            formatter:"{value}%"
                        }
                        /* data: ["0%","0.05%","0.10%","0.15%","0.2%","0.25%"]*/
                    },//Y轴线坐标

                    series: [{
                        name: '广告资源产出占比',
                        type: 'line',
                        data: result.xcount
                    },


                    ]

                };
                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
               // return false;
            }
        });

    }


    /*function changeDate(datetimes){
        if(datetimes.length>10){
            var str2int = parseInt(datetimes);
            var datetimes = (str2int/1000);
        }
        var date = new Date(datetimes);
        Y = date.getFullYear() + '-';
        M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
        D = date.getDate() ;
//      h = date.getHours() + ':';
//      m = date.getMinutes() + ':';
//      s = date.getSeconds();
//      年 月 日 时 分 秒
        return Y+M+D;
    }
*/
</script>
</body>
</html>



