<%@ page language="java" import="java.util.*" pageEncoding="gb18030"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/" +"tab/";
    
%>
<% long order = 1;
   String cleaner_num="";
   String name="";
   String id_num="";
   String sex="";
   String birthday="";  
   String position=""; 
   String tele=""; 
   String salary=""; 
   String work_range=""; 
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
	text-align: center;
	border-radius: 5px;
	line-height: 30px;
	position: absolute;
	left: 100%;
	margin-left: -60px;
	margin-top: 4px;
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
table.gridtable input:active {
	color: #80bed6;
	background: -webkit-gradient(linear, left top, left bottom, from(#0078a5),
		to(#00adee) );
	background: -moz-linear-gradient(top, #0078a5, #00adee);
	filter: progid :   DXImageTransform.Microsoft.gradient (   startColorstr
		= 
		 '#0078a5', endColorstr =   '#00adee' );
}
table.gridtable input {
	WIDTH: 150px�� position :   relative;
	left: -2px;
	top: -2px;
	font-size: 14px;
	line-height: 15px;
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
.optbtn {
	background-color: transparent; /* ����ɫ͸�� */
	border: 0px; /* �߿�ȡ�� */
	border-bottom: 1px solid #005aa7; /* �»���Ч�� */
}
::-moz-focus-inner {
	border: 0px;
}
.winspan {
 background-color:#bbcc00; 
 width:150px;
 text-alien:left;
 display:-moz-inline-box; 
 display:inline-block;
 }
</style>

<div id=win style="display: none; position: absolute; left: 50%; top: 40%; width: 370px; height: 400px; margin-left: -300px; margin-top: -200px; border: 1px solid #888; background-color: gray; text-align: center;">
     <a href="javascript:closeLogin();" alien="right" ; class="close">�ر�</a>
     <br>
     <span>�༭������Ϣ</span><br><br><br>
     <span>&nbsp;&nbsp;�������:</span><span id="showcleaner_num" class="winspan"></span><br><br>
     <span>&nbsp;&nbsp;����:</span><input id="showname"></input><br><br>
     <span>&nbsp;&nbsp;���֤��:</span><input id="showid_num"></input><br><br>   
     <span>&nbsp;&nbsp;�Ա�:</span><input id="showsex"></input> <br> <br>
     <span>&nbsp;&nbsp;��������:</span><input id="showbirthday"></input><br><br>
     <span>&nbsp;&nbsp;ְλ:</span><input id="showposition"></input><br><br>
     <span>&nbsp;&nbsp;��ϵ��ʽ:</span><input id="showtele"></input><br><br>
     <span>&nbsp;&nbsp;нˮ:</span><input id="showsalary"></input><br><br>
     <span>&nbsp;&nbsp;��������:</span><input id="showwork_range"></input><br><br>
	 <input type="submit" id="editSure" style="position: absolute; left: 45%; top: 85%;" value="ȷ��" onclick="editSured()"></input>
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

<div id=addwin style="display: none; position: absolute; left: 50%; top: 40%; width: 370px; height:400px; margin-left: -300px; margin-top: -200px; 
		border: 1px solid #888; background-color: gray; text-align: center;">
    <a href="javascript:closeAdd();" alien="right" ; class="close">�ر�</a><br>
	<label>��ӱ�����Ϣ</label><br></br>
	<label>&nbsp;&nbsp;�������:</label><input id="cleaner_numInfo" type="text" style="width:200px"></input><br></br>
	<label>&nbsp;&nbsp;����:</label><input id="nameInfo" type="text" style="width:200px"></input><br></br>
	<label>&nbsp;&nbsp;���֤��:</label><input id="id_numInfo" type="text" style="width:200px"></input><br></br>
	<label>&nbsp;&nbsp;�Ա�:</label><input id="sexInfo" type="text" style="width:200px"></input><br></br>
	<label>&nbsp;&nbsp;��������:</label><input id="birthdayInfo" type="text" style="width:200px"></input><br></br>
	<label>&nbsp;&nbsp;ְλ:</label><input id="positionInfo" type="text" style="width:200px"></input><br></br>
	<label>&nbsp;&nbsp;��ϵ��ʽ:</label><input id="teleInfo" type="text" style="width:200px"></input><br></br>
	<label>&nbsp;&nbsp;нˮ:</label><input id="salaryInfo" type="text" style="width:200px"></input><br></br>
	<label>&nbsp;&nbsp;��������:</label><input id="work_rangeInfo" type="text" style="width:200px"></input><br></br>
	<input type="submit" id="addSure" style="position: absolute; left: 45%; top: 85%;" value="ȷ��" onclick="addSured()"></input>
</div>

<!--------------------------------JavaScript����-------------------------------->
<script>		
var selectedId;//��ѡ�е�item
var doc=document;
function openEdit(id){  
   
 
	var cleaner_num=doc.getElementById("cleaner_num"+id).innerHTML;
	
	var name=doc.getElementById("name"+id).innerHTML;
	var id_num=doc.getElementById("id_num"+id).innerHTML;
	var sex=doc.getElementById("sex"+id).innerHTML;
	var birthday=doc.getElementById("birthday"+id).innerHTML;
	var position=doc.getElementById("position"+id).innerHTML;
	var tele=doc.getElementById("tele"+id).innerHTML;
	var salary=doc.getElementById("salary"+id).innerHTML;
	var work_range=doc.getElementById("work_range"+id).innerHTML;
	doc.getElementById("showcleaner_num").value=cleaner_num;
	doc.getElementById("showname").value=name;
	doc.getElementById("showid_num").value=id_num;
	doc.getElementById("showsex").value=sex;
	doc.getElementById("showbirthday").value=birthday;
	doc.getElementById("showposition").value=position;
	doc.getElementById("showtele").value=tele;
	doc.getElementById("showsalary").value=salary;
	doc.getElementById("showwork_range").value=work_range;
	doc.getElementById("win").style.display="";
	selectedId=id;
}
//�ڱ������ת����Xҳ
function jumpTo(){

	 var temp=document.getElementById('jump_to').value;
	 var count = <%=(Integer)session.getAttribute("pageCount")/15+((Integer)session.getAttribute("pageCount")%15!=0?1:0)%>
	 if(temp<=count&&temp>0)
	  	window.location.href="../servlet/Security1?jump_type=jump_to&to_page="+temp;
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
	 
		 var addedCleaner_num=doc.getElementById("cleaner_numInfo").value;
	
		 completeInfo+=addedCleaner_num+'#';
		  var addedName=doc.getElementById("nameInfo").value;
		 completeInfo+=addedName+'#';
		  var addedId_num=doc.getElementById("id_numInfo").value;
		 completeInfo+=addedId_num+'#';
		  var addedSex=doc.getElementById("sexInfo").value;
		 completeInfo+=addedSex+'#';
		  
	     var addedBirthday=doc.getElementById("birthdayInfo").value;
	     completeInfo+=addedBirthday+'#';
	     
	     var addedPosition=doc.getElementById("positionInfo").value;
	       completeInfo+=addedPosition+'#';
	       
		 var addedTele=doc.getElementById("teleInfo").value;
		   completeInfo+=addedTele+'#';
	     var addedSalary=doc.getElementById("salaryInfo").value;
	     completeInfo+=addedSalary+'#'; 
	      var addedWork_range=doc.getElementById("work_rangeInfo").value;
	     completeInfo+=addedWork_range+'#'; 
	  
	     document.getElementById("addDoneDiv").style.display=""; 
	     var tip='document.getElementById("addDoneDiv").style.display="none";'
	     setTimeout(tip,2000); 
	     alert("1111");
	     doc.getElementsByName("addSolve")[0].value=completeInfo;
	    
	     var addForm=doc.forms("transForm");   
	     addForm.action="../servlet/Security1_Insert";
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
	   var updatedCleaner_num=doc.getElementById("showcleaner_num").value;
	   var updatedName=doc.getElementById("showname").value;
	   var updatedId_num=doc.getElementById("showid_num").value;
	   var updatedSex=doc.getElementById("showsex").value;
	   var updatedBirthday=doc.getElementById("showbirthday").value;
	   var updatedPosition=doc.getElementById("showposition").value;
	   var updatedTele=doc.getElementById("showtele").value;
	   var updatedSalary=doc.getElementById("showsalary").value;
	   var updatedWork_range=doc.getElementById("showwork_range").value;
	   doc.getElementsByName("cleaner_numvalue")[0].value=updatedCleaner_num;
	   doc.getElementsByName("namevalue")[0].value=updatedName;
	   doc.getElementsByName("id_numvalue")[0].value=updatedId_num;
	   doc.getElementsByName("sexvalue")[0].value=updatedSex;
	   doc.getElementsByName("birthdayvalue")[0].value=updatedBirthday;
	   doc.getElementsByName("positionvalue")[0].value=updatedPosition;
	   doc.getElementsByName("televalue")[0].value=updatedTele;
	   doc.getElementsByName("salaryvalue")[0].value=updatedSalary;
	   doc.getElementsByName("work_rangevalue")[0].value=updatedWork_range;
	   document.getElementById("updateDoneDiv").style.display="";
	   var tip='document.getElementById("updateDoneDiv").style.display="none";'
	   setTimeout(tip,2000); 
	   var form=doc.forms("transForm");  //��Ӧ��һ��table form
	   form.action="../servlet/Security1_Update";
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
	    var cleanerKey=doc.getElementById("cleaner_num"+delId).innerHTML;    	  
	    doc.getElementsByName("delSolve")[0].value=cleanerKey+'#';//��ȡ����keyֵ    	   
	    //for (i=1;i<cleanerInfoTable.rows.length;i++){//����
	    //    cleanerInfoTable.rows[i].cells[1].innerHTML=i;
	   // }  //for
	      //submit
	    var f=doc.forms("transForm");       
	    f.action="../servlet/Security1_Delete";
	    f.submit();   
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
	        var cleanerKey = doc.getElementById("cleaner_num"+i).innerHTML;
	        allKey+=cleanerKey+'#';
	    }  
   } 
   doc.getElementsByName("delSolve")[0].value=allKey;
   var keyform=doc.forms("transForm");   
   keyform.action="../servlet/Security1_Delete";
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
</script>
</head>


<body>
<!-- ������  2015.7.13-->
<form name="transForm" method="post" action="">
	<input type="hidden" name="delSolve" value=""/>
	<input type="hidden" name="addSolve" value=""/>
	<input type="hidden" name="cleaner_numvalue" value=""/>   
	<input type="hidden" name="namevalue" value=""/>   
	<input type="hidden" name="id_numvalue" value=""/>   
	<input type="hidden" name="sexvalue" value=""/>   
	<input type="hidden" name="birthdayvalue" value=""/>  
	<input type="hidden" name="positionvalue" value=""/>   
	<input type="hidden" name="televalue" value=""/>    
	<input type="hidden" name="salaryvalue" value=""/>    
	<input type="hidden" name="work_rangevalue" value=""/>     
	
</form>
<!-- ������ end -->

<div class="box1">&nbsp;
	<font size="2" >�㵱ǰ��λ��:</font>
	<font color="blue" size=2pt>[��������]-[������Ϣ����]<br ></br> </font>
</div>
<br>
 <form action="../servlet/Security1_Select" method="post" name="queryform">
			<table class="gridtable" width="98%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<font size=2>&nbsp;&nbsp;�������:</font>
							<input type="text" id="cleaner_num" name="cleaner_num"></input>
						</td>
						<td>
							<font size=2>&nbsp;&nbsp;��������:</font>
							<input type="text" id="name" name="name"></input>
						</td>
						
					</tr>
					<tr>
						<td>
							<font size=2>&nbsp;&nbsp;����ְλ:</font>
							<select id="position" name="position">
								<option value="0">--ѡ��ְλ--</option>
								<option value="�鳤">�鳤</option>
								<option value="��Ա">��Ա</option>
							</select>
						</td>
						<td>
							<font size=2>&nbsp;&nbsp;��������:</font>
							<select id="work_range" name="work_range">
								<option value="0">
									--ѡ������--
								</option>
								<option value="1">
									1
								</option>
								<option value="2">
									2
								</option>
								<option value="3">
									3
								</option>
								<option value="4">
									4
								</option>
								<option value="5">
									5
								</option>
								<option value="6">
									6
								</option>
							</select>

						</td>
					</tr>
					<tr>
						<td colspan="3" align="right" class="tdbtn">
							<input type="submit" id="btnQuery" value="��ѯ" class="buttonadd"></input>
							<input type="button" id="btnAdd" value="����" class="buttonadd" onclick="addItem()"></input>
							<input type="button" id="btnDel" value="ɾ��" class="buttonadd" onclick="delBatItems()"></input>
							<input type="reset" id="btnSet" value="����" class="buttonadd"></input>
						</td>
					</tr>
				</table>
			</form>
			<br>

		<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0" >
							<tr>
								<td width="8" background="<%=basePath%>/images/tab_12.gif">
									&nbsp;
								</td>
								<td>							 
									<table width="100%" border="0" cellpadding="0" cellspacing="1"
										bgcolor="b5d6e6" onmouseover="changeto()"
										onmouseout="changeback()" id="cleanerInfoTable">
										<tr>
											<td width="6%" height="22" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<input type="checkbox" name="checkbox" value="checkbox"
														onclick="clickall()" />
													<span class="STYLE1">ȫѡ</span>
												</div>
											</td>
											<td width="5%" height="eight=" 22" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">���</span>
												</div>
											</td>
											<td width="5%" height="eight=" 22" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">�������</span>
												</div>
											</td>
											<td width="10%" height="22" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">����</span>
												</div>
											</td>
											<td width="15%" height="22" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">���֤��</span>
												</div>
											</td>
											<td width="4%" background="<%=basePath%>/images/bg.gif" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">�Ա�</span>
												</div>
											</td>
											<td width="4%" background="<%=basePath%>/images/bg.gif" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">����</span>
												</div>
											</td>
											<td width="4%" background="<%=basePath%>/images/bg.gif" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">ְλ</span>
												</div>
											</td>
											<td width="11%" height="22" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">��ϵ��ʽ</span>
												</div>
											</td>	
											<td width="5%" height="22" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">нˮ</span>
												</div>
											</td>
											<td width="5%" height="22" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">��������</span>
												</div>
											</td>											
											<td width="17%" height="22" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF" class="STYLE1">
												<div align="center">
													��������
												</div>
											</td>
										</tr>                                     
										<!-- -ѭ����� -->  
										<c:forEach items="${list}" var="cleaner">
											<tr>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<input type="checkbox" name="checkbox" value="checkbox" />
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1"> <%=order%>
													</div>
												</td>
								 				<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="cleaner_num<%=order%>">${cleaner.cleaner_num}</span>
														
													</div>
												</td>			   
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="name<%=order%>">${cleaner.name}</span>
														
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="id_num<%=order%>">${cleaner.id_num}</span>
														
													</div>
												</td>
												<td bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="sex<%=order%>">${cleaner.sex}</span>
														
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="birthday<%=order%>">${cleaner.birthday}</span>
													   
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="position<%=order%>">${cleaner.position}</span>
														
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="tele<%=order%>">${cleaner.tele}</span>
														
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="salary<%=order%>">${cleaner.salary}</span>
														
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="work_range<%=order%>">${cleaner.work_range}</span>
														
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF" align="center">
													<img src="<%=basePath%>/images/edt.gif" />
													<button type="button" name="btnedit" id="btnedit<%=order%>"
														class="optbtn" onclick="openEdit(<%=order%>)">
														�༭
													</button>
													<img src="<%=basePath%>/images/del.gif" />
													<button type="button" name="btndel" id="btndel<%=order%>"
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
														    <div align="center"><a href="../servlet/Security1?jump_type=first"><img src="<%=basePath%>/images/first.gif" width="37" height="15"/></a></div></td>
														</td>
														
														<td width="45">													    
														    <div align="center">
														    <%
														        if(((Integer)session.getAttribute("currentPage")).intValue()>=2){												    	   
														    	    out.print("<a href=\"../servlet/Security1?jump_type=back\">");
														    	}												    
														    %>														  
														    <img src="<%=basePath%>/images/back.gif" width="43" height="15" /></a></div>								
														</td>
														
														<td width="45">
														    <div align="center">
														   	<%
														     if(((Integer)session.getAttribute("currentPage")).intValue()<((Integer)session.getAttribute("pageCount")/15+((Integer)session.getAttribute("pageCount")%15!=0?1:0))){							    	    
														    	 out.print("<a href=\"../servlet/Security1?jump_type=next\">");
														     }									  											    
														    %>													  													   	
															<img src="<%=basePath%>/images/next.gif" width="43" height="15" /></a></div>								
														</td>
																					
														<td width="40"><div align="center"><a href="../servlet/Security1?jump_type=last"><img src="<%=basePath%>/images/last.gif" width="37" height="15" /></a></div>																							
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

