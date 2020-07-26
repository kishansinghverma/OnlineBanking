<%-- 
    Document   : CreateAccount
    Created on : Mar 24, 2017, 6:22:16 PM
    Author     : Kishan Verma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account</title>
        <link href="resources/style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/kishan" user="root" password="root"/>   
        <sql:update dataSource="${snapshot}" var="result">
        INSERT INTO bank VALUES (null,?,?,?,?,?,?,?);
        <sql:param value="${param.fname}" />
        <sql:param value="${param.lname}" />
        <sql:param value="${param.password}" />
        <sql:param value="${param.amount}" />
        <sql:param value="${param.phone}" />
        <sql:param value="${param.address}" />
        <sql:param value="${param.email}" />
    </sql:update>
        <sql:query dataSource="${snapshot}" var="result">
        SELECT * from bank;
        </sql:query>
        <c:forEach var="row" items="${result.rows}">
            <c:set var="account" value="${row.id}"/>
            <c:set var="fname" value="${row.fname}"/>
            <c:set var="lname" value="${row.lname}"/>
            <c:set var="password" value="${row.password}"/>
            <c:set var="amount" value="${row.amount}"/>
            <c:set var="phone" value="${row.phone}"/>
            <c:set var="address" value="${row.address}"/>
            <c:set var="email" value="${row.mail}"/>
    </c:forEach>
       
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
                        <a href="AccountForm.html"><button>New User?</button></a>&emsp;
                        <a href="LoginForm.jsp"><button>Login to NetBanking</button></a>
                    </div>
                    <div class="inf2">1800-180-0000</div>
                </div>
                <div class="wrap">
                    <div class="heading1"><br><br><br>Account Created Successfully</div><br><br>
                    <div class="form1">
                    <table cellpadding="5">
                        <tr><td>Your Account No:</td><td>00000${account}</td></tr>
                        <tr><td>Name:</td><td>${fname} ${lname}</td></tr>
                        <tr><td>Amount Deposited:</td><td>${amount}</td></tr>
                        <tr><td>Mobile No.:</td><td>${phone}</td></tr>
                        <tr><td>Address:</td><td>${address}</td></tr>
                        <tr><td>Password:</td><td>${password}</td></tr>
                    </table>
                    </div>   
                </div>
            </td>
        </tr>
    </table>
    <div class="block2">
        <div class="foot">Apna Bank never sends email for getting customer information. Please report immediately to nearest branch if you receive any e-mail purported to be originated by Apna Bank to gather your UserID or Password or any other personal information. Our Bank does not ask for the details of your account/PIN/password. Therefore any one pretending to be asking you for information from the bank may be fraudulent entities, so please beware. You should know how to operate net transactions and if you are not familiar you may refrain from doing so.</div>
    </div>
    </body>
</html>
