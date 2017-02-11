
<%@ page import="com.dts.crsm.dao.StockDAO,com.dts.crsm.model.Stock,com.dts.core.util.LoggerManager"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'UDStockAction.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	

  </head>
  
  <body>
     <%
        Stock stock = null;
     	String pageexe = request.getParameter("page");
     	String type = request.getParameter("type");
     	String value = request.getParameter("value");
     	String button = request.getParameter("button");
     	String target = pageexe + "?header=list&"+type+"="+value;
     	System.out.println("====="+target);
     	int count = Integer.parseInt(request.getParameter("count")); 
     	try {
     	
     	        StockDAO aStockdao = new StockDAO();
     			String ch[] = new String[count];
     			Integer companyid[] = new Integer[count];
     			Integer categoryid[] = new Integer[count];
     			Integer medicineid[] = new Integer[count];
     			Integer quantity[] = new Integer[count];
     			Double price[] = new Double[count];
     		
     			for (int i = 0,j=0; i<count; i++) {
     		    	stock = new Stock();
     		    	ch[i] =  request.getParameter("ch"+(i));
     		    	if(ch[i]!=null)
     		    	{
     		        	companyid[j] = new Integer(ch[i].substring(0,ch[i].indexOf(",")));
     		        	stock.setCompanyID(companyid[j].intValue());
     		        	categoryid[j] = new Integer(ch[i].substring(ch[i].indexOf(",")+1,ch[i].lastIndexOf(",")));
     		        	stock.setCategoryID(categoryid[j].intValue());
     		        	medicineid[j] = new Integer(ch[i].substring(ch[i].lastIndexOf(",")+1,ch[i].length()));
     		        	stock.setMedicineID(medicineid[j].intValue());
                 		quantity[j] = new Integer(request.getParameter("quantity"+i));
                 		stock.setQuantity(quantity[j].intValue());
                		price[j] = new Double(request.getParameter("price"+i));
                		stock.setPrice(price[j].doubleValue());
                		if(button.equals("Update"))
     	                {
                			aStockdao.updateStock(stock);
                		}
                		else	
                		{
                		    aStockdao.deleteStock(stock);
                		}
                		j++;
                	}
     			}
     	} catch (Exception e) {
     	    e.printStackTrace();
     		LoggerManager.writeLogWarning(e);
     	}
     	response.sendRedirect(target);
     	//RequestDispatcher rd = request.getRequestDispatcher(target);
     	//rd.forward(request, response);
     %>
  </body>
</html>
