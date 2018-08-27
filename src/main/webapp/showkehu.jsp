<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>CRM销售系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js" defer="defer">
    </script>
    <script type="text/javascript">
        <!--非空校验-->
       function checkqttel(){
       if(document.f1.content.value==""){
        alert("联系号码不能为空!");
        document.f1.content.focus();
       return false; 
      }
      return true; 
     }
    </script>
    <script type="text/javascript">
    function checkuser(){
     
      if(document.f2.state.value==""){
        alert("沟通状态不能为空!");
        document.f2.state.focus();
       return false; 
      }
      
       if(document.f2.level.value==""){
        alert("评定级别不能为空!");
        document.f2.level.focus();
       return false; 
      }
      return true; 
      }
    </script>
    
     <script type="text/javascript">
    function abc(){
     
          if(document.getElementById("s3").options[document.getElementById("s3").selectedIndex].value=='无效号码'){
             document.getElementById("le").value='C:放弃客户';
          }else{
             document.getElementById("le").value='';
          }

      }
    
	    function disabledWeChatMethod(obj) {
	    	var isWeChatVar = document.getElementById("isWeChat");
	    	if(obj == '2'){
	    		isWeChatVar.value="0";
	    		isWeChatVar.disabled=true;
	    	}else{
	    		isWeChatVar.value="0";
	    		isWeChatVar.disabled=false;
	    	}
	    }

    </script>
    
  </head>
  
  <body>
    <center>
    <br>

      
       <script type="text/javascript">
	       function gotel(tel9,tel){
	         window.open("kehu.do?act=showkehu&tel="+tel,"客户资料","toolbar=yes,menubar=no,location=no,scrollbars=no,resizable=yes");
	         document.title="<BCCMD>BCCMDDIAL,"+tel9;
	          
	       }
	    </script>
	    <script type="text/javascript">
	       function gotelbd(tel2){
	         tel3 = "0" + tel2;
	         //alert(tel3);
	         //window.open("kehu.do?act=showkehu&tel="+tel,"客户资料","toolbar=yes,menubar=no,location=no,scrollbars=no,resizable=yes"); 
	         document.title="<BCCMD>BCCMDDIAL,"+tel3;
	          
	       }
	    </script>
	    <script type="text/javascript">
	       function gotelwd(tel4){
	         tel5 = "00" + tel4;
	         //alert(tel5);
	         window.open("kehu.do?act=showkehu&tel="+tel,"客户资料","toolbar=yes,menubar=no,location=no,scrollbars=no,resizable=yes"); 
	         document.title="<BCCMD>BCCMDDIAL,"+tel5;
	          
	       }
	    </script>
      <table width="80%" border="1" bgcolor="#ecf1fb">
        <tr>
          <td colspan="2"><font style="color: green">客户资料:</font>&nbsp;&nbsp;<font style="font-size: 15px">客户编号:&nbsp;&nbsp;通话:</font><input type="button" value="通话" onclick="gotel('');">
          </td>
        </tr>
        <tr>
          <td style="font-size: 13px" width="18%">

            <form name="f1" action="kehu.do?act=insertqtlxfs&cid= " method="post" onsubmit="return checkqttel();">
              <input type="text" name="content" size="10">&nbsp;<input type="submit" value="添加其它电话"><br>
            </form>

            <table border="1" style="font-size: 13px" width="100%">
              <tr>
                <td align="center" >联系号码</td>
              </tr>
             
              <tr>
                <td align="center"> &nbsp;&nbsp;<input type="button" value="本地" onclick="gotelbd(' ');">&nbsp;<input type="button" value="外地" onclick="gotelwd(' ');"></td>
              </tr>
             
            </table>
          </td>
          <td>
           <form name="f2" action="kehu.do?act=updatekehu&cid= &tel= &lastbinding= &wx_num= " method="post" onsubmit="return checkuser();">
            <table style="font-size: 13px">
              <script type="text/javascript">
                  window.onload=function(){
                  document.getElementById("s1").value=' ';
                  document.getElementById("s2").value=' ';
                  document.getElementById("s3").value='';
                  document.getElementById("s3Right").innerHTML=' ';
                  document.getElementById("s5").value=' ';
                  document.getElementById("s6").value=' ';
                  document.getElementById("le").value=' ';
       
                  }
                </script>
              <tr>
                <td nowrap>客户姓名:&nbsp;<input type="text" name="name" size="10" value=" "></td>
                <td nowrap>客户手机:&nbsp; </td>
                <td nowrap>微信号码:&nbsp;
                    <input type="text" name="wxCode" size="10" value=" ">
                </td> 
                <td nowrap>沟通状态:
                   <select name="state" style="width: 130px;" id="s3" onchange="abc();">
                     <option selected></option>
                       <option value="接通非股民">接通非股民</option>
                       <option value="接通股民">接通股民</option>
                       <option value="拒接/接通立即挂断">拒接/接通立即挂断</option>
                       <option value="空号">空号</option>
                       <option value="停机">停机</option>
                       <option value="关机">关机</option>
			       </select>
                </td>
               </tr>
               <tr>
                   <td nowrap colspan="2">省:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <select name="province" style="width: 80px;" id="s2">
                       <option selected></option>
                       <option value="北京">北京</option>
                       <option value="天津">天津</option>
                       <option value="河北">河北</option>
                       <option value="山西">山西</option>
                       <option value="内蒙古">内蒙古</option>
                       <option value="山东">山东</option>
                       <option value="江苏">江苏</option>
                       <option value="安徽">安徽</option>
                       <option value="浙江">浙江</option>
                       <option value="福建">福建</option>
                       <option value="上海">上海</option>
                       <option value="广东">广东</option>
                       <option value="广西">广西</option>
                       <option value="海南">海南</option>
                       <option value="湖北">湖北</option>
                       <option value="湖南">湖南</option>
                       <option value="河南">河南</option>
                       <option value="江西">江西</option>
                       <option value="宁夏">宁夏</option>
                       <option value="新疆">新疆</option>
                       <option value="青海">青海</option>
                       <option value="陕西">陕西</option>
                       <option value="甘肃">甘肃</option>
                       <option value="四川">四川</option>
                       <option value="云南">云南</option>
                       <option value="贵州">贵州</option>
                       <option value="西藏">西藏</option>
                       <option value="重庆">重庆</option>
                       <option value="辽宁">辽宁</option>
                       <option value="吉林">吉林</option>
                       <option value="黑龙江">黑龙江</option>
                       <option value="台湾">台湾</option>
                       <option value="香港">香港</option>
                       <option value="澳门">澳门</option>
                   </select>
                       &nbsp;&nbsp;
                       股龄:&nbsp;&nbsp;<input type="text" name="stockage" size="5" value=" ">
                       &nbsp;&nbsp;性格:&nbsp;&nbsp;
                   <select name="style" style="width: 80px;" id="s5">
                     <option selected></option>
				     <option value="冲动">冲动</option>
				     <option value="理智">理智</option>
				     <option value="果断">果断</option>
				     <option value="犹豫">犹豫</option>
			       </select>
                </td>
                <td nowrap>其他软件:&nbsp;<input type="text" name="othersoft" size="10" value=" "></td>
                <td nowrap>上次沟通:&nbsp;<span id="s3Right"></span></td>
               </tr>
               <tr> 
                <td nowrap>地区:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="city" size="10" value=" "></td>
                <td nowrap>QQ号码:&nbsp;<input type="text" name="assetstat" size="10" value=" "><input type="hidden" name="assetstat1" size="10" value=""></td>
                <td nowrap>客户性别:
                   <select name="sex" style="width: 80px;" id="s6">
                     <option selected></option>
				     <option value="男">男</option>
				     <option value="女">女</option>
			       </select>
                </td>
                <td nowrap>资源类型:
                   <select name="type" id="s1">
                     <option value=""></option>
				     <option value="下发资源">下发资源</option>
				     <option value="热线资源">热线资源</option>
				     <option value="客服回访">客服回访</option>
			       </select>
			    </td>
               
              
               </tr>
               <tr>
                 <td nowrap>录入时间:&nbsp; </td>
                 <td colspan="2">备注:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="other" size="40" value=" "></td>
                 <td nowrap>注册时间:&nbsp; </td>
                 
              </tr>
              <tr>
                 <td colspan="2">持股情况:&nbsp;<input type="text" name="cgqk" size="40" value=" "></td>
                 <td nowrap>客户来源:&nbsp;<input type="text" name="khly" size="13" value=" "></td>
                 <td nowrap>资金量:&nbsp;&nbsp;&nbsp;<input type="text" name="zjl" size="10" value=" "></td>
                 
                 
              </tr>
              <tr>
                 <td nowrap>炒股风格:&nbsp;<input type="text" name="cgfg" size="10" value=" "></td>
                 <td >方便沟通时间:&nbsp;<input type="text" name="gtsj" size="12" value=" "></td>
                 <td >分析能力:&nbsp;<input type="text" name="fxnl" size="13" value=" "></td>
                 <td >承受风险:&nbsp;<input type="text" name="csfx" size="15" value=" "></td>
              </tr>
              
              <tr>
                 <td colspan="1">身份证号:&nbsp;<input type="text" name="shenfenzheng" size="20" value=" "></td>
                 <td nowrap>是否上门:<input type="text" name="shangmen" size="13" value=" "></td>
                 <td colspan="2" nowrap>首次上门时间:<input onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" type="text" name="scsmtime" size="25" value=""></td>
              </tr>
              <tr>
                 <td colspan="2">模拟帐号:&nbsp;<input type="text" name="monihao" size="20" value=" "></td>
                 <td nowrap>正式帐号:&nbsp;<input type="text" name="zhengshihao" size="13" value=" "></td>
                 <td nowrap>是否入金:&nbsp;&nbsp;&nbsp;<input type="text" name="rujin" size="10" value=" "></td>
              </tr>
              <tr>
	              <td>有无微信:&nbsp;
		            <select name="isExistsWeChat" id="isExistsWeChat" onchange="disabledWeChatMethod(this.value)">
		               <option value="0">==请选择==</option>
					   <option value="1" >有</option>
					   <option value="2" >无</option>
					 </select>
                 </td>
                  <td>是否添加微信:&nbsp;
		            <select name="isWeChat" id="isWeChat" >
					   <option value="0" >未添加</option>
					   <option value="1" >已添加</option>
					 </select>
                 </td>
                  <td  colspan="2" nowrap>注册来源:&nbsp;

                  </td>
              </tr>
                <tr>
                    <td colspan="2">字词:&nbsp;</td>
                    <td colspan="2">重复数量:&nbsp;</td>
                </tr>
              </table>
          </td>
        </tr>
           
        <tr style="font-size: 13px">
          <td colspan="6">回访内容:<br>
            <textarea name="content" rows="6" cols="130"></textarea>
          </td>
        </tr>
        <tr style="font-size: 13px">
          <td colspan="6">
            预约下次回访时间:<input id="d13" name="fdate" class="Wdate" type="text" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" size="22"/>&nbsp;&nbsp;&nbsp;&nbsp;
            评定级别:  
            <select name="level" id="le">
               <option selected></option>
			   <option value="A:意向客户">A:意向客户</option>
			   <option value="B:培养客户">B:培养客户</option>
			   <option value="C:放弃客户">C:放弃客户</option>
			   <option value="D:成交客户">D:成交客户</option>
			   <option value="E:未沟通上">E:未沟通上</option>
			   <option value="F:即将成交">F:即将成交</option>
			 </select>&nbsp;&nbsp;
			 <input type="submit" value="添 加">
          </td>
        </tr>
       </form> 
        <tr>
          <td colspan="2">
            <table width="100%" border="1">
              <tr align="center" style="color: blue">
                <td style="font-size: 16px">记录人</td>
                <td style="font-size: 16px">内容</td>
                <td style="font-size: 16px">预约回访时间</td>
                <td style="font-size: 16px">记录时间</td>              
              </tr>
            
              <tr>
                <td style="font-size: 16px" align="center">&nbsp;</td>
                <td style="font-size: 16px" >&nbsp;</td>
                <td style="font-size: 16px" align="center">&nbsp;</td>
                <td style="font-size: 16px" align="center">&nbsp;</td>
              </tr>
            
            </table>
          </td>
        </tr>
       
      </table>
    </center>
  </body>
</html>
