<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/6/2021
  Time: 8:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../assert/bootstrap4/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="assert/datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<jsp:include page="/layout1/header.jsp"></jsp:include>

<div class="container-fluid mt-2">
    <h2>ADD New Employee</h2>
    <form action="/employee" method="post">
        <input type="hidden" name="action" value="create">
        <div>
            <div class="form-group">
                <label class="mt-2">Name :</label>
                <input class="form-control" type="text" name="name" style="width: 80%" value="${employee.name}">

                <label class="mt-2">Birthday :</label>
                <input class="form-control" type="date" name="birthday" style="width: 80%" value="${employee.birthday}">

                <label class="mt-2">Id Card :</label>
                <input class="form-control" type="text" name="idCard" aria-describedby="idCard" style="width: 80%" value="${employee.idCard}">
                <c:if test="${messIdCard != null}">
                    <small id="idCard" class="form-text text-danger">${messIdCard}</small>
                </c:if>

                <label>Salary :</label>
                <input class="form-control" type="text" name="salary" aria-describedby="salary"  style="width: 80%" value="${employee.salary}">
                <c:if test="${messSalary != null}">
                    <small id="salary" class="form-text text-danger">${messSalary}</small>
                </c:if>

                <label class="mt-2">Phone :</label>
                <input class="form-control" type="text" name="phone" aria-describedby="phone" style="width: 80%" value="${employee.phone}">
                <c:if test="${messPhone != null}">
                    <small id="phone" class="form-text text-danger">${messPhone}</small>
                </c:if>

                <label class="mt-2">Email :</label>
                <input class="form-control" type="text" name="email" aria-describedby="email" style="width: 80%" value="${employee.email}">
                <c:if test="${messEmail != null}">
                    <small id="email" class="form-text text-danger">${messEmail}</small>
                </c:if>

                <label class="mt-2">Address :</label>
                <input class="form-control" type="text" name="address" style="width: 80%" value="${employee.address}">

                <label class="mt-2">Position Id :</label>
                <input class="form-control" type="number" name="positionId" style="width: 80%" value="${employee.positionId}">

                <label class="mt-2">Education Degree Id :</label>
                <input class="form-control" type="text" name="educationDegreeId" style="width: 80%" value="${employee.educationDegreeId}">

                <label class="mt-2">Division Id :</label>
                <input class="form-control" type="text" name="divisionId" style="width: 80%" value="${employee.divisionId}">

                <label class="mt-2">Username :</label>
                <input class="form-control" type="text" name="username" style="width: 80%" value="${employee.username}">
            </div>
        </div>

        <div class="mt-2">
            <input class="btn btn-success" type="submit" value="Create"> |
            <a class="btn btn-dark" href="/employee" role="button">Back</a>
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
