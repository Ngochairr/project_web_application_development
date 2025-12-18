<%-- 
    Document   : fee
    Created on : Dec 16, 2025, 3:28:58 PM
    Author     : admin
--%>
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
        <table border="1">
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

        <%
            for (int period = 1; period <= 16; period++) {
        %>
            <tr>
                <td>Period <%= period %></td>

                <%
                    for (int day = 1; day <= 7; day++) {
                %>
                    <td>
                        <!-- subject goes here -->
                    </td>
                <%
                    }
                %>
            </tr>
        <%
            }
        %>
        </table>
    </body>
</html>
