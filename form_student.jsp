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
    <link rel="stylesheet" href="styles/forms.css">
    <title>
        <c:choose>
            <c:when test="${student != null}">Edit Student</c:when>
            <c:otherwise>Add New Student</c:otherwise>
        </c:choose>
    </title>
    </head>
<body>
    <div class="container">
        <h1>
            <c:choose>
                <c:when test="${student != null}">
                    ✏️ Edit Student
                </c:when>
                <c:otherwise>
                    ➕ Add New Student
                </c:otherwise>
            </c:choose>
        </h1>
        
        <form action="student" method="POST">
            <!-- Hidden field for action -->
            <c:choose>
                <c:when test="${student != null}">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="${student.id}">
                </c:when>
                <c:otherwise>
                    <input type="hidden" name="action" value="insert">
                </c:otherwise>
            </c:choose>

            <!-- Student Roll -->
            <div class="form-group">
                <label for="roll">
                    Student Code <span class="required">*</span>
                </label>
                <input type="text" 
                       id="roll" 
                       name="roll" 
                       value="${student.roll_no}" 
                       <c:if test="${student != null}">readonly</c:if> 
                       placeholder="e.g., SV001, IT123">
                <p class="info-text">Format: 2 letters + 3+ digits</p>
                <c:if test="${not empty errorCode}">
                    <span class="error">${errorCode}</span>
                </c:if>
            </div>
            
            <!-- Full Name -->
            <div class="form-group">
                <label for="fullName">
                    Full Name <span class="required">*</span>
                </label>
                <input type="text" 
                       id="fullName" 
                       name="fullName" 
                       value="${student.name}" 
                       required 
                       placeholder="Enter full name">
                <c:if test="${not empty errorName}">
                    <span class="error">${errorName}</span>
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
                <a href="student?action=list" class="btn btn-secondary">❌ Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>

