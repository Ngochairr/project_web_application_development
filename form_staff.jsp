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
            <c:when test="${staff != null}">Edit Staff</c:when>
            <c:otherwise>Add New Student</c:otherwise>
        </c:choose>
    </title>
    </head>
<body>
    <div class="container">
        <h1>
            <c:choose>
                <c:when test="${staff != null}">
                    ✏️ Edit Student
                </c:when>
                <c:otherwise>
                    ➕ Add New Student
                </c:otherwise>
            </c:choose>
        </h1>
        
        <form action="staff" method="POST">
            <!-- Hidden field for action -->
            <c:choose>
                <c:when test="${staff != null}">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="${staff.id}">
                </c:when>
                <c:otherwise>
                    <input type="hidden" name="action" value="insert">
                </c:otherwise>
            </c:choose>

            <!-- Staff ID -->
            <div class="form-group">
                <label for="id">
                    Student Code <span class="required">*</span>
                </label>
                <input type="text" 
                       id="id" 
                       name="id" 
                       value="${staff.id}" 
                       <c:if test="${staff != null}">readonly</c:if> 
                       placeholder="e.g., SV001, IT123">
                <p class="info-text">Format: 2 letters + 3+ digits</p>
                <c:if test="${not empty errorCode}">
                    <span class="error">${errorCode}</span>
                </c:if>
            </div>

            <!-- Staff Role -->
            <div class="form-group">
                <label for="staff_role">
                    Full Name <span class="required">*</span>
                </label>
                <input type="text" 
                       id="staff_role" 
                       name="staff_role" 
                       value="${staff.staff_role}" 
                       required 
                       placeholder="Enter Role">
                <c:if test="${not empty errorName}">
                    <span class="error">${errorName}</span>
                </c:if>
            </div>

            <!-- Staff Name -->
            <div class="form-group">
                <label for="staff_name">
                    Email <span class="required">*</span>
                </label>
                <input type="staff_name" 
                       id="staff_name" 
                       name="staff_name" 
                       value="${staff.staff_name}" 
                       required 
                       placeholder="Enter Full Name">
                <c:if test="${not empty errorEmail}">
                    <span class="error">${errorEmail}</span>
                </c:if>
            </div>
            <!-- Staff Salary -->
            <div class="form-group">
                <label for="staff_name">
                    Email <span class="required">*</span>
                </label>
                <input type="staff_name" 
                       id="staff_name" 
                       name="staff_name" 
                       value="${staff.staff_name}" 
                       required 
                       placeholder="Enter Full Name">
                <c:if test="${not empty errorEmail}">
                    <span class="error">${errorEmail}</span>
                </c:if>
            </div>
            <!-- Buttons -->
            <div class="button-group">
                <button type="submit" class="btn btn-primary">
                    <c:choose>
                        <c:when test="${student != null}">💾 Update Student</c:when>
                        <c:otherwise>➕ Add Student</c:otherwise>
                    </c:choose>
                </button>
                <a href="staff?action=list" class="btn btn-secondary">❌ Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>
