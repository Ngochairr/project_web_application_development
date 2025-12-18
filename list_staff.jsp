<%-- 
    Document   : list_staff
    Created on : Dec 17, 2025, 7:04:31 PM
    Author     : admin
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Fees</title>
        <link rel="stylesheet" href="styles/generic.css"> <!-- This line links your CSS file -->
    </head>
    <body>
        <!-- Fee Table -->
        <c:choose>
            <c:when test="${not empty staff}">
                <table>
                    <thead>
                        <tr>
                            <th>
                                <a href="staff?action=sort&sortBy=id&order=${sortBy=='id' && order=='asc' ? 'desc' : 'asc'}">
                                    ID
                                    <c:if test="${sortBy=='id'}">${order=='asc' ? '▲' : '▼'}</c:if>
                                </a>
                            </th>
                            <th>
                                <a href="staff?action=sort&sortBy=student&order=${sortBy=='staff_role' && order=='asc' ? 'desc' : 'asc'}">
                                    Student
                                    <c:if test="${sortBy=='staff_role'}">${order=='asc' ? '▲' : '▼'}</c:if>
                                </a>
                            </th>
                            <th>
                                <a href="staff?action=sort&sortBy=staff_name&order=${sortBy=='staff_name' && order=='asc' ? 'desc' : 'asc'}">
                                    Fee Name
                                    <c:if test="${sortBy=='staff_name'}">${order=='asc' ? '▲' : '▼'}</c:if>
                                </a>
                            </th>
                            <th>
                                <a href="staff?action=sort&sortBy=salary_amount&order=${sortBy=='salary_amount' && order=='asc' ? 'desc' : 'asc'}">
                                    Fee Value
                                    <c:if test="${sortBy=='salary_amount'}">${order=='asc' ? '▲' : '▼'}</c:if>
                                </a>
                            </th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="staff" items="${staffs}">
                            <tr>
                                <td>${staff.id}</td>
                                <td>${staff.staff_role}</td>
                                <td><strong>${staff.staff_name}</strong></td>
                                <td><a href="salary?id=${staff.id}" class="btn btn-secondary">${staffs.salary.salary_amount}</a></td>
                                    <c:if test="${sessionScope.role eq 'admin'}">
                                        <td>
                                            <div class="actions">
                                                <a href="timetable?action=edit&id=${staff.id}" class="btn btn-secondary">View Classes</a>
                                                <a href="staff?action=edit&id=${staff.id}" class="btn btn-secondary">✏️ Edit</a>
                                                <a href="staff?action=delete&id=${staff.id}" 
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
        </c:choose>
            <c:otherwise>
                <div class="empty-state">
                    <div class="empty-state-icon">📭</div>
                    <h3>No staff</h3>
                </div>
            </c:otherwise>
        <div class="pagination">
            <!-- Previous button -->
            <c:if test="${currentPage > 1}">
                <a href="staff?action=list&page=${currentPage - 1}">« Previous</a>
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
                        <a href="staff?action=list&page=${i}">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <!-- Next button -->
            <c:if test="${currentPage < totalPages}">
                <a href="staff?action=list&page=${currentPage + 1}">Next »</a>
            </c:if>
            <c:if test="${currentPage == totalPages}">
                <span class="disabled">Next »</span>
            </c:if>
        </div>
    </body>
</html>