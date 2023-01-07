<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2023-01-07
  Time: 11:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create New Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="../viewALL/furama.css" rel="stylesheet">
    <style>
        .background {
            color: red;
            background-color: aquamarine;;
            margin: 0px;
        }
    </style>
</head>
<body>
<div class="row">
    <c:import url="../viewALL/header.jsp"></c:import>
</div>
<div class="row">
    <c:import url="../viewALL/navbar.jsp"></c:import>
</div>

<div class="background">
    <h2 class=" background">CREATE NEW CUSTOMER</h2>
</div>

<hr>
<div class="row background">
    <div class="col-lg-5 col-sm-12">
        <form>
            <fieldset>
                <table>

                    <tr class="mb-3">
                        <td> * Input New ID:</td>
                        <td>
                            <input class="form-control" hidden type="number" name="id"><br>
                        </td>
                    </tr>

                    <tr class="mb-3">
                        <td> * Input New NAME :</td>
                        <td>
                            <input class="form-control" type="text" name="name"><br>
                        </td>
                    </tr>

                    <tr class="mb-3">
                        <td> * Input New DATE OF BIRTH :</td>
                        <td>
                            <input class="form-control" type="text" name="dateofbirth"><br>
                        </td>
                    </tr>

                    <tr class="mb-3">
                        <td> * Input New GENDER :</td>
                        <td>
                            <input class="form-control" type="text" name="gender"><br>
                        </td>
                    </tr>

                    <tr>
                        <td * class="mb-3"> Input New ID CARD :</td>
                        <td>
                            <input class="form-control" type="text" name="idcard"><br>
                        </td>
                    </tr>

                    <tr>
                        <td * class="mb-3"> Input New PHONE NUMBER :</td>
                        <td>
                            <input class="form-control" type="text" name="phonenumber"><br>
                        </td>
                    </tr>

                    <tr>
                        <td * class="mb-3"> Input New EMAIL :</td>
                        <td>
                            <input class="form-control" type="text" name="email"><br>
                        </td>
                    </tr>

                    <tr>
                        <td * class="mb-3"> Input New ADDRESS :</td>
                        <td>
                            <input class="form-control" type="text" name="address"><br>
                        </td>
                    </tr>

                    <tr class="mb-3">
                        <td> * Input New CUSTOMER TYPE NAME :</td>
                        <td>
                            <input class="form-control" type="text" name="type"><br>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>-------------------------------------</p>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <button type="submit" class="btn btn-outline-primary background" >Create New Customer</button>
                        </td>
                        <td>
                            <button type="submit" class="btn btn-outline-primary background" >Back In List Customer
                            </button>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </div>
    <div class="col-lg-7 col-sm-12 ">
        <img src="https://furamavietnam.com/wp-content/uploads/2018/10/Vietnam_Danang_Furama_Resort_Exterior_Courtyard-1.jpg" width="100%" style="padding-top: 30px">
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
