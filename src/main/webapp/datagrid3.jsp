<%@page contentType="text/html; utf-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core"    prefix="c" %>


<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/My97DatePicker/WdatePicker.js" defer="dp"></script>
<style type="text/css">

</style>

<h4 align="left"><fmt:formatDate value="${sessionScope.sysdate}" pattern="yyyy-MM-dd " /></h4>
<table id="tab"></table>
<br><br><br><br><br><br>
<br><br><br><br><br><br>
<br>
<br><br>
<br>
<br><br>


    <script>
    var date=$("#date").val();
    function findxs() {

        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "${pageContext.request.contextPath }/deptinfo/findlist.do" ,//url
            data: $('#form1').serialize(),date:date,
            success: function (data) {
                console.log(data+"打印服务端返回的数据(调试用)");//打印服务端返回的数据(调试用)

                location.href="${pageContext.request.contextPath }/datagrid3.jsp"
               alert("SUCCESS");

            },
            error : function() {

                alert("异常！");
            }
        });
    }



    $(function () {
        $('#tab').datagrid({
            title:'销售信息',
            fit:true,
            fitColumns:true,
            url:'${pageContext.request.contextPath}/deptinfo/findlist.do',
            columns:[[
                {field:'dept',title:'部门',width:25},
                {field:'name',title:'主管',width:25},
                {field:'deptNum',title:'人数',width:25},
                {field:'todayOrderNum',title:'当日新单',width:25},
                {field:'weekOrderNum',title:'当周新单',width:25},
                {field:'monthOrderNum',title:'当月新单',width:25},
                {field:'todayAmount',title:'当日金额',width:25},
                {field:'weekAmount',title:'当周金额',width:25},
                {field:'mothAmount',title:'当月订单金额',width:25},
                {field:'weekBonus',title:'周奖金',width:25},
                {field:'monthBonuss',title:'主管奖金',width:25},
                {field:'todayOrdersj',title:'当日升级单数',width:25},
                {field:'monthOrdersj',title:'当月升级单数',width:25},
                {field:'todaySjAmount',title:'当日升级单金额',width:25},
                {field:'mothSjAmount',title:'当月升级单金额',width:25},
                {field:'monthSum',title:'月金额汇总',width:25},
                {field:'sjrate',title:'升级率',width:35},

            ]],
   /*         toolbar:[{
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

            }],*/
            pagination:false,

        });

    })

 /*   function ExporterExcel() {
        //获取Datagride的列
        var rows = $('#tab').datagrid('getRows');
        var columns = $("#tab").datagrid("options").columns[0];
        var oXL = new ActiveXObject("Excel.Application"); //创建AX对象excel
        var oWB = oXL.Workbooks.Add(); //获取workbook对象
        var oSheet = oWB.ActiveSheet; //激活当前sheet
        //设置工作薄名称
        oSheet.name = "导出Excel报表";
        //设置表头
        for (var i = 0; i < columns.length; i++) {
            oSheet.Cells(1, i+1).value = columns[i].title;
        }
        //设置内容部分
        for (var i = 0; i < rows.length; i++) {
            //动态获取每一行每一列的数据值
            for (var j = 0; j < columns.length; j++) {
                oSheet.Cells(i + 2, j+1).value = rows[i][columns[j].field];
            }
        }
        oXL.Visible = true; //设置excel可见属性
    }
*/

</script>



<%--<div id="dd" style="background-image:url('##');background-repeat:no-repeat;background-size:100% 100%" >--%>

    <form id="fff" method="post">


        <div  style="text-align:center;">
            <H3 style="color: crimson;">请选择要导出的字段信息</H3>
            <a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >导出excel</a>
        </div>
        <div   style="text-align:center;">
            <select id="cc" class="easyui-combotree" style="width:200px;"data-options="required:true" >
               <%-- <option value="全选">$("select").val()</option>--%>
            </select>
        </div>
    </form>
    <br>


    <form  style="text-align:center;" id="form1">
        选择时间查询:<input  name="datestr" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'})"  id= "date" type="text"   size="24">
        <a id="btn1" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="findxs()"  >提交</a>
  <%--  </div>--%>
</form>
<script>
    $('#cc').combotree({
        url: '${pageContext.request.contextPath}/back/map.json',
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
            url:"${pageContext.request.contextPath}/deptinfo/export.do",
            queryParams:{"content":content,"fields":ss},
            /*  handler:function () {
                      $.messager.show({
                          title:'提醒',
                          msg:'导出成功',
                          showType:'show',

                      });
              }*/
        });
    });
</script>








