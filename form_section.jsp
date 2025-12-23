<%-- 
    Document   : form_section
    Created on : Dec 19, 2025, 6:36:24 PM
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
                    ✏️ Edit Section
                </c:when>
                <c:otherwise>
                    ➕ Add New Section
                </c:otherwise>
            </c:choose>
        </h1>
        
        <form action="student" method="POST">
            <!-- Hidden field for action -->
            <c:choose>
                <c:when test="${section != null}">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="${section.id}">
                </c:when>
                <c:otherwise>
                    <input type="hidden" name="action" value="insert">
                </c:otherwise>
            </c:choose>

            <!-- Section ID -->
            <div class="form-group">
                <label for="roll">
                    Section ID <span class="required">*</span>
                </label>
                <input type="text" 
                       id="sec_id" 
                       name="sec_id" 
                       value="${section.idsection}" 
                       <c:if test="${section != null}">readonly</c:if> 
                       placeholder="e.g., SE001, SE123">
                <p class="info-text">Format: SE + 3 digits</p>
                <c:if test="${not empty errorSectionID}">
                    <span class="error">${errorSectionID}</span>
                </c:if>
            </div>
            
             <!-- ROOM ID -->
            <div class="form-group">
                <label for="studentsection">
                    Room ID <span class="required">*</span>
                </label>
                <input type="text" 
                       id="sec_room" 
                       name="sec_room" 
                       value="${section.room_id}" 
                       required 
                       placeholder="Enter Room ID">
                <c:if test="${not empty errorSectionRoom}">
                    <span class="error">${errorSectionRoom}</span>
                </c:if>
            </div>
                
            <!-- Class ID -->
            <div class="form-group">
                <label for="class">
                    Class ID <span class="required">*</span>
                </label>
                <input type="text" 
                       id="sec_class" 
                       name="sec_class" 
                       value="${section.class_id}" 
                       required 
                       placeholder="Enter Class ID">
                <c:if test="${not empty errorclass_id}">
                    <span class="error">${errorclass_id}</span>
                </c:if>
            </div>
            
                
             <!-- Start Week -->
            <div class="form-group">
                <label for="class">
                    First Week <span class="required">*</span>
                </label>
                <input type="text" 
                       id="sec_sweek" 
                       name="sec_sweek" 
                       value="${section.start_week}" 
                       required 
                       placeholder="Enter Start Week">
                <c:if test="${not empty errorstart_week}">
                    <span class="error">${errorstart_week}</span>
                </c:if>
            </div>
                
                <!-- End Week -->
            <div class="form-group">
                <label for="class">
                    Last Week <span class="required">*</span>
                </label>
                <input type="text" 
                       id="sec_eweek" 
                       name="sec_eweek" 
                       value="${section.end_week}" 
                       required 
                       placeholder="Enter End Week">
                <c:if test="${not empty errorend_week}">
                    <span class="error">${errorend_week}</span>
                </c:if>
            </div>
            
                <!-- Start Time -->
            <div class="form-group">
                <label for="class">
                    Start Time <span class="required">*</span>
                </label>
                <input type="text" 
                       id="sec_stime" 
                       name="sec_stime" 
                       value="${section.start_week}" 
                       required 
                       placeholder="Enter Start Time">
                <c:if test="${not empty errorstart_time}">
                    <span class="error">${errorstart_time}</span>
                </c:if>
            </div>
                
                <!-- End Time -->
            <div class="form-group">
                <label for="class">
                     End Time <span class="required">*</span>
                </label>
                <input type="text" 
                       id="sec_etime" 
                       name="sec_etime" 
                       value="${section.end_week}" 
                       required 
                       placeholder="Enter End Time">
                <c:if test="${not empty errorend_time}">
                    <span class="error">${errorend_time}</span>
                </c:if>
            </div>
             <!-- Day -->
            <div class="form-group">
                <label for="class">
                    Day <span class="required">*</span>
                </label>
                <input type="text" 
                       id="sec_day" 
                       name="sec_day" 
                       value="${section.day}" 
                       required 
                       placeholder="Enter Day of the week(Sunday is 1)">
                <c:if test="${not empty errorsecday}">
                    <span class="error">${errorsecday}</span>
                </c:if>
            </div>
             <!-- Name -->
            <div class="form-group">
                <label for="class">
                    Name <span class="required">*</span>
                </label>
                <input type="text" 
                       id="sec_name" 
                       name="sec_name" 
                       value="${section.name}" 
                       required 
                       placeholder="Enter Name">
                <c:if test="${not empty errorsecname}">
                    <span class="error">${errorsecname}</span>
                </c:if>
            </div>

            <!-- Buttons -->
            <div class="button-group">
                <button type="submit" class="btn btn-primary">
                    <c:choose>
                        <c:when test="${section != null}">💾 Update Section</c:when>
                        <c:otherwise>➕ Add Section</c:otherwise>
                    </c:choose>
                </button>
                <a href="section?action=list" class="btn btn-secondary">❌ Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>
