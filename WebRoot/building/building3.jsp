<%@ page language="java" import="java.util.*" pageEncoding="gb18030"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/" +"tab/";
%>
<% long order = 1;
   String room="";
   String floor="";
   String size="";
   String layout="";
   String state="";  
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>¥����Ϣ����</title>
<link rel="stylesheet" type="text/css" href="../1.css">

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
</style>

<!------------------------ Jquery 2015.7.12 -------------------->
<script type="text/javascript"
src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js">
</script>

<div id=win style="display: none; position: absolute; left: 50%; top: 40%; width: 420px; height: 300px; margin-left: -300px; margin-top: -200px; 
		border: 1px solid #888; background-color: #ffffff; text-align: center;">
	<table style="background-color:#008080;" width="100%" heigh="20%">
			<tr>
				<td width="90%"> <label><font color="#f5f5f5" face="microsoft yahei" size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�޸ķ�����Ϣ</font></label></td>
				<td width="10%"><a href="javascript:closeLogin();" alien="right" ; class="close">�ر�</a> </td>
			</tr>
		</table>		
    <br>
	<label>¥��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input disabled id="showRoom_info" type="text" style="width:160px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px;  color:#000000"></input><br></br>
	<label>��Ȩ��&nbsp;&nbsp;&nbsp;</label><input id="showOwner_name" type="text" style="width:160px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px;  color:#000000"></input><br></br>
	<label>���֤��&nbsp;</label><input id="showOwner_id" type="text" style="width:160px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px;  color:#000000"></input><br></br>
	<label>��ס�˿�&nbsp;</label><input id="showPopulation" type="text" style="width:160px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px;  color:#000000"></input><br></br>
	<label>��������&nbsp;</label><input id="showSale_time" type="text" style="width:160px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px;  color:#000000"></input><br></br>
	<input type="submit" id="editSure" style="position: absolute; left: 40%; top: 90%;" value="  ȷ��  " onclick="editSured()"></input>
</div>

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

<div id=addwin style="display: none; position: absolute; left: 50%; top: 40%; width: 420px; height: 420px; margin-left: -300px; margin-top: -200px; 
		border: 1px solid #888; background-color: #ffffff; text-align: center;">
		<table style="background-color:#008080;" width="100%" heigh="20%">
			<tr>
				<td width="90%"> <label><font color="#f5f5f5" face="microsoft yahei" size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ӷ�����Ϣ</font></label></td>
				<td width="10%"><a href="javascript:closeAdd();" alien="right" ; class="close">�ر�</a> </td>
			</tr>
		</table>		
    <br>
    <label>С����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input id="comInfo" type="text" style="width:160px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px;  color:#000000"></input><br></br>
    <label>¥���&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input id="buildInfo" type="text" style="width:160px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px;  color:#000000"></input><br></br>
    <label>��Ԫ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input id="uintInfo" type="text" style="width:160px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px;  color:#000000"></input><br></br>
	<label>�����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input id="roomInfo" type="text" style="width:160px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px;  color:#000000"></input><br></br>
	<label>��Ȩ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input id="owner_nameInfo" type="text" style="width:160px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px;  color:#000000"></input><br></br>
	<label>��Ȩ�˱��&nbsp;</label><input id="owner_numInfo" type="text" style="width:160px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px;  color:#000000"></input><br></br>
	<label>��ס�˿�&nbsp;&nbsp;&nbsp;</label><input id="populationInfo" type="text" style="width:160px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px;  color:#000000"></input><br></br>
	<label>��������&nbsp;&nbsp;&nbsp;</label><input id="sale_timeInfo" type="text" style="width:160px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px;  color:#000000"></input><br></br>
	<input type="submit" id="addSure" style="position: absolute; left: 40%; top: 90%;" value="  ȷ��  " onclick="addSured()"></input>
</div>

<!--------------------------------JavaScript����-------------------------------->
<script type="text/javascript" src="../js/WdatePicker.js"></script>
<script>		
var selectedId;//��ѡ�е�item
var doc=document;
function openEdit(id){  
 
	doc.getElementById("showRoom_info").value = doc.getElementById("room_info"+id).innerHTML;
	doc.getElementById("showOwner_name").value = doc.getElementById("owner_name"+id).innerHTML;
	doc.getElementById("showOwner_num").value = doc.getElementById("owner_num"+id).innerHTML;
	doc.getElementById("showPopulation").value = doc.getElementById("population"+id).innerHTML;
	doc.getElementById("showSale_time").value = doc.getElementById("sale_time"+id).innerHTML;
	doc.getElementById("win").style.display="";
	selectedId=id;
}

//�ڱ������ת����Xҳ
function jumpTo(){

	 var temp=document.getElementById('jump_to').value;
	 var count = <%=(Integer)session.getAttribute("pageCount")%>
	 if(temp<=count && temp>0)
	  	window.location.href="../servlet/Building3?jump_type=jump_to&to_page="+temp;
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
	 alert('');
	 if(isSureAdded==true){
	 	
		 completeInfo += doc.getElementById("comInfo").value + '#';
		 completeInfo += doc.getElementById("buildInfo").value + '#';
		 completeInfo += doc.getElementById("unitInfo").value + '#';
		 completeInfo += doc.getElementById("roomInfo").value + '#';
		 completeInfo += doc.getElementById("owner_nameInfo").value + '#';
		 completeInfo += doc.getElementById("owner_numInfo").value + '#';
		 completeInfo += doc.getElementById("populationInfo").value + '#';
		 completeInfo += doc.getElementById("sale_timeInfo").value + '#';
	
	     document.getElementById("addDoneDiv").style.display=""; 
	     var tip='document.getElementById("addDoneDiv").style.display="none";'
	     setTimeout(tip,2000); 
	     doc.getElementsByName("addSolve")[0].value=completeInfo;
	     var addForm=doc.forms("transForm");   
	     addForm.action="../servlet/Building3_Insert";
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
    if(isSureEdited==true){
			
	   doc.getElementsByName("room_info")[0].value = doc.getElementById("showRoom_info").value;
	   doc.getElementsByName("owner_name")[0].value = doc.getElementById("showOwner_name").value;
	   doc.getElementsByName("owner_num")[0].value = doc.getElementById("showOwner_num").value;
	   doc.getElementsByName("population")[0].value = doc.getElementById("showPopulation").value;
	   doc.getElementsByName("sale_time")[0].value = doc.getElementById("showSale_time").value;
	   
	   document.getElementById("updateDoneDiv").style.display="";
	   var tip='document.getElementById("updateDoneDiv").style.display="none";'
	   setTimeout(tip,2000); 
	   var form=doc.forms("transform");  //��Ӧ��һ��table form
	   form.action="../servlet/Building3_Update";
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
	    var roomKey=doc.getElementById("room_info"+delId).innerHTML;    	  
	    doc.getElementsByName("delSolve")[0].value=roomKey+'#';//��ȡ����keyֵ    	   
	    for (i=1;i<roomInfoTable.rows.length;i++){//����
	        roomInfoTable.rows[i].cells[1].innerHTML=i;
	    }  //for
	      //submit
	    var form=doc.forms("transForm");       
	    form.action="../servlet/Building3_Delete";
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
	        var roomKey = doc.getElementById("room_info"+i).innerHTML;
	        allKey+=roomKey+'#';
	    }  
   } 
     var isSureDeled=confirm('ȷ��Ҫɾ����Щ��Ϣ��');
   if(isSureDeled==false)
   {
    for(i=0;i<len;i++)
    {
	    if(batBox[i].checked==true)
	    {   
	       batBox[i].checked=false;
	    }  
    } 
   return;
   }
   doc.getElementsByName("delSolve")[0].value=allKey;
   var keyform=doc.forms("transForm");   
   keyform.action="../servlet/Building3_Delete";
   keyform.submit();  
}

//������Ӵ��� 2015.7.14
function addItem(){
   doc.getElementById("addwin").style.display="";
}
</script>


<!------------------------------------------�����ѡ����ɫ����----------------------------------------------->
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
	<input type="hidden" name="room_info" value=""/>   
	<input type="hidden" name="owner_name" value=""/>   
	<input type="hidden" name="owne_num" value=""/>   
	<input type="hidden" name="population" value=""/>   
	<input type="hidden" name="sale_info" value=""/>  
	
</form>
<!-- ������ end -->

<div class="box1">&nbsp;
	<font size="2" >�㵱ǰ��λ��:</font>
	<font color="blue" size=2pt>[��������]-[���ݽ��ӹ���]<br /> <br /> </font>
</div>
<br>

<form action="../servlet/Building3_Select" method="post" name="queryform">
           
            <!-------------------------------------��ѯ���� ------------------------------------>
            
			<table class="gridtable" width="98%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<font size=2>&nbsp;&nbsp;С����:</font>
							<select id="com_name" name="com_name">
								<option value="0">--ѡ��С��--</option>
								<option value="ˮ�Ƽ�">ˮ�Ƽ� </option>
								<option value="����� ">����� </option>
								<option value="���԰">���԰</option>
								<option value="ź���">ź��� </option>
							</select>
						</td>
						<td>
							<font size=2>&nbsp;&nbsp;¥���:</font>
							<select id="build_num" name="build_num">
								<option value="0">--ѡ��¥��--</option>
								<option value="A01">A01</option>
								<option value="A02">A02</option>
								<option value="A03">A03</option>
								<option value="B01">B01</option>
								<option value="B02">B02</option>
								<option value="B03">B03</option>
								<option value="C01">C01</option>
								<option value="C02">C02</option>
								<option value="C03">C03</option>
						</td>
						<td>
							<font size=2>&nbsp;&nbsp;��Ԫ��:</font>
							<select id="unit_num" name="unit_num">
								<option value="0">--ѡ��Ԫ��--</option>
								<option value="1��Ԫ">1��Ԫ</option>
								<option value="2��Ԫ">2��Ԫ</option>
								<option value="3��Ԫ">3��Ԫ</option>
							</select>
						</td>		
					</tr>
					<tr>
					    <td>
							<font size=2>&nbsp;&nbsp;�����:</font>
							<input type="text" id="room_num" name="room_num"></input>
						</td>
						<td>
							<font size=2>&nbsp;&nbsp;��Ȩ��:</font>
							<input type="text" id="owner_name" name="owner_name"></input>
						</td>
						<td>
						    <font size=2>&nbsp;&nbsp;��������:</font>
							<input type="text" onclick="WdatePicker()" id="start_time" name="start_time"></input>
							&nbsp;-&nbsp;
							<input type="text" onclick="WdatePicker()" id="end_time" name="end_time"></input>
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
			<!-------------------------------------����ͷ���� ------------------------------------>
			
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
										onmouseout="changeback()" id="roomInfoTable">
										<tr>
											<td width="6%" height="22" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<input type="checkbox" name="checkbox" value="checkbox"
														onclick="clickall()" />
													<span class="STYLE1">ȫѡ</span>
												</div>
											</td>
											<td width="4%" height="eight=" 22" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">���</span>
												</div>
											</td>
											<td width="20%" height="22" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">����</span>
												</div>
											</td>
											<td width="10%" height="22" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">��Ȩ��</span>
												</div>
											</td>
											<td width="18%" background="<%=basePath%>/images/bg.gif" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">��Ȩ�˱��</span>
												</div>
											</td>
											<td width="10%" background="<%=basePath%>/images/bg.gif" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">��ס�˿�</span>
												</div>
											</td>
											<td width="12%" background="<%=basePath%>/images/bg.gif" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">��������</span>
												</div>
											</td>																		
											<td width="20%" height="22" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF" class="STYLE1">
												<div align="center">
													��������
												</div>
											</td>
										</tr>                                     
										
			<!--------------------------------------------- ѭ�����  --------------------------------------------> 
			 
										<c:forEach items="${list}" var="sale_info">
										<tr>
										<td height="10" bgcolor="#FFFFFF">
											<div align="center">
							  				 	 <input type="checkbox" name="checkbox" value="checkbox" />
											</div>
										</td>
										<td height="10" bgcolor="#FFFFFF" align="center">
											<div align="center">
												<span class="STYLE1"><%=order%></span>
											</div>											
										</td>						   
										<td height="10" bgcolor="#FFFFFF">
											<div align="center">
												<span class="STYLE1" id="room_info<%=order%>">${sale_info.com_name}-${sale_info.build_num}-${sale_info.unit_num}-${sale_info.room_num}</span>
											</div>
										</td>
										<td height="10" bgcolor="#FFFFFF">
											<div align="center" id="floortip">
												<span class="STYLE1" id="owner_name<%=order%>">${sale_info.owner_name}</span>
											</div>
										</td>
										<td bgcolor="#FFFFFF">
											<div align="center">
												<span class="STYLE1" id="owner_num<%=order%>">${sale_info.owner_num}</span>
											</div>
										</td>
										<td height="10" bgcolor="#FFFFFF">
											<div align="center">
												<span class="STYLE1" id="population<%=order%>">${sale_info.population}</span>
													   
						 					</div>
										</td>
										<td height="10" bgcolor="#FFFFFF">
											<div align="center">
												<span class="STYLE1" id="sale_time<%=order%>">${sale_info.date}</span>
											</div>
										</td>
										<td height="10" bgcolor="#FFFFFF" align="center">
											<img src="<%=basePath%>/images/edt.gif" />
												<button type="button" name="btnedit" id="btnedit<%=order%>" class="optbtn" onclick="openEdit(<%=order%>)">
													�༭
												</button>
											<img src="<%=basePath%>/images/del.gif" />
												<button type="button" name="btndel" id="btndel<%=order%>" class="optbtn" onclick="delSingleItem(<%=order++%>)">
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
			
				<!-------------------------------------------��ǰ�ڼ�ҳ,ҳ����ת��ť -------------------------------------------------->
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
												&nbsp;&nbsp;����<%=session.getAttribute("recordCount")%>����¼����ǰ�� <%=session.getAttribute("currentPage")%>/<%=(Integer)session.getAttribute("pageCount")%>ҳ
											</td>
											<td>
												<table border="0" align="right" cellpadding="0" cellspacing="0">					  
													<tr>
														<td width="40">	
														<div align="center">
														<%
														      if(((Integer)session.getAttribute("currentPage")).intValue()>1 && ((Integer)session.getAttribute("pageCount"))!=1){												    	   
														    	  out.print("<a href=\"../servlet/Building3?jump_type=first\">");
														      }												    
														%>										
														<img src="<%=basePath%>/images/first.gif" width="37" height="15"/></a></div>
														</td>
														
														<td width="45">													    
														    <div align="center">
														    <%
														        if(((Integer)session.getAttribute("currentPage")).intValue()>=2){												    	   
														    	    out.print("<a href=\"../servlet/Building3?jump_type=back\">");
														    	}												    
														    %>														  
														    <img src="<%=basePath%>/images/back.gif" width="43" height="15" /></a></div>								
														</td>
														
														<td width="45">
														    <div align="center">
														   	<%
														     if(((Integer)session.getAttribute("currentPage")).intValue()<(Integer)session.getAttribute("pageCount")){							    	    
														    	 out.print("<a href=\"../servlet/Building3?jump_type=next\">");
														     }									  											    
														    %>													  													   	
															<img src="<%=basePath%>/images/next.gif" width="43" height="15" /></a></div>								
														</td>
																					
														<td width="40"><div align="center">
														<%
														     if(((Integer)session.getAttribute("currentPage")).intValue()!=0 && ((Integer)session.getAttribute("currentPage")).intValue()< ((Integer)session.getAttribute("pageCount")).intValue()
														                               && ((Integer)session.getAttribute("pageCount")).intValue()!=1){												    	   
														    	 out.print("<a href=\"../servlet/Building3?jump_type=last\">");
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
			

<script>
var select1=document.getElementById("com_name").options;
for(var i=0,n=select1.length;i<n;i++){
	if(select1[i].value=='<%=(String)session.getAttribute("com_name")%>'){
		select1[i].selected=true;
	}
}

var select2=document.getElementById("build_num").options;
for(var i=0,n=select2.length;i<n;i++){
	if(select2[i].value=='<%=(String)session.getAttribute("build_num")%>'){
		select2[i].selected=true;
	}
}
var select3=document.getElementById("unit_num").options;
for(var i=0,n=select3.length;i<n;i++){
	if(select3[i].value=='<%=(String)session.getAttribute("unit_num")%>'){
		select3[i].selected=true;
	}
}

document.getElementById("room_num").value='<%=(String)session.getAttribute("room_num")%>';
document.getElementById("owner_name").value='<%=(String)session.getAttribute("owner_name")%>';
document.getElementById("start_time").value='<%=(String)session.getAttribute("start_time")%>';
document.getElementById("end_time").value='<%=(String)session.getAttribute("end_time")%>';


</script>			
			
			
	</body>
</html>

