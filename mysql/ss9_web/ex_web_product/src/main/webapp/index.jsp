<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-12-29
  Time: 9:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index</title>

</head>
<body>
<div>
  <h2>Product Discount Calculator</h2>

  <form action="/ProductDiscountCalculator" method="post">
      <p>Product Description</p>
    <input type="text" name="Description" value="Product Description"><br>
      <p>List Price</p>
    <input type="number" name="Price" value="0.0"><br>
      <p>Discount Percent</p>
    <input type="number" name="Percent" value="0.0"><br>
    <p></p>
      <button type="submit" >Calculate Discount</button>
  </form>
</div>
</body>
</html>
