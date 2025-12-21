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
            <c:when test="${not empty fee}">
                <table>
                    <thead>
                        <tr>
                            <th>
                                <a href="fee?action=sort&sortBy=id&order=${sortBy=='id' && order=='asc' ? 'desc' : 'asc'}">
                                    ID
                                    <c:if test="${sortBy=='id'}">${order=='asc' ? '▲' : '▼'}</c:if>
                                </a>
                            </th>
                            <th>
                                <a href="fee?action=sort&sortBy=student&order=${sortBy=='id' && order=='asc' ? 'desc' : 'asc'}">
                                    Student
                                    <c:if test="${sortBy=='fee_student'}">${order=='asc' ? '▲' : '▼'}</c:if>
                                </a>
                            </th>
                            <th>
                                <a href="fee?action=sort&sortBy=fee_name&order=${sortBy=='student_code' && order=='asc' ? 'desc' : 'asc'}">
                                    Fee Name
                                    <c:if test="${sortBy=='fee_name'}">${order=='asc' ? '▲' : '▼'}</c:if>
                                </a>
                            </th>
                            <th>
                                <a href="fee?action=sort&sortBy=fee_value&order=${sortBy=='full_name' && order=='asc' ? 'desc' : 'asc'}">
                                    Fee Value
                                    <c:if test="${sortBy=='fee_value'}">${order=='asc' ? '▲' : '▼'}</c:if>
                                </a>
                            </th>
                            <th>
                                <a href="fee?action=sort&sortBy=fee_expiration&order=${sortBy=='email' && order=='asc' ? 'desc' : 'asc'}">
                                    Expiration
                                    <c:if test="${sortBy=='fee_expiration'}">${order=='asc' ? '▲' : '▼'}</c:if>
                                </a>
                            </th>
                            <th>
                                <a href="fee?action=sort&sortBy=fee_paid&order=${sortBy=='major' && order=='asc' ? 'desc' : 'asc'}">
                                    Paid
                                    <c:if test="${sortBy=='fee_paid'}">${order=='asc' ? '▲' : '▼'}</c:if>
                                </a>
                            </th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="fee" items="${fee}">
                            <tr>
                                <td>${fee.id}</td>
                                <td>${fee.fee_student}</td>
                                <td><strong>${fee.fee_name}</strong></td>
                                <td>${fee.fee_value}</td>
                                <td>${fee.fee_expiration}</td>
                                <td>${fee.fee_paid}</td>
                                    <c:if test="${sessionScope.role eq 'admin'}">
                                        <td>
                                            <div class="actions">
                                                <a href="fee?action=edit&id=${fee.id}" class="btn btn-secondary">✏️ Edit</a>
                                                <a href="fee?action=delete&id=${fee.id}"
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