<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
<%--<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">--%>


<title> Medical store system </title>
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
                <td><img src="images_files/medical8.png" width="100%" height="150"></td>
             
            </tbody></table></td>
        </tr>
        <tr> 
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tbody><tr> 
                <td><img src="images_files/medicine6.jpg" width="100%" height="220"></td>
                <td><img src="images_files/medicine7.jpg" width="100%" height="220"></td>
              </tr>
            </tbody></table></td>
        </tr>
        <tr> 
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tbody><tr> 
               
                <td background="images_files/med2.jpg">
               <jsp:include page="generaloptions.jsp"/>
				</td>
              </tr>
            </tbody></table></td>
        </tr>
        <tr> 
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tbody><tr> 
                <td valign="top" width="192"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tbody><tr> 
                      <td><img src="images_files/med2.jpg" width="100%" height="17"></td>
                    </tr>
                    <tr> 
                      <td background="images_files/med2.jpg"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tbody><tr> 
                            <td class="links" style="padding-left: 15px;" height="28"></td>
                          </tr>
                          <tr> 
                            <td class="links" style="padding-left: 15px;" height="28"></td>
                          </tr>
                          <tr> 
                            <td class="links" style="padding-left: 15px;" height="28"></td>
                          </tr>
                          <tr> 
                            <td class="links" style="padding-left: 15px;" height="28"></td>
                          </tr>
						  <tr> 
                            <td class="links" style="padding-left: 15px;" height="28"> 
                             </td>
                          </tr>
                          <tr> 
                            <td class="links" style="padding-left: 15px;" height="28"></td>
                          </tr>
                          <tr> 
                            <td class="links" style="padding-left: 15px;" height="28"></td>
                          </tr>
                          <tr> 
                            <td class="links" style="padding-left: 15px;" height="28"></td>
                          </tr>
                          <tr> 
                            <td class="links" style="padding-left: 15px;" height="28">&nbsp;</td>
                          </tr>
						  <tr> 
                            <td class="links" style="padding-left: 15px;" height="28"></td>
                          </tr>
						  <tr> 
                            <td class="links" style="padding-left: 15px;" height="28"></td>
                          </tr>
                          
                          <tr> 
                            <td class="links" style="padding-left: 15px;" height="28"></td>
                          </tr>
                         
                          
						  
                          <tr> 
                            <td class="links" style="padding-left: 15px;" height="28"></td>
                          </tr>
                          <tr> 
                            <td class="links" style="padding-left: 15px;" height="28"> </td>
                          </tr>
                          <tr> 
                            <td class="links" style="padding-left: 15px;" height="28"><div align="center"><br>
                                <br>
                                <br>
                                <a href="http://www.naemd.com/naemdprospects.pdf"></a></div>
                              <br></td>
                          </tr>
                          <tr> 
                            <td class="links" style="padding-left: 10px;" height="28"><div align="center"><a href="http://www.niemindia.com/" target="_blank"></a></div></td>
                          </tr>
                          <tr> 
                            <td height="213">&nbsp;</td>
                          </tr>
                        </tbody></table></td>
                    </tr>
                    <tr> 
                      <td><img src="images_files/med2.jpg" width="100%" height="17"></td>
                    </tr>
                  </tbody></table></td>
                <td valign="top" width="604"> 
                 <marquee><H1><font color="green">Medical Store System </font></H1></marquee>  <p align="center">&nbsp;</p>
               
<form id="form1" method="post" action="loginAction.do" name="register" onsubmit="return validate()">
					<fieldset>
					<legend>Sign-In</legend>
                    <div align="center">
                    <%
					  if(request.getParameter("ls")!=null)
					  {
					%>
                    <span class="style2"><%=request.getParameter("ls")%>					</span>
                    <%
					  }
					%>     
                                   </div>
                  <table align="center"><tr><td>User Name</td><td>
					<input type="text" name="loginID"/></td></tr>
					<tr><td>
					Password:</td><td>
					<input  type="password" name="password"/></td></tr>
					<tr><td></td><td><input  type="submit" name="inputsubmit1" value="Sign In" /></td></tr>
					<tr><td></td><td><p class="tiny"><a href="RecoverPassword.jsp">Forgot your password?</a></p></td></tr>
					<p class="tiny">&nbsp;</p>
<tr><td>				</td><td>	<p class="tiny"><a href="Registerform.jsp">New User Sign Up !...</a></p></td></tr></table>
				  </fieldset>
				</form>
				<script language="JavaScript" type="text/javascript">
//You should create the validator only after the definition of the HTML form
  var frmvalidator  = new Validator("register");
  
 
  frmvalidator.addValidation("loginID","req","Please enter your loginID");
  frmvalidator.addValidation("loginID","maxlen=20",	"Max length for loginID is 20");
  frmvalidator.addValidation("loginID","alpha"," loginID Alphabetic chars only");
  
  frmvalidator.addValidation("password","req","Please enter your password");
  frmvalidator.addValidation("password","maxlen=20","Max length is 20");
 //frmvalidator.addValidation("password","alpha"," password Alphabetic chars only");
  
      
 </script>
 

                  <p align="center">&nbsp;</p></td>
                <td valign="top" width="194"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tbody><tr> 
                      <td><img src="images_files/med2.jpg" width="100%" height="15"></td>
                    </tr>
                    <tr> 
                      <td background="images_files/med2.jpg"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tbody>
                         <tr> 
                            <td align="center" valign="top" width="194" height="450"><marquee direction="up" align="middle" width="106" height="450">
                              <img src="images_files/medicin1.jpg" width="100%" height="160"><img src="images_files/medicine3.jpg" width="106" height="160"><img src="images_files/medicine5.jpg" width="106" height="160"><img src="images_files/medicine4.jpg" width="106" height="160"><img src="images_files/medicine7.jpg" width="106" height="160"><img src="images_files/medical9.jpg" width="106" height="160"><img src="images_files/medical8.png" width="106" height="160"></td> 
                              </marquee>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                 		<tr> 
                            <td>&nbsp;</td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                        </tbody></table></td>
                    </tr>
                    <tr> 
                      <td><img src="images_files/med2.jpg" width="100%" height="17"></td>
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
          <td bgcolor="#3178B6" width="100%" height="30"><div align="center"><font color="#6F294A" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Copyright © 2017 TCS.com, Inc. All right reserved.</strong></font></div></td>
         
        </tr>
       
      </tbody></table>
</td>
  </tr>
</tbody></table>



</body></html>