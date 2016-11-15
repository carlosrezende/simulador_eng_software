<%@page import="simulador.jdbc.LoginUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page session="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - Usuário</title>
        <link rel="stylesheet" type="text/css" href="css/usuario_login.css">
    </head>
    <body>

        <div id="menu" >

            <form name="FormHome" action="index.jsp" method="POST">
                <input id="btns" type="submit" value="Home" name="btnHome" />
            </form>
        </div>

        <div id="divLogin">

            <form action="" method="POST">

                Login do Usuário:<br>
                <input id="InputUser" type="text" name="txtUsuario"><br><br>

                Senha:<br>
                <input id="InputSenha" type="password" name="txtContra"><br><br>

                <input id="btnLogin" type="submit" name="btnIngresar" value="Login">
            </form>

        </div>

        <%
            LoginUser op = new LoginUser();

            if (request.getParameter("btnIngresar") != null) {

                String nombre = request.getParameter("txtUsuario");
                String contra = request.getParameter("txtContra");

                HttpSession sesion = request.getSession();

                switch (op.loguear(nombre, contra)) {

                    case 2:
                        sesion.setAttribute("usuario", "user");
                        response.sendRedirect("usuario.jsp");
                        break;
                    default:
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('O login não existe ou a senha é inválida.');");
                        out.println("</script>");
                        break;
                }
            }
        %>
    </body>
</html>
