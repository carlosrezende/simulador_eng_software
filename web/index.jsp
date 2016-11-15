<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page session="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fácil Invest</title>
        <link rel="stylesheet" type="text/css" href="css/index.css">
    </head>
    <body>        

        <div id="divLogin">

            <p id="pLogin">Login:</p>
            <form name="FormUsuarioLogin" action="usuario_login.jsp">
                <input id="btnLogin" type="submit" value="Usuário" name="btnLoginUsuario" />
            </form>

            <form name="FormAdminLogin" action="admin_login.jsp">
                <input id="btnLogin" type="submit" value="Administrador" name="btnLoginAdmin" />
            </form>
        </div>

    </body>
</html>
