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
    <link href="view/viewALL/furama.css" rel="stylesheet">
    <style>
        .background {
            color: red;
            font-size: 200%;
            background-color: aquamarine;;
            margin: 0px;
        }

        .mess {
            color: red;
            font-size: 200%;
            float: left;
        }
    </style>

</head>

<body>

<div class="row">
    <c:import url="../viewALL/header.jsp"></c:import>
</div>
<div class="row nav2">
    <c:import url="../viewALL/navbar.jsp"></c:import>
</div>
<div class="row">
    <div class="center content">

        <h2 class="center background">LIST CUSTOMER</h2>

        <hr>
        <p class="mess">${mess}</p>

        <br>

        <form>
            <button style="float: left" type="button" class="btn btn-primary btn-lg"><a style="color: white"
                                                                                        href="/CustomerServlet?action=create">Create
                New Customer</a></button>
        </form>
        <form method="post" action="/CustomerServlet?action=search">
            <p style="float: right">
                <span>input name : </span>
                <input type="text" name="name">
                <span>input gender : </span>
                <select name="gender">
                    <option value="0">Nữ</option>
                    <option value="1">NNam</option>
                </select>
                <button type="submit">Search</button>
            </p>
        </form>


        <form>

            <table id="customer" class="table table-dark table-striped">
                <thead>
                <tr style="text-align: center">
                    <th>ID</th>
                    <th>TYPE_ID</th>
                    <th>NAME</th>
                    <th>DATE OF BIRTH</th>
                    <th>GENDER</th>
                    <th> ID CARD</th>
                    <th> PHONE NUMBER</th>
                    <th>EMAIL</th>
                    <th>ADDRESS</th>
                    <th>EDIT</th>
                    <th>DELETE</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="customer" items="${customerList}">
                    <tr style="text-align: center">
                        <td>${customer.getId()}</td>
                        <c:forEach var="customerType" items="${customerTypeList}">
                            <c:if test="${customer.getTypeId() == customerType.getTypeId()}">
                                <td>${customerType.getTypeName()}</td>
                            </c:if>
                        </c:forEach>
                        <td>${customer.getName()}</td>
                        <td>${customer.getDateOfBirth()}</td>
                        <c:if test="${customer.getGender() ==true}">
                            <td>Nam</td>
                        </c:if>
                        <c:if test="${customer.getGender() ==false}">
                            <td>Nữ</td>
                        </c:if>
                        <td>${customer.getIdCard()}</td>
                        <td>${customer.getPhoneNumber()}</td>
                        <td>${customer.getEmail()}</td>
                        <td>${customer.getAddress()}</td>
                        <td>
                            <button onclick="editCustomer('${customer.getId()}','${customer.getTypeId()}','${customer.getName()}',
                                    '${customer.getDateOfBirth()}','${customer.getGender()}','${customer.getIdCard()}','${customer.getPhoneNumber()}'
                                    ,'${customer.getPhoneNumber()}','${customer.getEmail()}','${customer.getAddress()}')"
                                    type="button"
                                    data-bs-target="#exampleModal2" data-bs-toggle="modal"
                                    class="btn btn-outline-secondary">
                                Edit
                            </button>
                        </td>

                        <td>
                            <button onclick="deleteCustomer('${customer.getId()}','${customer.getName()}')"
                                    type="button"
                                    class="btn btn-outline-danger" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal">
                                Delete
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </form>
        <!-- Modal delete -->

        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Delete</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form method="get">
                        <div class="modal-body">
                            <p>bạn muốn xóa khách hàng: </p>
                            <input type="text" name="idDelete" hidden id='idDelete'>
                            <span id='nameDelete'></span>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" name="action" value="delete" class="btn btn-primary">Save changes
                            </button>
                        </div>
                    </form>
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
                <form method="post" action="/CustomerServlet?action=edit">
                    <div class="modal-body">
                        <table>
                            <tr class="mb-3">
                                <td> * Edit Id:</td>
                                <td>
                                    <input type="number" id='idEdit' hidden name='id'>
                                </td>
                            </tr>
                            <tr class="mb-3">
                                <td> * Input New TypeId:</td>
                                <td>
                                    <input class="form-control" type="number" id="typeId" name="typeId"
                                           value="${customer.getTypeId()}"><br>
                                </td>
                            </tr>

                            <tr class="mb-3">
                                <td> * Input New NAME :</td>
                                <td>
                                    <input class="form-control" type="text" name="name" id="name"
                                           value="${customer.getName()}"><br>
                                </td>
                            </tr>

                            <tr class="mb-3">
                                <td> * Input New DATE OF BIRTH :</td>
                                <td>
                                    <input class="form-control" type="text" name="dateOfBirth" id="dateOfBirth"
                                           value="${customer.getDateOfBirth()}"><br>
                                </td>
                            </tr>

                            <tr class="mb-3">
                                <td> * Input New GENDER :</td>
                                <td>
                                    <input class="form-control" type="text" name="gender" id="gender"
                                           value="${customer.getGender()}"><br>
                                </td>
                            </tr>

                            <tr>
                                <td * class="mb-3"> Input New ID CARD :</td>
                                <td>
                                    <input class="form-control" type="text" name="idCard" id="idCard"
                                           value="${customer.getIdCard()}"><br>
                                </td>
                            </tr>

                            <tr>
                                <td * class="mb-3"> Input New PHONE NUMBER :</td>
                                <td>
                                    <input class="form-control" type="text" name="phoneNumber" id="phoneNumber"
                                           value="${customer.getPhoneNumber()}"><br>
                                </td>
                            </tr>
                            value="${customer.getPhoneNumber()}
                            <tr>
                                <td * class="mb-3"> Input New EMAIL :</td>
                                <td>
                                    <input class="form-control" type="text" id="email" name="email"
                                           value="${customer.getEmail()}"><br>
                                </td>
                            </tr>

                            <tr>
                                <td * class="mb-3"> Input New ADDRESS :</td>
                                <td>
                                    <input class="form-control" type="text" name="address" id="address"
                                           value="${customer.getAddress()}"><br>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                </form>
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
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#customer').dataTable({
            dom: 'lrtip',
            lengthChange: false,
            pageLength: 4,
            bInfo: false,
            // "pagingType": 'full_numbers',
        });
    });

    function deleteCustomer(id, name) {
        document.getElementById('idDelete').value = id;
        document.getElementById('nameDelete').innerText = name;
    }

    function editCustomer(id, typeId, name, dateOfBirth, gender, idCard, phoneNumber, email, address) {
        document.getElementById('idEdit').value = id;
        document.getElementById('typeId').value = typeId;
        document.getElementById('name').value = name;
        document.getElementById('dateOfBirth').value = dateOfBirth;
        document.getElementById('gender').value = gender
        document.getElementById('idCard').value = idCard
        document.getElementById('phoneNumber').value = phoneNumber
        document.getElementById('email').value = email
        document.getElementById('address').value = address
    }
</script>
</html>
