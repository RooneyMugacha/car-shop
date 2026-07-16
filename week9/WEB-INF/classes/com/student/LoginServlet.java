package com.student;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");
        
        // Basic Validation
        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Username and Password cannot be empty!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // 1. Create a session
        HttpSession session = request.getSession(true);
        session.setAttribute("username", username);
        session.setAttribute("loginTime", System.currentTimeMillis());
        
        // 2. Cookie for Remember Me
        if ("on".equals(rememberMe)) {
            Cookie rememberCookie = new Cookie("remember_me", username);
            rememberCookie.setMaxAge(60 * 60 * 24 * 30); // 30 days
            response.addCookie(rememberCookie);
        } else {
            // Remove the cookie if checkbox is unchecked
            Cookie rememberCookie = new Cookie("remember_me", "");
            rememberCookie.setMaxAge(0); // Delete
            response.addCookie(rememberCookie);
        }
        
        // Redirect to dashboard
        response.sendRedirect("dashboard.jsp");
    }
}
