package com.example.mvc2.controller;

import com.example.mvc2.models.Point;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import static com.example.mvc2.Table.points;

@WebServlet(name = "AreaCheckServlet", value = "/areacheck-servlet")
public class AreaCheckServlet extends HttpServlet {

    List<Point> points1;

    public void init() {
        points1 = new ArrayList<>();
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        points1 = new ArrayList<>();
        Point point;
        try {
            point = (Point) request.getAttribute("Point");
        }catch (Exception e) {
            return;
        }

        double X = point.X;
        double Y = point.Y;
        double R = point.R;

        // circle
        if(X>=0 && Y>=0)
           if (X*X + Y*Y <= (R/2)*(R/2)) {
               point.isCatch = true;
           }
        // triangle
        if(X>=0 && Y <=0)
            if(Y >= X/2 - R/2){
                point.isCatch = true;
            }
        // square
        if(X<=0 && Y <=0)
            if(X >=  -R/2 && Y>= -R){
                point.isCatch = true;
            }

        point.setX(round(point.getX(), 2));
        point.setY(round(point.getY(), 2));


        System.out.println(point.getX());
        if(request.getServletContext().getAttribute("Points")!=null)
            points1 =  (List<Point>) request.getServletContext().getAttribute("Points");
        points1.add(point);
        request.getServletContext().setAttribute("Points", points1);

        response.setContentType("text/html");
        response.setStatus(point.isCatch?209:210);
        System.out.println(point.getX());
        getServletContext().getRequestDispatcher("/point.jsp").forward(request, response);


    }




    public void destroy() {
    }

    public static double round(double val, int places) {
        if (places < 0) throw new IllegalArgumentException();

        long factor = (long) Math.pow(10, places);
        val = val * factor;
        long tmp = Math.round(val);
        return (double) tmp / factor;
    }
}
