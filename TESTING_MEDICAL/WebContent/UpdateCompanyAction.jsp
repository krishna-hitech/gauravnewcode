<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.dts.crsm.model.Company,com.dts.crsm.dao.CompanyDAO"%>
<%@page import="com.dts.core.util.LoggerManager;"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AddCompanyAction.jsp' starting page</title>
    
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
        try
        { 
            int companyid = Integer.parseInt(request.getParameter("companyid"));
        	String companyname = request.getParameter("companyname");
        	String address = request.getParameter("address");
        	String contact = request.getParameter("contact");
        	String email = request.getParameter("email");
        	Company aCompany = new Company();
        	aCompany.setCompanyID(companyid);
        	aCompany.setCompanyName(companyname);
        	aCompany.setCompanyAdd(address);
        	aCompany.setCompanyContact(contact);
        	aCompany.setCompanyEmail(email);
        	CompanyDAO aCompanyDAO = new CompanyDAO();
        	boolean flag = aCompanyDAO.updateCompany(aCompany);
        }
        catch(Exception e)
        {
           LoggerManager.writeLogWarning(e);
        }
        	RequestDispatcher rd = request.getRequestDispatcher("ViewCompany.jsp?header=list");
        	rd.forward(request,response);
        
      %>
  </body>
</html>
