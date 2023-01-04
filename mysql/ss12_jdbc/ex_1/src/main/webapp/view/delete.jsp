
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2023-01-04
  Time: 11:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>delete</title>
</head>
<body>

<h1>Delete user is id : ${id}</h1>

<p>-------------------------------------</p>
<form method="post">
  <table>
    <tr>
      <td>bạn muốn xóa sản phẩm có id là :  ${id}</td>
    </tr>
    <tr>
      <td>
        <button type="submit">delete</button>
      </td>
    </tr>
    <tr>
      <td>
        <button type="submit"><a href="/UserServlet">Back to list user</a></button>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
