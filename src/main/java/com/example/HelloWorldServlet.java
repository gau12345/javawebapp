package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.io.PrintWriter;


// Tells the web server to map requests to /hello to this servlet
@WebServlet("/hello")
public class HelloWorldServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; // Recommended for Servlets

    // This method handles GET requests
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Set the content type so the browser knows it's HTML
        response.setContentType("text/html");

        // Get the output stream to write the response
        PrintWriter out = response.getWriter();

        try {
            // Write the HTML response
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Hello World Servlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Hello, World from Eclipse Servlet!</h1>");
            out.println("<p>This app was created in Eclipse.</p>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            // Always close the writer
            out.close();
        }
    }
}