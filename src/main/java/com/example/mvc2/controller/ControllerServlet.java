package com.example.mvc2.controller;

import com.example.mvc2.models.Point;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "controllerServlet", value = "/controller-servlet")
public class ControllerServlet extends HttpServlet {

    List<Point> points1;

    public void init() {
        points1 = new ArrayList<>();

    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getServletContext().getAttribute("Points")!=null) {
            boolean reset = Boolean.parseBoolean(request.getParameter("Reset"));

            if(reset) {
                request.getServletContext().removeAttribute("Points");
            } else {
                points1 = (List<Point>) request.getServletContext().getAttribute("Points");
            }
        }


        getServletContext().getRequestDispatcher("/main.jsp").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Point point = Point.getPoint(request);
        response.setContentType("text/html");
        if(point.Y != Point.nullable && point.X != Point.nullable && point.R != Point.nullable)
        {


            request.setAttribute("Point", point);
            request.getServletContext().getNamedDispatcher("AreaCheckServlet").forward(request, response);
        }
    }

    public void destroy() {
    }
}
