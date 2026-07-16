<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String rememberedUser = "";
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("remember_me".equals(cookie.getName())) {
                rememberedUser = cookie.getValue();
            }
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <div class="glass-card">
            <h2>Welcome Back</h2>
            
            <% 
                String error = (String) request.getAttribute("error");
                if (error != null) { 
            %>
                <div class="error-message"><%= error %></div>
            <% } %>

            <form action="login" method="POST">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" value="<%= rememberedUser %>" required placeholder="Enter your username">
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required placeholder="Enter your password">
                </div>

                <div class="checkbox-group">
                    <input type="checkbox" id="rememberMe" name="rememberMe" <%= !rememberedUser.isEmpty() ? "checked" : "" %>>
                    <label for="rememberMe">Remember Me</label>
                </div>

                <button type="submit" class="btn">Sign In</button>
            </form>
        </div>
    </div>
</body>
</html>
