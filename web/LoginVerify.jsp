<%-- 
    Document   : VerifyForm
    Created on : Mar 24, 2017, 10:44:43 AM
    Author     : Kishan Verma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify Form</title>
    </head>
    <body>
                   <sql:setDataSource var="conn" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/kishan" user="root" password="root" />
                   <sql:query dataSource="${conn}" var="result">
                        SELECT password from bank where id='${param.ac_no}';
                   </sql:query>
                   <c:forEach var="row" items="${result.rows}">
                        <c:set var="pass" value="${row.password}"/>
                   </c:forEach>
                        <c:if test="${pass eq null}">
                            <c:set var="errorcode" value="no_ac" scope="application" />
                            <c:redirect url="LoginForm.jsp" />
                        </c:if>
                        <c:if test="${pass ne null}">
                            <c:if test="${pass eq param.password}">
                                <c:set var="user_id" value="${param.ac_no}" scope="session" />
                                <c:set var="session" value="present" scope="session" />
                                <%
                                    Date createTime = new Date(session.getCreationTime());
                                %>
                                <c:redirect url="Welcome.jsp" />
                            </c:if> 
                            <c:if test="${pass ne param.password}">
                                <c:set var="errorcode" value="err_pass" scope="application" />
                                <c:redirect url="LoginForm.jsp" />
                            </c:if>
                        </c:if>
                        
    </body>
</html>
