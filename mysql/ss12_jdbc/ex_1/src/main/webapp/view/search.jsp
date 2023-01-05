<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2023-01-05
  Time: 10:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Seach by country</title>
</head>
<body>
<h2>User your search by country : ${country}</h2>
<p>
    <a href="/UserServlet">Back to user list</a>
</p>

<table>
    <tr>
        <th>id</th>
        <th>name</th>
        <th>email</th>
        <th>country</th>
    </tr>
    <c:forEach var="user" items="${users}">
        <tr>
            <td>${user.getId()}</td>
            <td>${user.getName()}</td>
            <td>${user.getEmail()}</td>
            <td>${user.getCountry()}</td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
