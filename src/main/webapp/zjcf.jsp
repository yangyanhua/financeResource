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


<body class="easyui-layout">
<div data-options="region:'north',split:true" style="height:60px">
    <div  align="center" style="font-size: 24px;color: darkred;font-family: 楷体;padding-top: 10px">中金财富</div>
</div>
<div data-options="region:'west',split:true" style=" width: 200px" >
    <ul id="tt" class="easyui-tree">
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
<div data-options="region:'center'"   >
    <div id="content" class="easyui-tabs" data-options="fit:true,pill:true,narrow:true" style="width:500px;height:250px;">
</div>
</div>
</body>
</html>
