<%-- 
    Document   : form_student
    Created on : Dec 17, 2025, 7:19:08 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        <c:choose>
            <c:when test="${fees != null}">Edit Fee</c:when>
            <c:otherwise>Add Fee</c:otherwise>
        </c:choose>
    </title>
    </head>
<body>
    <div class="container">
        <h1>
             ✏️ Edit Salary
        </h1>
        
        <form action="salary" method="POST">
            <!-- Hidden field for action -->
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="${salary.id}">

            <!-- Salary ID -->
            <div class="form-group">
                <label for="salary_id">
                    Student Code <span class="required">*</span>
                </label>
                <input type="text" 
                       id="salary_id" 
                       name="salary_id" 
                       value="${salary.id}" 
                       <c:if test="${salary != null}">readonly</c:if> 
                       placeholder="e.g., SS001, SS23">
                <p class="info-text">Format: SS + 3 digits</p>
                <c:if test="${not empty errorSalaryID}">
                    <span class="error">${errorSalaryID}</span>
                </c:if>
            </div>

            <!-- Staff ID -->
            <div class="form-group">
                <label for="salary_staff">
                    Full Name <span class="required">*</span>
                </label>
                <input type="text" 
                       id="salary_staff" 
                       name="salary_staff" 
                       value="${salary.staffid}" 
                       required 
                       placeholder="Enter full name">
                <c:if test="${not empty errorSalaryStaff}">
                    <span class="error">${errorSalaryStaff}</span>
                </c:if>
            </div>

            <!-- Salary Amount -->
            <div class="form-group">
                <label for="salary_amount">
                    Email <span class="required">*</span>
                </label>
                <input type="salary_amount" 
                       id="salary_amount" 
                       name="salary_amount" 
                       value="${salary.salary_amount}" 
                       required 
                       placeholder="student@example.com">
                <c:if test="${not empty errorSalaryAmount}">
                    <span class="error">${errorSalaryAmount}</span>
                </c:if>
            </div>
            <!-- Payment Date -->
            <div class="form-group">
                <label for="salary_date">
                    Email <span class="required">*</span>
                </label>
                <input type="salary_date" 
                       id="salary_date" 
                       name="salary_date" 
                       value="${salary.date}" 
                       required 
                       placeholder="student@example.com">
                <c:if test="${not empty errorSalaryDate}">
                    <span class="error">${errorSalaryDate}</span>
                </c:if>
            </div>
            <!-- Buttons -->
            <div class="button-group">
                <button type="submit" class="btn btn-primary">est="${salary != null}">💾 Update Salary
                </button>
                <a href="salary?id=${salary.staffid}" class="btn btn-secondary">❌ Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>
