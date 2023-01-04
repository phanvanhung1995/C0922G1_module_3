<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2023-01-03
  Time: 5:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  language="java" %>
<html>
<head>
    <title>Product List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<h1>Product List</h1>
<p>
    <a href="/ProductServlet?action=create">create new product</a>
</p>
<table class="table table-striped">
    <tr>
        <th>Id</th>
        <th>name</th>
        <th>price</th>
        <th>description</th>
        <th>manufacturer</th>
        <th>edit</th>
        <th>delete</th>
    </tr>

    <c:forEach var="product" items='${requestScope["products"]}'>
        <tr>
            <td><a href="/ProductServlet?action=view&id=${product.id}">${product.id}</a></td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.description}</td>
            <td>${product.manufacturer}</td>
            <td><a href="/ProductServlet?action=edit&id=${product.id}">edit</a></td>
            <td><a href="/ProductServlet?action=delete&id=${product.id}">delete</a></td>
        </tr>
    </c:forEach>



</table>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</html>
