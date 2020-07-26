<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 5.1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<title>Welcome to Apna Bank</title>
<link href="resources/style.css" rel="stylesheet" type="text/css">
</head>

<body>
                   <sql:setDataSource var="conn" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/kishan" user="root" password="root" />
<%///////////////////////////////////////////////////Update/////////////////////////////////////////////////////////////////////%>                   
                   <c:if test="${(param.fnm ne '') && (param.lnm ne '') && (param.fnm ne null) && (param.lnm ne null) }">
                   <sql:update dataSource="${conn}" var="count">
                    UPDATE bank SET fname ='${param.fnm}', lname='${param.lnm}' where id=${user_id};
                   </sql:update>
                   </c:if>
                   <c:if test="${(param.pass ne '') && (param.pass ne null) }">
                   <sql:update dataSource="${conn}" var="count">
                    UPDATE bank SET password ='${param.pass}' where id=${user_id};
                   </sql:update>
                   </c:if>
                   <c:if test="${(param.mbl ne '') && (param.mbl ne null) }">
                   <sql:update dataSource="${conn}" var="count">
                    UPDATE bank SET phone ='${param.mbl}' where id=${user_id};
                   </sql:update>
                   </c:if>
                   <c:if test="${(param.mel ne '') && (param.mel ne null) }">
                   <sql:update dataSource="${conn}" var="count">
                    UPDATE bank SET mail ='${param.mel}' where id=${user_id};
                   </sql:update>
                   </c:if>
                   <c:if test="${(param.mel ne '') && (param.mel ne null) }">
                   <sql:update dataSource="${conn}" var="count">
                    UPDATE bank SET mail ='${param.mel}' where id=${user_id};
                   </sql:update>
                   </c:if>
                   <c:if test="${(param.addrs ne '') && (param.addrs ne null) }">
                   <sql:update dataSource="${conn}" var="count">
                    UPDATE bank SET address ='${param.addrs}' where id=${user_id};
                    
                   </sql:update>
                   </c:if>
<%////////////////////////////////////////////////Update complete////////////////////////////////////////////////////////////////%>                    
<%////////////////////////////////////////////////Fetch Data/////////////////////////////////////////////////////%>
                   <sql:query dataSource="${conn}" var="result">
                        SELECT * from bank where id='${user_id}';
                   </sql:query>
                   <c:forEach var="row" items="${result.rows}">
                       <c:set var="id" value="${row.id}"/>
                       <c:set var="email" value="${row.mail}"/> 
                       <c:set var="fname" value="${row.fname}"/>
                       <c:set var="lname" value="${row.lname}"/>
                       <c:set var="address" value="${row.address}"/>
                       <c:set var="mobile" value="${row.phone}"/>
                       <c:set var="password" value="${row.password}"/>
                   </c:forEach>
<%/////////////////////////////////////////////////////////////////////////////////////////////////////%>

                        
    <table>
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
                        <c:if test="${session eq 'present'}">
                        <a href="Profile.jsp"><button>My Profile</button></a>&emsp;
                        <a href="Logout.jsp" onclick="return confirm('Are You Sure You Want To Logout?')"><button>Logout</button></a>
                        </c:if>
                        <c:if test="${session ne 'present'}">
                        <a href="AccountForm.html"><button>New User?</button></a>&emsp;
                        <a href="LoginForm.jsp"><button>Login to NetBanking</button></a>
                        </c:if>
                    </div>
                    <div class="inf2">1800-180-0000</div>
                </div>
                <div>
                <div class="wrap">
                    <c:if test="${session eq 'present'}">
                        <div class="menu">
                            <a class="am" href="Welcome.jsp">Home&emsp;&emsp;</a>|
                            <a class="am" href="Deposit.jsp">&emsp;&emsp;Deposit&emsp;&emsp;</a>|
                            <a class="am" href="Transfer.jsp">&emsp;&emsp;Transfer&emsp;&emsp;</a>|
                            <a class="am" href="Close.jsp" onclick="return confirm('Are You Sure You Want To Close Your Account?\nAll Your Related Info Will Be Deleted!\nAll Your Balance Will Be Lapsed!')">&emsp;&emsp;Close Account</a>
                        </div>
                    <div class="heading1"><br><br><br><br>Welcome to Apna Bank</div><br>
                    <div class="formx">
                        <table cellpadding="5">
                            
                            <tr><th class="tab">Your Account No:</th><th style="width: 500px; ">00000${id}</th><th style="width: 50px; height: 32px;"></th></tr>
                            <tr><td class="tab">Name</td><td id="i1">${fname} ${lname}</td><td id="b1"><button onclick="func1()" class="edit"><img src="resources/4.png" width="25" height="25"></button></td><td style="display: none; position: absolute;" id="t1"><form action="Profile.jsp"><input type="text" class="d" name="fnm" required><input type="text" class="d" name="lnm" required> <input type="submit" class="d" value="Save"></form></td></tr>
                            <tr><td class="tab">Password:</td><td id="i2">${password}</td><td id="b2"><button onclick="func2()" class="edit"><img src="resources/4.png" width="25" height="25"></button></td><td id="t2" style="display: none;"><form action="Profile.jsp"><input type="text" class="d" name="pass" maxlength="40" required pattern=".{6,}" title="Six Or More Characters Required!"> <input type="submit" class="d" value="Save"></form></td></tr>
                            <tr><td class="tab">Mobile No.:</td><td id="i3">${mobile}</td><td id="b3"><button onclick="func3()" class="edit"><img src="resources/4.png" width="25" height="25"></button></td><td id="t3" style="display: none;"><form action="Profile.jsp"><input type="text" class="d"  name="mbl" pattern="^\d{10}" title="Invalid Mobile Number" maxlength="10" required> <input type="submit" class="d" value="Save"></form></td></tr>
                            <tr><td class="tab">Email:</td><td id="i4">${email}</td><td id="b4"><button onclick="func4()" class="edit"><img src="resources/4.png" width="25" height="25"></button></td><td id="t4" style="display: none;"><form action="Profile.jsp"><input type="mail" class="d" name="mel" maxlength="45"  required pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$"> <input type="submit" class="d" value="Save"></form></td></tr>
                            <tr><td class="tab">Address:</td><td id="i5">${address}</td><td id="b5"><button onclick="func5()" class="edit"><img src="resources/4.png" width="25" height="25"></button></td><td id="t5" style="display: none;"><form action="Profile.jsp"><input type="text" class="d" name="addrs" maxlength="60"  required> <input type="submit" class="d" value="Save"></form></td></tr>
                        
                        </table> 
                    </c:if>
                    <c:if test="${session ne 'present'}">
                        <br><br><br><br><br><br><br><br><br>
                        <div class="heading1">You Are Not Authorised!<br><br> Please Login Again...</div>
                    </c:if>
                </div>
            </td>
        </tr>
    </table>
    <div class="block2">
        <div class="foot">Apna Bank never sends email for getting customer information. Please report immediately to nearest branch if you receive any e-mail purported to be originated by Apna Bank to gather your UserID or Password or any other personal information. Our Bank does not ask for the details of your account/PIN/password. Therefore any one pretending to be asking you for information from the bank may be fraudulent entities, so please beware. You should know how to operate net transactions and if you are not familiar you may refrain from doing so.</div>
    </div>
</body>
<script type="text/javascript" src="resources/formvalidate.js"></script>
<script>
    function func1()
    {
        document.getElementById('i1').style.display='none';
        document.getElementById('t1').style.display='block';
        document.getElementById('b1').style.display='none';
        
    }
    function func2()
    {
        document.getElementById('i2').style.display='none';
        document.getElementById('t2').style.display='block';
        document.getElementById('b2').style.display='none';
        
    }
    function func3()
    {
        document.getElementById('i3').style.display='none';
        document.getElementById('t3').style.display='block';
        document.getElementById('b3').style.display='none';
        
    }
    function func4()
    {
        document.getElementById('i4').style.display='none';
        document.getElementById('t4').style.display='block';
        document.getElementById('b4').style.display='none';
        
    }
    function func5()
    {
        document.getElementById('i5').style.display='none';
        document.getElementById('t5').style.display='block';
        document.getElementById('b5').style.display='none';
        
    }
</script>
</html>
