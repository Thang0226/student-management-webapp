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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New Student</title>
    <link rel="stylesheet" href="../styles/bootstrap.min.css">
</head>

<body class="bg-light py-5">

<div class="container">
    <!-- Page Title -->
    <h1 class="text-primary text-center mb-4">Create New Student</h1>

    <!-- Message Section -->
    <p class="text-center">
        <c:if test="${requestScope.message != null}">
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

            <!-- Name Field -->
            <div class="mb-3">
                <label for="name" class="form-label">Name:</label>
                <input type="text" class="form-control" name="name" id="name">
            </div>

            <!-- Score Field -->
            <div class="mb-3">
                <label for="score" class="form-label">Score:</label>
                <input type="text" class="form-control" name="score" id="score">
            </div>

            <!-- Class Selection -->
            <div class="mb-3">
                <label class="form-label">Class:</label>
                <div style="padding-left: 50px">
                    <input type="radio" class="form-check-input" id="class1" name="class_id" value="1">
                    <label for="class1" class="form-check-label">Java Backend</label>
                </div>
                <div style="padding-left: 50px">
                    <input type="radio" class="form-check-input" id="class2" name="class_id" value="2">
                    <label for="class2" class="form-check-label">Java Frontend</label>
                </div>
                <div style="padding-left: 50px">
                    <input type="radio" class="form-check-input" id="class3" name="class_id" value="3">
                    <label for="class3" class="form-check-label">PHP Backend</label>
                </div>
            </div>

            <!-- Submit Button -->
            <div class="text-center">
                <input type="submit" value="Create Student" class="btn btn-primary">
            </div>
        </fieldset>
    </form>
</div>

<script src="../styles/bootstrap.bundle.min.js"></script>
</body>
</html>
