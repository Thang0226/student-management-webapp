<%--
  Created by IntelliJ IDEA.
  User: thang
  Date: 29/11/24
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Delete Student Information</title>
  <link rel="stylesheet" href="../styles/bootstrap.min.css">
</head>
<body>
<h1>Delete student information</h1>
<p>
  <a href="/students">Back to Home page</a>
</p>
<form method="post">
  <h3>Are you sure?</h3>
  <fieldset>
    <legend>Student information</legend>
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
        <td><input type="submit" value="Delete student"></td>
        <td><a href="/students">Back to Home page</a></td>
      </tr>
    </table>
  </fieldset>
</form>

<script src="../styles/bootstrap.bundle.min.js"></script>
</body>
</html>
