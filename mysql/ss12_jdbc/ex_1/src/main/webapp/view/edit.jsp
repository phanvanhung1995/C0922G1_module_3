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

<form method="post">
    <fieldset>
        <legend>Form edit user</legend>
        <table>
            <tr>
                <td> name : </td>
                <td>
                    <input type="text" name="name" ><br>
                </td>
            </tr>
            <tr>
                <td> email : </td>
                <td>
                    <input type="text" name="email"><br>
                </td>
            </tr>
            <tr>
                <td> country : </td>
                <td>
                    <input type="text" name="country"><br>
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
