<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/27/2021
  Time: 12:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        h1{
            text-align: center;
            height: 70px;
        }
        table{
            width: 100%;
            border-collapse: collapse;
        }
        img{
            width: 50px;
            height: 50px;
        }
        th{
            width: 25%;
            border-bottom: 1px solid grey;
        }
        td{
            border-bottom: 1px solid grey;
        }
        tr{
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>Danh Sách Khách Hàng</h1>
    <table>
        <thead>
            <tr>
                <th>Tên</th>
                <th>Ngày Sinh</th>
                <th>Địa chỉ</th>
                <th>Ảnh</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="student" items="${customerList}">
                <tr>
                    <td>${student.name}</td>
                    <td>${student.birthday}</td>
                    <td>${student.address}</td>
                    <td><img src="data:image/jpeg;base64,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"></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
