<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2023-01-03
  Time: 5:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
</head>
<body>
<h1>Product List</h1>
<p>
  <a href="/ProductServlet?action=create">create new product</a>
</p>
<table border="1">
  <tr>
    <th>Id</th>
    <th>name</th>
    <th>price</th>
    <th>description</th>
    <th>manufacturer</th>
  </tr>
  <tr>
    <c:forEach var="product" items='${requestScope[""]}'>

    </c:forEach>
  </tr>
</table>
</body>
</html>
