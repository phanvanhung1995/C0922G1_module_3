<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2023-01-02
  Time: 1:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="furama.css" rel="stylesheet">
</head>
<body>
<div class="row">
    <c:import url="../viewALL/header.jsp"></c:import>
</div>
<div class="row">
    <c:import url="../viewALL/navbar.jsp"></c:import>
</div>
<div class="row center content" >

    <h2 class="center">LIST CUSTOMER</h2>

    <hr>
    <hr>
    <table class="table table-dark table-striped">
        <tr style="text-align: center">
            <th>STT</th>
            <th>NAME</th>
            <th>DATE OF BIRTH</th>
            <th>GENDER</th>
            <th> ID CARD</th>
            <th> PHONE NUMBER</th>
            <th>EMAIL</th>
            <th>ADDRESS</th>
            <th>CUSTOMER TYPE NAME</th>
            <th>EDIT</th>
            <th>DELETE</th>
        </tr>
        <tr style="text-align: center">
            <td>1</td>
            <td>Phan Văn Hung</td>
            <td>17/07/1995</td>
            <td>Nam</td>
            <td>187541711</td>
            <td>0921093190/td>
            <td>phanvanhung@gmail.com</td>
            <td>nghệ an</td>
            <td>diamond</td>
            <td>
                <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal"
                        data-bs-target="#exampleModal2">
                    Edit
                </button>
            </td>
            <td>
                <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal"
                        data-bs-target="#exampleModal">
                    delete
                </button>
            </td>
        </tr>
        <tr style="text-align: center">
            <td>2</td>
            <td>Nguyễn Ngọc Hậu</td>
            <td>17/07/1995</td>
            <td>Nam</td>
            <td>187541711</td>
            <td>0921093190/td>
            <td>phanvanhung@gmail.com</td>
            <td>nghệ an</td>
            <td>diamond</td>
            <td>
                <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal"
                        data-bs-target="#exampleModal2">
                    Edit
                </button>
            </td>
            <td>
                <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal"
                        data-bs-target="#exampleModal">
                    delete
                </button>
            </td>
        </tr>
        <tr style="text-align: center">
            <td>3</td>
            <td>Nguyễn Ngọc Vũ</td>
            <td>17/07/1995</td>
            <td>Nam</td>
            <td>187541711</td>
            <td>0921093190/td>
            <td>phanvanhung@gmail.com</td>
            <td>nghệ an</td>
            <td>diamond</td>
            <td>
                <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal"
                        data-bs-target="#exampleModal2">
                    Edit
                </button>
            </td>
            <td>
                <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal"
                        data-bs-target="#exampleModal">
                    delete
                </button>
            </td>
        </tr>
    </table>

    <!-- Modal delete -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    chưa có gì đâu mà nhìn
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal edit -->
    <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModal2Label">Modal title</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    đây cũng chưa có gì
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>

</div>

<div class="row center footer">
    <c:import url="../viewALL/footer.jsp"></c:import>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</html>
