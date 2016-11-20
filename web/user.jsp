<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<!DOCTYPE html>
<html>
    <head>        
        <!--código para verificar se existe alguem logado-->
        <%
            /*evitar erro 500 e impedir que o usuário tente entrar direto na página user por meio do link*/
            if (session.getAttribute("level") != null) {

                /*verificar se a pessoa logada é um usuário*/
                if (session.getAttribute("level") == ("2")) {
                    /*permenece na página*/
                } else {
                    response.sendRedirect("index.jsp");
                }
            } else {
                response.sendRedirect("index.jsp");
            }
        %>

        <title>Página do Usuário</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="icon" href="img/favicon.png" />
    </head>
    <body>
        <nav id="menu">
            <center>
                <ul>
                    <li>
                        <a id="logoMenu" href="user.jsp">                 
                            <span>
                                Fácilnvest                                
                            </span>                         
                        </a>
                    </li>
                    <li>
                        <a href="logout.jsp" class="btnHeaderMenu" id="lastBtnHeaderMenu">
                            <span class="spanMenu">Sair</span>                          
                        </a>
                    </li>
                    <li>
                        <a href="user.jsp" class="btnHeaderMenu" id="firstBtnHeaderMenu">
                            <span class="spanMenu">Home</span>
                        </a>
                    </li>
                    <li>
                        <span id="spanShowLogin">
                            Olá, <%
                                if (session.getAttribute("login") != null) {
                                    out.write(session.getAttribute("login").toString());
                                }
                            %>!
                        </span>
                    </li>
                </ul>
            </center>
        </nav>

        <div id="below">
            <div id="boxMenuUser">
                <center>
                    <br>
                    <br>
                    <!--
                    <a class="btnMenu" href="cadastro_de_cliente.jsp">
                        <span >Cadastrar Clientes</span>
                    </a>-->
                    <br>
                    <br>
                    <br>
                    <a class="btnMenu" href="simulador.jsp">
                        <span >Simulador</span>
                    </a>
                    <br>
                </center>
            </div>
        </div>   
    </body>
</html>
