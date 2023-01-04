<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2023-01-04
  Time: 4:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List</title>
</head>
<body>
<h1>List User</h1>
<p>
  <a href="/UserServlet?action=create">Create new user</a>
</p>
<table border="1">
  <tr>
    <th>stt</th>
    <th>name</th>
    <th>email</th>
    <th>country</th>
    <th>edit</th>
    <th>delete</th>
  </tr>
  <c:forEach var="user" items="${userList}" varStatus="userStatust">
  <tr>
    <td>${userStatust.count}</td>
    <td>${user.name}</td>
    <td>${user.email}</td>
    <td>${user.country}</td>
    <td><a href="/UserServlet?action=edit&id=${userStatust.count}">edit</a></td>
    <td><a href="/UserServlet?action=delete&id=${userStatust.count}">delete</a></td>
  </tr>
  </c:forEach>

</table>
</body>
</html>
