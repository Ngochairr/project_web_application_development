<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        <c:choose>
            <c:when test="${staff != null}">Edit Staff</c:when>
            <c:otherwise>Add New Staff</c:otherwise>
        </c:choose>
    </title>
    </head>
<body>
    <div class="container">
        <h1>
            <c:choose>
                <c:when test="${staff != null}">
                    ✏️ Edit Staff
                </c:when>
                <c:otherwise>
                    ➕ Add New Staff
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
                    Staff ID <span class="required">*</span>
                </label>
                <input type="text"
                       id="id"
                       name="id"
                       value="${staff.id}"
                       <c:if test="${staff != null}">readonly</c:if>
                       placeholder="e.g., S001, S123">
                <p class="info-text">Format: S + 3 digits</p>
                <c:if test="${not empty errorStaffID}">
                    <span class="error">${errorStaffID}</span>
                </c:if>
            </div>

            <!-- Staff Name -->
            <div class="form-group">
                <label for="staff_name">
                    Staff Name <span class="required">*</span>
                </label>
                <input type="staff_name"
                       id="staff_name"
                       name="staff_name"
                       value="${staff.staff_name}"
                       required
                       placeholder="Enter Full Name">
                <c:if test="${not empty errorStaffName}">
                    <span class="error">${errorStaffName}</span>
                </c:if>
            </div>
            <!-- Staff Salary -->
            <div class="form-group">
                <label for="staff_salary">
                    Staff's Salary <span class="required">*</span>
                </label>
                <input type="staff_salary"
                       id="staff_salary"
                       name="staff_salary"
                       value="${staff.staff_salary}"
                       required
                       placeholder="Enter Full Name">
                <c:if test="${not empty errorStaffSalary}">
                    <span class="error">${errorStaffSalary}</span>
                </c:if>
            </div>
            <!-- Buttons -->
            <div class="button-group">
                <button type="submit" class="btn btn-primary">
                    <c:choose>
                        <c:when test="${staff != null}">💾 Update Staff</c:when>
                        <c:otherwise>➕ Add Staff</c:otherwise>
                    </c:choose>
                </button>
                <a href="staff?action=list" class="btn btn-secondary">❌ Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>