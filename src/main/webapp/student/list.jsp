<%--
  Created by IntelliJ IDEA.
  User: thang
  Date: 29/11/24
  Time: 13:26
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student List</title>
    <link rel="stylesheet" href="../styles/bootstrap.min.css">
    <style>
        table th, table td {
            text-align: center;
            vertical-align: middle;
        }
    </style>
</head>

<body>
<div class="container">
    <nav class="navbar navbar-expand-lg bg-dark border-bottom border-body fixed-top" data-bs-theme="dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Students Manager</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/students">Show Students</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/students?action=create">Create New Student</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            Dropdown
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" aria-disabled="true">Disabled</a>
                    </li>
                </ul>
                <form class="d-flex my-auto" role="search" action="/students?action=search" method="post">
                    <input class="form-control me-2" type="search" placeholder="Search Name" aria-label="Search"
                           name="name">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</div>
<div class="container" style="margin-top:100px;">
    <div class="table-responsive">
        <table class="table table-bordered table-light table-striped table-hover">
            <thead class="table-light">
            <tr>
                <th scope="col" class="col-1">ID</th>
                <th scope="col" class="col-2">Name</th>
                <th scope="col" class="col-2">Score</th>
                <th scope="col" class="col-3">Class</th>
                <th scope="col" class="col-2">Actions</th>
            </tr>
            </thead>
            <tbody class="table-group-divider">
            <c:forEach items="${requestScope.students}" var="student">
                <tr>
                    <th scope="row">${student.id}</th>
                    <td><a href="/students?action=view&id=${student.id}">${student.name}</a></td>
                    <td>${student.score}</td>
                    <td>
                        <c:choose>
                        <c:when test="${student.class_id == 1}">
                        <c:forEach items="${requestScope.classes}" var="class_item">
                            <c:if test="${class_item.id == 1}">${class_item.name}</c:if>
                        </c:forEach>
                        </c:when>
                        <c:when test="${student.class_id == 2}">
                        <c:forEach items="${requestScope.classes}" var="class_item">
                            <c:if test="${class_item.id == 2}">${class_item.name}</c:if>
                        </c:forEach>
                        </c:when>
                        <c:when test="${student.class_id == 3}">
                        <c:forEach items="${requestScope.classes}" var="class_item">
                            <c:if test="${class_item.id == 3}">${class_item.name}</c:if>
                        </c:forEach>
                        </c:when>
                        </c:choose>
                    <td>
                        <button class="btn btn-success">
                            <a href="/students?action=edit&id=${student.id}">edit</a>
                        </button>
                        <button class="btn btn-danger">
                            <a href="/students?action=delete&id=${student.id}">delete</a>
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script src="../styles/bootstrap.bundle.min.js"></script>
</body>
</html>
