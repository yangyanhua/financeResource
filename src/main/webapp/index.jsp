
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><script type="text/javascript">
    $(function() {
        //定义数据表格
        $('#userdg').datagrid({
            loadMsg: "Loading..",//远程加载展示字段
            showFooter: true,
            fitColumns: true,//自动展开/收缩列的大小，以适应网格的宽度
            //title : 'PictMessages',//标题
            striped: true,//展示斑马线
            remoteSort: false,
            ctrlSelect: true,//可多选
            rownumbers: true,// 显示行号
            selectOnCheck: true,//选中行是否可以选中框
            checkOnSelect: true,//如果为true，当用户点击行的时候该复选框就会被选中或取消选中。
            //如果为false，当用户仅在点击该复选框的时候才会呗选中或取消
            //singleSelect : false,//如果为true，则只允许选择一行
            columns: [[{
                field: 'ckbox',
                checkbox: true,
            },
                {
                    field: 'dept',
                    title: '部门',
                    width: 100,
                    height: 100,
                    align: 'center',
                    formatter:function(val,row,index){
                        return row.dept;
                    }
                },
                {
                    field: 'name',
                    title: '主管',
                    width: 100,
                    height: 100,
                    align: 'center',
                },



                {
                    field: 'num',
                    title: '人数',
                    width: 100,
                    height: 100,
                    align: 'center',
                    formatter:function(val,row,index){
                        return row.num;
                    }

                },




                {
                    field: 'state',
                    title: '用户状态',
                    width: 100,
                    height: 100,
                    align: 'center',
                },
            ]
            ],

            //datagrid自定义工具
            toolbar:[

            ],
            url:'${pageContext.request.contextPath}/deptinfo/findlist.do',
            //加入分页控件
            pagination : true,//底部展示工具栏
            pagePosition : 'bottom',//分页栏的位置
            pageNumber : 1,//默认展示第几页
            pageSize : 5,//默认每页展示的条数
            pageList : [ 5, 10, 15, 20 ],//可选择每页展示数据
        });
    });


</script>

</head>

<body>


<table id="userdg" class="easyui-datagrid">
</table>






<!-- 提交按钮 -->
<div id="tool" style="display: none">
    <a class="easyui-linkbutton" href="javascript:void(0)" id="sub"
       data-options="iconCls:'icon-ok',onClick:sub">提交</a> <a
        class="easyui-linkbutton" href="javascript:void(0)" id="remove"
        data-options="iconCls:'icon-remove',onClick:remove">重置</a>
</div>


</body>
</html>

















































































