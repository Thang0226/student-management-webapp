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

<body class="bg-light py-5">

<div class="container">
  <!-- Page Title -->
  <h1 class="text-primary text-center mb-4">Student Information Details</h1>

  <!-- Back to Home Link -->
  <p class="text-center">
    <a href="/students" class="btn btn-success">Back to Home Page</a>
  </p>

  <!-- Message Section -->
  <c:if test="${requestScope.message != null}">
    <p class="text-center text-success fw-bold">${requestScope.message}</p>
  </c:if>

  <!-- Student Details Table -->
  <div class="card p-4 col-md-12 col-lg-6 mx-auto">
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
          <c:choose>
            <c:when test="${requestScope.student.class_id == 1}">
              <c:forEach items="${requestScope.classes}" var="class_item">
                <c:if test="${class_item.id == 1}">${class_item.name}</c:if>
              </c:forEach>
            </c:when>
            <c:when test="${requestScope.student.class_id == 2}">
              <c:forEach items="${requestScope.classes}" var="class_item">
                <c:if test="${class_item.id == 2}">${class_item.name}</c:if>
              </c:forEach>
            </c:when>
            <c:when test="${requestScope.student.class_id == 3}">
              <c:forEach items="${requestScope.classes}" var="class_item">
                <c:if test="${class_item.id == 3}">${class_item.name}</c:if>
              </c:forEach>
            </c:when>
          </c:choose>
        </td>
      </tr>
      </tbody>
    </table>
  </div>
</div>

<script src="../styles/bootstrap.bundle.min.js"></script>
</body>
</html>
