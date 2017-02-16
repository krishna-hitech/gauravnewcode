<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
<%--<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">--%>


<title>Medical Store System  </title>
<%--<meta name="Description" content="Event Management Institute India, Event Management Courses In India, | national academy of event management and development ">
<meta name="KeyWords" content="Event Management Institute, Event Managemnet Course, Event Management Courses in India - Asia, Event Management Program, Jobs in Events, Career in Events, Event Management College, certified course in events, International event management course.">

 <link href="images_files/style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="images_files/slideshow1.js"></script>--%>
 <<script language="JavaScript" src="scripts/gen_validatorv31.js" type="text/javascript"></script>
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
               <jsp:include page="generaloptions.jsp"/>
				</td>
              </tr>
            </tbody></table></td>
        </tr>
        <tr > 
          <td background="images_files/sitebackground.jpg"><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tbody> 
                <td valign="top" width="192"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <marquee direction="up" align="left" width="100%" height="605">
                              <img src="images_files/mq1.jpg" width="100%" height="160"><img src="images_files/mq2.jpg" width="100%" height="160"><img src="images_files/mq3.jpg" width="100%" height="160"><img src="images_files/mq4.jpg" width="100%" height="160"><img src="images_files/mq5.jpg" width="100%" height="160"><img src="images_files/mq6.jpg" width="100%" height="160"><img src="images_files/mq7.jpg" width="100%" height="160"><img src="images_files/mq8.jpg" width="100%" height="160"><img src="images_files/mq9.jpg" width="100%" height="160"><img src="images_files/mq10.jpg" width="100%" height="160"><img src="images_files/mq11.jpg" width="100%" height="160"><img src="images_files/mq12.jpg" width="100%" height="160"><img src="images_files/mq13.jpg" width="100%" height="160"><img src="images_files/mq14.jpg" width="100%" height="160"><img src="images_files/mq15.png" width="100%" height="160"><img src="images_files/mq16.jpg" width="100%" height="160"><img src="images_files/mq17.jpg" width="100%" height="160"><img src="images_files/mq18.jpg" width="100%" height="160"></td> 
                              </marquee>
                         
                  </table></td>
                <td valign="top"  width="750" > 
                 <H1 align="center"><font color="Blue">Medical Store System </font></H1>  <p align="center">&nbsp;</p>
               
	<h2 class="title">Recover password</h2>
	  		

  <form action="RecoverPasswordAction.jsp" method="post" name="register" onsubmit="return validateQues()" ><fieldset>
					  <div align="center">
                    <%
					  if(request.getParameter("status")!=null)
					  {
					%>
                    <span class="style2"><font color="Red"><%=request.getParameter("status")%>					</span>
                    <%
					  }
					%>     
                    </div>
                    <br />
                    <table border="0">
                      <tr>
                        <td><span class="style3">Login Name </span></td>
                        <td><input type="text" name="username" />                        </td>
                      </tr>
                      <tr>
                        <td><span class="style3">Secret Question</span></td>
                        <td><select name="squest">
                            <option value="1">What is your favorite pastime?</option>
                            <option value="2">Who was your childhood hero?</option>
                            <option value="3">What was the name of your first school?</option>
                            <option value="4">Where did you meet your spouse?</option>
                            <option value="5">What is your favorite sports team?</option>
                            <option value="6">What is your father's middle name?</option>
                            <option value="7">What was your high school mascot?</option>
                            <option value="8">What make was your first car or bike?</option>
                            <option value="9">What is your pet's name?</option>
                        </select></td>
                      </tr>
                     
                      <tr>
                        <td><span class="style3">Secret Answer </span></td>
                        <td><input name="sanswer" type="text" /></td>
                      </tr>
                      <tr>
                        <td colspan="2"><div align="center">
                            <div align="center">
                          <input name="Input" type="submit" value="Recover" />
                          &nbsp;</div></td>
                      </tr>
                    </table>
  </fieldset>
				</form>	<script language="JavaScript" type="text/javascript">
//You should create the validator only after the definition of the HTML form
  var frmvalidator  = new Validator("register");
  
 
  frmvalidator.addValidation("username","req","Please enter your loginID");
    frmvalidator.addValidation("squest","dontselect=0"); 
  frmvalidator.addValidation("sanswer","req","Please enter your password");
 
      
 </script>
                

       <p align="center">&nbsp;</p></td>
                <td valign="top" width="194">
               
                    
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