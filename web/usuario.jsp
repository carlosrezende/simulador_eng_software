<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page session="true" %>

<!DOCTYPE html>
<html>
    <head>

        <%
            if (session.getAttribute("usuario") == null) {
                response.sendRedirect("usuario_login.jsp");
            } else if (session.getAttribute("usuario") == ("user")) {
                /*fica na página*/
            } else {
                response.sendRedirect("usuario_login.jsp");
            }
        %>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página do Usuário</title>
        <link rel="stylesheet" type="text/css" href="css/usuario.css">
    </head>
    <body>
        <div id="divMaior">

            <form name="FormHome" action="index.jsp" method="POST">
                <input id="btns" type="submit" value="Home" name="btnHome" />
            </form>

            <form name="FormCadastrarCliente" action="cadastro_de_cliente.jsp" method="POST">
                <input id="btns" type="submit" value="Cadastrar Clientes" name="btnCadClientes" />
            </form>

            <form name="FormIrParaSimulador" action="simulador.jsp" method="POST">
                <input id="btns" type="submit" value="Simulador" name="btnIrParaSimulador" />
            </form>

            <form name="FormSair" action="usuario.jsp" method="POST">
                <input id="btns" type="submit" value="Logout" name="btnSair" />
            </form>
        </div>

        <%
            if (request.getParameter("btnSair") != null) {
                if (request.getParameter("btnSair").equals("Logout")) {
                    session.setAttribute("usuario", "saiu");
                    response.sendRedirect("index.jsp");
                }
            }
        %>

    </body>
</html>
