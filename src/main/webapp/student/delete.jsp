<%--
  Created by IntelliJ IDEA.
  User: thang
  Date: 29/11/24
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Delete Student Information</title>
  <link rel="stylesheet" href="../styles/bootstrap.min.css">
</head>
<body>
<div class="container">
  <!-- Page Title -->
  <h1 class="text-danger text-center mb-4">Delete Student Information</h1>

  <!-- Back to Home Link -->
  <p class="text-center">
    <a href="/students" class="btn btn-success">Back to Home Page</a>
  </p>

  <!-- Form Section -->
  <form method="post" class="p-4 bg-white border rounded col-md-12 col-lg-6 mx-auto">
    <h3 class="text-warning mb-3 text-center">Are you sure?</h3>
    <fieldset>
      <legend class="text-primary">Student Information</legend>
      <table class="table table-striped">
        <tbody>
        <tr>
          <td><strong>Name:</strong></td>
          <td>${requestScope.student.name}</td>
        </tr>
        <tr>
          <td><strong>Score:</strong></td>
          <td>${requestScope.student.score}</td>
        </tr>
        <tr>
          <td><strong>Class:</strong></td>
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
        </tbody>
      </table>
      <div class="text-center mt-4">
        <input type="submit" value="Delete Student" class="btn btn-danger">
      </div>
    </fieldset>
  </form>
</div>

<script src="../styles/bootstrap.bundle.min.js"></script>
</body>
</html>
