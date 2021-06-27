<%@ page import="java.io.PrintWriter" %>
<%@ page import="model.Calculator" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/27/2021
  Time: 6:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% float firstOperand = Integer.parseInt(request.getParameter("first-operand"));%>
<% float secondOperand = Integer.parseInt(request.getParameter("second-operand"));%>
<% char operator = request.getParameter("operator").charAt(0);%>
<% String string = null; %>
<% try {
    float result = Calculator.calculate(firstOperand, secondOperand, operator);
    string = firstOperand + " " + operator + " " + secondOperand + " = " + result;
} catch (Exception ex) {
    string = "Error: " + ex.getMessage();
}
%>
<h1>Result:</h1>
<p><%=string%></p>
</body>
</html>
