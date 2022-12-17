<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html><head>
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
        <meta charset="UTF-8">
        <title>Лаба</title>
        <script src="./js/click.js" type="text/javascript"></script>


        <!-- Настройка viewport -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Подключаем Bootstrap CSS -->
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



<p id="reason" style="color: red;"></p>

    <label>X </label>
    <div class = "X">

        <c:forEach var="counter" begin="1" end="9">
            <input id="<c:out value="${counter-5}" />X" type="button" name="X" onclick="click_X_box_handler(this.id)" style="background-color: #ffffff" value=<c:out value="${counter-5}" /> />
        </c:forEach>


    </div>

<p>Y <label for="Y"></label><input class="Y" id="Y" type="text" onkeydown="dirt_cleaner(this.id)" onkeyup="dirt_cleaner(this.id)" name="Y"/></p>

<label>R </label>
    <div class = "R">

        <label>
            <c:forEach var="counter" begin="1" end="5">
                <label><c:out value="${counter}" />
                    <input id="<c:out value="${counter}" />X" type="radio" name="R" onclick="click_R_box_handler(this.id)" value=<c:out value="${counter}" /> />
                </label>
            </c:forEach>


        </label>

    </div>

<p><input id="button" type="submit" onclick="click_handler()"/>
    <input id="reset_button" type="submit" onclick="reset_results()" value="Сбросить результаты"/></p>
                            <table>
                                <thead>
                                    <tr>
                                        <td>X</td>
                                        <td>Y</td>
                                        <td>R</td>
                                        <td>IsCathed</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="point" items="${Points}">
                                        <tr>
                                            <td><c:out value="${point.getX()}" /></td>
                                            <td><c:out value="${point.getY()}" /></td>
                                            <td><c:out value="${point.getR()}" /></td>
                                            <td><c:out value="${point.isCatch()}" /></td>
                                        </tr>

                                    </c:forEach>

                                </tbody>

                            </table>





                        </div>
                        <canvas id="my-canvas" width="224" height="215"></canvas>

                        </div>

                    </div>


                </div>
                <div id="right-bar"></div>
            </div>
            <div class="footer">

            </div>
        </div>

</body></html>
<style>

    #my-canvas { border: 1px solid gray; background-image: url("http://localhost:8080/images/areas.png");     display: block;}

</style>
<script>

    function drawPoint(context, x, y, color, size) {
        if (color == null) {
            color = '#000';
        }
        if (size == null) {
            size = 5;
        }

        // to increase smoothing for numbers with decimal part
        var pointX = Math.round(x);
        var pointY = Math.round(y);

        context.beginPath();
        context.fillStyle = color;
        context.arc(pointX, pointY, size, 0, 2 * Math.PI);
        context.fill();


    }




</script>
<script>



    graph = document.getElementById('graph');
    img = document.getElementById('my-canvas');
    img.addEventListener('click', async function(e) {
        let c = img.getBoundingClientRect()

        var canvas = document.querySelector('#my-canvas');
        var context = canvas.getContext('2d');

        let pointX = (e.clientX- c.left - 110.90625)/78 * currentR;
        let pointY = -(e.clientY-c.top - 110)/78*currentR;

        const response = await fetch('http://localhost:8080/controller-servlet', {method: "POST", body: JSON.stringify({ X: pointX, Y: pointY, R: currentR })});
        if (response.status===209) {
             drawPoint(context, e.clientX - c.left, e.clientY - c.top, 'black', 2);
        } else if(response.status===210) {
            drawPoint(context, e.clientX - c.left, e.clientY - c.top, 'red', 2);
        } else {
            const jsonResponse = await response.text();
        }



    });
</script>