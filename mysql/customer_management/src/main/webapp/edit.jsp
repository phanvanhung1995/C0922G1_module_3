<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2023-01-03
  Time: 2:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit customer</title>
</head>
<body>
<h2>Edit Customer</h2>
<p>
    <a href="/CustomerServlet">back to menu</a>
</p>

<form method="post">
    <table>
        <tr>
            <td>Name: </td>
            <td><input type="text" name="name" id="name"></td>
        </tr>
        <tr>
            <td>Email: </td>
            <td><input type="text" name="email" id="email"></td>
        </tr>
        <tr>
            <td>Address: </td>
            <td><input type="text" name="address" id="address"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Create customer"></td>
        </tr>
    </table>
</form>

</body>
</html>
