<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    // Ensure the session exists and the user is logged in
    HttpSession userSession = request.getSession(false);
    if (userSession == null || userSession.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String username = (String) userSession.getAttribute("username");
    String sessionId = userSession.getId();
    Long loginTimeMillis = (Long) userSession.getAttribute("loginTime");
    
    String loginTimeStr = "";
    if (loginTimeMillis != null) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        loginTimeStr = sdf.format(new Date(loginTimeMillis));
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container dashboard-container">
        <div class="glass-card">
            <h2>Welcome, <%= username %>!</h2>
            
            <p style="text-align: center; color: var(--text-muted); margin-bottom: 20px;">
                You have successfully logged in. Here are your session details:
            </p>

            <div class="dashboard-stats">
                <div class="stat-card">
                    <div class="stat-label">Session ID</div>
                    <div class="stat-value"><%= sessionId %></div>
                </div>
                <div class="stat-card">
                    <div class="stat-label">Login Time</div>
                    <div class="stat-value"><%= loginTimeStr %></div>
                </div>
            </div>

            <form action="logout" method="GET">
                <button type="submit" class="btn">Logout</button>
            </form>
        </div>
    </div>
</body>
</html>
