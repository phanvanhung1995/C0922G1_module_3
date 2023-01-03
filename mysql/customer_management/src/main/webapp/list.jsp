<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2023-01-03
  Time: 11:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>create new customer</title>
</head>
<body>
<h1> Customer</h1>
<p>
  <a href="/CustomerServlet?action=create">create new customer</a>
</p>
<table border="1">
<tr>
  <td>Name</td>
  <td>Email</td>
  <td>Address</td>
  <td>Edit</td>
  <td>Delete</td>
</tr>
  <tr>
    <c:forEach var="customer" items='${requestScope["customers"]}'>
  <tr>
  <td><a href="/CustomerServlet?action=view&id=${customer.getId()}">${customer.getName()}</a></td>
  <td>${customer.getEmail()}</td>
  <td>${customer.getAddress()}</td>
  <td><a href="/CustomerServlet?action=edit&id=${customer.getId()}">edit</a></td>
  <td><a href="/CustomerServlet?action=delete&id=${customer.getId()}">delete</a></td>
  </tr>
    </c:forEach>
  </tr>
</table>
</body>
</html>
