<jsp:useBean id="product" scope="request" type="javax.xml.stream.util.StreamReaderDelegate"/>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2023-01-03
  Time: 10:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>delete product</title>
</head>
<body>
<h2>delete product</h2>
<p>
  <a href="/ProductServlet">back to product list</a>
</p>

<form method="post">
  <p> bạn muốn xóa sản phầm : ${product.name}</p>
  <button type="submit">Delete</button>
  <a href="/ProductServlet"><input type="submit" value="back to product list"></a>
</form>
</body>
</html>
