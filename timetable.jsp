<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Fees</title>
</head>
<body>
<c:choose>
    <c:when test="${sessionScope.role eq 'student' && fee.paid eq 'false'}">
        <div class="empty-state">
            <div class="empty-state-icon">📭</div>
            <h3>You cannot view this page due to unpaid fees</h3>
        </div>
    </c:when>
    <c:otherwise>
        <table border="1">
            <thead>
                <tr>
                    <th></th>
                    <th>Monday</th>
                    <th>Tuesday</th>
                    <th>Wednesday</th>
                    <th>Thursday</th>
                    <th>Friday</th>
                    <th>Saturday</th>
                    <th>Sunday</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="period" begin="1" end="16">
                    <tr>
                        <td><strong>Period ${period}</strong></td>
                        <c:forEach var="day" begin="1" end="7">
                            <td>
                                <c:forEach var="entry" items="${timetableList}">
                                    <c:if test="${day == entry.day && param.period >= entry.startTime && period <= entry.endTime && entry.dayOfWeek == day}">
                                        <c:choose>
                                            <c:when test="${sessionScope.role eq 'admin'}">
                                                <div class="empty-state">
                                                    <a href="section?action=edit&id=${staff.id}" class="btn btn-secondary">Room: ${entry.room_name}</a>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                Room: ${entry.room_name}
                                            </c:otherwise>
                                        </c:choose>
                                        ${entry.subject}<br/>
                                        ${entry.teacherName}
                                    </c:if>
                                </c:forEach>
                            </td>
                        </c:forEach>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>
</body>
</html>