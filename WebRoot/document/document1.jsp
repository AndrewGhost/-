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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��ҵ��Ϣ����</title>

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

	margin-left: -16px;
	margin-top: -14px;
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
    background:url('../tab/images/tab_05.gif');
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
.filePrew { 
width:200px; 
height:20px; 
background-color:#ffffff; 
border:solid 1px #7dbad7; 
font-size:12px; 
color:#000000;
} 
 
</style>
<script type="text/javascript" src="../js/WdatePicker.js"></script>
<div id=win style="display: none; position: absolute; left: 50%; top: 40%; width: 370px; height: 250px; margin-left: -300px; margin-top: -200px; border: 1px solid #888; background-color: #ffffff; text-align: center;">
   
     <table width="100%" style="background-color:#008080;" hight="20%" >
     	<tr >
     		<td width="90%">
     			<span><font color="#f5f5f5" face="microsoft yahei" size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�༭�ĵ���Ϣ</font></span>
     		</td>
     		<td width="10%">
     			<a href="javascript:closeLogin();" class="close">�ر�</a>
     		</td>
     	</tr>
     
     </table>
     <br>
     
     <span>&nbsp;&nbsp;�ĵ����:</span><span id="showdid" class="winspan" style="width:130px; height:20px; background-color:#ffffff;  font-size:12px; color:#000000"></span><br><br>
     <span>&nbsp;&nbsp;�ĵ�����:</span><input id="showdname" style="width:130px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px; color:#000000"></input><br><br>
     <span>&nbsp;&nbsp;&nbsp;&nbsp;�ϴ���:</span><input id="showperson" style="width:130px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px; color:#000000"></input><br><br>   
 
	 <input type="submit" id="editSure" style="position: absolute; left: 45%; top: 80%;background-color:#ff8040" value="ȷ��" onclick="editSured()"></input>
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

<div id=addwin style="display: none; position: absolute; left: 50%; top: 40%; width: 370px; height: 250px; margin-left: -300px; margin-top: -200px; border: 1px solid #888; background-color: #ffffff; text-align:left;">
   
     <table width="100%" style="background-color:#008080;" hight="20%" >
     	<tr >
     		<td width="90%">
     			<span><font color="#f5f5f5" face="microsoft yahei" size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����ĵ���Ϣ</font></span>
     		</td>
     		<td width="10%">
     			<a href="javascript:closeAdd();" class="close">�ر�</a>
     		</td>
     	</tr>
     
     </table>
     <br>
     
     <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ļ�:</span><input type="file" id="file" onchange="file_onselect()" class="filePrew"/><br><br>
     <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ĵ�����:</span><input id="titleInfo" style="width:130px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px; color:#000000"></input><br><br>
     <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ϴ���:</span><input id="personInfo" style="width:130px; height:15px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px; color:#000000"></input><br><br>   
 
	 <input type="submit" id="addSure" style="position: absolute; left: 45%; top: 80%;background-color:#ff8040" value="�ϴ�" onclick="addSured()"></input>
</div>

<!--------------------------------JavaScript����-------------------------------->
<script>		
var selectedId;//��ѡ�е�item
var doc=document;
function jumpTo(){

	 var temp=document.getElementById('jump_to').value;
	 var count = <%=(Integer)session.getAttribute("pageCount")/15+((Integer)session.getAttribute("pageCount")%15!=0?1:0)%>
	 if(temp<=count&&temp>0)
	  	window.location.href="../servlet/Document1?jump_type=jump_to&to_page="+temp;
}

function closeLogin(){   
    document.getElementById("win").style.display="none";
}
//�ر���Ӽ�¼���� 2015.7.14
function closeAdd(){   
	document.getElementById("addwin").style.display="none";
}

function openEdit(id){  	
 
	var doc_num=doc.getElementById("doc_num"+id).innerHTML;
	
	var doc_title=doc.getElementById("doc_title"+id).innerHTML;
	
	var upload_person=doc.getElementById("upload_person"+id).innerHTML;

	doc.getElementById("showdid").innerHTML=doc_num;
	doc.getElementById("showdname").value=doc_title;
	doc.getElementById("showperson").value=upload_person;
	
	doc.getElementById("win").style.display="";
	selectedId=id;
}

//ȷ�ϱ༭���޸�
function editSured(){ 
   	var isSureEdited=confirm('ȷ��Ҫ�޸���');
    if(isSureEdited==true)
    {  
   
		var Did=doc.getElementById("showdid").innerHTML;
	    var updatedDoc_name=doc.getElementById("showdname").value;
	    var updatedPerson=doc.getElementById("showperson").value;

	    doc.getElementsByName("didvalue")[0].value=Did;
	    doc.getElementsByName("namevalue")[0].value=updatedDoc_name;
	    doc.getElementsByName("personvalue")[0].value=updatedPerson;
	    
	    document.getElementById("updateDoneDiv").style.display="";
	    setTimeout(submit,500); //һ����ת
	    closeLogin();
   }
   else
   	    closeLogin();
}
function submit(){
 	var form=doc.forms("transform");  //��Ӧ��һ��table form
   	form.action="../servlet/Document1_Update";
    form.submit();
}

function getPath(obj)  
{  
  if(obj)  
    {  
    if (window.navigator.userAgent.indexOf("MSIE")>=1)  
      {  
        obj.select();  
      return document.selection.createRange().text;  
      }  
 
    else if(window.navigator.userAgent.indexOf("Firefox")>=1)  
      {  
      if(obj.files)  
        {  
        return obj.files.item(0).getAsDataURL();  
        }  
      return obj.value;  
      }  
    return obj.value;  
    }  
}  

//������Ӵ��� 2015.7.16
function addItem(){
   doc.getElementById("addwin").style.display=""; 
}
var file_url="";
function file_onselect() {//ѡ���ļ����ʱ��д�ļ���
     file_url = getPath(document.getElementById("file"));//�ļ�·�� 
	 var index=file_url.lastIndexOf("\\"); 
	 var filename=file_url.slice(index+1);
	 doc.getElementById("titleInfo").value=filename;
 }
//��Ӽ�¼ȷ�� 2015.7.16
function addSured(){  	
	 var isSureAdded=confirm('ȷ��Ҫ���������¼��');
	 var completeInfo="";
	 if(isSureAdded==true){
		var Title=doc.getElementById("titleInfo").value;
		var PersonInfo=doc.getElementById("personInfo").value;
	    completeInfo=file_url+"#"+Title+"#"+PersonInfo+"#";    
	    if(file_url==0||Title==0||PersonInfo==0)
	    {
	      alert("��Ϣ��������");
	      return;
	    }
	    document.getElementById("addDoneDiv").style.display=""; 
	    var tip='document.getElementById("addDoneDiv").style.display="none"';
	    setTimeout(tip,2000); 
	    doc.getElementsByName("addSolve")[0].value=completeInfo;
	    var addForm=doc.forms("transForm");   
	    addForm.action="../servlet/Document1_Insert";
	    addForm.submit(); 
	    closeAdd();    
	 }
	 else
	 {
	    closeAdd();
	 }
}

function delSingleItem(delId){ 
      
    var isSureDeled=confirm('ȷ��Ҫɾ��������Ϣ��');
    if(isSureDeled){
	    var docKey=doc.getElementById("doc_num"+delId).innerHTML;  	  
	    doc.getElementsByName("delSolve")[0].value=docKey+'#';//��ȡ����keyֵ    	   
	    for (i=1;i<docInfoTable.rows.length;i++){//����
	        docInfoTable.rows[i].cells[1].innerHTML=i;
	    }  //for
	      //submit
	    var form=doc.forms("transForm");       
	    form.action="../servlet/Document1_Delete";
	    form.submit();   
    }//if         
}
function resetAll(){
     var e=doc.getElementsByTagName("input");
     for(i=0;i<e.length;i++){
      if(e[i].type=='text')
        e[i].value="";    
     }
    
}
function delBatItems(){ 

   var batBox=doc.getElementsByName("checkbox"); 
   var len=batBox.length;
   var allKey="";
   for(i=0;i<len;i++)
   {
	    if(batBox[i].checked==true&&batBox[i].value!="all_checkbox")
	    {   
	        var docKey = doc.getElementById("doc_num"+i).innerHTML;
	        allKey+=docKey+'#';
	    }  
   } 
   if(allKey=="#")
   return;
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
   keyform.action="../servlet/Document1_Delete";
   keyform.submit();  
}

function download(delId){
    
     var Key=doc.getElementById("doc_num"+delId).innerHTML;
     var filename=doc.getElementById("doc_title"+delId).innerHTML;    
     var  fileurl="http://10.25.240.5:8080/MyProject/upload/"+Key+"@"+filename;//http://10.25.240.39:8080
     window.open(fileurl);            
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
function resetAll(){
     var e=doc.getElementsByTagName("input");
     for(i=0;i<e.length;i++){
      if(e[i].type=='text')
        e[i].value="";    
     }
    
}
</script>
</head>

<body>
<!-- ������  2015.7.13-->
<form name="transForm" method="post" action="">
	<input type="hidden" name="delSolve" value=""/>
	<input type="hidden" name="addSolve" value=""/>
	
	<input type="hidden" name="didvalue" value=""/>   
	<input type="hidden" name="namevalue" value=""/>   
	<input type="hidden" name="personvalue" value=""/>   

</form>
<!-- ������ end -->

<div class="box1">&nbsp;
	<font size="2">�㵱ǰ��λ��:</font>
	<font color="blue" size=2pt>[�ĵ�����]-[�ĵ���Ϣ����]<br></br> </font>
</div>
<br>
 <form action="../servlet/Document1_Select" method="post" name="queryform">
  <table class="gridtable" width="98%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td>
							<font size=2>&nbsp;&nbsp;�����ĵ����:</font>
							<input id="doc_num"  type="text" name="doc_num"
							value=<%if(session.getAttribute("doc_num_tran")!=null) 
							out.print(session.getAttribute("doc_num_tran"));session.setAttribute("doc_num_tran","");%>
							></input>
						</td>
					   <td>
							<font size=2>&nbsp;&nbsp;�ĵ��ϴ���Ա:</font>
                            <input id="upload_person" type="text" name="upload_person" 
                            value=<%if(session.getAttribute("upload_person_tran")!=null) 
							out.print(session.getAttribute("upload_person_tran"));session.setAttribute("upload_person_tran","");%>
                            ></input>
					   </td>
					 </tr>
					 
					 <tr>					 
					   <td>
							<font size=2>&nbsp;&nbsp;���ϴ��ļ���:</font>
                            <input id="doc_title" type="text" name="doc_title" 
                             value=<%if(session.getAttribute("doc_title_tran")!=null) 
							 out.print(session.getAttribute("doc_title_tran"));session.setAttribute("doc_title_tran","");%>
                            ></input>
					   </td>
					   <td>
						    <font size=2>&nbsp;&nbsp;�ĵ��ϴ�ʱ��:</font>
							<input id="d11" type="text" onclick="WdatePicker()" name="start_time" 
							 value=<%if(session.getAttribute("start_time_tran")!=null) 
							 out.print(session.getAttribute("start_time_tran"));session.setAttribute("start_time_tran","");%>
							></input>
							<span>~</span>
							<input id="d12" type="text" onclick="WdatePicker()" name="end_time" 
							value=<%if(session.getAttribute("end_time_tran")!=null) 
							 out.print(session.getAttribute("end_time_tran"));session.setAttribute("end_time_tran","");%>
							></input>									 			
					   </td>	
					 </tr>
				
					<tr>
						<td colspan="3" align="right" class="tdbtn">
							<input type="submit" id="btnQuery" value="��ѯ" class="buttonadd"></input>
							<input type="button" id="btnAdd" value="�ϴ�" class="buttonadd" onclick="addItem()"></input>
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
														 
									<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()" onmouseout="changeback()" id="docInfoTable">				
										<tr>
											<td width="4%" height="20" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<input type="checkbox" name="checkbox" value="all_checkbox"
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
													<span class="STYLE1">�ĵ����</span>
												</div>
											</td>
											<td width="10%" height="20" background="<%=basePath%>/images/bg.gif" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">�ĵ�����</span>
												</div>
											</td>
											<td width="8%" height="20" background="<%=basePath%>/images/bg.gif" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1"> �ϴ���</span>
												</div>
											</td>
											<td width="7%" height="20" background="<%=basePath%>/images/bg.gif" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1"> �ϴ�ʱ��</span>
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
							<c:forEach items="${doc_list}" var="d">
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
													<div align="center">
														<span class="STYLE1" id="doc_num<%=order%>">${d.doc_num}</span>														
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="doc_title<%=order%>">${d.doc_title}</span>														
													</div>
												</td>
												<td bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="upload_person<%=order%>">${d.upload_person}</span>												
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="upload_date<%=order%>">${d.upload_date}</span>												   
													</div>
												</td>																							
								               
												<td height="20" bgcolor="#FFFFFF" align="center">
												    <img src="<%=basePath%>/images/down.gif" />
													<button type="button" name="btnedit" id="btnedit<%=order%>"
														class="optbtn" onclick="download(<%=order%>)">
														����
													</button>
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
								<td width="8" background="<%=basePath%>/images/tab_15.gif">&nbsp;</td>
							</tr>
						</table>
					</td>
				</tr>
				<!-- �˴���� -->
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
														    <div align="center"><a href="../servlet/Document1?jump_type=first"><img src="<%=basePath%>/images/first.gif" width="37" height="15"/></a></div></td>
														</td>
														
														<td width="45">													    
														    <div align="center">
														    <%
														        if(((Integer)session.getAttribute("currentPage")).intValue()>=2){												    	   
														    	    out.print("<a href=\"../servlet/Document1?jump_type=back\">");
														    	}												    
														    %>														  
														    <img src="<%=basePath%>/images/back.gif" width="43" height="15" /></a></div>								
														</td>
														
														<td width="45">
														    <div align="center">
														   	<%
														     if(((Integer)session.getAttribute("currentPage")).intValue()<((Integer)session.getAttribute("pageCount")/15+((Integer)session.getAttribute("pageCount")%15!=0?1:0))){							    	    
														    	 out.print("<a href=\"../servlet/Document1?jump_type=next\">");
														     }									  											    
														    %>													  													   	
															<img src="<%=basePath%>/images/next.gif" width="43" height="15" /></a></div>								
														</td>
																					
														<td width="40"><div align="center"><a href="../servlet/Document1?jump_type=last"><img src="<%=basePath%>/images/last.gif" width="37" height="15" /></a></div>																							
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

