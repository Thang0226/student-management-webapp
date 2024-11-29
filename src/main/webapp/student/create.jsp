<%--
  Created by IntelliJ IDEA.
  User: thang
  Date: 29/11/24
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new student</title>
    <style>
        .message{
            color:green;
        }
    </style>
</head>
<body>
<h1>Create new student</h1>
<p>
    <c:if test="${requestScope.message != null}">
        <span class="message">${requestScope.message}</span>
    </c:if>
</p>
<p>
    <a href="/students">Back to student list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Student information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>Score: </td>
                <td><input type="text" name="score" id="score"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create student"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
