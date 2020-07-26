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
<%///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>    
                   <sql:setDataSource var="conn" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/kishan" user="root" password="root" />
                   <sql:query dataSource="${conn}" var="result1">
                        SELECT amount from bank where id='${user_id}';
                   </sql:query>
                   <c:forEach var="row1" items="${result1.rows}">
                       <c:set var="payer_amount" value="${row1.amount}"/>
                   </c:forEach>
 <%/////////////////////////////////////////////////////////////////////////////////////////////////////////////%>                  
                   <sql:query dataSource="${conn}" var="result2">
                        SELECT * from bank where id='${param.reciever}';
                   </sql:query>
                   <c:forEach var="row2" items="${result2.rows}">
                       <c:set var="payee_id" value="${row2.id}"/>
                       <c:set var="payee_amount" value="${row2.amount}"/>
                       <c:set var="payee_fname" value="${row2.fname}"/>
                       <c:set var="payee_lname" value="${row2.lname}"/>
                       <c:set var="ac_found" value="true" />
                   </c:forEach>
 <%////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>                       
                   <c:if test="${param.reciever ne null}">
                       <c:if test="${ac_found eq 'true'}">
                       <c:if test="${user_id != payee_id}"> 
                       <c:if test="${param.t_amount <= payer_amount}" >
                       <sql:update dataSource="${conn}" var="count1">
                            UPDATE bank SET amount ='${payer_amount-param.t_amount}' where id=${user_id};
                       </sql:update>
                       <sql:update dataSource="${conn}" var="count2">
                            UPDATE bank SET amount ='${payee_amount+param.t_amount}' where id=${param.reciever};
                       </sql:update>
                            
                       <sql:query dataSource="${conn}" var="result3">
                        SELECT * from bank where id='${user_id}';
                       </sql:query>
                       <c:forEach var="row3" items="${result3.rows}">
                         <c:set var="amount" value="${row3.amount}"/>
                       </c:forEach>
                        
                       <c:set var="output" value="Rs. ${param.t_amount} Transfrred To ${payee_fname} ${payee_lname}." />
                       <c:set var="updated" value="Updated Balance: ${amount} Rs." />
                       </c:if>
                       <c:if test="${param.t_amount > payer_amount}" >
                           <c:set var="output" value="Insufficient Fund!" />
                           <c:set var="updated" value="Transaction Declined..." />
                       </c:if>
                   </c:if>
                   <c:if test="${user_id == payee_id}">
                       <c:set var="output" value="Can't Transfer To self!" /> 
                       <c:set var="updated" value="Transaction Declined..." />
                   </c:if>
                   </c:if>
                   <c:if test="${ac_found ne 'true'}">
                       <c:set var="output" value="Reciever's Account Does'nt Exists!" />
                       <c:set var="updated" value="Transaction Declined..." />
                   </c:if>
                   </c:if>
<%///////////////////////////////////////////////////////////////////////////////////////////////////////////%>                        
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
                    <div class="form">
                    <form action="Transfer.jsp" method="post">
                        <input type="text" name="reciever" placeholder="Reciver's Account No." required pattern="^\d{1,}" title="Provide Valid A/c Number" maxlength="9">
                        <input type="text" name="t_amount" placeholder="Amount To Be Transfer" required pattern="^\d{1,}" title="Provide Valid Amount!" maxlength="9">
                        <hr class="hrl">
                        <input type="submit" value="Transfer">
                    </form>
                    <div class="out1"><c:out value="${output}" /><br><br><c:out value="${updated}" /></div>
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
</html>
