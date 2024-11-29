<%--
  Created by IntelliJ IDEA.
  User: thang
  Date: 29/11/24
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search student information by name</title>
</head>
<body>
<form method="post">
    <fieldset>
        <legend>Student information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" id="name" placeholder="Student name"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Search student"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
