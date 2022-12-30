<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-12-30
  Time: 11:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        input {
            width: 90px;
            height: 30px;
            padding-left: 70px;
        }
        div {
            padding: 10px;
        }
    </style>
</head>
<body>
<h3>Calculator</h3>
<form action="/CalculatorServlet" method="post">
    <div>
    <label>First operand</label>
    <input name="firstoperand" type="text" value="0"><br>
    </div>
    <div>
    <label>Operator</label>
    <select name="operator">
        <option value="+">Addition</option>
        <option value="-">subtraction</option>
        <option value="/">share calculation</option>
        <option value="*">multiplication</option>
    </select><br>
    </div>
    <div>
    <label>Second operand</label>
    <input name="secondoperand" type="text" value="0"><br>
    <button type="submit">Calculate</button>
    </div>
</form>
</body>
</html>
