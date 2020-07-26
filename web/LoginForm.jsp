<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 5.1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>New Account</title>
<link href="resources/style.css" rel="stylesheet" type="text/css">
</head>

<body>
    
    <c:if test="${errorcode eq 'none'}">
       <c:set var="output" value="" /> 
    </c:if>
    <c:if test="${errorcode eq 'no_ac'}">
        <c:set var="output" value="No Such Account Exists!" />
    </c:if>
    <c:if test="${errorcode eq 'err_pass'}">
        <c:set var="output" value="Invalid Password Attempt!" />
    </c:if>
    <c:set var="errorcode" value="none" scope="application"/>
    <table border="0">
        <tr>
            <td class="c1">
                <div><img src="resources/Bank.png" width="150" height="150" alt="Bank"/></div>
                <div><font style="font-size: 38px; font-weight: bolder;">Apna Bank</font></div>
                <div align="right"><font style="font-size: 18px; font-style: italic; font-weight: bolder;">ExtraOrdinary Service</font></div>
                <br><br><br><br>
                <div class="link">&raquo; Online Services</div>
                <div class="hrblock"><hr></div>
                <div class="link">&raquo; Products/ Mobile app Info</div>
                <div class="hrblock"><hr></div>
                <div class="link">&raquo; Grievance Redressal / Services</div>
                <div class="hrblock"><hr></div>
                <div class="link">&raquo; Security / Safety</div>
                <div class="hrblock"><hr></div>
            </td>
            <td class="c2">
                <div class="block1">
                    <div class="inf1">Customer Support</div>
                    <div class="btn">
                        <a href="AccountForm.html"><button>New User?</button></a>&emsp;
                        <a href="LoginForm.jsp"><button>Login to NetBanking</button></a>
                    </div>
                    <div class="inf2">1800-180-0000</div>
                </div>
                <div class="wrap">
                    <div class="heading1"><br><br><br><br>Login To NetBanking</div><br>
                    <div class="form">
                        <form action="LoginVerify.jsp" method="post">
                        <input type="text" name="ac_no" placeholder="Account Number" required pattern="^\d{1,}" title="Provide Valid A/c Number!" autofocus style>
                        <input type="password" name="password" placeholder="Password" required>
                        <div class="msgout"><c:out value="${output}" /></div>
                        <hr class="hrl">
                        <input type="submit" value="Secure Login" style="width: 219px;">
                        <input type="submit" value="Forgot Password?" style="width: 219px;" formaction="ForgetPwd.jsp" formnovalidate>
                    </form>
                    </div>    
                </div>
            </td>
        </tr>
    </table>
    <div class="block2">
        <div class="foot">Apna Bank never sends email for getting customer information. Please report immediately to nearest branch if you receive any e-mail purported to be originated by Apna Bank to gather your UserID or Password or any other personal information. Our Bank does not ask for the details of your account/PIN/password. Therefore any one pretending to be asking you for information from the bank may be fraudulent entities, so please beware. You should know how to operate net transactions and if you are not familiar you may refrain from doing so.</div>
    </div>
</body>
<script type="text/javascript" src="resources/formvalidate.js"></script>
</html>
