<%@ page language="java" import="java.util.*" pageEncoding="gb18030" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/" +"tab/";
%>
<% long order = 1;
   String depart_num=""; 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>������Ϣ����</title>

<!---------------------------CSS��ʽ------------------------------>
<style type="text/css">	
a{
   text-decoration:none;color:white;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {
	font-size: 12px
}
.STYLE3 {
	font-size: 12px;
	font-weight: bold;
}
.STYLE4 {
	color: #03515d;
	font-size: 12px;
}
.close {
	width: 50px;
	height: 30px;
	
	border-radius: 5px;
	line-height: 30px;
	position: absolute;

	margin-left: -8px;
	margin-top: -15px;
}
.close:hover {
	background: #008000;
	color: #FFFFFF;
}
.beautywords {
	font-size: 40px;
	font-family: ����Ҧ��;
	color: blue;
}
</style>



<!------------------------ Jquery 2015.7.12 -------------------->
<script type="text/javascript"
src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js">
</script>

<div id=win style="display: none; position: absolute; left: 50%; top: 40%; width: 450px; height: 340px; margin-left: -300px; margin-top: -200px; border: 1px solid #888; background-color: #ffffff; text-align: center;">
     
     <table style="background-color:#008080;" width="100%" heigh="20%">
     	<tr>
     		<td width="90%"><span><font color="#f5f5f5" face="microsoft yahei" size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������Ϣ</font></span></td>
     		<td width="10%"><a href="javascript:closeLogin();" align="right" ; class="close">�ر�</a></td>
     	</tr>
     </table>
     <br>
     <span style="position: absolute; left: 21%;">��&nbsp;��&nbsp;��&nbsp;��:</span><input id="showdepart_num" style="width:160px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px; color:#000000;position: absolute; left: 42%;" disabled></input>  <br><br>
     <span style="position: absolute; left: 21%;">��&nbsp;��&nbsp;��&nbsp;��:</span><input id="showdepart_name" style="width:160px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px; color:#000000;position: absolute; left: 42%;" ></input> <br><br>
     <span style="position: absolute; left: 21%;">��&nbsp;��&nbsp;��&nbsp;��:</span><input id="showoffice_num" style="width:160px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px; color:#000000;position: absolute; left: 42%;" onkeyup="IsInteger(2,this)"></input><span id="error2" style="color:red;font-size:9px;position: absolute; left: 80%;"></span><br><br>   
     <span style="position: absolute; left: 21%;">Ա&nbsp;��&nbsp;��&nbsp;��:</span><input id="showstaff_num" style="width:160px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px; color:#000000 ;position: absolute; left: 42%;" onkeyup="IsInteger(3,this)"></input><span id="error3" style="color:red; font-size:9px;position: absolute; left: 80%;" ></span><br> <br>
     <span style="position: absolute; left: 21%;">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��:</span><input id="showmanager" style="width:160px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px; color:#000000;position: absolute; left: 42%;" onkeyup="IsChinese(4,this)"><span id="error4" style="color:red;font-size:9px;position: absolute; left: 80%;"></span><br><br>
     <span style="position: absolute; left: 21%;">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��:</span><input id="showrule" style="width:160px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px; color:#000000;position: absolute; left: 42%;" ></input><br>
	 <input type="submit" id="editSure" style="position: absolute; left: 20%; top: 85%;background-color:#ff8040" value="                ȷ��               " onclick="editSured()" ></input>
</div>
<div style='display: none; position: absolute; left: 40%; top: 14%;'id='updateDoneDiv'>
	<span class="beautywords">�޸ĳɹ�</span>
</div>
		
<div style='display: none; position: absolute; left: 40%; top: 14%;'id='delDoneDiv'>
	<span class="beautywords">ɾ���ɹ���</span>
</div>	

<div style='display: none; position: absolute; left: 40%; top: 14%;'id='addDoneDiv'>
	<span class="beautywords">��ӳɹ���</span>
</div>

<div id=addwin style="display: none; position: absolute; left: 50%; top: 40%; width: 420px; height: 340px; margin-left: -300px; margin-top: -200px; 
		border: 1px solid #888; background-color: #ffffff; text-align: center;" >
		<table style="background-color:#008080;" width="100%" heigh="20%">
			<tr>
				<td width="90%"><label><font color="#f5f5f5" face="microsoft yahei" size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��Ӳ�����Ϣ</font></label></td>
				<td width="10%"><a href="javascript:closeAdd();" alien="right" ; class="close">�ر�</a></td>
			</tr>
		</table>
		
		
    <br>
	
	<label style="position: absolute; left: 21%;">��&nbsp;��&nbsp;��&nbsp;��:</label><input id="depart_numinfo" type="text" style="width:160px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px; color:#000000 ;position: absolute; left: 42%" onkeyup="IsInteger(6,this)"></input><span id="error6" style="color:red;font-size:9px;position: absolute; left: 83%;"></span><br></br>
	<label style="position: absolute; left: 21%;">��&nbsp;��&nbsp;��&nbsp;��:</label><input id="depart_nameinfo" type="text" style="width:160px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px; color:#000000 ;position: absolute; left: 42%" ></input><br></br>
	<label style="position: absolute; left: 21%;">��&nbsp;��&nbsp;��&nbsp;��:</label><input id="office_info" type="text" style="width:160px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px; color:#000000;position: absolute; left: 42%" onkeyup="IsInteger(8,this)"></input><span id="error8" style="color:red;font-size:9px;position: absolute; left: 83%;"></span><br></br>
	<label style="position: absolute; left: 21%;">Ա&nbsp;��&nbsp;��&nbsp;��:</label><input id="staff_info" type="text" style="width:160px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px; color:#000000;position: absolute; left: 42%" onkeyup="IsInteger(9,this)"></input><span id="error9" style="color:red;font-size:9px;position: absolute; left: 83%;"></span><br></br>
	<label style="position: absolute; left: 21%;">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��:</label><input id="manager_info" type="text" style="width:160px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px; color:#000000;position: absolute; left: 42%" onkeyup="IsChinese(10,this)"></input><span id="error10" style="color:red;font-size:9px;position: absolute; left: 83%;"></span><br></br>
	<label style="position: absolute; left: 21%;">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��:</label><input id="rule_info" type="text" style="width:160px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px; color:#000000;position: absolute; left: 42%" ></input><br></br>

	<input type="submit" id="addSure" style="position: absolute; left: 19%; top: 85%; background-color:#ff8040" value="                ȷ��               " onclick="addSured()"></input>
</div>

<!---------------------------------Jquery end 2015.7.12---------------------------->

<!--------------------------------JavaScript����-------------------------------->

<script>		
var selectedId;//��ѡ�е�item
var doc=document;
/*���ǲ�����Ϣ���,ÿ����Ϣ��ı༭���ܵĵ��ú���,ʵ���޸Ĺ���*/
function openEdit(id){  
   
 
	var depart_num=doc.getElementById("depart_num"+id).innerHTML;
	
	var depart_name=doc.getElementById("depart_name"+id).innerHTML;
	var office_num=doc.getElementById("office_num"+id).innerHTML;
	var staff_num=doc.getElementById("staff_num"+id).innerHTML;
	var manager=doc.getElementById("manager"+id).innerHTML;
	var rule=doc.getElementById("rule"+id).innerHTML;
	doc.getElementById("showdepart_num").value=depart_num;
	doc.getElementById("showdepart_name").value=depart_name;
	doc.getElementById("showoffice_num").value=office_num;
	doc.getElementById("showstaff_num").value=staff_num;
	doc.getElementById("showmanager").value=manager;
	doc.getElementById("showrule").value=rule;
	doc.getElementById("win").style.display="";
	selectedId=id;
}
//�ڱ������ת����Xҳ
function jumpTo(){

	 var temp=document.getElementById('jump_to').value;
	 var count = <%=(Integer)session.getAttribute("pageCount")/15+((Integer)session.getAttribute("pageCount")%15!=0?1:0)%>
	 if(temp<=count && temp>0)
	  	window.location.href="../servlet/Office1?jump_type=jump_to&to_page="+temp;
}
function closeLogin(){   
    document.getElementById("win").style.display="none";
}
//�ر���Ӽ�¼���� 2015.7.14
function closeAdd(){   
	document.getElementById("addwin").style.display="none";
}
//��Ӽ�¼ȷ�� 2015.7.14
function addSured(){  
	 
	 var isSureAdded=confirm('ȷ��Ҫ���������¼��');
	 var completeInfo="";
	 if(isSureAdded==true){
	 
		 var addedDepart_num=doc.getElementById("depart_numinfo").value;
		 completeInfo+=addedDepart_num+'#';
		  var addedDepart_name=doc.getElementById("depart_nameinfo").value;
		 completeInfo+=addedDepart_name+'#';
		  var addedOffice=doc.getElementById("office_info").value;
		 completeInfo+=addedOffice+'#';
		  var addedStaff=doc.getElementById("staff_info").value;
		 completeInfo+=addedStaff+'#';
	     var addedManager=doc.getElementById("manager_info").value;
	     completeInfo+=addedManager+'#';
	     var addedRule=doc.getElementById("rule_info").value;
	       completeInfo+=addedRule+'#'; 
	  
	     document.getElementById("addDoneDiv").style.display=""; 
	     var tip='document.getElementById("addDoneDiv").style.display="none";'
	     setTimeout(tip,2000); 
	     doc.getElementsByName("addSolve")[0].value=completeInfo;
	     var addForm=doc.forms("transForm");   
	     addForm.action="../servlet/office1_Insert";
	     addForm.submit(); 
	     closeAdd();    
	 }
	 else
	 {
	    closeAdd();
	 }
}
//ȷ�ϱ༭���޸�
function editSured(){ 
   
   	var isSureEdited=confirm('ȷ��Ҫ�޸���');
    if(isSureEdited==true)
    {
	   var updatedDepart_num=doc.getElementById("showdepart_num").value;
	   var updatedDepart_name=doc.getElementById("showdepart_name").value;
	   var updatedOffice=doc.getElementById("showoffice_num").value;
	   var updatedStaff_num=doc.getElementById("showstaff_num").value;
	   var updatedManager=doc.getElementById("showmanager").value;
	   var updatedRule=doc.getElementById("showrule").value;
	   doc.getElementsByName("depart_numvalue")[0].value=updatedDepart_num;
	   doc.getElementsByName("staffvalue")[0].value=updatedStaff_num;
	   doc.getElementsByName("rulevalue")[0].value=updatedRule;
	   doc.getElementsByName("managervalue")[0].value=updatedManager;
	   doc.getElementsByName("officevalue")[0].value=updatedOffice;
	   doc.getElementsByName("depart_namevalue")[0].value=updatedDepart_name;
	   document.getElementById("updateDoneDiv").style.display="";
	   var tip='document.getElementById("updateDoneDiv").style.display="none";'
	   setTimeout(tip,2000); 
	   var form=doc.forms("transform");  //��Ӧ��һ��table form
	   form.action="../servlet/office1_Update";
	   form.submit();
	   closeLogin();
   }
   else
   	   closeLogin();
}
//ɾ��������Ŀ 2015.7.13
function delSingleItem(delId){ 
      
    var isSureDeled=confirm('ȷ��ҪҪɾ��������Ϣ��');
    if(isSureDeled){
	    var departKey=doc.getElementById("depart_num"+delId).innerHTML;    	  
	    doc.getElementsByName("delSolve")[0].value=departKey+'#';//��ȡ����keyֵ    	   
	    for (i=1;i<departInfoTable.rows.length;i++){//����
	        departInfoTable.rows[i].cells[1].innerHTML=i;
	    }  //for
	      //submit
	    var form=doc.forms("transForm");       
	    form.action="../servlet/office1_Delete";
	    form.submit();   
    }//if         
}
//����ɾ������ 2015.7.13
function delBatItems(){ 

   var batBox=doc.getElementsByName("checkbox"); 
   var len=batBox.length;
   var rowIndex;
   var allKey="";
   for(i=0;i<len;i++)
   {
	    if(batBox[i].checked==true)
	    {   
	        var departKey = doc.getElementById("depart_num"+i).innerHTML;
	        allKey+=departKey+'#';
	    }  
   } 
   doc.getElementsByName("delSolve")[0].value=allKey;
   var keyform=doc.forms("transForm");   
   keyform.action="../servlet/office1_Delete";
   keyform.submit();  
}
//������Ӵ��� 2015.7.14
function addItem(){
   doc.getElementById("addwin").style.display="";
}
</script>


<script>
var  highlightcolor='#c1ebff';
//�˴�clickcolorֻ����winϵͳ��ɫ������ܳɹ�,�����#xxxxxx�Ĵ���Ͳ���,��û�����Ϊʲô:(
var  clickcolor='#51b2f6';
function  changeto(){
	source=event.srcElement;
	if  (source.tagName=="TR"||source.tagName=="TABLE")
	return;
	while(source.tagName!="TD")
	source=source.parentElement;
	source=source.parentElement;
	cs  =  source.children;
	//alert(cs.length);
	if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
		
		for(i=0;i<cs.length;i++){
			cs[i].style.backgroundColor=highlightcolor;
		}
	}
		
function  changeback(){
	
	if (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
		return
	if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
		//source.style.backgroundColor=originalcolor
	for(i=0;i<cs.length;i++){
		cs[i].style.backgroundColor="";
	}
}

function  clickto(){
	source=event.srcElement;
	if(source.tagName=="TR"||source.tagName=="TABLE")
		return;
	while(source.tagName!="TD")
	source=source.parentElement;
	source=source.parentElement;
	cs  =  source.children;
	//alert(cs.length);
	if(cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
		for(i=0;i<cs.length;i++){
			cs[i].style.backgroundColor=clickcolor;
		}
	else
		for(i=0;i<cs.length;i++){
			cs[i].style.backgroundColor="";
		}
}
//ȫѡ����  2015.7.12
var isSelected=1;
function clickall(){
   var el = document.getElementsByTagName('input'); 
   var len = el.length; 
   for(var i=0; i<len; i++) { 
	   if((el[i].type=="checkbox")) { 
	     if(isSelected==1)
	     el[i].checked = true;
	     else
	     el[i].checked = false;
	  } //if
	} //for
   isSelected++;
   isSelected=isSelected%2;
}

function IsInteger(i,obj)     
{       
        var str = obj.value;   
        if(str.length!=0){    
        reg=/^[-+]?\d*$/;     
        if(!reg.test(str)){
        	document.getElementById("error"+i).innerHTML='*�����봿����' ;       
        }
         else document.getElementById("error"+i).innerHTML='' ;    
        }    
}
function IsChinese(i,obj)     
{     	
   		var str = obj.value;
        if(str.length!=0){    
        reg=/^[\u0391-\uFFE5]+$/;    
        if(!reg.test(str)){
        document.getElementById("error"+i).innerHTML='*����������';       
        }
         else document.getElementById("error"+i).innerHTML='' ;    
        }    
}
   
</script>
<!----------------------�޸��ɴ˿�ʼ ------------------------->
<style type="text/css">
table.gridtable {
	margin: auto;
	font-family: verdana, arial, sans-serif;
	font-size: 11px;
	color: #333333;
	border-color: #999999;
	border-collapse: collapse;
}
table.gridtable td {
	background: #b5cfd2 url('<%=basePath%>/images/tab_05.gif');
	border-width: 1px;
	border: 1px;
	padding: 3px;
	border-style: solid;
	border-color: #999999;
}
table.gridtable td.tdbtn input {
	color: #d9eef7;
	border: solid 1px #0076a3;
	background: #0095cd;
	background: -webkit-gradient(linear, left top, left bottom, from(#00adee),
		to(#0078a5) );
	background: -moz-linear-gradient(top, #00adee, #0078a5);
	filter: progid :   DXImageTransform.Microsoft.gradient (   startColorstr
		= 
		 '#00adee', endColorstr =   '#0078a5' );
}
table.gridtable td.tdbtn input:hover {
	background: #007ead;
	background: -webkit-gradient(linear, left top, left bottom, from(#0095cc),
		to(#00678e) );
	background: -moz-linear-gradient(top, #0095cc, #00678e);
	filter: progid :   DXImageTransform.Microsoft.gradient (   startColorstr
		= 
		 '#0095cc', endColorstr =   '#00678e' );
}
table.gridtable td.tdbtn input:active {
	color: #80bed6;
	background: -webkit-gradient(linear, left top, left bottom, from(#0078a5),
		to(#00adee) );
	background: -moz-linear-gradient(top, #0078a5, #00adee);
	filter: progid :   DXImageTransform.Microsoft.gradient (   startColorstr
		= 
		 '#0078a5', endColorstr =   '#00adee' );
}
table.gridtable select {
	WIDTH: 150px�� position :   relative;
	left: -2px;
	top: -2px;
	font-size: 12px;
	line-height: 14px;
	border: 1px;
	color: #909993;
}
table.gridtable input[type=text] {
	border: 2px solid #F4F5F3;
	width: 150px;
	font-size: 16px;
	font-weight: bold;
	left: -2px;
	top: -2px;
	line-height: 14px;
	height: 14px;
}
.box1 {
	background: url('<%=basePath%>/images/tab_05.gif');
	height: 20px;
}
</style>

<style>
.optbtn {
	background-color: transparent; /* ����ɫ͸�� */
	border: 0px; /* �߿�ȡ�� */
	border-bottom: 1px solid #005aa7; /* �»���Ч�� */
}
::-moz-focus-inner {
	border: 0px;
}
</style>
</head>


<body>
<!-- ������  2015.7.13-->
<form name="transForm" method="post" action="">
	<input type="hidden" name="delSolve" value=""/>
	<input type="hidden" name="addSolve" value=""/>
	<input type="hidden" name="depart_numvalue" value=""/>   
	<input type="hidden" name="depart_namevalue" value=""/>   
	<input type="hidden" name="officevalue" value=""/>   
	<input type="hidden" name="staffvalue" value=""/>   
	<input type="hidden" name="managervalue" value=""/>  
	<input type="hidden" name="rulevalue" value=""/>    
	
</form>
<!-- ������ end -->

<div class="box1">&nbsp;
	<font size=2>�㵱ǰ��λ��:</font>
	<font color="blue" size=2pt><%=session.getAttribute("Present_Location")%><br /> <br /> </font>
</div>
<br>
<form action="../servlet/office1_Select" method="post" name="queryform">
	<table  class="gridtable" width="98%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td>
				<font size=2>&nbsp;&nbsp;��������:</font>
	 				<select id="department" name="department">
	 				<option value="0">--ѡ����--</option> 
	 				<option value="����1">����1</option>
	 				<option value="����2">����2</option>
	 				<option value="����3">����3</option>
	 				<option value="����4">����4</option>
	 				
	 				</select>
			</td>
			<td>
				<font size=2>&nbsp;&nbsp;�칫�Һ�:</font>
				<input type="text" id="office_num" name="office_num"></input>
			</td>
	
		</tr>
		<tr>
 			<td colspan="3"  align="right" class="tdbtn">
 			<input type="submit" id="btnAdd" value="��ѯ" class="buttonadd"></input>
  			<input type="button" id="btnAdd" value="����" class="buttonadd" onclick="addItem()"></input>
  			<input type="button" id="btnAdd" value="ɾ��" class="buttonadd" onclick="delBatItems()"></input>
  			<input type="reset" id="btnAdd" value="����" class="buttonadd"></input>
  			</td>
		</tr>
	</table>
</form>
<br>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="8" background="<%=basePath%>/images/tab_12.gif">
									&nbsp;
								</td>
								<td>
									<table width="100%" border="0" cellpadding="0" cellspacing="1"
										bgcolor="b5d6e6" onmouseover="changeto()"
										onmouseout="changeback()" id="departInfoTable">
										<tr>
											<td width="5%" height="22" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<input type="checkbox" name="checkbox" value="checkbox"
														onclick="clickall()" />
													<span class="STYLE1">ȫѡ</span>
												</div>
											</td>
											<td width="5%" height="22" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">���</span>
												</div>
											</td>
											<td width="5%" height="22" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">���ű��</span>
												</div>
											</td>
											<td width="15%" height="22" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">��������</span>
												</div>
											</td>
											<td width="5%" height="22" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">�칫�Һ�</span>
												</div>
											</td>
											<td width="5%" background="<%=basePath%>/images/bg.gif" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">Ա������</span>
												</div>
											</td>
											<td width="15%" background="<%=basePath%>/images/bg.gif" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">����</span>
												</div>
											</td>
											<td width="25%" background="<%=basePath%>/images/bg.gif" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">����</span>
												</div>
											</td>
											<td width="20%" height="22" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF" class="STYLE1">
												<div align="center">
													��������
												</div>
											</td>
										</tr>

										<!-- -ѭ����� -->
										<c:forEach items="${off1}" var="off11">
											<tr>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<input type="checkbox" name="checkbox" value="checkbox" />
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF" align="center">
												<span class="STYLE1"><%=order%>											
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center" class="STYLE1">
														<span class="STYLE1" align="center" id="depart_num<%=order%>">${off11.depart_Num}</span>
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="depart_name<%=order%>">${off11.depart_Name}</span>
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center" >
														<span class="STYLE1" id="office_num<%=order%>">${off11.office_Num}
														</span>
													</div>
												</td>
												<td bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="staff_num<%=order%>">${off11.staff_Num}</span>
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="manager<%=order%>">${off11.manager}</span>
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="rule<%=order%>">${off11.rule}</span>
													</div>
												</td>
												

												<td height="20" bgcolor="#FFFFFF" align="center">
													<img src="<%=basePath%>/images/edt.gif" />
													<button type="button" name="btnedit" id="btnedit<%=order %>"
														class="optbtn" onclick="openEdit(<%=order %>)">
														�༭
													</button>
													<img src="<%=basePath%>/images/del.gif" />
													<button type="button" name="btndel" id="btndel<%=order %>"
														class="optbtn" onclick="delSingleItem(<%=order++%>)">
														ɾ��
													</button>
												</td>
											</tr>
										</c:forEach>

									</table>
								</td>
								<td width="8" background="<%=basePath%>/images/tab_15.gif">
									&nbsp;
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="35" background="<%=basePath%>/images/tab_19.gif">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="12" height="35">
									<img src="<%=basePath%>/images/tab_18.gif" width="12" height="35" />
								</td>
								<td>
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td class="STYLE4">
												&nbsp;&nbsp;����<%=session.getAttribute("pageCount")%>����¼����ǰ�� <%=session.getAttribute("currentPage")%>/<%=(Integer)session.getAttribute("pageCount")/15+((Integer)session.getAttribute("pageCount")%15!=0?1:0)%>ҳ
											</td>
											<td>
												<table border="0" align="right" cellpadding="0" cellspacing="0">					  
													<tr>
														<td width="40">	
														<div align="center">
														<%
														      if(((Integer)session.getAttribute("currentPage")).intValue()!=0){												    	   
														    	  out.print("<a href=\"../servlet/Office1?jump_type=first\">");
														      }												    
														%>										
														<img src="<%=basePath%>/images/first.gif" width="37" height="15"/></a></div>
														</td>
														
														<td width="45">													    
														    <div align="center">
														    <%
														        if(((Integer)session.getAttribute("currentPage")).intValue()>=2){												    	   
														    	    out.print("<a href=\"../servlet/Office1?jump_type=back\">");
														    	}												    
														    %>														  
														    <img src="<%=basePath%>/images/back.gif" width="43" height="15" /></a></div>								
														</td>
														
														<td width="45">
														    <div align="center">
														   	<%
														     if(((Integer)session.getAttribute("currentPage")).intValue()<((Integer)session.getAttribute("pageCount")/15+((Integer)session.getAttribute("pageCount")%15!=0?1:0))){							    	    
														    	 out.print("<a href=\"../servlet/Office1?jump_type=next\">");
														     }									  											    
														    %>													  													   	
															<img src="<%=basePath%>/images/next.gif" width="43" height="15" /></a></div>								
														</td>
																					
														<td width="40"><div align="center">
														<%
														     if(((Integer)session.getAttribute("currentPage")).intValue()!=0){												    	   
														    	 out.print("<a href=\"../servlet/Office1?jump_type=last\">");
														     }												    
														%>										
														<img src="<%=basePath%>/images/last.gif" width="37" height="15" /></a></div>																							
														</td>
												
														<td width="100">
															<div align="center">
																<span class="STYLE1">ת���� <input name="textfield" id="jump_to"
																		type="text" size="4"
																		style="height: 12px; width: 20px; border: 1px solid #999999;" />
																	ҳ </span>
															</div>
														</td>
														<td width="40">
															<div align="center"><a href="javascript:jumpTo()" onclick="jumpTo()"><img src="<%=basePath%>/images/go.gif" width="37" height="15" /></a></div>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
								<td width="16">
									<img src="<%=basePath%>/images/tab_20.gif" width="16" height="35" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
	</body>
</html>

