<%@ page language="java" import="java.util.*" pageEncoding="gb18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

		<base href="<%=basePath%>">

		<title>��ҵ��Ϣ����ϵͳ_�û���¼</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<style type="text/css">
p {
	font-family: Verdana, Geneva, sans-serif;
}
body p {
	font-family: Verdana, Geneva, sans-serif;
}
</style>
</head>

<body background="images/tab_bg11.jpg" align="center">
<form action="servlet/Login" method="post">
 <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="solid">
  <tr >
   <td height="125" colspan="2">  </td>
   <td width="34%">  </td>
   <td width="1%">  </td>
  </tr>
  <tr>
   
    <td width="44%" height="100"><p align="center" ><font color="#CCCC00" size="10" face="��������">׿Խ����С��    </font></p>
      <p align="center"><font color="#CCCC00" size="6" face="��������">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      ������&nbsp;����&nbsp;��ƽ�� &nbsp;����Ц &nbsp;������ </font></p>
      <p align="center"><b>Copyright �0�82015</p></td>
    <td rowspan="3">
     <table width="339" height="202" cellspacing="0" style="background-color:#ffffff;">
      <tr style="background-color:#008080;"> 
       <td height="65" colspan="2"><div align="center"><font color="#f5f5f5" face="microsoft yahei" size="5">ͳһ��ݵ�¼</font></div></td>
       </tr>
      <tr>
        <td height="29" colspan="2"><div align="center"><font color="red" size="2">${errmsg }</font></div></td>
      </tr>
      <tr>
        <td width="135" height="26"><div align="right">�û�����</div></td>
        <td width="198"><input type="text" name="usname" style="width:130px; height:20px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px; color:#000000"></td>
        </tr>
      <tr>
        <td height="27"><div align="right">��&nbsp; �룺</div></td>
        <td height="27"><input type="password" name="psword" style="width:130px; height:20px; background-color:#ffffff; border:solid 1px #7dbad7; font-size:12px; color:#000000"></td>
        </tr>
      <tr>
      <tr>
      </tr>
         <td height="50" colspan="2" align="center"><a><input name="" type="submit" style="background-color:#ff8040" value="      ��¼      "/></td>
        </tr>
     </table>
    </td>
    <td rowspan="3">  </td>
  </tr>
  <tr>
    <td  >&nbsp;</td>
  </tr>
  <tr>
    <td height="156" colspan="2"  ></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp; </td>
    <td>&nbsp; </td>
    <td>&nbsp; </td>
  </tr>
  </table>
</form>
</body>
</html>

