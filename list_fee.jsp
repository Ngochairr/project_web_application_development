<%-- 
    Document   : fee
    Created on : Dec 16, 2025, 3:28:58 PM
    Author     : admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Fees</title>
        <link rel="stylesheet" href="styles/lists.css"> <!-- This line links your CSS file -->
    </head>
    <body>
        <!-- Fee Table -->
        <c:choose>
            <c:when test="${not empty fee}">
                <table>
                    <thead>
                        <tr>
                            <th>
                                <a href="fee?action=sort&sortBy=id&order=${sortBy=='fee_id' && order=='asc' ? 'desc' : 'asc'}">
                                    ID
                                    <c:if test="${sortBy=='fee_id'}">${order=='asc' ? '▲' : '▼'}</c:if>
                                </a>
                            </th>
                            <th>
                                <a href="fee?action=sort&sortBy=student&order=${sortBy=='student_id' && order=='asc' ? 'desc' : 'asc'}">
                                    Student
                                    <c:if test="${sortBy=='student_id'}">${order=='asc' ? '▲' : '▼'}</c:if>
                                </a>
                            </th>
                            <th>
                                <a href="fee?action=sort&sortBy=name&order=${sortBy=='student_code' && order=='asc' ? 'desc' : 'asc'}">
                                    Fee Name
                                    <c:if test="${sortBy=='name'}">${order=='asc' ? '▲' : '▼'}</c:if>
                                </a>
                            </th>
                            <th>
                                <a href="fee?action=sort&sortBy=value&order=${sortBy=='full_name' && order=='asc' ? 'desc' : 'asc'}">
                                    Fee Value
                                    <c:if test="${sortBy=='value'}">${order=='asc' ? '▲' : '▼'}</c:if>
                                </a>
                            </th>
                            <th>
                                <a href="fee?action=sort&sortBy=expiration&order=${sortBy=='email' && order=='asc' ? 'desc' : 'asc'}">
                                    Expiration
                                    <c:if test="${sortBy=='expiration'}">${order=='asc' ? '▲' : '▼'}</c:if>
                                </a>
                            </th>
                            <th>
                                <a href="fee?action=sort&sortBy=paid&order=${sortBy=='major' && order=='asc' ? 'desc' : 'asc'}">
                                    Paid
                                    <c:if test="${sortBy=='paid'}">${order=='asc' ? '▲' : '▼'}</c:if>
                                </a>
                            </th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="fee" items="${fee}">
                            <tr>
                                <td>${fee.fee_id}</td>
                                <td>${fee.student_id}</td>
                                <td><strong>${fee.name}</strong></td>
                                <td>${fee.value}</td>
                                <td>${fee.expiration}</td>
                                <td>${fee.paid}</td>
                                    <c:if test="${sessionScope.role eq 'admin'}">
                                        <td>
                                            <div class="actions">
                                                <a href="fee?action=edit&id=${fee.fee_id}" class="btn btn-secondary">✏️ Edit</a>
                                                <a href="fee?action=delete&id=${feefee_idid}" 
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
                    <h3>No unpaid fees</h3>
                </div>
            </c:otherwise>
        <div class="pagination">
            <!-- Previous button -->
            <c:if test="${currentPage > 1}">
                <a href="fee?action=list&page=${currentPage - 1}">« Previous</a>
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
                        <a href="fee?action=list&page=${i}">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <!-- Next button -->
            <c:if test="${currentPage < totalPages}">
                <a href="fee?action=list&page=${currentPage + 1}">Next »</a>
            </c:if>
            <c:if test="${currentPage == totalPages}">
                <span class="disabled">Next »</span>
            </c:if>
        </div>
    </body>
</html>
