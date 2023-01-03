<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2023-01-03
  Time: 9:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<h2>Create new Product</h2>
<p>
    <a href="/ProductServlet">
        back to product list
    </a>
</p>
<p></p>
<form method="post">
    <fieldset>
        <legend>product infomation</legend>
        <table>
            <tr>
                <td>name :</td>
                <td>
                    <input type="text" id="name" name="name">
                </td>
            </tr>
            <tr>
                <td>price :</td>
                <td>
                    <input type="text" id="price" name="price">
                </td>
            </tr>
            <tr>
                <td>description :</td>
                <td>
                    <input type="text" id="description" name="description">
                </td>
            </tr>
            <tr>
                <td>manufacturer :</td>
                <td>
                    <input type="text" id="manufacturer" name="manufacturer">
                </td>
            </tr>
            <tr><td>
                ------------------------
            </td></tr>
            <tr>
                <td>
                    <button type="submit">create product</button>
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>

</html>
