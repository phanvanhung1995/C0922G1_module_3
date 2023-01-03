<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2023-01-03
  Time: 3:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>delete customer</h2>
<p>
    <a href="/CustomerServlet">back to menu</a>
</p>

<form method="post">
    <table>
        <tr>
        <tr>
            <td>Name:</td>
            <td>${requestScope["customer"].getName()}</td>
        </tr>
        <tr>
            <td>Email:</td>
            <td>${requestScope["customer"].getEmail()}</td>
        </tr>
        <tr>
            <td>Address:</td>
            <td>${requestScope["customer"].getAddress()}</td>
        </tr>
        <tr>
            <td><input type="submit" value="Delete customer"></td>
            <td><a href="/CustomerServlet">Back to customer list</a></td>
        </tr>
        </tr>
    </table>
</form>
</body>
</html>
