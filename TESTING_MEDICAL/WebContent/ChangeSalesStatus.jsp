<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.dts.crsm.model.Company,com.dts.crsm.dao.CompanyDAO,com.dts.core.util.CoreHash,java.util.*"%>
<%@ page import="com.dts.crsm.dao.*,com.dts.crsm.model.*,com.dts.core.util.*,java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ChangeSalesStatus.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
      String target = (String)session.getAttribute("tpage"); 
      try
      {
         int salesid = Integer.parseInt(request.getParameter("salesid"));
         int status = Integer.parseInt(request.getParameter("status"));
         
         
         new SalesDAO().updateSalesStatus(salesid,status);
      }
      catch(Exception e)
      {
         LoggerManager.writeLogWarning(e);
      }
      response.sendRedirect("customerSales.do");
     %>
  </body>
</html>
