
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<!DOCTYPE html>
<html>
    <head>
        <%
            if (session.getAttribute("usuario") == null) {
                response.sendRedirect("admin_login.jsp");
            } else if (session.getAttribute("usuario") == ("admin")) {
                /*fica na página*/
            } else {
                response.sendRedirect("admin_login.jsp");
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página do Administrador</title>
        <link rel="stylesheet" type="text/css" href="css/admin.css">
    </head>
    <body>
        <div id="divMaior">

            <form name="FormHome" action="index.jsp" method="POST">
                <input id="btns" type="submit" value="Home" name="btnHome" />
            </form>

            <form name="FormCadastrarUsuario" action="cadastro_de_usuario.jsp" method="POST">
                <input id="btns" type="submit" value="Cadastrar Usuários" name="btnCadastrarUsuario" />
            </form>

            <form name="FormCadastrarInvestimento" action="cadastro_de_investimento.jsp" method="POST">
                <input id="btns" type="submit" value="Cadastrar Investimentos" name="btnCadastrarInvestimento" />
            </form>

            <form name="FormAlterarTaxa" action="alteracao_de_taxas.jsp" method="POST">
                <input id="btns" type="submit" value="Alterar as taxas" name="btnAlterarTaxa" />
            </form>

            <form name="FormSair" action="admin.jsp" method="POST">
                <input id="btns" type="submit" value="Logout" name="btnSair" />
            </form>
            <%
                if (request.getParameter("btnSair") != null) {
                    if (request.getParameter("btnSair").equals("Logout")) {
                        session.setAttribute("usuario", "saiu");
                        response.sendRedirect("index.jsp");
                    }
                }
            %>
        </div>
    </body>
</html>