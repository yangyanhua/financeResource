<%@page contentType="text/html; utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>财务资源系统</title>

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
        $(function(){
            $('#m1').bind('click', function AddTab(title,url) {
                    //判断选项卡是否重复打开
                    if ($('#tt').tabs('exists', title)) {
                        $('#tt').tabs('select', title);//选中并刷新


                        var currTab = $('#tt').tabs('getSelected');
                        var url = $(currTab.panel('options').content).attr('');
                        if(url != undefined && currTab.panel('options').title != 'Home') {
                            $('#tabs').tabs('update',{  //刷新这个tab
                                tab:currTab,
                                options:{
                                    content:createFrame(url)
                                }
                            })
                        }
                        tabClose(); //绑定menu菜单
                    }
                    else {

                        //var content = createFrame(url); //创建Frame
                        var content = createFrame("${pageContext.request.contextPath }/echarts2.jsp"); //创建Frame
                        $("#tt").tabs("add", {
                            title: '概况',
                            url:"${pageContext.request.contextPath }/xiaoliang.jsp",
                            content:content,
                            closable: true

                        });
                        $('#tt').tabs('add',{
                            title:'广告资源',
                            url:"${pageContext.request.contextPath }/xiaoliang.jsp",
                            content:'<div width=\'100%\' height=\'100%\' frameborder=\'0\' scrolling=\'yes\' src=\'"xiaoliang.jsp"\' ></div>',
                            closable:true,
                            tools:[{
                                iconCls:'icon-mini-refresh',
                                handler:function(){
                                    //  alert('refresh');
                                  //  return "xiaoliang.jsp"
                                }
                            }]
                        });
                        $('#tt').tabs('add',{
                            title:'大数据资源',
                            content:'<div width=\'100%\' height=\'100%\' frameborder=\'0\' scrolling=\'yes\'  ></div>',
                            closable:true,
                            tools:[{
                                iconCls:'icon-mini-refresh',
                                handler:function(){
                                    // alert('refresh');
                                }
                            }]
                        });
                        $('#tt').tabs('add',{
                            title:'渠道资源',
                            content:'<div width=\'100%\' height=\'100%\' frameborder=\'0\' scrolling=\'yes\'  \'></div>',
                            closable:true,
                            tools:[{
                                iconCls:'icon-mini-refresh',
                                handler:function(){
                                    //   alert('refresh');
                                }
                            }]
                        });
                        $('#tt').tabs('add',{
                            title:'自动外呼资源',
                            content:'<div width=\'100%\' height=\'100%\' frameborder=\'0\' scrolling=\'yes\'  ></div>',
                            closable:true,
                            tools:[{
                                iconCls:'icon-mini-refresh',
                                handler:function(){
                                    // alert('refresh');
                                }
                            }]
                        });
                        $('#tt').tabs('add',{
                            title:'机器人资源',//src='"+url+"'
                            content:'<div width=\'100%\' height=\'100%\' frameborder=\'0\' scrolling=\'yes\'  ></div>',
                            closable:true,
                            tools:[{
                                iconCls:'icon-mini-refresh',
                                handler:function(){
                                    //alert('refresh');
                                }
                            }]
                        });
                        $('#tt').tabs('add',{
                            title:'App推广',
                            content:'<div width=\'100%\' height=\'100%\' frameborder=\'0\' scrolling=\'yes\'  ></div>',
                            closable:true,
                            tools:[{
                                iconCls:'icon-mini-refresh',
                                handler:function(){
                                    //alert('refresh');
                                }
                            }]
                        });
                        $('#tt').tabs('add',{
                            title:'流失资源',
                            content:'<div width=\'100%\' height=\'100%\' frameborder=\'0\' scrolling=\'yes\'  ></div>',
                            closable:true,
                            tools:[{
                                iconCls:'icon-mini-refresh',
                                handler:function(){
                                    // alert('refresh');
                                }
                            }]
                        });
                    }

        });
        })


        function createFrame(url) {
            var s = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
            return s;
        }

        function tabClose() {
            /*双击关闭TAB选项卡*/
            $(".tabs-inner").dblclick(function(){ //jQuery双击方法
                var subtitle = $(this).text();
                $('#tabs').tabs('close',subtitle);
            })
        }
    </script>
</head>
<body class="easyui-layout">
<div data-options="region:'north',split:true" style="height:60px;background-color:#5C160C ">
    <div style="font-size: 24px;color: white;font-family: 楷体;float: left;padding-top: 10px;padding-left: 20px">财务资源系统</div>
</div>

<div data-options="region:'west',title:'导航菜单',split:true" style="width:200px;">
    <div id="m1" >资源统计</div>
    <div id="m2"   >费用结算</div>
</div>
<div data-options="region:'center'" >
    <div id="tt" class="easyui-tabs" data-options="fit:true,pill:true,narrow:true" style="width:500px;height:250px;">
        <div title="Home"></div>
    </div>
</div>
</body>
</html>