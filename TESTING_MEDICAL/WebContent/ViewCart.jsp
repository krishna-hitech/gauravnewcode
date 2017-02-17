
<%@ page import="com.dts.crsm.model.Medicine,com.dts.crsm.dao.MedicineDAO,com.dts.core.util.CoreHash,com.dts.core.util.LoggerManager,java.util.*"%>
<%@  page import="com.dts.crsm.model.*, com.dts.crsm.dao.*,com.dts.core.util.CoreList"%>
<%@  page import="com.dts.crsm.model.Company, com.dts.crsm.dao.CompanyDAO,com.dts.crsm.model.Stock, com.dts.crsm.dao.StockDAO"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
<%--<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">--%>


<title> Medical Store System </title>
<%--<meta name="Description" content="Event Management Institute India, Event Management Courses In India, | national academy of event management and development ">
<meta name="KeyWords" content="Event Management Institute, Event Managemnet Course, Event Management Courses in India - Asia, Event Management Program, Jobs in Events, Career in Events, Event Management College, certified course in events, International event management course.">

 <link href="images_files/style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="images_files/slideshow1.js"></script>--%>
 <script language="javascript" src="images_files/slideshow2.js"></script>


<style type="text/css">
<!--
body {
	background-color: #996666;
}
body,td,th {
	font-size: 18px;
}
-->
</style>
 <script language="javascript">

function validate()
{
   if(document.login.username.value=="" || document.login.password.value=="")
   {
       alert("All Fields are manditory");
	   return false;
   }
   return true;
}
</script>
<script language="javascript" src="scripts/general.js"></script>
<script type="text/javascript">
function calculate(form)
  {
  
  var total="00.00"; 
  var count=0;
     validate(form);
     for(var i=1;document.sales.iprice[i]!=null;i++)
     { 
           if(document.sales.quantity[i].value<=0)
            {
                alert("Quantity must be greater than Zero");
                document.sales.quantity[i].value=1;
            }    
                document.sales.price[i].value = (document.sales.iprice[i].value)*(document.sales.quantity[i].value);
                total=parseFloat(total)+parseFloat(document.sales.price[i].value);
                document.sales.total.value=total;
                
      }             
  }
function validate(form)
{
   for(var i=1;document.sales.iprice[i]!=null;i++)
   {
       if(parseInt(document.sales.quantity[i].value) > parseInt(document.sales.iquantity[i].value))
       {
            alert("Not sufficient stock");
            document.sales.quantity[i].value = document.sales.iquantity[i].value;
           //  calculate(form);
            return false;
       }   
   }
   return true;
}
</script>
</head>



<body leftmargin="0" topmargin="0" onLoad="Delay()" marginheight="0" marginwidth="0">
<table style="border: 1px solid rgb(0, 0, 102);" align="center" bgcolor="#A8B7B6" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tbody>
        <tr> 
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tbody><tr> 
                <td><img src="images_files/banner_01.jpg" width="100%" height="130"></td>
                <td><img src="images_files/banner_02.jpg" width="100%" height="130"></td>
              </tr>
            </tbody></table></td>
        </tr>
        <tr> 
          <td><table border="1" cellpadding="0" cellspacing="0" width="100%">
              <tbody><tr> 
               
                <td background="images_files/optionsbg.JPG">
               <jsp:include page="customeroptions.jsp"/>
				</td>
              </tr>
            </tbody></table></td>
        </tr>
        <tr > 
          <td background="images_files/sitebackground.jpg"><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tbody> 
                <td valign="top" width="120"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <marquee direction="up" align="left" width="100%" height="605">
                              <img src="images_files/mq1.jpg" width="100%" height="160"><img src="images_files/mq2.jpg" width="100%" height="160"><img src="images_files/mq3.jpg" width="100%" height="160"><img src="images_files/mq4.jpg" width="100%" height="160"><img src="images_files/mq5.jpg" width="100%" height="160"><img src="images_files/mq6.jpg" width="100%" height="160"><img src="images_files/mq7.jpg" width="100%" height="160"><img src="images_files/mq8.jpg" width="100%" height="160"><img src="images_files/mq9.jpg" width="100%" height="160"><img src="images_files/mq10.jpg" width="100%" height="160"><img src="images_files/mq11.jpg" width="100%" height="160"><img src="images_files/mq12.jpg" width="100%" height="160"><img src="images_files/mq13.jpg" width="100%" height="160"><img src="images_files/mq14.jpg" width="100%" height="160"><img src="images_files/mq15.png" width="100%" height="160"><img src="images_files/mq16.jpg" width="100%" height="160"><img src="images_files/mq17.jpg" width="100%" height="160"><img src="images_files/mq18.jpg" width="100%" height="160"></td> 
                              </marquee>
                         
                  </table></td>
                <td valign="top"  width="750" > 
                 <H1 align="center"><font color="Blue">Medical Store System </font></H1>  <p align="center">&nbsp;</p>
               
                  <p align="center"><fieldset>
					<legend><span class="style3">View Cart Medicines</span></legend>

  <br />
  
 
      <form  method="post" action="PlaceSales.jsp" name="sales" onSubmit="return validate(sales)">
      
    <table width="500" border="0" align="center" bordercolor="#8692E3">
    
      <tr bgcolor="#509C16">
      <%
        
	      CoreList inCoreList = new CoreList();
	     // CoreHash bCoreHash = new CoreHash();
	      CoreHash cCoreHash = new CoreHash();
	      CoreHash iCoreHash = new CoreHash();
	      
	     try{
             int categoryid = 0;
             int medicineid = 0;
             MedicineDAO medicinedao = new MedicineDAO();
             CategoryDAO categorydao = new CategoryDAO();
          //   CompanyDAO branddao = new CompanyDAO();
             StockDAO stockdao = new StockDAO(); 
             
             if(session.getAttribute("cart")!=null && !((CoreHash)session.getAttribute("cart")).isEmpty())
         	 {
               Stock stock = null;
               iCoreHash = medicinedao.listMedicineNames(); 
               cCoreHash = categorydao.listCategoryNames(); 
              // bCoreHash = branddao.listCompanyNames();
               
               Sales sales = new Sales(); 
               CoreHash aCoreHash = (CoreHash)session.getAttribute("cart");
               Enumeration enu = aCoreHash.elements();
               
        %>
         <td width="89"><div align="center" class="style8">Category<input type="hidden" name="categoryid" value="0"/></div></td>
        <td width="96"><div align="center" class="style8">Medicine<input type="hidden" name="medicineid" value="0"/></div></td>
        <td width="62"><div  class="style8">Stock<input name="iquantity" type="hidden" value="0"/></div></td>
        <td width="98"><div  class="style8">Price/Medicine<input name="iprice" type="hidden" value="0"/></div></td>
	    <td width="61"><div class="style8">Quantity<input name="quantity" type="hidden" value="0"/></div></td>
        <td width="56"><div class="style8">Amount<input name="price" type="hidden" value="0"/></div></td>
        <td width="64"><div class="style8">Remove</div></td>
        </tr>
          <%
          	
          	int quantity = 0;
          	double price = 0;
          			Medicine medicine;
          			
          			int i=0;
          			while (enu.hasMoreElements()) 
          			{
          				sales = (Sales) enu.nextElement();
          				medicineid = sales.getMedicineid();
          				categoryid = sales.getCategoryid();
          				
          		        stock = new StockDAO().getStock(categoryid, medicineid);     		
          %>
      <tr bgcolor="#CEC9FA">
      
         
        <td bgcolor="#C3D7BA"><div align="center" class="style7"><input type="hidden" name="categoryid" value="<%=categoryid%>"/><%=cCoreHash.get(new Integer(categoryid))%></div></td> 
        <td bgcolor="#C3D7BA"><div align="center" class="style7"><input type="hidden" name="medicineid" value="<%=medicineid%>"/><%=iCoreHash.get(new Integer(medicineid))%></div></td>
        <td bgcolor="#C3D7BA"><div align="center"><span class="style7"><input name="iquantity" type="text" value="<%=stock.getQuantity()%>" size="5" readonly/>
        </span></div></td>
        <td bgcolor="#C3D7BA"><div align="center"><span class="style7"><input name="iprice" type="text" value="<%=stock.getPrice()%>" size="5" readonly/>
        </span></div></td>
        <td bgcolor="#C3D7BA"><div align="center"><input name="quantity" type="text" value="1" size="5"  onkeyup="calculate(order)"/>
        </div></td>
        <td bgcolor="#C3D7BA"><div align="center"><input name="price" type="text" value="<%=stock.getPrice()%>" size="5" readonly/>
        </div></td>
        <td valign="top" bgcolor="#DDEAD7"><div align="center" class="style9"><a href="RemovefromCart.jsp?id=<%=categoryid%><%=medicineid%>"><img src="images/delete_button.png" alt="" width="26" height="26"/></a> </div></td>
      </tr>
      <%i++;
      	}%> <input type="hidden" name="count" value="<%=i%>"/>
      	
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td bgcolor="#509C16"><div align="center"><span class="style3"><strong>Total</strong></span></div></td>
        <td bgcolor="#C3D7BA"><input name="total" type="text" size="8" /></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="8"><div align="center">
         
         
          <input type="submit" name="button" id="button2" value="Place Order"/>  &nbsp; &nbsp;<input type="button" name="button" id="button2" value="Back" onClick="javascript:history.back(-1);"/>
         
        </div></td>
      </tr>
       <%
       	}
       else {
      %>
         <tr><td height="24" colspan="8"><div align="center" class="style3"><input type="hidden" name="iprice"/><strong>No Medicines in the Cart</strong></div></td>
         </tr>
      <%
      	}
      	} catch (Exception e) {
      		LoggerManager.writeLogWarning(e);
      	}
      	
      %>
    </table>
   
  </form>
	</td>
                  <p align="center">&nbsp;</p></td>
                <td valign="top" width="120">
               
                    
                      <marquee direction="down" BEHAVIOR="ALTERNATE" align="left" width="100%" height="605">
                              <img src="images_files/mq1.jpg" width="100%" height="160"><img src="images_files/mq2.jpg" width="100%" height="160"><img src="images_files/mq3.jpg" width="100%" height="160"><img src="images_files/mq4.jpg" width="100%" height="160"><img src="images_files/mq5.jpg" width="100%" height="160"><img src="images_files/mq6.jpg" width="100%" height="160"><img src="images_files/mq7.jpg" width="100%" height="160"><img src="images_files/mq8.jpg" width="100%" height="160"><img src="images_files/mq9.jpg" width="100%" height="160"><img src="images_files/mq10.jpg" width="100%" height="160"><img src="images_files/mq11.jpg" width="100%" height="160"><img src="images_files/mq12.jpg" width="100%" height="160"><img src="images_files/mq13.jpg" width="100%" height="160"><img src="images_files/mq14.jpg" width="100%" height="160"><img src="images_files/mq15.png" width="100%" height="160"><img src="images_files/mq16.jpg" width="100%" height="160"><img src="images_files/mq17.jpg" width="100%" height="160"><img src="images_files/mq18.jpg" width="100%" height="160"></td> 
                              </marquee>
                         
                          </tr>
                       </td>
                    </tr>
                    
                  </tbody></table></td>
              </tr>
			  
              <tr> 
                <td colspan="3" bordercolor="#5f6366" valign="top"><div align="center"> 
                 
                 
<!-- SiteSearch Google -->
                </div></td>
              </tr>
              <tr>
                <td colspan="3" bordercolor="#5f6366" align="center" valign="top" img src="images (2).png">
                
<!-- SiteSearch Google -->

</td>
              </tr>
            </tbody></table></td>
        </tr>
        <tr> 
		<td>
		<table bgcolor="#D9E7F3" width="100%">
		<tbody><tr bgcolor="##D9E7F3">
          <td bgcolor="#3178B6" width="100%" height="8"><div align="center"><font color="#6F294A" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Copyright © 2017 TCS.com, Inc. All right reserved.</strong></font></div></td>
         
        </tr>
       
      </tbody></table>
</td>
  </tr>
</tbody></table>



</body></html>