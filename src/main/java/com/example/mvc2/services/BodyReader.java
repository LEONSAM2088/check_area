package com.example.mvc2.services;

import jakarta.servlet.http.HttpServletRequest;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;

public class BodyReader {
    public static String extractPostRequestBody(HttpServletRequest request) {
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            Scanner s = null;
            try {
                s = new Scanner(request.getInputStream(), StandardCharsets.UTF_8).useDelimiter("\\A");
            } catch (IOException e) {
                e.printStackTrace();
            }
            assert s != null;
            return s.hasNext() ? s.next() : "";
        }
        return "";
    }
}
