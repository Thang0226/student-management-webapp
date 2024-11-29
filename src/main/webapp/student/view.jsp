<%--
  Created by IntelliJ IDEA.
  User: thang
  Date: 29/11/24
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>View student</title>
</head>
<body>
<h1>Student information details</h1>
<p>
  <a href="/students">Back to student list</a>
</p>
<table>
  <tr>
    <td>Name: </td>
    <td>${requestScope.student.name}</td>
  </tr>
  <tr>
    <td>Score: </td>
    <td>${requestScope.student.score}</td>
  </tr>
</table>
</body>
</html>
