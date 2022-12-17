<%@ page import="com.example.mvc2.models.Point" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.mvc2.Table" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    final Point point = (Point) request.getAttribute ("Point");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Point</title>
</head>
<body>
<table>
    <thead>
    <tr>
        <th>X</th>
        <th>Y</th>
        <th>R</th>
        <th>Попал</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>${requestScope.Point.getX()}</td>
        <td>${requestScope.Point.getY()}</td>
        <td>${requestScope.Point.getR()}</td>
        <td>${requestScope.Point.isCatch()}</td>

    </tr>



    <a href="${pageContext.request.contextPath}/controller-servlet">Вернуться к форме</a>





    </tbody>
</table>


</body>
</html>