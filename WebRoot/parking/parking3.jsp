<%@ page language="java" import="java.util.*" pageEncoding="gb18030"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/" +"tab/";
%>
<% long order = 1;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!----------------------2015.7.15------------------------->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>ͣ��λ����</title>

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

<script type="text/javascript" src="../js/WdatePicker.js"></script>
<!--------------------------------JavaScript����-------------------------------->
<script>		
var selectedId;//��ѡ�е�item
var doc=document;
/*���Ƿ�����Ϣ���,ÿ����Ϣ��ı༭���ܵĵ��ú���,�ɱ༭���ۺ��۳�״̬*/
function openEdit(id){  
	var record=doc.getElementById("record_num"+id).innerHTML;	
	var parking_num=doc.getElementById("parking_num"+id).innerHTML;
	var car_owner=doc.getElementById("car_owner"+id).innerHTML;
	var tele=doc.getElementById("tele"+id).innerHTML;
	var start_time=doc.getElementById("start_time"+id).innerHTML;
	var plan_time=doc.getElementById("plan_time"+id).innerHTML;
	var charge=doc.getElementById("charge"+id).innerHTML;
	var charger=doc.getElementById("charger"+id).innerHTML;
	doc.getElementById("showrid").innerHTML=record;
	doc.getElementById("showpid").value=parking_num;
	doc.getElementById("showowner").value=car_owner;
	doc.getElementById("showtele").value=tele;
	doc.getElementById("showstart").value=start_time;
	doc.getElementById("showplan").value=plan_time;
	doc.getElementById("showcharge").value=charge;
	doc.getElementById("showcharger").value=charger;
	doc.getElementById("win").style.display="";
	selectedId=id;
}
//ȷ�ϱ༭���޸�
function editSured(){ 
   	var isSureEdited=confirm('ȷ��Ҫ�޸���');
    if(isSureEdited==true)
    {
	  	var Rid=doc.getElementById("showrid").innerHTML;
		var updatedPid=doc.getElementById("showpid").value;
		var updatedOwner=doc.getElementById("showowner").value;
		var updatedTele=doc.getElementById("showtele").value;
		var updatedStart=doc.getElementById("showstart").value;
		var updatedPlan=doc.getElementById("showplan").value;
		var updatedCharge=doc.getElementById("showcharge").value;
		var updatedCharger=doc.getElementById("showcharger").value;
	    doc.getElementsByName("ridvalue")[0].value=Rid;
	    doc.getElementsByName("pidvalue")[0].value=updatedPid;
	    doc.getElementsByName("ownervalue")[0].value=updatedOwner;
	    doc.getElementsByName("televalue")[0].value=updatedTele;
	    doc.getElementsByName("startvalue")[0].value=updatedStart;
	    doc.getElementsByName("planvalue")[0].value=updatedPlan;
	    doc.getElementsByName("chargevalue")[0].value=updatedCharge;
	    doc.getElementsByName("chargervalue")[0].value=updatedCharger;
	    document.getElementById("updateDoneDiv").style.display="";
	    setTimeout(submit,500); //һ����ת
	    closeLogin();
   }
   else
   	    closeLogin();
}
function submit(){
 	var form=doc.forms("transform");  //��Ӧ��һ��table form
   	form.action="../servlet/Parking3_Update";
    form.submit();
}
function closeLogin(){   
    document.getElementById("win").style.display="none";
}
//ɾ��������Ŀ 2015.7.13
function delSingleItem(delId){ 
      
    var isSureDeled=confirm('ȷ��Ҫɾ��������Ϣ��');
    if(isSureDeled){
	    var recordKey=doc.getElementById("record_num"+delId).innerHTML;  	  
	    doc.getElementsByName("delSolve")[0].value=recordKey+'#';//��ȡ����keyֵ    	   
	    for (i=1;i<parkInfoTable.rows.length;i++){//����
	        parkInfoTable.rows[i].cells[1].innerHTML=i;
	    }  //for
	      //submit
	    var form=doc.forms("transForm");       
	    form.action="../servlet/Parking3_Delete";
	    form.submit();   
    }//if         
}

//����ɾ������ 2015.7.13
function delBatItems(){ 

   var batBox=doc.getElementsByName("checkbox"); 
   var len=batBox.length;
   var allKey="";
   for(i=0;i<len;i++)
   {
	    if(batBox[i].checked==true)
	    {   
	        var recordKey = doc.getElementById("record_num"+i).innerHTML;
	        allKey+=recordKey+'#';
	    }  
   } 
   if(allKey=="#")
   return;
   doc.getElementsByName("delSolve")[0].value=allKey;
   var keyform=doc.forms("transForm");   
   keyform.action="../servlet/Parking3_Delete";
   keyform.submit();  
}
//������Ӵ��� 2015.7.16
function addItem(){
   doc.getElementById("addwin").style.display="";
}
//��Ӽ�¼ȷ�� 2015.7.16
function addSured(){  
	 
	 var isSureAdded=confirm('ȷ��Ҫ���������¼��');
	 var completeInfo="";
	 if(isSureAdded==true){
	 
		var Rid=doc.getElementById("ridInfo").value;
		var Pid=doc.getElementById("pidInfo").value;
		var Owner=doc.getElementById("ownerInfo").value;
		var Tele=doc.getElementById("teleInfo").value;
		var Start=doc.getElementById("startInfo").value;
		var Plan=doc.getElementById("planInfo").value;
		var Charge=doc.getElementById("chargeInfo").value;
		var Charger=doc.getElementById("chargerInfo").value;
	    completeInfo=Rid+"#"+Pid+"#"+Owner+"#"+Tele+"#"+Start+"#"+Plan+"#"+Charge+"#"+Charger;    
	    document.getElementById("addDoneDiv").style.display=""; 
	    var tip='document.getElementById("addDoneDiv").style.display="none";'
	    setTimeout(tip,2000); 
	    doc.getElementsByName("addSolve")[0].value=completeInfo;
	    var addForm=doc.forms("transForm");   
	    addForm.action="../servlet/Parking3_Insert";
	    addForm.submit(); 
	    closeAdd();    
	 }
	 else
	 {
	    closeAdd();
	 }
}
function closeAdd(){   
	document.getElementById("addwin").style.display="none";
}
//�ڱ������ת����Xҳ
function jumpTo(){

	 var temp=document.getElementById('jump_to').value;
	 var count = <%=(Integer)session.getAttribute("pageCount")/15+((Integer)session.getAttribute("pageCount")%15!=0?1:0)%>
	 if(temp<=count&&temp>0)
	  	window.location.href="../servlet/Parking3?jump_type=jump_to&to_page="+temp;
}
function resetAll(){
     var e=doc.getElementsByTagName("input");
     for(i=0;i<e.length;i++){
      if(e[i].type=='text')
        e[i].value="";    
     }
    
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
<div style='display: none; position: absolute; left: 40%; top: 14%;'id='updateDoneDiv'>
	<span class="beautywords">�޸ĳɹ�</span>
</div>
		
<div style='display: none; position: absolute; left: 40%; top: 14%;'id='delDoneDiv'>
	<span class="beautywords">ɾ���ɹ���</span>
</div>	

<div style='display: none; position: absolute; left: 40%; top: 14%;'id='addDoneDiv'>
	<span class="beautywords">��ӳɹ���</span>
</div>
<div id=win style="display: none; position: absolute; left: 50%; top: 40%; width: 450px; height: 400px; margin-left: -300px; margin-top: -200px; border: 1px solid #888; background-color: gray; text-align: center;">
     <a href="javascript:closeLogin();" alien="right" ; class="close">�ر�</a>
     <br>
     <span>�༭ͣ��λ��¼</span><br><br>
     <span>&nbsp;&nbsp;��¼���:</span><span id="showrid" class="winspan"></span><br><br>
     <span>ͣ��λ���:</span><input id="showpid"></input><br><br>
     <span>&nbsp;&nbsp;���ó���:</span><input id="showowner"></input><br><br>   
     <span>&nbsp;&nbsp;��ϵ��ʽ:</span><input id="showtele"></input> <br> <br>
     <span>&nbsp;&nbsp;��ʼʱ��:</span><input id="showstart"></input><br><br>
     <span>&nbsp;&nbsp;����ʱ��:</span><input id="showplan"></input> <br><br>
     <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�շ�:</span><input id="showcharge"></input> <br><br>
     <span>&nbsp;&nbsp;&nbsp;&nbsp;�շ���:</span><input id="showcharger"></input> <br><br>
	 <input type="button" id="editSure" style="position: absolute; left: 45%; top: 90%;" value="ȷ��" onclick="editSured()"></input>
</div>

<div id=addwin style="display: none; position: absolute; left: 50%; top: 40%; width: 420px; height: 400px; margin-left: -300px; margin-top: -200px; 
		border: 1px solid #888; background-color: gray; text-align: center;">
    <a href="javascript:closeAdd();" alien="right" ; class="close">�ر�</a><br>
	 <label>��Ӽ�¼��Ϣ</label><br></br>
     <span>&nbsp;&nbsp;��¼���:</span><input id="ridInfo"></input><br><br>
     <span>ͣ��λ���:</span><input id="pidInfo"></input><br><br>
     <span>&nbsp;&nbsp;���ó���:</span><input id="ownerInfo"></input><br><br>   
     <span>&nbsp;&nbsp;��ϵ��ʽ:</span><input id="teleInfo"></input> <br> <br>
     <span>&nbsp;&nbsp;��ʼʱ��:</span><input id="startInfo" type="text" onclick="WdatePicker()"><br><br>
     <span>&nbsp;&nbsp;����ʱ��:</span><input id="planInfo"></input> <br><br>
     <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�շ�:</span><input id="chargeInfo"></input> <br><br>
     <span>&nbsp;&nbsp;&nbsp;&nbsp;�շ���:</span><input id="chargerInfo"></input> <br><br>
	<input type="submit" id="addSure" style="position: absolute; left: 45%; top: 90%;" value="ȷ��" onclick="addSured()"></input>
</div>

<!-- ������  2015.7.13-->
<form name="transForm" method="post" action="">
	<input type="hidden" name="delSolve" value=""/>
	<input type="hidden" name="addSolve" value=""/>
	<input type="hidden" name="ridvalue" value=""/>   
	<input type="hidden" name="pidvalue" value=""/>   
	<input type="hidden" name="ownervalue" value=""/>   
	<input type="hidden" name="televalue" value=""/>   
	<input type="hidden" name="startvalue" value=""/>  
	<input type="hidden" name="planvalue" value=""/> 
	<input type="hidden" name="chargevalue" value=""/>  
	<input type="hidden" name="chargervalue" value=""/>     
	
</form>
<!-- ������ end -->

<div class="box1">&nbsp;
	<font size="2">�㵱ǰ��λ��:</font>
	<font color="blue" size=2pt>[ͣ������]-[������Ϣ����]<br ></br> </font>
</div>
<br>
 <form action="../servlet/Parking3_Select" method="post" name="queryform">
			<table class="gridtable" width="98%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td>
							<font size=2>&nbsp;&nbsp;ͣ��λ���:</font>
							<input id="parking_num"  type="text" name="parking_num"
							value=<%if(session.getAttribute("keepPark")!=null) 
							out.print(session.getAttribute("keepPark"));session.setAttribute("keepPark","");%>
							></input>
						</td>
					   <td>
							<font size=2>&nbsp;&nbsp;������:</font>
                            <input id="car_owner" type="text" name="car_owner"
                            value=<%if(session.getAttribute("tenant")!=null) 
							out.print(session.getAttribute("tenant"));session.setAttribute("tenant","");%>
                            ></input>
					   </td>
					   <td>
						    <font size=2>&nbsp;&nbsp;��λ������ʼʱ��:</font>
							<input id="d11" type="text" onclick="WdatePicker()" name="start_time" 
							value=<%if(session.getAttribute("cal")!=null) 
							out.print(session.getAttribute("cal"));session.setAttribute("cal","");%>></input>								 			
					   </td>	
					</tr>
											
					<tr>
						<td colspan="3" align="right" class="tdbtn">
							<input type="submit" id="btnQuery" value="��ѯ" class="buttonadd"></input>
							<input type="button" id="btnAdd" value="����" class="buttonadd" onclick="addItem()"></input>
							<input type="button" id="btnDel" value="ɾ��" class="buttonadd" onclick="delBatItems()"></input>
							<input type="button" id="btnSet" value="����" class="buttonadd" onclick="resetAll()"></input>
						</td>
					</tr>
				</table>
			</form>
<br>
			<!----------------------�޸Ľ��� 2015.7.14------------------------->

			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0" >
							<tr>
								<td width="8" background="<%=basePath%>/images/tab_12.gif">&nbsp</td>
								<td>							 
									<table width="100%" border="0" cellpadding="0" cellspacing="1"
										bgcolor="b5d6e6" onmouseover="changeto()"
										onmouseout="changeback()" id="parkInfoTable">
										<tr>
											<td width="4%" height="20" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<input type="checkbox" name="checkbox" value="checkbox"
												onclick="clickall()" />
													<span class="STYLE1">ȫѡ</span>
                                                 </div>
											</td>
											<td width="3%" height="20" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">���</span>
												</div>
											</td>
											<td width="10%" height="20" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">��¼���</span>
												</div>
											</td>
											<td width="10%" height="20" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">ͣ��λ���</span>
												</div>
											</td>
											<td width="5%" height="20" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1"> ������</span>
												</div>
											</td>
											<td width="8%" height="20" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1"> ��������ϵ��ʽ</span>
												</div>
											</td>
											<td width="7%" height="20" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1"> ������ʼʱ��</span>
												</div>
											</td>
											<td width="8%" height="20" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1"> Ԥ������ʱ��(��)</span>
												</div>
											</td>
											<td width="5%" height="20" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1"> �շ�(Ԫ)</span>
												</div>
											</td>
											<td width="6%" height="20" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1"> �շ���</span>
												</div>
											</td>																												
											<td width="20%" height="20" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF" class="STYLE1">
												<div align="center">
													��������
												</div>
											</td>
										</tr>                                     
										<!-- -ѭ����� -->  
							<c:forEach items="${park_list}" var="p">
											<tr>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<input type="checkbox" name="checkbox" value="checkbox" />
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF" align="center">
												 	<div align="center">
														<span class="STYLE1"><%=order%></span>														
													</div>																					
												</td>
								 							   
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="record_num<%=order%>">${p.record_num}</span>														
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="parking_num<%=order%>">${p.parking_num}</span>														
													</div>
												</td>
												<td bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="car_owner<%=order%>">${p.car_owner}</span>												
													</div>
												</td>
												<td bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="tele<%=order%>">${p.tele}</span>												
													</div>
												</td>	
												<td bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="start_time<%=order%>">${p.start_time}</span>												
													</div>
												</td>
												<td bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="plan_time<%=order%>">${p.plan_time}</span>												
													</div>
												</td>
												<td bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="charge<%=order%>">${p.charge}</span>												
													</div>
												</td>
												<td bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="charger<%=order%>">${p.charger}</span>												
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
								<td width="8" background="<%=basePath%>/images/tab_15.gif">&nbsp;
									
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
														    <div align="center"><a href="../servlet/Parking3?jump_type=first"><img src="<%=basePath%>/images/first.gif" width="37" height="15"/></a></div></td>
														</td>
														
														<td width="45">													    
														    <div align="center">
														    <%
														        if(((Integer)session.getAttribute("currentPage")).intValue()>=2){												    	   
														    	    out.print("<a href=\"../servlet/Parking3?jump_type=back\">");
														    	}												    
														    %>														  
														    <img src="<%=basePath%>/images/back.gif" width="43" height="15" /></a></div>								
														</td>
														
														<td width="45">
														    <div align="center">
														   	<%
														     if(((Integer)session.getAttribute("currentPage")).intValue()<((Integer)session.getAttribute("pageCount")/15+((Integer)session.getAttribute("pageCount")%15!=0?1:0))){							    	    
														    	 out.print("<a href=\"../servlet/Parking3?jump_type=next\">");
														     }									  											    
														    %>													  													   	
															<img src="<%=basePath%>/images/next.gif" width="43" height="15" /></a></div>								
														</td>
																					
														<td width="40"><div align="center"><a href="../servlet/Parking3?jump_type=last"><img src="<%=basePath%>/images/last.gif" width="37" height="15" /></a></div>																							
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

