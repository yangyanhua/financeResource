




<%@page contentType="text/html; utf-8" isELIgnored="false" pageEncoding="UTF-8" %>

<html>
<head>
    <script charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <%--第一步:引入ecahrts.js文件--%>
    <script charset="utf-8" src="${pageContext.request.contextPath}/back/echarts.js"></script>
    <%--引入goeasy的js文件--%>
    <script src="http://cdn-hangzhou.goeasy.io/goeasy.js"></script>
</head>
<body>

<!-- 第二步:为 ECharts 准备一个具备大小（宽高）的 DOM -->
<div id="main" style="width: 600px;height:400px;"></div>




<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    myChart.setOption({
        title:{
            text:'echarts统计'
        },
        tooltip:{

        },
        legend:{
            data:['资源占比']
        },
        grid: {
            left: '10%',
            bottom:'20%'
        },
        xAxis:{
            data:[],
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
        yAxis:{

            axisLabel:{

                formatter:"{value}%"
            }
            /* data: ["0%","0.05%","0.10%","0.15%","0.2%","0.25%"]*/
        },//Y轴线坐标

        series:[
            {
                name:'资源占比',
                type:'line',

                data:[]
            },
        ]
    });

    $.post(
        "<%=request.getContextPath()%>/xiaoliang/findAll.do",
        {},
        function(data){
            myChart.setOption({
                xAxis:{
                    data:data.xname
                },
                series:[
                    {
                        name:'资源占比',
                        data:data.xcount,
                        axisLabel:{

                            formatter:"{value}%"
                        }
                    },
                ]
            });
        },
        "json"
    )




</script>
</body>
</html>



































