PRACTICAL 5A

AIM: Develop a JSP application to demonstrate the use of JSP Directives.

Header.jsp

<h2>Welcome to JSP Directives Demonstration</h2>
<hr>

Index.jsp

<%@ page language="java" import="java.util.Date" %>
<%@ include file="Header.jsp" %>
<%@ taglib prefix="y" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>JSP Directives Demo</title>
</head>
<body>
    <p>Today's Date and Time:</p>
    <%
        Date d = new Date();
        out.println(d);
    %>

    <%-- JSTL Library --%>
    <y:set var="username" value="Mr.Smith" />
    <p>Welcome, <y:out value="${username}" />!</p>
</body>
</html>


PRACTICAL 5B

AIM: Develop a JSP application to demonstrate Form Processing and Input Validation.

index.jsp

<!DOCTYPE html>
<html>
<body>
    <h2>Form Processing & Validation</h2>

    <form method="post">
        Username: <input type="text" name="user"><br><br>
        Age: <input type="text" name="age"><br><br>
        <input type="submit" value="Submit">
    </form>

    <%
        String u = request.getParameter("user");
        String a = request.getParameter("age");

        if (u != null && a != null) {
            if (u.trim().isEmpty()) {
                out.println("<p style='color:red;'>Error: Username cannot be empty.</p>");
            } else {
                try {
                    int age = Integer.parseInt(a);

                    if (age > 0 && age <= 120) {
                        out.println("<p style='color:green;'>Success! Welcome " + u + ", Age: " + age + "</p>");
                    } else {
                        out.println("<p style='color:red;'>Error: Age must be between 1 and 120.</p>");
                    }
                } catch (NumberFormatException e) {
                    out.println("<p style='color:red;'>Error: Age must be a valid number.</p>");
                }
            }
        }
    %>
</body>
</html>
