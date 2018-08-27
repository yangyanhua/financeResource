<%@page contentType="text/html; utf-8" isELIgnored="false" pageEncoding="UTF-8" %>
<html>
<head>

    <script charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <%--第一步:引入ecahrts.js文件--%>
    <script charset="utf-8" src="${pageContext.request.contextPath}/back/echarts.js"></script>
  <%--  <script src="http://echarts.baidu.com/doc/example/timelineOption.js"></script>--%>
</head>
<body>
<!-- 第二步:为 ECharts 准备一个具备大小（宽高）的 DOM -->
<div id="main" style="width: 600px;height:400px;"></div>
<script>
    /*初始化init echarts表格*/
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    //发送ajax查询数据
    $.ajax({
        url:"${pageContext.request.contextPath}/back/echats1.json",
        dataType:"JSON",
        type:"get",
        success:function (result) {
            //设置当前echarts表格的配置
            // 指定图表的配置项和数据
            var option = {
                title: {
                    text: 'ECharts 图例'
                },
                tooltip: {
                    trigger:"axis"//提示框，该列所有坐标轴所对应的数据
                },
                legend: {//图例
                    data:['广告资源产出占比'],


            },

                 xAxis: {//x轴线坐标
                     data: ["2018-07-24","2018-07-25","2018-07-26","2018-07-27","2018-07-28","2018-07-29",
                         "2018-08-01","2018-08-02","2018-08-03","2018-08-04","2018-08-05","2018-08-06",
                         "2018-08-07","2018-08-08","2018-08-09","2018-08-10","2018-08-11","2018-08-12"
                         ,"2018-08-13","2018-08-14","2018-08-15"
                     ],
                    // type: 'time',
                     axisLabel:{
                         show:true,
                         interval:"0",
                         rotate:45,
                         margin:24,
                         formatter:"{value}日",
                         textStyle:{
                             color:"blue",
                             fontFamily:"sans-serif",
                             fontSize:8,
                             fontStyle:"italic",
                             fontWeight:"bold"
                         }


                     }

                 },
                 yAxis: {
                     axisLabel:{

                         formatter:"{value}%"
                     }
                    /* data: ["0%","0.05%","0.10%","0.15%","0.2%","0.25%"]*/
                 },//Y轴线坐标

                series: [{
                    name: '广告资源产出占比',
                    type: 'line',
                    data: result.sales.data
                },


                ]

            };
            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        }
    });


</script>
</body>
</html>



