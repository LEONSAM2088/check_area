package com.example.mvc2.models;

import com.example.mvc2.services.BodyReader;
import com.google.gson.Gson;
import jakarta.servlet.http.HttpServletRequest;

public class Point {
    public final static double nullable = -909;

    public double getX() {
        return X;
    }

    public double getY() {
        return Y;
    }

    public double getR() {
        return R;
    }

    public boolean isCatch() {
        return isCatch;
    }

    public void setX(double x) {
        X = x;
    }

    public void setY(double y) {
        Y = y;
    }

    public double X = nullable;
    public double Y = nullable;
    public double R = nullable;
    public boolean isCatch = false;

    public static Point getPoint(HttpServletRequest request) {
        Gson gson = new Gson();
        String json = BodyReader.extractPostRequestBody(request);
        return gson.fromJson(json, Point.class);
    }
}
