!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
<%--<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">--%>


<title> Medical Store System </title>
<%--<meta name="Description" content="Event Management Institute India, Event Management Courses In India, | national academy of event management and development ">
<meta name="KeyWords" content="Event Management Institute, Event Managemnet Course, Event Management Courses in India - Asia, Event Management Program, Jobs in Events, Career in Events, Event Management College, certified course in events, International event management course.">

 <link href="images_files/style.css" rel="stylesheet" type="text/css">--%>
<%--<script language="javascript" src="images_files/slideshow1.js"></script>--%>
<%-- <script language="javascript" src="images_files/slideshow2.js"></script>--%>
<%--<script language="javascript" src="scripts/moveclock.js"></script>--%>

<script language="JavaScript" src="scripts/gen_validatorv31.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript" src="scripts/ts_picker.js"></script>
<script language="JavaScript1.1" src="scripts/pass.js">


</script> <script type="text/javascript" src="scripts/image.js"> </script>
 <script type="text/javascript" src="scripts/general.js"> </script>
 <script type="text/javascript" src="scripts/adi.js"> </script>
 <script type="text/javascript" src="scripts/form_validation.js"> </script>

<script type="text/javascript" src="scripts/moveclock.js"></script>

<style type="text/css">
<!--
body {
	background-color: #B0A7D7;
}
body,td,th {
	font-size: 18px;
}
-->
</style>
 
</head>
<body leftmargin="0" topmargin="0" onLoad="Delay()" marginheight="0" marginwidth="0">
<table style="border: 1px solid rgb(0, 0, 102);" align="center" bgcolor="#A8B7B6" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tbody><tr>
    <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody><tr> 
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tbody>
                <td><img src="images_files/medical8.png" width="100%" height="60"></td>
             
            </tbody></table></td>
        </tr>
        <tr> 
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tbody><tr> 
                <td><img src="images_files/medicine6.jpg" width="100%" height="140"></td>
                <td><img src="images_files/medicine7.jpg" width="100%" height="140"></td>
              </tr>
            </tbody></table></td>
        </tr>
        <tr> 
          <td><table border="1" cellpadding="0" cellspacing="0" width="100%">
              <tbody><tr> 
               
                <td background="images_files/med2.jpg">
               <jsp:include page="generaloptions.jsp"/>
				</td>
              </tr>
            </tbody></table></td>
        </tr>
        <tr background="images_files/med2.jpg"> 
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tbody> 
                <td valign="top" width="192"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                    
                  </table></td>
                <td valign="top"  width="750" > 
                 <H1 align="center"><font color="Blue">Medical Store System </font></H1>  <p align="center">&nbsp;</p>
               
                
                 <div align="center">
                    <%
					  if(request.getParameter("regs")!=null)
					  {
					%>
                    <span class="style2"><%=request.getParameter("regs")%>					</span>
                    <%
					  }
					%>     
                                   </div>
                 
                  <p align="center">&nbsp;</p>
               <h3>Register Form</h3>
 <form action="RegisterAction.jsp" method="post" name="f"><fieldset>
					  <div align="center">
                    <%
					  if(request.getParameter("status")!=null)
					  {
					%>
                    <span class="style2"><%=request.getParameter("status")%>					</span>
                    <%
					  }
					%>     
                    </div>
                    <br />
                      <table border="0" align="center">
                        <tr>
                          <td class="tiny style3">First Name </td>
                          <td><input type="text" name="fname" class="textfield"/>                          </td>
                        </tr>
                        <tr>
                          <td><span class="style3">Last Name </span></td>
                          <td><input type="text" name="lname" class="textfield"/>                          </td>
                        </tr>
                        <tr>
                          <td><span class="style3">Birth Date </span></td>
                          <td><input type="text" name="bdate"  />
                            <a href="javascript:show_calendar('document.f.bdate', document.f.bdate.value);"> <img src="images/cal.gif" alt="a" width="18" height="18" border="0"/></a> </td>
                        </tr>
                        <tr>
                          <td class="style3">House No</td>
                          <td><input type="text" name="hno" class="textfield"/></td>
                        </tr>
                        <tr>
                          <td class="style3">Street</td>
                          <td><input type="text" name="street" class="textfield"/></td>
                        </tr>
                        <tr>
                          <td><span class="style3">City</span></td>
<td><select name="city">
                              <option>Hyderabad</option>
                              <option>Mumbai</option>
                              <option>Rewa</option>
                            </select>                          </td>
                        </tr>
                        <tr>
                          <td><span class="style3">State</span></td>
<td><select name="state">
                              <option>Andhra pradesh</option>
                              <option>Maharashtra</option>
                              <option>MadhyaPradesh</option>
                            </select>                          </td>
                        </tr>
                        <tr>
                          <td><span class="style3">Country</span></td>
<td><select name="country">
                              <option>India</option>
                            </select>                          </td>
                        </tr>
                        <tr>
                          <td class="style3">Pincode</td>
                          <td><input type="text" name="pincode" class="textfield"/></td>
                        </tr>
                        <tr>
                          <td class="style3">Contact No</td>
                          <td><input type="text" name="phoneno" class="textfield"/></td>
                        </tr>
                        <tr>
                          <td class="style3">Email</td>
                          <td><input type="text" name="email" class="textfield"/></td>
                        </tr>
                        <tr>
                          <td><span class="style3">Login Name</span></td>
                          <td><input type="text" name="loginname" />                          </td>
                        </tr>
                        <tr>
                          <td><span class="style3">Password</span></td>
                          <td><input name="password" type="password" id="password" />                          </td>
                        </tr>
                        <tr>
                          <td><span class="style3"> Secret Question </span></td>
<td><select name="squest">
                              <option value="1">What is your favorite pastime?</option>
                              <option value="2">Who your childhood hero?</option>
                              <option value="3">What is the name of your first school?</option>
                              <option value="4">Where did you meet your spouse?</option>
                              <option value="5">What is your favorite sports team?</option>
                              <option value="6">What is your father's middle name?</option>
                              <option value="7">What was your high school mascot?</option>
                              <option value="8">What make was your first car or bike?</option>
                              <option value="9">What is your pet's name?</option>
                          </select></td>
                        </tr>
                       
                        <tr>
                          <td><span class="style3">Secret Answer</span></td>
                          <td><input name="sanswer" type="text" /></td>
                        </tr>
                        <tr>
                          <td height="11" colspan="2"></td>
                        </tr>
                        <tr>
                          <td colspan="2"><div align="center">
                            <input name="Input" type="submit" value="Register" />
                          </div></td>
                        </tr>
                      </table>
                   
					</fieldset>
				</form>
				<script language="JavaScript" type="text/javascript">
//You should create the validator only after the definition of the HTML form
  var frmvalidator  = new Validator("f");
  
 
  frmvalidator.addValidation("fname","req","Please enter your First Name");
  frmvalidator.addValidation("fname","maxlen=20",	"Max length for FirstName is 20");
  frmvalidator.addValidation("fname","alpha"," First Name Alphabetic chars only");
  
  frmvalidator.addValidation("lname","req","Please enter your Last Name");
  frmvalidator.addValidation("lname","maxlen=20","Max length is 20");
  frmvalidator.addValidation("lname","alpha"," Last Name Alphabetic chars only");
  
   
   frmvalidator.addValidation("bdate","req","Please enter your DOB"); 
  
     
  frmvalidator.addValidation("email","maxlen=50");
  frmvalidator.addValidation("email","req");
  frmvalidator.addValidation("email","email");
   
  
   frmvalidator.addValidation("houseNo","req","Please enter your House Number");
   
   frmvalidator.addValidation("street","req","Please enter your Street Number");
     
   frmvalidator.addValidation("phoneno","req");
  
  frmvalidator.addValidation("phoneno","maxlen=50");
  frmvalidator.addValidation("phoneno","numeric");
 frmvalidator.addValidation("phoneno","Phone");
   
   frmvalidator.addValidation("city","req","Please enter your city Name");
   frmvalidator.addValidation("state","req","Please enter your State Name");
   frmvalidator.addValidation("country","req","Please enter your Country Name");
   frmvalidator.addValidation("pincode","req","Please enter your pin Number");
   
   frmvalidator.addValidation("loginname","req","Please enter your Username");
   frmvalidator.addValidation("password","req","Please enter your Password");
   
   frmvalidator.addValidation("sanswer","req","Please enter your Answer");
   frmvalidator.addValidation("squest","dontselect=0");
     
 </script>
 
 

            <p align="center">&nbsp;</p></td>
                <td valign="top" width="194">
               
                    
                      <marquee direction="up" align="left" width="100%" height="640">
                              <img src="images_files/medicin1.jpg" width="100%" height="160"><img src="images_files/medicine3.jpg" width="100%" height="160"><img src="images_files/medicine5.jpg" width="100%" height="160"><img src="images_files/medicine4.jpg" width="100%" height="160"><img src="images_files/medicine7.jpg" width="100%" height="160"><img src="images_files/medical9.jpg" width="100%" height="160"><img src="images_files/medical8.png" width="100%" height="160"></td> 
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
                <td colspan="3" bordercolor="#5f6366" align="center" valign="top">
                
<!-- SiteSearch Google -->

</td>
              </tr>
            </tbody></table></td>
        </tr>
        <tr> 
		<td>
		<table bgcolor="#D9E7F3" width="100%">
		<tbody><tr bgcolor="##D9E7F3">
          <td bgcolor="#3178B6" width="100%" height="30"><div align="center"><font color="#6F294A" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Copyright � 2017 TCS.com, Inc. All right reserved.</strong></font></div></td>
         
        </tr>
       
      </tbody></table>
</td>
  </tr>
</tbody></table>



</body></html>