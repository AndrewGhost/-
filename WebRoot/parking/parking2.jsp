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
.selectcss{
	WIDTH: 150px�� position :relative;
	left: -2px;
	top: -2px;
	font-size: 12px;
	line-height: 14px;
	border: 1px;
	color: #909993;
}
.winspan {
 background-color:#bbcc00; 
 width:150px;
 text-alien:left;
 display:-moz-inline-box; 
 display:inline-block;
 }
</style>

<!------------------------ Jquery 2015.7.12 
<script type="text/javascript"
src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js">
</script>
-->
<!--------------------------------JavaScript����-------------------------------->
<script>		
var selectedId;//��ѡ�е�item
var doc=document;
/*���Ƿ�����Ϣ���,ÿ����Ϣ��ı༭���ܵĵ��ú���,�ɱ༭���ۺ��۳�״̬*/
function openEdit(id){  
	var parklot_num=doc.getElementById("parklot_num"+id).innerHTML;	
	var parking_num=doc.getElementById("parking_num"+id).innerHTML;
	var state=doc.getElementById("state"+id).innerHTML;
	
	doc.getElementById("showspace").innerHTML=parking_num;
	doc.getElementById("showlot").value=parklot_num;
	doc.getElementById("showstate").value=state;
	
	doc.getElementById("win").style.display="";
	selectedId=id;
}
//ȷ�ϱ༭���޸�
function editSured(){ 
   
   	var isSureEdited=confirm('ȷ��Ҫ�޸���');
    if(isSureEdited==true)
    {
	    var parking_num=doc.getElementById("showspace").innerHTML;
	    var updatedLot=doc.getElementById("showlot").value;
	    var updatedState=doc.getElementById("showstate").value;
	  
	   doc.getElementsByName("spacevalue")[0].value=parking_num;
	   doc.getElementsByName("lotvalue")[0].value=updatedLot;
	   doc.getElementsByName("statevalue")[0].value=updatedState;
	   
       closeLogin();
	   document.getElementById("updateDoneDiv").style.display="";   	   
	   var form=doc.forms("transForm");  //��Ӧ��һ��table form
       form.action="../servlet/Parking2_Update";  
	   setTimeout(submit(form),1000); //һ����ת	  
   }
   else
   	   closeLogin();
}
//�ڱ������ת����Xҳ
function jumpTo(){

	 var temp=document.getElementById('jump_to').value;
	 var count = <%=(Integer)session.getAttribute("pageCount")/15+((Integer)session.getAttribute("pageCount")%15!=0?1:0)%>
	 if(temp<=count&&temp>0)
	  	window.location.href="../servlet/Parking2?jump_type=jump_to&to_page="+temp;
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
	 
		 var addedSpace=doc.getElementById("spaceInfo").value;
		 var addedLot=doc.getElementById("lotInfo").value;
		 var addedState=doc.getElementById("stateInfo").value;
		 completeInfo=addedSpace+'#'+addedLot+"#"+addedState;
		
	     document.getElementById("addDoneDiv").style.display=""; 
	     var tip='document.getElementById("addDoneDiv").style.display="none";'
	     setTimeout(tip,2000); 
	     doc.getElementsByName("addSolve")[0].value=completeInfo;
	     var addForm=doc.forms("transForm");   
	     addForm.action="../servlet/Parking2_Insert";
	     addForm.submit(); 
	     closeAdd();    
	 }
	 else
	 {
	    closeAdd();
	 }
}


//ɾ��������Ŀ 2015.7.13
function delSingleItem(delId){ 
      
    var isSureDeled=confirm('ȷ��Ҫɾ��������Ϣ��');
    if(isSureDeled){
	    var pKey=doc.getElementById("parking_num"+delId).innerHTML;    	  
	    doc.getElementsByName("delSolve")[0].value=pKey+'#';//��ȡ����keyֵ    	   
	    for (i=1;i<parkInfoTable.rows.length;i++){//����
	        parkInfoTable.rows[i].cells[1].innerHTML=i;
	    }  //for
	      //submit
	      
	    document.getElementById("delDoneDiv").style.display="";
	    setTimeout(submit,400); //һ����ת
	    submit("Parking2_Delete");   
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
	        var pKey = doc.getElementById("parking_num"+i).innerHTML;
	        allKey+=pKey+'#';
	    }  
   } 
   if(allkey=="#")
   return;
   doc.getElementsByName("delSolve")[0].value=allKey;
   
   document.getElementById("delDoneDiv").style.display="";
   setTimeout(submit,400); //һ����ת
   submit("Parking2_Delete"); 
    
}
function submit(form){
    form.submit();
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
function resetAll(){
     var e=doc.getElementsByTagName("input");
     for(i=0;i<e.length;i++){
      if(e[i].type=='text')
        e[i].value="";    
     }
     var s=doc.getElementById("state");
     var ops=s.options; 
     ops[0].selected = true;     
}
</script>

</head>
<body>
<div style='display: none; position: absolute; left: 40%; top: 14%;'id='updateDoneDiv'>
	<span class="beautywords">�޸ĳɹ�</span>
</div>
		
<div style='display: none; position: absolute; left: 40%; top: 14%;'id='delDoneDiv'>
	<span class="beautywords">�ɹ���</span>
</div>	

<div style='display: none; position: absolute; left: 40%; top: 14%;'id='addDoneDiv'>
	<span class="beautywords">��ӳɹ���</span>
</div>
<div id=win style="display: none; position: absolute; left: 50%; top: 40%; width: 320px; height: 300px; margin-left: -300px; margin-top: -200px; border: 1px solid #888; background-color: gray; text-align: center;">
     <a href="javascript:closeLogin();" alien="right" ; class="close">�ر�</a>
     <br>
     <span>�༭ͣ��λ��Ϣ</span><br><br><br>
     <span>&nbsp;&nbsp;ͣ��λ���:</span><span id="showspace" class="winspan"></span><br><br>
     <span>&nbsp;&nbsp;ͣ�������:</span><input id="showlot"></input><br><br>
     <span>��λʹ��״̬:</span><input id="showstate"></input><br><br>      
	 <input type="submit" id="editSure" style="position: absolute; left: 42%; top: 80%;" value="ȷ��" onclick="editSured()"></input>
</div>

<div id=addwin style="display: none; position: absolute; left: 50%; top: 50%; width: 390px; height: 260px; margin-left: -300px; margin-top: -200px; 
		border: 1px solid #888; background-color: gray; text-align: center;">
    <a href="javascript:closeAdd();" alien="right" ; class="close">�ر�</a><br>
	<label>��ӷ�����Ϣ</label><br></br><br>
	<label>&nbsp;&nbsp;ͣ��λ���:</label><input id="spaceInfo" type="text" style="width:200px"></input><br></br>
	<label>&nbsp;&nbsp;ͣ�������:</label><input id="lotInfo" type="text" style="width:200px"></input><br></br>
	<label>��λʹ��״̬:</label><input id="stateInfo" type="text" style="width:200px"></input><br></br>
	<input type="submit" id="addSure" style="position: absolute; left: 42%; top: 80%;" value="ȷ��" onclick="addSured()"></input>
</div>

<!-- ������  2015.7.13-->
<form name="transForm" method="post" action="">
	<input type="hidden" name="delSolve" value=""/>
	<input type="hidden" name="addSolve" value=""/>
	<input type="hidden" name="spacevalue" value=""/>   
	<input type="hidden" name="lotvalue" value=""/>   
	<input type="hidden" name="statevalue" value=""/>   
</form>
<!-- ������ end -->

<div class="box1">&nbsp;
	<font size="2">�㵱ǰ��λ��:</font>
	<font color="blue" size=2pt>[ͣ������]-[ͣ��λ����]<br ></br> </font>
</div>
<br>
 <form action="../servlet/Parking2_Select" method="post" name="queryform">
			<table class="gridtable" width="98%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td>
							<font size=2>&nbsp;&nbsp;ͣ��λ���:</font>
							<input id="parking_num" name="parking_num" type="text"
							value=<%if(session.getAttribute("parking_num_tran")!=null) 
							out.print(session.getAttribute("parking_num_tran"));session.setAttribute("parking_num_tran","");%>											
					       ></input>
						</td>
					   <td>
							<font size=2>&nbsp;&nbsp;ͣ�������:</font>
                            <input id="parklot_num" name="parklot_num" type="text"
                            value=<%if(session.getAttribute("parklot_num_tran")!=null) 
							out.print(session.getAttribute("parklot_num_tran"));session.setAttribute("parklot_num_tran","");%>
                            ></input>
					   </td>
						<td>
						    <font size=2>&nbsp;&nbsp;��λռ��״̬:</font>
							<select id="state" name="state" class="selectcss">
								<option value="" >
									--ѡ��״̬--
								</option>
								<option value="1" 
								 <%if(session.getAttribute("state_tran")!=null)
								 {
								   if(session.getAttribute("state_tran").toString().equals("1"))
								   out.print("selected");
								 }
								 %>							
								>
									��ռ��
								</option>
								<option value="0"
								<%if(session.getAttribute("state_tran")!=null)
								 {
								   if(session.getAttribute("state_tran").toString().equals("0"))
								   out.print("selected");
								 }
								 %>									
								>
									δռ��
								</option>			
							</select>						 			
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
											<td width="6%" height="20" background="<%=basePath%>/images/bg.gif"
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
											<td width="20%" height="20" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">ͣ��λ���</span>
												</div>
											</td>
											<td width="20%" height="20" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1"> ͣ�������</span>
												</div>
											</td>
											<td width="20%" height="20" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1"> ��λռ��״̬</span>
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
														<span class="STYLE1" id="parking_num<%=order%>">${p.parking_num}</span>														
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="parklot_num<%=order%>">${p.parklot_num}</span>														
													</div>
												</td>
												<td bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="state<%=order%>">${p.state}</span>												
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
														    <div align="center"><a href="../servlet/Parking2?jump_type=first"><img src="<%=basePath%>/images/first.gif" width="37" height="15"/></a></div></td>
														</td>
														
														<td width="45">													    
														    <div align="center">
														    <%
														        if(((Integer)session.getAttribute("currentPage")).intValue()>=2){												    	   
														    	    out.print("<a href=\"../servlet/Parking2?jump_type=back\">");
														    	}												    
														    %>														  
														    <img src="<%=basePath%>/images/back.gif" width="43" height="15" /></a></div>								
														</td>
														
														<td width="45">
														    <div align="center">
														   	<%
														     if(((Integer)session.getAttribute("currentPage")).intValue()<((Integer)session.getAttribute("pageCount")/15+((Integer)session.getAttribute("pageCount")%15!=0?1:0))){							    	    
														    	 out.print("<a href=\"../servlet/Parking2?jump_type=next\">");
														     }									  											    
														    %>													  													   	
															<img src="<%=basePath%>/images/next.gif" width="43" height="15" /></a></div>								
														</td>
																					
														<td width="40"><div align="center"><a href="../servlet/Parking2?jump_type=last"><img src="<%=basePath%>/images/last.gif" width="37" height="15" /></a></div>																							
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

