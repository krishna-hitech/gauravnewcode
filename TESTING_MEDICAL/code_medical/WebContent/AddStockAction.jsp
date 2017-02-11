<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.dts.crsm.dao.StockDAO,com.dts.crsm.model.Stock,com.dts.core.util.LoggerManager"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AddNewStockAction.jsp' starting page</title>
    
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
      String target = "ViewStockbyCompany.jsp?header=list";
      try
      {
         // int companyid = Integer.parseInt(request.getParameter("companyid"));
          int categoryid = Integer.parseInt(request.getParameter("categoryid"));
          int medicineid = Integer.parseInt(request.getParameter("medicineid"));
          int quantity = Integer.parseInt(request.getParameter("quantity"));
          double price = Double.parseDouble(request.getParameter("price"));
          
          Stock stock = new Stock();
          
         // inventory.setBrandID(brandid);
          stock.setCategoryID(categoryid);
          stock.setMedicineID(medicineid);
          stock.setQuantity(quantity);
          stock.setPrice(price);
          
          boolean flag = new StockDAO().addStock(stock);
          }
          catch(Exception e)
          {e.printStackTrace();
             LoggerManager.writeLogWarning(e);
          }
          
          RequestDispatcher rd = request.getRequestDispatcher(target);
          rd.forward(request,response);                
   %>
    
  </body>
</html>
