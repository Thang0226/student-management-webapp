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
                <label for="class" class="form-label">Class:</label>
                <select class="form-select" name="class_id" id="class">
                    <option value="1">Java Backend</option>
                    <option value="2">Java Frontend</option>
                    <option value="3">PHP Backend</option>
                </select>
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
