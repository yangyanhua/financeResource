<%@page contentType="text/html; utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>zjcf财务资源系统</title>

    <%--引入goeasy的JS文件--%>
    <script src="http://cdn-hangzhou.goeasy.io/goeasy.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/back/themes/icon.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/back/themes/default/easyui.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/back/themes/IconExtension.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/back/echarts.js"></script>

    <script type="text/javascript">

        $(function () {
                $('#m1').bind('click', function (){
                    $('#tt').tabs('close',"明细");
                    $('#tt').tabs('close',"广告费用");
                    $('#tt').tabs('close',"销售费用");
                    $('#tt').tabs('close',"渠道费用");
                    $('#tt').tabs('close',"大数支出");
                    AddTab("概况", "${pageContext.request.contextPath }/ceshi.html" );
                    AddTab("广告资源", "${pageContext.request.contextPath }/xiaoliang.jsp" );
                    AddTab("大数据资源", "${pageContext.request.contextPath }/echarts1.jsp" );
                    AddTab("渠道资源", "${pageContext.request.contextPath }/ceshi.html" );
                    AddTab("自动外呼资源", "${pageContext.request.contextPath }/echarts2.jsp" );
                    AddTab("机器人资源", "${pageContext.request.contextPath }/echarts1.jsp" );
                    AddTab("App推广", "${pageContext.request.contextPath }/index.jsp" );
                    AddTab("流失资源", "${pageContext.request.contextPath }/echarts1.jsp" );

                    var tab = $('#tt').tabs('getTab');  // 取得第一个tab
                    $('#tt').tabs('update', {
                        tab: tab,
                        options: {
                            closable : false
                        }
                    });

                })
            });

        $(function () {
            $('#m2').bind('click', function (){
                $('#tt').tabs('close',"概况");
                $('#tt').tabs('close',"广告资源");
                $('#tt').tabs('close',"大数据资源");
                $('#tt').tabs('close',"渠道资源");
                $('#tt').tabs('close',"自动外呼资源");
                $('#tt').tabs('close',"机器人资源");
                $('#tt').tabs('close',"App推广");
                $('#tt').tabs('close',"流失资源");
                AddTab("明细", "${pageContext.request.contextPath }/index.jsp" );
                AddTab("广告费用", "${pageContext.request.contextPath }/echarts1.jsp" );
                AddTab("销售费用", "${pageContext.request.contextPath }/ceshi.html" );
                AddTab("渠道费用", "${pageContext.request.contextPath }/echarts1.jsp" );
                AddTab("大数支出", "${pageContext.request.contextPath }/echarts1.jsp" );
                var tab = $('#tt').tabs('getTab');  // 取得第一个tab
            //    $('#tt').tabs({ closable : false, tabPosition : 'left', headerWidth : 100 });

            })
        });




        function AddTab(title, url) {
                //判断选项卡是否重复打开
                if ($('#tt').tabs('exists', title)) {
                    $('#tt').tabs('select', title);//选中并刷新
                } else {
                    var content = createFrame(url); //创建Frame
                    $("#tt").tabs("add", {
                        title: title,
                        content: content,
                        closable: false
                    })
                }

            }
            //创建Frame
            function createFrame(url) {
                var tabHeight = $("#tt").height() - 35;
                var s = '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:' + tabHeight + 'px;"></iframe>';
                return s;
            }


        //这个事件的目的是：当我们点击时变色
        function changeColor(obj)
        {
            //因为JS会把HTML标签当做一个对象
            //对象.属性 = 值;
            //判断对象是m1还是m2
            var m1= $('#m1');//jq对象
            var dm1=m1[0];//dom对象转换

            var m2= $('#m2');
            var dm2=m2[0];//dom对象转换



            if(m1.is(obj)){
                console.log("m1-1--"+dm1+"m2--1-"+dm2)
                obj.style.background = '#b8eecf';
                dm2.style.background = 'white';
            }
            if(m2.is(obj)){
                console.log("m1-2--"+dm1+"m2--2-"+dm2)
                obj.style.background = '#b8eecf';
                dm1.style.background = 'white';

            }


        }

    </script>
</head>
<body class="easyui-layout">
<div data-options="region:'north',split:true" style="height:60px">
    <div  align="center" style="font-size: 24px;color: darkred;font-family: 楷体;padding-top: 10px">zjcf财务资源系统</div>
</div>

<div data-options="region:'west',title:'导航菜单',split:true" style="font-size: 28px;font-family: 楷体;width:200px;height:120px">
    <ul id="tt1" class="easyui-tree">
        <li>
            <span><a href="#">首页</a></span>
            <ul>
                <li>
                    <span>报表-北京</span>
                    <ul>
                        <li>
                            <span><a href="${pageContext.request.contextPath }/xiaoliang.jsp" target="myframe">销售排名</a></span>
                        </li>
                        <li>
                            <span><a href="${pageContext.request.contextPath }/echarts1.jsp" target="myframe">销售报表</a></span>
                        </li>
                    </ul>
                </li>
                <li>
                    <span>报表-长沙</span>

                    <ul>
                        <li>
                            <span><a href="#">新单排名</a></span>
                        </li>
                        <li>
                            <span><a href="#">升级排名</a></span>
                        </li>
                        <li>
                            <span><a href="#">新单销售报表</a></span>
                        </li>
                        <li>
                            <span><a href="#">精英销售报表</a></span>
                        </li>
                    </ul>
                </li>
                <li>
                    <span>分析</span>
                    <ul>
                        <li>
                            <span><a href="#">销售分布</a></span>
                        </li>
                        <li>
                            <span><a href="#">投入产出分析</a></span>
                        </li>
                        <li>
                            <span><a href="#">逐月产出分析</a></span>
                        </li>
                    </ul>
                </li>
            </ul>
        </li>
    </ul>
    </li>
    </ul>
</div>
<div data-options="region:'center'" >
    <div id="tt" class="easyui-tabs" data-options="fit:true,pill:true,narrow:true" style="width:500px;height:250px;">
        <div title="主页"><img src="${pageContext.request.contextPath }/back/321.jpg"></div>
    </div>
</div>
</body>
</html>