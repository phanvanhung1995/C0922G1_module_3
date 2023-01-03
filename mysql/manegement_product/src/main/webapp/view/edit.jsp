<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2023-01-03
  Time: 10:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit</title>
</head>
<body>
<h2>Edit Product</h2>
<p>
    <a href="/ProductServlet">back to product list</a>
</p>
<form method="post">
    <fieldset>
        <legend>product form edit</legend>
        <table>
            <tr>
                <td>Name : </td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>price : </td>
                <td><input type="text" name="price" id="price"></td>
            </tr>
            <tr>
                <td>description : </td>
                <td><input type="text" name="description" id="description"></td>
            </tr>
            <tr>
                <td>manufacturer : </td>
                <td><input type="text" name="manufacturer" id="manufacturer"></td>
            </tr>
            <tr>
                <td>------------------</td>
            </tr>
            <tr>
                <td>
                    <button type="submit">update product</button>
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
