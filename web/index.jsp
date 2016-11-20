<%@page import="db.Login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page session="true" %>

<!DOCTYPE html>
<html>
    <head>
        <!--código para verificar se existe alguem logado-->
        <%
            if (session.getAttribute("level") != null) {

                /*verificar se já existe um usuário logado*/
                if (session.getAttribute("level") == "2") {
                    response.sendRedirect("user.jsp");
                }
                /*verificar se já existe um admin logado*/
                if (session.getAttribute("level") == "3") {
                    response.sendRedirect("admin.jsp");
                }
            }
        %>
        <title>Fácilnvest</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="icon" href="img/favicon.png" />

    </head>

    <body>   
        <div id="topHeaderLogin">
            <span id="logo">Fácilnvest</span>            
        </div>
        <div id="belowIndex">
            <div id="boxLogin">
                <div id="subBoxLogin">
                    <form name="FormLogin" method="POST">                        
                        <span class="spanInfoInput">Login</span><br>
                        <input class="inputLogin" type="text" name="InputLogin" value="" /><br><br>
                        <span class="spanInfoInput">Senha</span><br>
                        <input class="inputLogin" type="password" name="InputPass" value="" /><br>                        
                        <input class="btnLogin" type="submit" value="Fazer Login" name="btnLogin" /><br>
                    </form>
                </div>
            </div>
        </div>

        <!--código para efetuar o login-->
        <%  /*testar se o botão não é nulo é importante para evitar o erro 500*/
            if (request.getParameter("btnLogin") != null) {

                /*detectar quando o botão é clicado*/
                if (request.getParameter("btnLogin").equals("Fazer Login")) {

                    String LOGIN = request.getParameter("InputLogin");
                    String PASSWORD = request.getParameter("InputPass");

                    Login login = new Login();
                    int level = login.getLevel(LOGIN, PASSWORD);

                    if (level == 2) {
                        session.setAttribute("login", LOGIN);
                        session.setAttribute("level", "2");
                        response.sendRedirect("user.jsp");
                    }
                    if (level == 3) {
                        session.setAttribute("login", LOGIN);
                        session.setAttribute("level", "3");
                        response.sendRedirect("admin.jsp");
                    }
                    if (level == 0) {
                        out.write("<script>alert('");
                        out.write(login.getMessage());
                        out.write("');</script>");
                    }
                }
            }
        %>
    </body>
</html>
