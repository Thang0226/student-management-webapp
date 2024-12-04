<%--
  Created by IntelliJ IDEA.
  User: thang
  Date: 29/11/24
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Student Information</title>
  <link rel="stylesheet" href="../styles/bootstrap.min.css">
</head>
<body>
<h1>Edit student</h1>
<p style="color: green">
  <c:if test='${requestScope.message != null}'>
    <span class="message">${requestScope.message}</span>
  </c:if>
</p>
<p>
  <a href="/students">Back to Home page</a>
</p>
<form method="post">
  <fieldset>
    <legend>Student information</legend>
    <table>
      <tr>
        <td>Name: </td>
        <td><input type="text" name="name" id="name" value="${requestScope.student.name}"></td>
      </tr>
      <tr>
        <td>Score: </td>
        <td><input type="text" name="score" id="score" value="${requestScope.student.score}"></td>
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
      <tr>
        <td></td>
        <td><input type="submit" value="Update student"></td>
      </tr>
    </table>
  </fieldset>
</form>

<script src="../styles/bootstrap.bundle.min.js"></script>
</body>
</html>
