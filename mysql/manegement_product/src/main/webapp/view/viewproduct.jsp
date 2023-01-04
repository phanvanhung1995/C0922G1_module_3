
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2023-01-04
  Time: 10:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>view one product</title>
</head>
<body>
<h1> view product by id : ${id}</h1>
<p>
    <a href="/ProductServlet">back to product list</a>
</p>

<table>
    <tr>
        <td>name : </td>
        <td>${product.getName()}</td>
    </tr>
    <tr>
        <td>price : </td>
        <td>${product.getPrice()}</td>
    </tr>
    <tr>
        <td>description : </td>
        <td>${product.getDescription()}</td>
    </tr>
    <tr>
        <td>manufacturer : </td>
        <td>${product.getManufacturer()}</td>
    </tr>
</table>
</body>
</html>
