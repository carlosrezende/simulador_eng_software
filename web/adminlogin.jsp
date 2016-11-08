<%-- 
    Document   : adminlogin
    Created on : 08/11/2016, 15:37:21
    Author     : carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center">
            <form name="Form login admin" action="admin.jsp">
                <input type="text" name="usuario" value="" size =" 50" />
                <br>
                <input type="password" name="senha" value="" size =" 50" />
                <br>
                <input type="submit" value="Entrar" name="btnEntrar" />
            </form>
        </div>
    </body>
</html>
