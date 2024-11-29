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
    <title>Student List</title>
    <style>
        table {
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            width: 100px;
            text-align: center;
        }
        .col_id {
            width: 50px;
        }
        a {
            text-decoration: none;
        }
    </style>
</head>

<body>
<h1>Students</h1>
<p>
    <a href="/students?action=create">Create new student</a>
</p>
<p>
    <a href="/students?action=search">Search student information by name</a>
</p>
<table>
    <thead>
    <tr>
        <th class="col_id">ID</th>
        <th>Name</th>
        <th>Score</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${requestScope.students}" var="student">
        <tr>
            <td class="col_id">${student.id}</td>
            <td><a href="/students?action=view&id=${student.id}">${student.name}</a></td>
            <td>${student.score}</td>
            <td><a href="/students?action=edit&id=${student.id}">edit</a></td>
            <td><a href="/students?action=delete&id=${student.id}">delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
