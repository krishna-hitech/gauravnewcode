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
    
    <title>My JSP 'PlaceOrder.jsp' starting page</title>
    
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
    String status = "status=Order Not Placed";
     try
     {
       
        // String brandid[] = request.getParameterValues("brandid");
         String categoryid[] = request.getParameterValues("categoryid");
         String medicineid[] = request.getParameterValues("medicineid");
         
         String quantity[] = request.getParameterValues("quantity");
         String price[] = request.getParameterValues("price");
         
         Sales singleSales = null;
         Sales totalSales = new Sales();
         CoreHash aCoreHash = new CoreHash();
         System.out.println("This is Application--1  "+categoryid.length);
         try
         {
         	for(int i=1; i<categoryid.length;i++)
         	{
            	singleSales = new Sales();
            
           		// singleOrders.setBrandid(Integer.parseInt(brandid[i]));
            	singleSales.setCategoryid(Integer.parseInt(categoryid[i]));
            	System.out.println("categoryid"+categoryid[i]);
            	singleSales.setMedicineid(Integer.parseInt(medicineid[i]));
            	System.out.println("medicineid"+medicineid[i]);
            	singleSales.setQuantity(Integer.parseInt(quantity[i]));
            	System.out.println("quantity"+quantity[i]);
            	singleSales.setPrice(Float.parseFloat(price[i]));
            	System.out.println("price"+price[i]);
            System.out.println("This is Application alfjasfljsl adsjflkas--- categoryid"+categoryid[i]+"Medicineid"+medicineid[i]+"quantityid"+quantity[i]);	
          	    aCoreHash.put(new Integer(i),singleSales);
         	}
         }
         catch(ArrayIndexOutOfBoundsException aiob)
         {
         aiob.printStackTrace();
             LoggerManager.writeLogWarning(aiob);
         }
         
         double total = Double.parseDouble(request.getParameter("total"));
         
         System.out.println("This is asdf alkdfjlas sdla alsflasj---2");
         
         totalSales.setTotalamount(total);
         totalSales.setLoginname((String)session.getAttribute("user"));
         totalSales.setSalesDate(DateWrapper.parseDate(new Date()));
         totalSales.setStatus("Pending");
         
         boolean flag = new SalesDAO().placeTotalSales(totalSales, aCoreHash);
         
         if(flag)
         {
             status = "status=Order Placed";
             session.removeAttribute("cart");
             session.removeAttribute("nci");
         }
     }
     catch(Exception e)
     {
        LoggerManager.writeLogWarning(e);
     }
     response.sendRedirect("UserSearch.jsp?"+status);
     %>
  </body>
</html>
