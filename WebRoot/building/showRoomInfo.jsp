<%@ page language="java" import="java.util.*" pageEncoding="gb18030"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/" +"tab/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>������Ϣ����</title>

</head>


<body>
<!-------------------------------------����ͷ���� ------------------------------------>
<a href="../building/building5.jsp">����</a>
<BR>
<br>

<h2 align="center">������Ϣ</h2><br>

<table border=1 align="center"> 
   <tr>
      <td width=200 align="center"><b>���� </td>
	  <td width=100 align="center"><b>¥��</td>
	  <td width=100 align="center"><b>���</td> 
	  <td width=100 align="center"><b>����</td>
	  <td width=100 align="center"><b>����</td>
	  <td width=100 align="center"><b>�۳�״̬</td>
   <tr>
   <tr>
   <c:forEach items="${list1}" var="info">
   	  <td align="center">${info.com_name}-${info.build_num}-${info.unit_num}-${info.room_num}</td>
   	  <td align="center">${info.floor}</td>
   	  <td align="center">${info.room_size}</td>
   	  <td align="center">${info.price}</td>
   	  <td align="center">${info.layout}</td>
   	  <td align="center">${info.sale_state}</td>	  
   </c:forEach>
   </tr>
   
   
</table>

<body>
</html>

