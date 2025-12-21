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
        <form method="get">
            <label for="week"><strong>Select Week:</strong></label>
            <select name="week" id="week" onchange="this.form.submit()">
                <c:forEach var="w" begin="1" end="22">
                    <option value="${w}" ${param.week == w ? 'selected' : ''}>
                        Week ${w}
                    </option>
                </c:forEach>
            </select>
        </form>

        <c:set var="week" value="${empty param.week ? 1 : param.week}" />
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
                                    <c:if test="${day == entry.day
                                        && period >= entry.startTime
                                        && period <= entry.endTime
                                        && entry.startWeek <= week
                                        && entry.endWeek >= week}">
                                        Room: ${entry.room_name}<br/>
                                        ${entry.subject}<br/>
                                        ${entry.teacherName}<br/>
                                        ${entry.sectionname}<br/>
                                        ${entry.classname}
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