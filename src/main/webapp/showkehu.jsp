<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>CRM����ϵͳ</title>
    
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
        <!--�ǿ�У��-->
       function checkqttel(){
       if(document.f1.content.value==""){
        alert("��ϵ���벻��Ϊ��!");
        document.f1.content.focus();
       return false; 
      }
      return true; 
     }
    </script>
    <script type="text/javascript">
    function checkuser(){
     
      if(document.f2.state.value==""){
        alert("��ͨ״̬����Ϊ��!");
        document.f2.state.focus();
       return false; 
      }
      
       if(document.f2.level.value==""){
        alert("����������Ϊ��!");
        document.f2.level.focus();
       return false; 
      }
      return true; 
      }
    </script>
    
     <script type="text/javascript">
    function abc(){
     
          if(document.getElementById("s3").options[document.getElementById("s3").selectedIndex].value=='��Ч����'){
             document.getElementById("le").value='C:�����ͻ�';
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
	         window.open("kehu.do?act=showkehu&tel="+tel,"�ͻ�����","toolbar=yes,menubar=no,location=no,scrollbars=no,resizable=yes");
	         document.title="<BCCMD>BCCMDDIAL,"+tel9;
	          
	       }
	    </script>
	    <script type="text/javascript">
	       function gotelbd(tel2){
	         tel3 = "0" + tel2;
	         //alert(tel3);
	         //window.open("kehu.do?act=showkehu&tel="+tel,"�ͻ�����","toolbar=yes,menubar=no,location=no,scrollbars=no,resizable=yes"); 
	         document.title="<BCCMD>BCCMDDIAL,"+tel3;
	          
	       }
	    </script>
	    <script type="text/javascript">
	       function gotelwd(tel4){
	         tel5 = "00" + tel4;
	         //alert(tel5);
	         window.open("kehu.do?act=showkehu&tel="+tel,"�ͻ�����","toolbar=yes,menubar=no,location=no,scrollbars=no,resizable=yes"); 
	         document.title="<BCCMD>BCCMDDIAL,"+tel5;
	          
	       }
	    </script>
      <table width="80%" border="1" bgcolor="#ecf1fb">
        <tr>
          <td colspan="2"><font style="color: green">�ͻ�����:</font>&nbsp;&nbsp;<font style="font-size: 15px">�ͻ����:&nbsp;&nbsp;ͨ��:</font><input type="button" value="ͨ��" onclick="gotel('');">
          </td>
        </tr>
        <tr>
          <td style="font-size: 13px" width="18%">

            <form name="f1" action="kehu.do?act=insertqtlxfs&cid= " method="post" onsubmit="return checkqttel();">
              <input type="text" name="content" size="10">&nbsp;<input type="submit" value="��������绰"><br>
            </form>

            <table border="1" style="font-size: 13px" width="100%">
              <tr>
                <td align="center" >��ϵ����</td>
              </tr>
             
              <tr>
                <td align="center"> &nbsp;&nbsp;<input type="button" value="����" onclick="gotelbd(' ');">&nbsp;<input type="button" value="���" onclick="gotelwd(' ');"></td>
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
                <td nowrap>�ͻ�����:&nbsp;<input type="text" name="name" size="10" value=" "></td>
                <td nowrap>�ͻ��ֻ�:&nbsp; </td>
                <td nowrap>΢�ź���:&nbsp;
                    <input type="text" name="wxCode" size="10" value=" ">
                </td> 
                <td nowrap>��ͨ״̬:
                   <select name="state" style="width: 130px;" id="s3" onchange="abc();">
                     <option selected></option>
                       <option value="��ͨ�ǹ���">��ͨ�ǹ���</option>
                       <option value="��ͨ����">��ͨ����</option>
                       <option value="�ܽ�/��ͨ�����Ҷ�">�ܽ�/��ͨ�����Ҷ�</option>
                       <option value="�պ�">�պ�</option>
                       <option value="ͣ��">ͣ��</option>
                       <option value="�ػ�">�ػ�</option>
			       </select>
                </td>
               </tr>
               <tr>
                   <td nowrap colspan="2">ʡ:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <select name="province" style="width: 80px;" id="s2">
                       <option selected></option>
                       <option value="����">����</option>
                       <option value="���">���</option>
                       <option value="�ӱ�">�ӱ�</option>
                       <option value="ɽ��">ɽ��</option>
                       <option value="���ɹ�">���ɹ�</option>
                       <option value="ɽ��">ɽ��</option>
                       <option value="����">����</option>
                       <option value="����">����</option>
                       <option value="�㽭">�㽭</option>
                       <option value="����">����</option>
                       <option value="�Ϻ�">�Ϻ�</option>
                       <option value="�㶫">�㶫</option>
                       <option value="����">����</option>
                       <option value="����">����</option>
                       <option value="����">����</option>
                       <option value="����">����</option>
                       <option value="����">����</option>
                       <option value="����">����</option>
                       <option value="����">����</option>
                       <option value="�½�">�½�</option>
                       <option value="�ຣ">�ຣ</option>
                       <option value="����">����</option>
                       <option value="����">����</option>
                       <option value="�Ĵ�">�Ĵ�</option>
                       <option value="����">����</option>
                       <option value="����">����</option>
                       <option value="����">����</option>
                       <option value="����">����</option>
                       <option value="����">����</option>
                       <option value="����">����</option>
                       <option value="������">������</option>
                       <option value="̨��">̨��</option>
                       <option value="���">���</option>
                       <option value="����">����</option>
                   </select>
                       &nbsp;&nbsp;
                       ����:&nbsp;&nbsp;<input type="text" name="stockage" size="5" value=" ">
                       &nbsp;&nbsp;�Ը�:&nbsp;&nbsp;
                   <select name="style" style="width: 80px;" id="s5">
                     <option selected></option>
				     <option value="�嶯">�嶯</option>
				     <option value="����">����</option>
				     <option value="����">����</option>
				     <option value="��ԥ">��ԥ</option>
			       </select>
                </td>
                <td nowrap>�������:&nbsp;<input type="text" name="othersoft" size="10" value=" "></td>
                <td nowrap>�ϴι�ͨ:&nbsp;<span id="s3Right"></span></td>
               </tr>
               <tr> 
                <td nowrap>����:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="city" size="10" value=" "></td>
                <td nowrap>QQ����:&nbsp;<input type="text" name="assetstat" size="10" value=" "><input type="hidden" name="assetstat1" size="10" value=""></td>
                <td nowrap>�ͻ��Ա�:
                   <select name="sex" style="width: 80px;" id="s6">
                     <option selected></option>
				     <option value="��">��</option>
				     <option value="Ů">Ů</option>
			       </select>
                </td>
                <td nowrap>��Դ����:
                   <select name="type" id="s1">
                     <option value=""></option>
				     <option value="�·���Դ">�·���Դ</option>
				     <option value="������Դ">������Դ</option>
				     <option value="�ͷ��ط�">�ͷ��ط�</option>
			       </select>
			    </td>
               
              
               </tr>
               <tr>
                 <td nowrap>¼��ʱ��:&nbsp; </td>
                 <td colspan="2">��ע:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="other" size="40" value=" "></td>
                 <td nowrap>ע��ʱ��:&nbsp; </td>
                 
              </tr>
              <tr>
                 <td colspan="2">�ֹ����:&nbsp;<input type="text" name="cgqk" size="40" value=" "></td>
                 <td nowrap>�ͻ���Դ:&nbsp;<input type="text" name="khly" size="13" value=" "></td>
                 <td nowrap>�ʽ���:&nbsp;&nbsp;&nbsp;<input type="text" name="zjl" size="10" value=" "></td>
                 
                 
              </tr>
              <tr>
                 <td nowrap>���ɷ��:&nbsp;<input type="text" name="cgfg" size="10" value=" "></td>
                 <td >���㹵ͨʱ��:&nbsp;<input type="text" name="gtsj" size="12" value=" "></td>
                 <td >��������:&nbsp;<input type="text" name="fxnl" size="13" value=" "></td>
                 <td >���ܷ���:&nbsp;<input type="text" name="csfx" size="15" value=" "></td>
              </tr>
              
              <tr>
                 <td colspan="1">���֤��:&nbsp;<input type="text" name="shenfenzheng" size="20" value=" "></td>
                 <td nowrap>�Ƿ�����:<input type="text" name="shangmen" size="13" value=" "></td>
                 <td colspan="2" nowrap>�״�����ʱ��:<input onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" type="text" name="scsmtime" size="25" value=""></td>
              </tr>
              <tr>
                 <td colspan="2">ģ���ʺ�:&nbsp;<input type="text" name="monihao" size="20" value=" "></td>
                 <td nowrap>��ʽ�ʺ�:&nbsp;<input type="text" name="zhengshihao" size="13" value=" "></td>
                 <td nowrap>�Ƿ����:&nbsp;&nbsp;&nbsp;<input type="text" name="rujin" size="10" value=" "></td>
              </tr>
              <tr>
	              <td>����΢��:&nbsp;
		            <select name="isExistsWeChat" id="isExistsWeChat" onchange="disabledWeChatMethod(this.value)">
		               <option value="0">==��ѡ��==</option>
					   <option value="1" >��</option>
					   <option value="2" >��</option>
					 </select>
                 </td>
                  <td>�Ƿ����΢��:&nbsp;
		            <select name="isWeChat" id="isWeChat" >
					   <option value="0" >δ���</option>
					   <option value="1" >�����</option>
					 </select>
                 </td>
                  <td  colspan="2" nowrap>ע����Դ:&nbsp;

                  </td>
              </tr>
                <tr>
                    <td colspan="2">�ִ�:&nbsp;</td>
                    <td colspan="2">�ظ�����:&nbsp;</td>
                </tr>
              </table>
          </td>
        </tr>
           
        <tr style="font-size: 13px">
          <td colspan="6">�ط�����:<br>
            <textarea name="content" rows="6" cols="130"></textarea>
          </td>
        </tr>
        <tr style="font-size: 13px">
          <td colspan="6">
            ԤԼ�´λط�ʱ��:<input id="d13" name="fdate" class="Wdate" type="text" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" size="22"/>&nbsp;&nbsp;&nbsp;&nbsp;
            ��������:  
            <select name="level" id="le">
               <option selected></option>
			   <option value="A:����ͻ�">A:����ͻ�</option>
			   <option value="B:�����ͻ�">B:�����ͻ�</option>
			   <option value="C:�����ͻ�">C:�����ͻ�</option>
			   <option value="D:�ɽ��ͻ�">D:�ɽ��ͻ�</option>
			   <option value="E:δ��ͨ��">E:δ��ͨ��</option>
			   <option value="F:�����ɽ�">F:�����ɽ�</option>
			 </select>&nbsp;&nbsp;
			 <input type="submit" value="�� ��">
          </td>
        </tr>
       </form> 
        <tr>
          <td colspan="2">
            <table width="100%" border="1">
              <tr align="center" style="color: blue">
                <td style="font-size: 16px">��¼��</td>
                <td style="font-size: 16px">����</td>
                <td style="font-size: 16px">ԤԼ�ط�ʱ��</td>
                <td style="font-size: 16px">��¼ʱ��</td>              
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
