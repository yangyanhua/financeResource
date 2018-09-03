<%@page contentType="text/html; utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>zjcf系统</title>

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
          function zdie(){
              $(".easyui-layout").layout('collapse','west');

          }

        $(function(){
           // $(".easyui-layout").layout('collapse','north');
          //  $(".easyui-layout").layout('collapse','west');
            //easyui-layout的布局增加隐藏布局的情况下，显示title
            var buttonDir = {north:'down',south:'up',east:'left',west:'right'};
            $.extend($.fn.layout.paneldefaults,{
                onBeforeCollapse:function(){
                    /**/
                    var popts = $(this).panel('options');
                    var dir = popts.region;
                    var btnDir = buttonDir[dir];
                    if(!btnDir) return false;

                    setTimeout(function(){
                        var pDiv = $('.layout-button-'+btnDir).closest('.layout-expand').css({
                            textAlign:'center',lineHeight:'18px',fontWeight:'bold'
                        });

                        if(popts.title){
                            var vTitle = popts.title;
                            if(dir == "east" || dir == "west"){
                                var vTitle = popts.title.split('').join('<br/>');
                                pDiv.find('.panel-body').html(vTitle);
                            }else{
                                $('.layout-button-'+btnDir).closest('.layout-expand').find('.panel-title')
                                    .css({textAlign:'left'})
                                    .html(vTitle)
                            }

                        }
                    },100);

                }
            });


        });
    </script>
</head>
<body class="easyui-layout">


<div data-options="region:'west',split:true" style="width:200px;height:400px">
    <div  style="height:60px">
        <div  align="left"><img src="${pageContext.request.contextPath }/back/log.bmp" width:200px></div>
    </div>
    <div  >
    <ul id="tt1" class="easyui-tree" >
        <li  >
            <span><a href="${pageContext.request.contextPath }/index.jsp">首页</a></span>
            <ul>
                <li>
                    <span>报表-北京</span>
                    <ul>
                        <li>
                            <span><a href="${pageContext.request.contextPath }/xiaoshou.jsp" target="myframe">销售排名</a></span>
                        </li>
                        <li>
                            <span><a href="${pageContext.request.contextPath }/xiaoshou.jsp" target="myframe">销售报表</a></span>
                        </li>
                    </ul>
                </li>
                <li   >
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
                <li   >
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
</div>
<div data-options="region:'center'" >
   <%--<div  style="height: 30px"> <input id="zd" type="button" value="折叠" onclick="zdie()"></div>--%>
    <div  style="height: 50px"> <img id="zd" src="${pageContext.request.contextPath }/back/zedie.bmp" onclick="zdie()" ></div>
    <div id="tt" class="easyui-tabs" data-options="fit:true,pill:true,narrow:true" style="width:500px;height:250px;">
        <%--<div title="主页"> </div>--%>
            <iframe name="myframe" width="900" height="600" />
    </div>
</div>
</body>
</html>