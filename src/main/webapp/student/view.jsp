<%--
  Created by IntelliJ IDEA.
  User: thang
  Date: 29/11/24
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View Student</title>
  <link rel="stylesheet" href="../styles/bootstrap.min.css">
</head>
<body>
<h1>Student information details</h1>
<p>
  <a href="/students">Back to Home page</a>
</p>
<c:if test = "${requestScope.message != null}">
  <p>${requestScope.message}</p>
</c:if>
<table>
  <tr>
    <td>Name: </td>
    <td>${requestScope.student.name}</td>
  </tr>
  <tr>
    <td>Score: </td>
    <td>${requestScope.student.score}</td>
  </tr>
  <tr>
    <td>Class: </td>
    <td>
      <input type="radio" id="class1" name="class_id" value="1"
             <c:if test="${requestScope.student.class_id == 1}">checked</c:if>>
      <label for="class1">Java Backend</label><br>
      <input type="radio" id="class2" name="class_id" value="2"
             <c:if test="${requestScope.student.class_id == 2}">checked</c:if>>
      <label for="class2">Java Frontend</label><br>
      <input type="radio" id="class3" name="class_id" value="3"
             <c:if test="${requestScope.student.class_id == 3}">checked</c:if>>
      <label for="class3">PHP Backend</label>
    </td>
  </tr>
</table>

<script src="../styles/bootstrap.bundle.min.js"></script>
</body>
</html>
