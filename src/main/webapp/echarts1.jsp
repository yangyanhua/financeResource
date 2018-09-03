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
<form style="position: relative;left:20px">
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
<div  style=" width:800px;background-color: #b8eecf;position: relative;left:20px">
<form>
    <table>
        <tr >
            <td id="td1" class="td" onclick="changeTd(this)">消费</td>
            <td  >||</td>
            <td  id="td2" class="td" onclick="changeTd(this)">销售</td>
            <td  >||</td>
            <td  id="td3" class="td" onclick="changeTd(this)">产出</td>
<td><select id="select" style="background-color: #b8eecf;position: relative;left:500px">
    <option value="1">消费</option>
    <option value="2">销售</option>
    <option value="3">产出</option>
    </select>
</td>
        </tr>
    </table>
</form>
<div id="main" style="width: 700px;height:300px;position: relative;left:20px"></div>
</div>
<br> <br>
<form  >
    <div   style="position: relative;left:820px" >

        <select id="cc" class="easyui-combotree" style="width:200px;"data-options="required:true">
            <option>自定义</option>
        </select>
        <input  id="btn" class="easyui-linkbutton" value="导出" type="submit" style="background-color: #b8eecf">

    </div>
    <table id="tab" border="1px"  width="1000px" height="150px" style="position: relative;left:20px">

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



<script type="text/javascript">


    var myChart = echarts.init(document.getElementById('main'));
    var options=$("#select option:selected");  //获取选中的option
    var result;

    $.ajax({
        url: '${pageContext.request.contextPath}/xiaoliang/findAll.do',
        type: 'post',
        success: function(response) {
            result = response;
            $('#select').trigger('change');
        }
    });





    $('#select').on('change', function() {
        var val = $(this).val();
       if(val==1){
           ($('#td1')) [0].style.backgroundColor= 'white';
           ($('#td2')) [0].style.backgroundColor= '#b8eecf';
           ($('#td3')) [0].style.backgroundColor= '#b8eecf';
       }
        if(val==2){
            ($('#td2')) [0].style.backgroundColor= 'white';
            ($('#td1')) [0].style.backgroundColor= '#b8eecf';
            ($('#td3')) [0].style.backgroundColor= '#b8eecf';
        }
        if(val==3){
            ($('#td3')) [0].style.backgroundColor= 'white';
            ($('#td1')) [0].style.backgroundColor= '#b8eecf';
            ($('#td2')) [0].style.backgroundColor= '#b8eecf';
        }
        var xData = [];
        var yData = [];

      // for (var i = 0; i < result.xname.length; i++) {
           xData=(result.xname);
      // }
        if(val==1) {
            //    for (var n = 0; n < result.xname.length; n++) {
            yData = (result.xcount);

            myChart.setOption({
                backgroundColor: '#b8eecf',
                closable:false,
                /*   dataZoom:[{
                       startValue: "2018-07-24"
                   },{
                       type:"inside"

                   }],*/
                title: {
                    //text: 'ECharts统计图'
                },

              /*  legend: {//图例
                    data: ['广告资源产出占比'],
                    //data:['日期'],


                },*/
                tooltip: {
                    trigger: "axis",//提示框，该列所有坐标轴所对应的数据
                    axisPointer: {
                        type: "cross",
                        label: {
                            backgroundColor: "#ccc",
                            borderColor: "#aaa",
                            borderWidth: 1,
                            shadowOffsetX: 0,
                            shadowOffsetY: 0,
                            textStyle: {
                                color: "#222"

                            }
                        }
                    },
                    /*  formatter:function(data){
                          return data.xname+"<br/>"+data.xcount+"%";
                      }*/

                },
                grid: {
                    left: '10%',
                    bottom: '20%'
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
                    type: "category",
                    // boundaryGap:false,

                    /* dataZoom:[{
                         startValue: "2018-07-24"
                     },{
                         type:"inside"

                     }],*/
                    //  data:result.xname,

                    data: xData,
                    axisLabel: {
                        show: true,
                        interval: "0",
                        rotate: 20,
                        margin: 24,


                        formatter: "{value}日",


                        textStyle: {
                            color: "#808080",
                            fontFamily: "sans-serif",
                            fontSize: 4,
                            fontStyle: "italic",
                            fontWeight: "bold"
                        }


                    }

                },
                yAxis: {

                    show: true,
                    //show: false,//隐藏y轴
                    splitLine: {//坐标轴分割线
                        show: true,

                    },

                    axisLabel: {

                        formatter: "{value}%"
                    }
                    /* data: ["0%","0.05%","0.10%","0.15%","0.2%","0.25%"]*/
                },//Y轴线坐标

                series: [{
                    name: '广告资源产出占比',
                    type: 'line',
                    data: yData
                }]

                //console.log(val+"val-------"+yData)
            })
        }

            if (val == 2) {
                //   for (var n = 0; n < result.xname.length; n++) {
                yData = (result.amount);
                myChart.setOption({
                    backgroundColor: '#b8eecf',
                    closable:false,
                    /*   dataZoom:[{
                           startValue: "2018-07-24"
                       },{
                           type:"inside"

                       }],*/
                    title: {
                        //text: 'ECharts统计图'
                    },

                /*    legend: {//图例
                        data: ['销售额统计'],
                        //data:['日期'],


                    },*/
                    tooltip: {
                        trigger: "axis",//提示框，该列所有坐标轴所对应的数据
                        axisPointer: {
                            type: "cross",
                            label: {
                                backgroundColor: "#ccc",
                                borderColor: "#aaa",
                                borderWidth: 1,
                                shadowOffsetX: 0,
                                shadowOffsetY: 0,
                                textStyle: {
                                    color: "#222"

                                }
                            }
                        },
                        /*  formatter:function(data){
                              return data.xname+"<br/>"+data.xcount+"%";
                          }*/

                    },
                    grid: {
                        left: '10%',
                        bottom: '20%'
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
                        type: "category",
                        // boundaryGap:false,

                        /* dataZoom:[{
                             startValue: "2018-07-24"
                         },{
                             type:"inside"

                         }],*/
                        //  data:result.xname,

                        data: xData,
                        axisLabel: {
                            show: true,
                            interval: "0",
                            rotate: 20,
                            margin: 24,


                            formatter: "{value}日",


                            textStyle: {
                                color: "#808080",
                                fontFamily: "sans-serif",
                                fontSize: 4,
                                fontStyle: "italic",
                                fontWeight: "bold"
                            }


                        }

                    },
                    yAxis: {

                        show: true,
                        //show: false,//隐藏y轴
                        splitLine: {//坐标轴分割线
                            show: true,

                        },

                        axisLabel: {

                            formatter: "{value}"
                        }
                        /* data: ["0%","0.05%","0.10%","0.15%","0.2%","0.25%"]*/
                    },//Y轴线坐标

                    series: [{
                        name: '销售额统计',
                        type: 'line',
                        data: yData
                    }]

                    //console.log(val+"val-------"+yData)
                })
            }


        })

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
                var options=$("#select option:selected");  //获取选中的option
                var val=options.val()//获取下拉框选中的值

                if(val==1) {
                    var option = {
                        backgroundColor: '#b8eecf',
                        closable:true,
                        title: {
                            //text: 'ECharts统计图'
                        },

                        legend: {//图例
                            data: ['广告资源产出占比'],
                            //data:['日期'],


                        },
                        tooltip: {
                            // trigger:"axis",//提示框，该列所有坐标轴所对应的数据
                            axisPointer: {
                                type: "cross",
                                label: {
                                    backgroundColor: "#ccc",
                                    borderColor: "#aaa",
                                    borderWidth: 1,
                                    shadowOffsetX: 0,
                                    shadowOffsetY: 0,
                                    textStyle: {
                                        color: "#222"

                                    }
                                }
                            },


                        },
                        grid: {
                            left: '10%',
                            bottom: '20%'
                        },

                        xAxis: {//x轴线坐标
                            // type: 'time',
                            axisTick: {//去掉轴线上的分割线
                                show: false
                            },


                            type: "category",
                            data: result.xname,
                            axisLabel: {
                                show: true,
                                interval: "0",
                                rotate: 20,
                                margin: 24,

                                //   data: [result.date.data] ,
                                formatter: "{value}日",
                                textStyle: {
                                    color: "#808080",
                                    fontFamily: "sans-serif",
                                    fontSize: 4,
                                    fontStyle: "italic",
                                    fontWeight: "bold"
                                }


                            }

                        },
                        yAxis: {
                            show: true,
                            splitLine: {//坐标轴
                                show: true
                            },
                            //  data: result.sales.data,
                            axisLabel: {

                                formatter: "{value}%"
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
                }

                    if(val==2){
                        var option = {
                            backgroundColor: '#b8eecf',
                            closable:false,
                            title: {
                                //text: 'ECharts统计图'
                            },

                            legend: {//图例
                                data:['销售额统计'],
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

                                    formatter:"{value}"
                                }
                                /* data: ["0%","0.05%","0.10%","0.15%","0.2%","0.25%"]*/
                            },//Y轴线坐标

                            series: [{
                                name: '销售额统计',
                                type: 'line',
                                data: result.amount
                            },


                            ]

                        };







                }

                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
                // return false;
            }
        });

    }
/*
    $(function () {
        $('#tab').datagrid({
            //title:'销售信息',
            fit:true,
            border:1,
            fitColumns:true,
            url:'',
            columns:[[
                {field:'sysdate',title:'日期',width:25},
                {field:'resourceNum',title:'资源数',width:25},
                {field:'jietongNum',title:'接通数',width:25},
                {field:'tyweixin',title:'同意加微信',width:25},
                {field:'addSucessNum',title:'加成功数',width:25},
                {field:'yxgtNum',title:'有效沟通数',width:25},
                {field:'newOrderNum',title:'新单数',width:25},
                {field:'newOrderAmount',title:'新单额',width:25},
                {field:'sjOrderNum',title:'升级数',width:25},
                {field:'sjAmount',title:'升级额',width:25},
                {field:'jtRate',title:'接通率',width:25},
                {field:'tyjRate',title:'同意加率',width:25},
                {field:'addRate',title:'加成功率',width:25},
                {field:'yxRate',title:'有效率',width:25},
                {field:'newOrdercj',title:'新单成交率',width:25},
                {field:'sjrate',title:'升级率',width:25},
                {field:'sjccrate',title:'新单产出比',width:35},
                {field:'sjccrate',title:'升级产出比',width:35},
                {field:'totalrate',title:'总产出比',width:35},

            ]],
            /!*         toolbar:[{
                      /!*   text:'导出数据',
                         iconCls:'icon-2012080412511',
                         handler: function(){
                             $('#dd').dialog({
                                 title: '导出数据',
                                 width: 1000,
                                 height: 500,
                                 modal:true,

                             });
                         }
         *!/

                     }],*!/
            pagination:false,

        });

    })

    $('#cc').combotree({
        url: '/back/map.json',
        required: true,
        checkbox:true,
        onlyLeafCheck:true,
        multiple:true,
        panelWidth:'auto',//内容自适应
        editable:false,
        onShowPanel:function(){//面板自适应
            $(this).combobox('cc').width("auto");
        }
    });
    $("#btn").click(function () {
        //获取combotree的选中信息
        var content = $("#cc").combotree("getText");

        var vals = $("#cc").combotree("getValues");
        var ss="";
        $.each(vals,function (index,filed) {
            if(index<vals.length-1){
                ss += filed+",";
            }else{
                ss += filed;
            }

        })

        //提交form表单
        console.log(ss);
        console.log(content);
        $("#fff").form("submit",{
            url:"/deptinfo/export.do",
            queryParams:{"content":content,"fields":ss},
             handler:function () {
                      $.messager.show({
                          title:'提醒',
                          msg:'导出成功',
                          showType:'show',

                      });
              }
    });
   });
  */
  /* function changeTd(obj) {


       var tx = obj.innerText;
       console.log("tx-----"+tx);
       if (tx == "消费") {
           //var options = $("#select option:selected");
        //   $("#select").val("1");
           //console.log("options-----"+options.innerText);
       }
       if (tx == "销售") {
          // var options = $("#select option:selected");
          // options.innerText = 2;
          // $("#select").val("2");
          // console.log("options222-----"+options.innerText);
       }
       if (tx == "产出") {
          // var options = $("#select option:selected");
         //  options.innerText = 3;

       }

   }*/




</script>
</body>
</html>



