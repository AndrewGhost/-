<%@ page language="java" import="java.util.*" pageEncoding="gb18030"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/" +"tab/";
%>
<%long order = 1;
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
<title>������Ϣ����</title>

<!---------------------------CSS��ʽ------------------------------>
<style type="text/css">	
a{text_decoration:none;}
a:visited{color:blue;}

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

<!--------------------------------JavaScript����-------------------------------->
<script type="text/javascript" src="../js/WdatePicker.js"></script>
<script>		
//�ڱ������ת����Xҳ
function jumpTo(){

	 var temp=document.getElementById('jump_to').value;
	 var count = <%=(Integer)session.getAttribute("pageCount")%>
	 if(temp<=count && temp>0)
	  	window.location.href="../servlet/Building5?jump_type=jump_to&to_page="+temp;
}
function closeLogin(){   
    document.getElementById("win").style.display="none";
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

</script>
<!----------------------�޸��ɴ˿�ʼ ------------------------->
<style type="text/css">
table.gridtable {
	margin: auto;
	font-family: verdana, arial, sans-serif;
	font-size: 14px;
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

<div class="box1">&nbsp;
	<font size="2" >�㵱ǰ��λ��:</font>
	<font color="blue" size=2pt>[��������]-[�ۺ���Ϣ����]<br/><br/></font>
</div>
<br>


<form action="../servlet/Building5_Select" method="post" name="queryform">
           
            <!-------------------------------------��ѯ���� ------------------------------------>
            
			<table class="gridtable" width="98%" border="0" cellspacing="0" cellpadding="0" >
					<tr>
						<td>
						    <div style="display:none;"><iframe id="compareIframe" src=""></iframe></div>
							<font size=2>С����:</font>
							<select id="com_name" name="com_name">
								<option value="0">--ѡ��С��--</option>
								<option value="ˮ�Ƽ�">ˮ�Ƽ� </option>
								<option value="����� ">����� </option>
								<option value="���԰">���԰</option>
								<option value="ź���">ź��� </option>
							</select>
						</td>
						<td>
							<font size=2>¥���:</font>
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
					</tr>
					<tr>
						<td>
							<font size=2>��Ԫ��:</font>
							<select id="unit_num" name="unit_num">
								<option value="0">--ѡ��Ԫ��--</option>
								<option value="1��Ԫ">1��Ԫ</option>
								<option value="2��Ԫ">2��Ԫ</option>
								<option value="3��Ԫ">3��Ԫ</option>
							</select>
						</td>		
						<td>
							<font size=2>�����:</font>
							<input type="text" id="room_num" name="room_num"></input>
						</td>	
					</tr>
				
					<tr>
						<td colspan="3" align="right" class="tdbtn">
							<input type="submit" id="btnQuery" value="��ѯ" class="buttonadd"></input>&nbsp;				
							<input type="reset" id="btnSet" value="����" class="buttonadd"></input>&nbsp;
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
											<td width="4%" height="eight=" 22" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">���</span>
												</div>
											</td>
											<td width="18%" height="22" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">����</span>
												</div>
											</td>
											<td width="10%" height="22" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">������Ϣ</span>
												</div>
											</td>
											<td width="10%" background="<%=basePath%>/images/bg.gif" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">������Ϣ</span>
												</div>
											</td>	
											<td width="10%" background="<%=basePath%>/images/bg.gif" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">����װ�޼�¼</span>
												</div>
											</td>	
											<td width="10%" background="<%=basePath%>/images/bg.gif" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">�շѼ�¼</span>
												</div>
											</td>	
											<td width="10%" background="<%=basePath%>/images/bg.gif" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">����ͳ��</span>
												</div>
											</td>																										
										</tr>                                     
			
			<!--------------------------------------------- ѭ�����  --------------------------------------------> 			                        
										<c:forEach items="${list}" var="all_info">
										<tr>						
										<td height="20" bgcolor="#FFFFFF" align="center">
											<div align="center">
												<span class="STYLE1"><%=order%></span>
											</div>											
										</td>						   
										<td height="20" bgcolor="#FFFFFF">
											<div align="center">
												<span class="STYLE1" id="room<%=order%>">${all_info.com_name}-${all_info.build_num}-${all_info.unit_num}-${all_info.room_num}</span>
											</div>
										</td>
										<td height="20" bgcolor="#FFFFFF">
											<div align="center">
												<a href="../servlet/Building5_ShowInfo?id=${all_info.count}&type=1"><span class="STYLE1" id="room_info<%=order%>">������Ϣ</span></a>
											</div>
										</td>
										<td height="20" bgcolor="#FFFFFF">
											<div align="center">
												<a href="../servlet/Building5_ShowInfo?id=${all_info.count}&type=2"><span class="STYLE1" id="owner_info<%=order%>">${all_info.owner_name}</span></a>
											</div>
										</td>
										<td height="20" bgcolor="#FFFFFF">
											<div align="center">
												<a href="../servlet/Building5_ShowInfo?id=${all_info.count}&type=3"><span class="STYLE1" id="dec_info<%=order%>">����װ�޼�¼</span></a>
											</div>
										</td>
										<td height="20" bgcolor="#FFFFFF">
											<div align="center">
												<a href="../servlet/Building5_ShowInfo?id=${all_info.count}&type=4"><span class="STYLE1" id="fee_info<%=order%>">�շѼ�¼</span></a>
											</div>
										</td>
										<td height="20" bgcolor="#FFFFFF">
											<div align="center">
												<a href="../servlet/Building5_ShowInfo?id=${all_info.count}&type=5"><span class="STYLE1" id="sta_info<%=order%>">����ͳ��</span></a>
											</div>
										</td>
									</tr>		
									<%order++;%>					
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
														    	  out.print("<a href=\"../servlet/Building5?jump_type=first\" style=\"text-decoration:none;color:white\">");
														      }												    
														%>										
														<img src="<%=basePath%>/images/first.gif" width="37" height="15"/></a></div>
														</td>
														
														<td width="45">													    
														    <div align="center">
														    <%
														        if(((Integer)session.getAttribute("currentPage")).intValue()>=2){												    	   
														    	    out.print("<a href=\"../servlet/Building5?jump_type=back\" style=\"text-decoration:none;color:white\">");
														    	}												    
														    %>														  
														    <img src="<%=basePath%>/images/back.gif" width="43" height="15" /></a></div>								
														</td>
														
														<td width="45">
														    <div align="center">
														   	<%
														     if(((Integer)session.getAttribute("currentPage")).intValue()<(Integer)session.getAttribute("pageCount")){							    	    
														    	 out.print("<a href=\"../servlet/Building5?jump_type=next\" style=\"text-decoration:none;color:white\">");
														     }									  											    
														    %>													  													   	
															<img src="<%=basePath%>/images/next.gif" width="43" height="15" /></a></div>								
														</td>
																					
														<td width="40"><div align="center">
														<%
														     if(((Integer)session.getAttribute("currentPage")).intValue()!=0 && ((Integer)session.getAttribute("currentPage")).intValue()< ((Integer)session.getAttribute("pageCount")).intValue()
														                               && ((Integer)session.getAttribute("pageCount")).intValue()!=1){												    	   
														    	 out.print("<a href=\"../servlet/Building5?jump_type=last\" style=\"text-decoration:none;color:white\">");
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
															<div align="center"><a href="javascript:jumpTo()" onclick="jumpTo()" style="text-decoration:none;color:white"><img src="<%=basePath%>/images/go.gif" width="37" height="15" /></a></div>
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
</script>


	</body>
</html>

