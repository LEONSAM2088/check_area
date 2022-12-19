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
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main/main.css">
</head>
<body>

<div class="page">
    <div class="header">


        <div id="menu-main">
            <div id="logo">00:48</div>
            <ul id="navbar">
                <li><a class="neon" href="https://www.youtube.com/watch?v=LYmWO4vvYHg&amp;t=19049s">Долотов</a></li>
                <li><a class="flux" href="https://youtu.be/en353Wp0GQU">Леонид</a></li>
                <li><a class="neon" href="https://youtu.be/lRrOLTHu-ew">Михайлович</a></li>
                <li><a class="flux" href="https://youtu.be/A7eqzo0xLx0">2142</a></li>

            </ul>

            <div id="reg-field">P33202</div>
        </div>
    </div>
    <div class="content">
        <div id="left-bar"></div>
        <div id="inside">

            <div id="list-blat">

                <div id="interface">
                    <table>
                        <thead>
                        <tr>
                            <th>X</th>
                            <th>Y</th>
                            <th>R</th>
                            <th>Точка в области</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>${requestScope.Point.getX()}</td>
                            <td>${requestScope.Point.getY()}</td>
                            <td>${requestScope.Point.getR()}</td>
                            <td>${requestScope.Point.isCatch()?"Да":"Нет"}</td>

                        </tr>








                        </tbody>
                    </table>
                    <a href="${pageContext.request.contextPath}/controller-servlet">Вернуться к форме</a>

                </div>



            </div>

        </div>

        <div id="right-bar"></div>
    </div>
    <div class="footer">

    </div>
</div>

</body>
</html>