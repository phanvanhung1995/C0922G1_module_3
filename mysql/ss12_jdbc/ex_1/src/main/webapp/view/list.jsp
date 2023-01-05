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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<div>
    <c:import url="../navbar.jsp"></c:import>
</div>
<div class="row">
    <div class="col-lg-12">
        <h1 style="text-align: center">List User</h1>
    </div>
</div>
<div class="row">
    <div class="col-lg-6">

            <a href="/UserServlet?action=create">Create new user</a>

    </div>
</div>
<div class="row" >
    <div class="col-lg-6">
        <form method="post" action="/UserServlet?action=searchByCountry">
            <input style="text-align: right" type="text" name="country"><br>
            <button style="text-align: right" type="submit">Submit</button>
        </form>
    </div>
</div>

<table class="table table-striped">
    <tr>
        <th>stt</th>
        <th>
            <form method="post" action="/UserServlet?action=sortByName">
                <a href="/UserServlet?action=sortByName" style="color: black;text-decoration: none">Name</a>
            </form>
        </th>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</html>
