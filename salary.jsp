<%-- 
    Document   : salary
    Created on : Dec 16, 2025, 3:29:23 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Salary</title>
        <link rel="stylesheet" href="styles/lists.css"> 
    </head>
    <body>
        <c:forEach var="salary" items="${salaryList}">
            <c:if test="${salary.staffId == param.id}">
                <p>Staff: ${salary.staff_id}</p>
                <p>Salary ID: ${salary.id}</p>
                <p>Salary: ${salary.salary_amount}</p>
                <p>Payment date: ${salary.date}</p>
            </c:if>
        </c:forEach>
        <c:if test="${sessionScope.role eq 'admin'}">
                                        <td>
                                            <div class="actions">
                                                <a href="salary?action=edit&id=${staff.id}" class="btn btn-secondary">✏️ Edit</a>
                                            </div>
                                        </td>
       </c:if>
    </body>
</html>
