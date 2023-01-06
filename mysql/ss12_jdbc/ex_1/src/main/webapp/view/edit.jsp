<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2023-01-04
  Time: 10:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>edit</title>
</head>
<body>
<h1>Edit User</h1>
<p>-----------------------</p>

<form action="/UserServlet?action=edit" method="post">
    <fieldset>
        <legend>Form edit user</legend>
        <table>
            <tr>
                <td> id : </td>
                <td>
                    <input hidden type="text" name="id" value="${user.getId()}"><br>
                </td>
            </tr>
            <tr>
                <td> name : </td>
                <td>
                    <input type="text" name="name" value="${user.getName()}"><br>
                </td>
            </tr>
            <tr>
                <td> email : </td>
                <td>
                    <input type="text" name="email" value="${user.getEmail()}"><br>
                </td>
            </tr>
            <tr>
                <td> country : </td>
                <td>
                    <input type="text" name="country" value="${user.getCountry()}"><br>
                </td>
            </tr>
            <tr>
                <td>
                    <button type="submit"><a href="/UserServlet">Back to list user</a></button>
                </td>
            </tr>
            <tr>
                <td>
                    <button type="submit"> submit</button>
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
