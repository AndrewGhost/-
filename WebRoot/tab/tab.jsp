<%@ page language="java" import="java.util.*" pageEncoding="gb18030"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/" +"tab/";
%>
<%long order = 1;%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>

		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>�ޱ����ĵ�</title>
		<style type="text/css">
<!--
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

-->
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
		<!-- jquery 2015.7.12-->
		<script type="text/javascript"
			src="http://ajax.microsoft.com/ajax/jquery
/jquery-1.4.min.js"></script>
		<div id=win style="display: none; position: absolute; left: 50%; top: 40%; width: 450px; height: 320px; margin-left: -300px; margin-top: -200px; border: 1px solid #888; background-color: gray; text-align: center;">
			<a href="javascript:closeLogin();" alien="right" ; class="close">�ر�</a>
			<br>
			<span>��ҵ����ϵͳ</span>
			<br>
			<br>
			<br>
			<br>
			<br>
			<span>��&nbsp;&nbsp;&nbsp;��:</span><span id="showroom"></span>
			<br>
			<br>
			<span>&nbsp;��&nbsp;&nbsp;&nbsp;��:</span>
			<input id="showprice"></input>
			<br>
			<br>
			<span>�۳�״̬:</span>
			<input id="showstate"></input>
			<br>
			<input type="submit" id="editSure"
				style="position: absolute; left: 45%; top: 80%;" value="ȷ��"
				onclick="editSured()"></input>
		</div>
		<div style='display: none; position: absolute; left: 40%; top: 14%;'
			id='updateDoneDiv'>
			<span class="beautywords">�޸ĳɹ�</span>
		</div>
		<script>
/*���Ƿ�����Ϣ��ģ�ÿ����Ϣ��ı༭���ܵĵ��ú������ɱ༭���ۺ��۳�״̬*/
function openEdit(){  
var doc=document;
var room=doc.getElementById("room1").innerHTML;
var price=doc.getElementById("price1").innerHTML;
var isselled=doc.getElementById("selled1").innerHTML;
doc.getElementById("showroom").innerHTML=room;
doc.getElementById("showprice").value=price;
doc.getElementById("showstate").value=isselled;
doc.getElementById("win").style.display="";
}
function closeLogin(){   
document.getElementById("win").style.display="none";
}
function editSured(){ //ȷ���޸�
   var isSureEdited=confirm('ȷ��Ҫ�޸���');
   if(isSureEdited==true)
   {
   var doc=document;
   var updatedPrice=doc.getElementById("showprice").value;
   var updatedState=doc.getElementById("showstate").value;
   doc.getElementById("price1").innerHTML=updatedPrice;
   doc.getElementById("selled1").innerHTML=updatedState;
   closeLogin();
   document.getElementById("updateDoneDiv").style.display="";
   var tip='document.getElementById("updateDoneDiv").style.display="none";'
   setTimeout(tip,2000); 
   }
   else
   closeLogin();
}
</script>

		<!-- jquery end 2015.7.12-->
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
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

function  clickto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}
var isSelected=1;
function clickall(){//ȫѡ����  2015.7.12
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
		<!-- --------------------�޸��ɴ˿�ʼ ------------------------->
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
		<div class="box1">
			&nbsp;
			<font face="����" size="2" color="gray">�㵱ǰ��λ��:</font>
			<font color="blue" size=2pt>[ҵ������]-[�ҵ��ʼ�]<br /> <br /> </font>
		</div>
		<br>
			<form action="../servlet/Building1_Select" method="post">
				<table class="gridtable" width="98%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td>
							<font size=2>С����:</font>
							<select id="area" name="area">
								<option value="0">
									--ѡ��С��--
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
						<td>
							<font size=2>¥���:</font>
							<select id="building" name="building">
								<option value="0">
									--ѡ��¥��--
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
						<td>
							<font size=2>��Ԫ��:</font>
							<select id="unit" name="unit">
								<option value="0">
									--ѡ��Ԫ��--
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
						<td>
							<font size=2>&nbsp;&nbsp;¥��:</font>
							<select id="floor" name="floor">
								<option value="0">
									--ѡ��¥��--
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
						<td>
							<font size=2>&nbsp;&nbsp;״̬:</font>
							<select id="state" name="state">
								<option value="0">
									--ѡ��״̬--
								</option>
								<option value="1">
									1
								</option>
								<option value="2">
									2
								</option>

							</select>

						</td>
						<td>
							<font size=2 style="vertical-align: middle">&nbsp;&nbsp;���:</font>
							<input type="text" id="size" name="size"></input>
						</td>
					</tr>
					<tr>
						<td>
							<font size=2>&nbsp;&nbsp;����:</font>
							<input type="text" id="layout" name="layout"></input>
						</td>
						<td>
							<font size=2>�����:</font>
							<input type="text" id="roomId" name="roomId"></input>
						</td>
						<td>
							<font size=2>&nbsp;&nbsp;����:</font>
							<input type="text" id="price" name="price"></input>
						</td>
					</tr>
					<tr>
						<td colspan="3" align="right" class="tdbtn">
							<input type="submit" id="btnAdd" value="��ѯ" class="buttonadd"></input>
							<input type="submit" id="btnAdd" value="����" class="buttonadd"></input>
							<input type="submit" id="btnAdd" value="ɾ��" class="buttonadd"></input>
							<input type="reset" id="btnAdd" value="����" class="buttonadd"></input>
						</td>
					</tr>
				</table>
			</form>
			<br />

			<!-- --------------------�޸Ľ��� 2015.7.11------------------------->

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
										onmouseout="changeback()">
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
											<td width="25%" height="22" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">����</span>
												</div>
											</td>
											<td width="4%" height="22" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">¥��</span>
												</div>
											</td>
											<td width="4%" background="<%=basePath%>/images/bg.gif" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">���</span>
												</div>
											</td>
											<td width="8%" background="<%=basePath%>/images/bg.gif" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">����</span>
												</div>
											</td>
											<td width="18%" background="<%=basePath%>/images/bg.gif" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">����</span>
												</div>
											</td>
											<td width="5%" height="22" background="<%=basePath%>/images/bg.gif"
												bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">�۳�״̬</span>
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
										<c:forEach items="${list}" var="house">
											<tr>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<input type="checkbox" name="checkbox2" value="checkbox" />
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center" class="STYLE1">
														<div align="center"><%=order%></div>
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="room<%=order%>">${house.com_name}</span>
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center" id="floortip">
														<span class="STYLE1" id="floor<%=order%>">${house.floor}
														</span>
													</div>
												</td>
												<td bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="size<%=order%>">${house.room_size}</span>
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="price<%=order%>">${house.floor}</span>
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="lay<%=order%>">${house.layout}</span>
													</div>
												</td>
												<td height="20" bgcolor="#FFFFFF">
													<div align="center">
														<span class="STYLE1" id="selled<%=order++%>">${house.sale_state}</span>
													</div>
												</td>

												<td height="20" bgcolor="#FFFFFF" align="center">
													<img src="<%=basePath%>/images/edt.gif" />
													<button type="button" name="btnedit" id="btnedit"
														class="optbtn" onclick="openEdit()">
														�༭
													</button>
													<img src="<%=basePath%>/images/del.gif" />
													<button type="button" name="btndel" id="btndel"
														class="optbtn">
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
												&nbsp;&nbsp;���� 120 ����¼����ǰ�� 1/10 ҳ
											</td>
											<td>
												<table border="0" align="right" cellpadding="0"
													cellspacing="0">
													<tr>
														<td width="40">
															<img src="<%=basePath%>/images/first.gif" width="37" height="15" />
														</td>
														<td width="45">
															<img src="<%=basePath%>/images/back.gif" width="43" height="15" />
														</td>
														<td width="45">
															<img src="<%=basePath%>/images/next.gif" width="43" height="15" />
														</td>
														<td width="40">
															<img src="<%=basePath%>/images/last.gif" width="37" height="15" />
														</td>
														<td width="100">
															<div align="center">
																<span class="STYLE1">ת���� <input name="textfield"
																		type="text" size="4"
																		style="height: 12px; width: 20px; border: 1px solid #999999;" />
																	ҳ </span>
															</div>
														</td>
														<td width="40">
															<img src="<%=basePath%>/images/go.gif" width="37" height="15" />
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

