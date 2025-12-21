<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
</head>
<body>
    <!-- Navigation Bar -->
    <div class="navbar">
        <h2>📚 Student Management System</h2>
        <div class="navbar-right">
            <div class="user-info">
                <span>${sessionScope.fullName}</span>
                <span class="role-badge role-${sessionScope.role}">
                    ${sessionScope.role}
                </span>
            </div>
            <a href="logout" class="btn-logout">Logout</a>
            <a href="change-password" class="btn-logout">Change Password</a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container">
        <!-- Welcome Card -->
        <div class="welcome-card">
            <h1>${welcomeMessage}</h1>
            <p>Here's what's happening with your students today.</p>
        </div>

        <!-- Statistics -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-icon stat-icon-students">
                    👨‍🎓
                </div>
                <div class="stat-content">
                    <h3>${totalStudents}</h3>
                    <p>Total Students</p>
                </div>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="quick-actions">
            <h2>Quick Actions</h2>
            <div class="action-grid">
                <a href="student?action=list" class="action-btn action-btn-primary">
                    📋 View All Students
                </a>
                <a href="staff?action=list" class="action-btn action-btn-primary">
                    📋 View All Staff
                </a>
                <c:if test="${sessionScope.role eq 'student' || sessionScope.role eq 'admin' }">
                <a href="fee?action=list" class="action-btn action-btn-primary">
                    📋 View All Fees
                </a>
                </c:if>
                <a href="timetable?action=list" class="action-btn action-btn-primary">
                    📋 View Timetable
                </a>
                <a href="section?action=list" class="action-btn action-btn-primary">
                    📋 View Sections
                </a>
                <c:if test="${sessionScope.role eq 'staff'}">
                    <a href="salary?id=${sessionScope.username}" class="action-btn action-btn-success">
                        📋 View Salary
                    </a>
                </c:if>
                <c:if test="${sessionScope.role eq 'admin'}">
                    <a href="student?action=new" class="action-btn action-btn-success">
                        ➕ Add New Student
                    </a>
                </c:if>
                <c:if test="${sessionScope.role eq 'admin'}">
                    <a href="staff?action=new" class="action-btn action-btn-success">
                        ➕ Add New Staff
                    </a>
                </c:if>
                <c:if test="${sessionScope.role eq 'admin'}">
                    <a href="fee?action=new" class="action-btn action-btn-success">
                        ➕ Add New Fee
                    </a>
                </c:if>

                <a href="student?action=search" class="action-btn action-btn-warning">
                    🔍 Search Students
                </a>
                <a href="staff?action=search" class="action-btn action-btn-warning">
                    🔍 Search Staffs
                </a>
                <a href="fee?action=search" class="action-btn action-btn-warning">
                    🔍 Search Fees
                </a>
            </div>
        </div>
    </div>
</body>
</html>