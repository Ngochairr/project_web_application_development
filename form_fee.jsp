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
            <c:when test="${fees != null}">Edit Fee</c:when>
            <c:otherwise>Add Fee</c:otherwise>
        </c:choose>
    </title>
    </head>
<body>
    <div class="container">
        <h1>
            <c:choose>
                <c:when test="${fees != null}">
                    ✏️ Edit Fee
                </c:when>
                <c:otherwise>
                    ➕ Add New Fee
                </c:otherwise>
            </c:choose>
        </h1>
        
        <form action="fee" method="POST">
            <!-- Hidden field for action -->
            <c:choose>
                <c:when test="${fees != null}">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="${fee.id}">
                </c:when>
                <c:otherwise>
                    <input type="hidden" name="action" value="insert">
                </c:otherwise>
            </c:choose>

            <!-- Fee Code -->
            <div class="form-group">
                <label for="fee_id">
                    Student Code <span class="required">*</span>
                </label>
                <input type="text" 
                       id="feeID" 
                       name="feeID" 
                       value="${fee.id}" 
                       <c:if test="${fee != null}">readonly</c:if> 
                       placeholder="e.g., F001, F123">
                <p class="info-text">Format: F + 3 digits</p>
                <c:if test="${not empty errorFeeCode}">
                    <span class="error">${errorFeeCode}</span>
                </c:if>
            </div>

            <!-- Student ID -->
            <div class="form-group">
                <label for="fee_student">
                    Full Name <span class="required">*</span>
                </label>
                <input type="text" 
                       id="FeeStudent" 
                       name="FeeStudent" 
                       value="${fee.student_id}" 
                       required 
                       placeholder="Enter full name">
                <c:if test="${not empty errorFeeStudent}">
                    <span class="error">${errorFeeStudent}</span>
                </c:if>
            </div>

            <!-- Fee Name -->
            <div class="form-group">
                <label for="fee_name">
                    Email <span class="required">*</span>
                </label>
                <input type="fee_name" 
                       id="fee_name" 
                       name="fee_name" 
                       value="${fee.name}" 
                       required 
                       placeholder="student@example.com">
                <c:if test="${not empty errorFeeName}">
                    <span class="error">${errorFeeName}</span>
                </c:if>
            </div>
            <!-- Fee Value -->
            <div class="form-group">
                <label for="fee_value">
                    Email <span class="required">*</span>
                </label>
                <input type="fee_value" 
                       id="fee_value" 
                       name="fee_value" 
                       value="${fee.value}" 
                       required 
                       placeholder="student@example.com">
                <c:if test="${not empty errorFeeValue}">
                    <span class="error">${errorFeeValue}</span>
                </c:if>
            </div>
            <!-- Fee Expiration -->
            <div class="form-group">
                <label for="fee_expiration">
                    Email <span class="required">*</span>
                </label>
                <input type="fee_expiration" 
                       id="fee_expiration" 
                       name="fee_expiration" 
                       value="${fee.expiration}" 
                       required 
                       placeholder="student@example.com">
                <c:if test="${not empty errorFeeExpiration}">
                    <span class="error">${errorFeeExpiration}</span>
                </c:if>
            </div>
            <!-- Fee Paid -->
            <div class="form-group">
                <label for="fee_paid">
                    Email <span class="required">*</span>
                </label>
                <input type="checkbox"
                    id="fee_paid"
                    name="fee_paid"
                    value="true"
                    <c:if test="${fee.paid}">checked</c:if>
                    required>
                <c:if test="${not empty errorFeePaid}">
                    <span class="error">${errorFeePaid}</span>
                </c:if>
            </div>

            <!-- Buttons -->
            <div class="button-group">
                <button type="submit" class="btn btn-primary">
                    <c:choose>
                        <c:when test="${fee != null}">💾 Update Fee</c:when>
                        <c:otherwise>➕ Add Fee</c:otherwise>
                    </c:choose>
                </button>
                <a href="fee?action=list" class="btn btn-secondary">❌ Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>
