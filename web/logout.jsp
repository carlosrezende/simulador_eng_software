
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page session="true" %>

<!DOCTYPE html>
<html>
    <head>
        <!--código para fazer logout--> 
        <%
            session.setAttribute("level", "0");
            response.sendRedirect("index.jsp");
        %>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Saindo...</title>
        <link rel="icon" href="img/favicon.png" />
    </head>
    <body>
        <h1>Redirecionando para a página de inicial...</h1>
    </body>
</html>
