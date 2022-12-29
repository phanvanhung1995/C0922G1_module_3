<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <style>
        .login {
            height:180px; width:270px;
            margin:0;
            padding:10px;
            border:1px #CCC solid;
        }
        input {
            margin: 10px;
        }
        button {
            margin-left: 10px;
        }
    </style>
</head>
<body>
<div class="login">
    <form action="/login" method="post">
    <h2>Login</h2>
    <input type="text" name="username" size="30" placeholder="username"><br>
    <input type="password" name="password" size="30" placeholder="password"><br>
    <button type="submit">submid</button>
    </form>
</div>
</body>
</html>