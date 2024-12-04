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
</head>
<body class="bg-light py-5">

<div class="container">
  <!-- Page Title -->
  <h1 class="text-primary text-center mb-4">Edit Student</h1>

  <!-- Message Section -->
  <p class="text-center">
    <c:if test='${requestScope.message != null}'>
      <span class="text-success fw-bold">${requestScope.message}</span>
    </c:if>
  </p>

  <!-- Back to Home Link -->
  <p class="text-center">
    <a href="/students" class="btn btn-success">Back to Home Page</a>
  </p>

  <!-- Form Section -->
  <form method="post" class="p-4 bg-white border rounded col-md-12 col-lg-6 mx-auto">
    <fieldset>
      <legend class="text-primary">Student Information</legend>
      <div class="mb-3">
        <label for="name" class="form-label">Name:</label>
        <input type="text" class="form-control" name="name" id="name" value="${requestScope.student.name}">
      </div>
      <div class="mb-3">
        <label for="score" class="form-label">Score:</label>
        <input type="text" class="form-control" name="score" id="score" value="${requestScope.student.score}">
      </div>
      <div class="mb-3">
        <label class="form-label">Class:</label>
        <div style="padding-left: 50px">
          <input type="radio" class="form-check-input" id="class1" name="class_id" value="1"
                 <c:if test="${requestScope.student.class_id == 1}">checked</c:if>>
          <label for="class1" class="form-check-label">Java Backend</label>
        </div>
        <div style="padding-left: 50px">
          <input type="radio" class="form-check-input" id="class2" name="class_id" value="2"
                 <c:if test="${requestScope.student.class_id == 2}">checked</c:if>>
          <label for="class2" class="form-check-label">Java Frontend</label>
        </div>
        <div style="padding-left: 50px">
          <input type="radio" class="form-check-input" id="class3" name="class_id" value="3"
                 <c:if test="${requestScope.student.class_id == 3}">checked</c:if>>
          <label for="class3" class="form-check-label">PHP Backend</label>
        </div>
      </div>
      <div class="text-center">
        <input type="submit" value="Update Student" class="btn btn-primary">
      </div>
    </fieldset>
  </form>
</div>

<!-- Bootstrap JS (Optional, for interactivity) -->
<script src="../styles/bootstrap.bundle.min.js"></script>
</body>
</html>
