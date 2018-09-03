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
<div style="position: relative;left:20px">
    <div  id="form1" action="##"  method="post">
        <input  name="start"  style="background-color: #b8eecf" onClick="WdatePicker({dateFmt:'yyyy/MM/dd',maxDate:'%y-%M-%d'})"  id= "start" type="text"   size="10">
        至 <input   name="end"  style="background-color: #b8eecf"onClick="WdatePicker({dateFmt:'yyyy/MM/dd',maxDate:'%y-%M-%d',minDate:'#F{$dp.$D(\'start\')}',})"  id= "end" type="text"   size="10">
        <input name="button" onsubmit="return false" type="button" id="dp" value="查询" onclick="findxl()">
    </div>
</div>

<div class="breadcrumb___3MKYT ant-breadcrumb"><span><span class="ant-breadcrumb-link">
    <a href="#/">首页</a></span><span class="ant-breadcrumb-separator">/</span></span>
    <span><span class="ant-breadcrumb-link"><span to="/index.jsp">取一级目录</span></span>
        <span class="ant-breadcrumb-separator">/</span></span>
    <span><span class="ant-breadcrumb-link"><span to="/xiaoshou.jsp">取文件名</span></span>
    <span class="ant-breadcrumb-separator">/</span></span></div>



</body>
</html>



