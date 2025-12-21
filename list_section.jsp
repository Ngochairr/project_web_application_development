<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Section List</title>
    <link rel="stylesheet" href="styles/generic.css"> <!-- This line links your CSS file -->
</head>
<body>
     <!-- Navigation Bar -->
    <div class="navbar">
        <h2>📚 Student Management System</h2>
        <div class="navbar-right">
            <div class="user-info">
                <span>Welcome, ${sessionScope.fullName}</span>
                <span class="role-badge role-${sessionScope.role}">
                    ${sessionScope.role}
                </span>
            </div>
            <a href="dashboard" class="btn-nav">Dashboard</a>
            <a href="logout" class="btn-logout">Logout</a>
        </div>
    </div>
    <!-- TODO: Show error from URL parameter -->
    <c:if test="${not empty param.error}">
        <div class="alert alert-error">
            ${param.error}
        </div>
    </c:if>

    <!-- TODO: Add button - Admin only -->
    <c:if test="${sessionScope.role eq 'admin'}">
        <a href="section?action=new">➕ Add New Section</a>
    </c:if>

    <!-- In table header -->
    <c:if test="${sessionScope.role eq 'admin'}">
        <th>Actions</th>
    </c:if>

    <!-- In table rows -->
    <c:if test="${sessionScope.role eq 'admin'}">
        <td>
            <a href="section?action=edit&id=${section.id}">Edit</a>
            <a href="section?action=delete&id=${section.id}">Delete</a>
        </td>
    </c:if>
    <div class="container">
        <h1>📚 Student Management System</h1>
        <p class="subtitle">MVC Pattern with Jakarta EE & JSTL</p>
        
        <!-- Success Message -->
        <c:if test="${not empty param.message}">
            <div class="message success">
                ✅ ${param.message}
            </div>
        </c:if>
        
        <!-- Error Message -->
        <c:if test="${not empty param.error}">
            <div class="message error">
                ❌ ${param.error}
            </div>
        </c:if>
        
        <!-- Add New Student Button -->
        <div style="margin-bottom: 20px;">
            <a href="section?action=new" class="btn btn-primary">
                ➕ Add New Section
            </a>
        </div>
        <!-- Check if keyword exists -->
        <c:if test="${not empty keyword}">
            <div class="keyword success">
                Search Results for: ${keyword}
            </div>
        </c:if>

        <!-- Preserve value in input -->
        
        <div class = "searchbox">
            <form action="section" method="get" style="margin-bottom: 20px;">
                <input type="hidden" name="action" value="search">

                <input type="text" name="keyword" value="${keyword}">

                <button type="submit">Search</button>
                <!-- Show "Clear" button ONLY when keyword is active -->
                <c:if test="${not empty keyword}">
                    <a href="section"class="btn">
                        Show All
                    </a>
                </c:if>
            </form>
        </div> 

        <!-- Student Table -->
        <c:choose>
            <c:when test="${not empty sections}">
                <table>
                    <thead>
                        <tr>
                            <th>
                                <a href="section?action=sort&sortBy=roll&order=${sortBy=='roll' && order=='asc' ? 'desc' : 'asc'}">
                                    ID
                                    <c:if test="${sortBy=='roll'}">${order=='asc' ? '▲' : '▼'}</c:if>
                                </a>
                            </th>
                            <th>
                                <a href="section?action=sort&sortBy=sectionsection&order=${sortBy=='sectionsection' && order=='asc' ? 'desc' : 'asc'}">
                                    Code
                                    <c:if test="${sortBy=='sectionsection'}">${order=='asc' ? '▲' : '▼'}</c:if>
                                </a>
                            </th>
                            <th>
                                <a href="section?action=sort&sortBy=fullName&order=${sortBy=='fullName' && order=='asc' ? 'desc' : 'asc'}">
                                    Name
                                    <c:if test="${sortBy=='fullName'}">${order=='asc' ? '▲' : '▼'}</c:if>
                                </a>
                            </th>
                            <th>
                                <a href="section?action=sort&sortBy=section&order=${sortBy=='section' && order=='asc' ? 'desc' : 'asc'}">
                                    Email
                                    <c:if test="${sortBy=='section'}">${order=='asc' ? '▲' : '▼'}</c:if>
                                </a>
                            </th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="section" items="${sections}">
                            <tr>
                                <td>${section.roll}</td>
                                <td>${section.sectionsection}</td>
                                <td>${section.fullName}</td>
                                <td>${section.class}</td>
                                    <c:if test="${sessionScope.role eq 'admin'}">
                                        <td>
                                            <div class="actions">
                                                <a href="section?action=edit&id=${section.id}" class="btn btn-secondary">✏️ Edit</a>
                                                <a href="section?action=delete&id=${section.id}" 
                                                   class="btn btn-danger" 
                                                   onclick="return confirm('Are you sure?')">🗑️ Delete</a>
                                            </div>
                                        </td>
                                    </c:if>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="empty-state">
                    <div class="empty-state-icon">📭</div>
                    <h3>No sections found</h3>
                    <p>Start by adding a new section</p>
                </div>
            </c:otherwise>
            
        </c:choose>
        <div class="pagination">
            <!-- Previous button -->
            <c:if test="${currentPage > 1}">
                <a href="section?action=list&page=${currentPage - 1}">« Previous</a>
            </c:if>
            <c:if test="${currentPage == 1}">
                <span class="disabled">« Previous</span>
            </c:if>

            <!-- Page numbers -->
            <c:forEach begin="1" end="${totalPages}" var="i">
                <c:choose>
                    <c:when test="${i == currentPage}">
                        <strong>${i}</strong>
                    </c:when>
                    <c:otherwise>
                        <a href="section?action=list&page=${i}">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <!-- Next button -->
            <c:if test="${currentPage < totalPages}">
                <a href="section?action=list&page=${currentPage + 1}">Next »</a>
            </c:if>
            <c:if test="${currentPage == totalPages}">
                <span class="disabled">Next »</span>
            </c:if>
        </div>
    
</body>
</html>