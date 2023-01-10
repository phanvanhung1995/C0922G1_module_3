<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2023-01-02
  Time: 2:38 PM
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

        .center {
            text-align: center;
            padding: 20px;
        }
    </style>
</head>
<body>
<div class="row ">
    <c:import url="../viewALL/header.jsp"></c:import>
</div>
<div class="row nav2">
    <c:import url="../viewALL/navbar.jsp"></c:import>
</div>
<div class="row">

    <h2 class="center background">LIST EMPLOYEE</h2>

    <hr>
    <form>
        <button style="float: left" type="submit" class="btn btn-primary btn-lg">Create New Customer</button>
    </form>
    <hr>
    <table id="employee" class="table table-dark table-striped">
        <thead>
        <tr style="text-align: center">
            <th>ID</th>
            <th>NAME</th>
            <th>DATE OF BIRTH</th>
            <th> ID CARD</th>
            <th> SALARY</th>
            <th> PHONE NUMBER</th>
            <th>EMAIL</th>
            <th>ADDRESS</th>
            <th>EDUCATION DEGREE ID</th>
            <th>POSITION ID</th>
            <th>DIVISION_ID</th>
            <th>EDIT</th>
            <th>DELETE</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="employee" items="${employeeList}">
            <tr style="text-align: center">
                <td>${employee.getId()}</td>
                <td>${employee.getName()}</td>
                <td>${employee.getDateOfBirth()}</td>
                <td>${employee.getIdCard()}</td>
                <td>${employee.getSalary()}</td>
                <td>${employee.getPhoneNumber()}</td>
                <td>${employee.getEmail()}</td>
                <td>${employee.getAddress()}</td>
                <c:forEach var="educationDegreeList" items="${educationDegreeList}">
                    <c:if test="${employee.getEducationDegreeId() == educationDegreeList.getId()}">
                        <td>${educationDegreeList.getName()}</td>
                    </c:if>
                </c:forEach>

                <c:forEach var="positionList" items="${positionList}">
                    <c:if test="${employee.getPositionId() == positionList.getId()}">
                        <td>${positionList.getName()}</td>
                    </c:if>
                </c:forEach>

                <c:forEach var="divisionList" items="${divisionList}">
                    <c:if test="${employee.getDivisionId() == divisionList.getId()}">
                        <td>${divisionList.getName()}</td>
                    </c:if>
                </c:forEach>
                <td>
                    <button type="submit" class="btn btn-outline-secondary" data-bs-toggle="modal"
                            data-bs-target="#exampleModal2">
                        <a href="/EmployeeServlet?action=edit&id=${employee.getId()}">edit</a>
                    </button>
                </td>
                <td>
                    <button type="submit" class="btn btn-outline-danger" data-bs-toggle="modal"
                            data-bs-target="#exampleModal">
                        <a href="/EmployeeServlet?action=delete&id=${employee.getId()}">delete</a>
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
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

<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#employee').dataTable({
            dom: 'lrtip',
            lengthChange: false,
            pageLength: 4,
            bInfo: false,
            // "pagingType": 'full_numbers',
        });
    });
</script>
</html>
