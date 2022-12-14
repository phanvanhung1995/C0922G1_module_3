<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>HOME</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="view/viewALL/furama.css" rel="stylesheet">
</head>
<body>
<div class="row">
    <c:import url="view/viewALL/header.jsp"></c:import>
</div>
<div class="row nav2" >
    <c:import url="view/viewALL/navbar.jsp"></c:import>
</div>
<div class="row" nav2>
    <c:import url="view/viewALL/content.jsp"></c:import>
</div>
<div class="row center footer">
    <c:import url="view/viewALL/footer.jsp"></c:import>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</html>