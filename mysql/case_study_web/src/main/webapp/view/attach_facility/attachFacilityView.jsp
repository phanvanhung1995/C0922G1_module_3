<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2023-01-07
  Time: 10:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Attach Facility</title>
    <title>Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="../viewALL/furama.css" rel="stylesheet">
</head>
<body>
<div class="row">
    <c:import url="../viewALL/header.jsp"></c:import>
</div>
<div class="row">
    <c:import url="../viewALL/navbar.jsp"></c:import>
</div >
<div>
    <h2 class="center" style="color: red;font-size: 200%">LIST ATTACH FACILITY</h2>
</div>

<hr>
<div>
    <table class="table table-dark table-striped">
        <tr style="text-align: center">
            <th>#</th>
            <th> Name </th>
            <th>Customer  </th>
            <th>  Date of First</th>
            <th> Date of End</th>
            <th>Deposits</th>
            <th> Total Money</th>
            <th>List Facility</th>
            <th>Create </th>
            <th>Display</th>
        </tr>
        <tr style="text-align: center">
            <td>1</td>
            <td>Room Twin 01</td>
            <td>Phan Văn Hùng</td>
            <td>17/07/2020</td>
            <td>17/07/2020</td>
            <td>Đại học</td>
            <td>Giám đốc</td>
            <td>50000000</td>
            <td>
                <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal"
                        data-bs-target="#exampleModal2">
                    +
                </button>
            </td>
            <td>
                <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal"
                        data-bs-target="#exampleModal">
                    List Attach Facility
                </button>
            </td>
        </tr>

        <tr style="text-align: center">
            <td>1</td>
            <td>Room Twin 01</td>
            <td>Phan Văn Hùng</td>
            <td>17/07/2020</td>
            <td>17/07/2020</td>
            <td>Đại học</td>
            <td>Giám đốc</td>
            <td>50000000</td>
            <td>
                <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal"
                        data-bs-target="#exampleModal">
                    +
                </button>
            </td>
            <td>
                <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal"
                        data-bs-target="#exampleModal2">
                    List Attach Facility
                </button>
            </td>
        </tr>
    </table>
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

<div class="row center footer">
    <c:import url="../viewALL/footer.jsp"></c:import>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</html>
