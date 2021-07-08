<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/6/2021
  Time: 8:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../assert/bootstrap4/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="assert/datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<jsp:include page="/layout1/header.jsp"></jsp:include>

<div class="container-fluid mt-2">
    <h2>ADD New Customer</h2>
    <form action="/customer" method="post">
        <input type="hidden" name="action" value="create">
        <div>
            <div class="form-group">
                <label>Customer code :</label>
                <input class="form-control" type="text" name="code" aria-describedby="code" style="width: 80%" value="${customer.code}">
                <c:if test="${messCustomercode != null}">
                <small id="code" class="form-text text-danger">${messCustomercode}</small>
                </c:if>

                <label class="mt-2">Customer Type Id :</label>
                <input class="form-control" type="number" name="customerTypeId" style="width: 80%" value="${customer.customerTypeId}">

                <label class="mt-2">name :</label>
                <input class="form-control" type="text" name="name" style="width: 80%" value="${customer.name}">

                <label class="mt-2">Birthday :</label>
                <input class="form-control" type="date" name="birthday" style="width: 80%" value="${customer.birthday}">

                <label for="gender">Gender</label>
                <select class="form-control" id="gender" name="gender" style="width: 80%">
                    <option value="0" ${customer.gender == 0 ? 'selected': ''}>Male</option>
                    <option value="1" ${customer.gender == 1 ? 'selected': ''}>Female</option>
                    <option value="2" ${customer.gender == 2 ? 'selected': ''}>Other</option>
                </select>

                <label class="mt-2">Id Card :</label>
                <input class="form-control" type="text" name="idCard" aria-describedby="idCard" style="width: 80%" value="${customer.idCard}">
                <c:if test="${messIdCard != null}">
                    <small id="idCard" class="form-text text-danger">${messIdCard}</small>
                </c:if>

                <label class="mt-2">Phone :</label>
                <input class="form-control" type="text" name="phone" aria-describedby="phone" style="width: 80%" value="${customer.phone}">
                <c:if test="${messPhone != null}">
                    <small id="phone" class="form-text text-danger">${messPhone}</small>
                </c:if>

                <label class="mt-2">Email :</label>
                <input class="form-control" type="text" name="email" aria-describedby="email" style="width: 80%" value="${customer.email}">
                <c:if test="${messEmail != null}">
                    <small id="email" class="form-text text-danger">${messEmail}</small>
                </c:if>

                <label class="mt-2">Address :</label>
                <input class="form-control" type="text" name="address" style="width: 80%" value="${customer.address}">
            </div>
        </div>

        <div class="mt-2">
            <input class="btn btn-success" type="submit" value="Create"> |
            <a class="btn btn-dark" href="/customer" role="button">Back</a>
        </div>
    </form>
</div>

<script src="../assert/jquery/jquery-3.5.1.min.js"></script>
<script src="assert/datatables/js/jquery.dataTables.min.js"></script>
<script src="assert/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="../assert/jquery/popper.min.js"></script>
<script src="../assert/bootstrap4/js/bootstrap.js"></script>

</body>
</html>
