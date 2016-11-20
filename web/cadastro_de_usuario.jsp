<%@page import="db.IsValidUser"%>
<%@page import="db.DaoUser"%>
<%@page import="users.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page session="true" %>

<!DOCTYPE html>
<html>
    <head>

        <!--código para verificar se existe alguem logado-->
        <%
            /*evitar erro 500 e impedir que o usuário tente entrar direto na página admin por meio do link*/
            if (session.getAttribute("level") != null) {

                /*verificar se a pessoa logada é um admin*/
                if (session.getAttribute("level") == ("3")) {
                    /*permenece na página*/
                } else {
                    response.sendRedirect("index.jsp");
                }
            } else {
                response.sendRedirect("index.jsp");
            }
        %>

        <title>Cadastro de Usuários</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="icon" href="img/favicon.png" />
    </head>
    <body>
        <nav id="menu">
            <center>
                <ul>
                    <li>
                        <a id="logoMenu" href="admin.jsp">                 
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
                        <a href="admin.jsp" class="btnHeaderMenu" id="firstBtnHeaderMenu">
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
            <div id="boxCadUser">
                <center>
                    <span  class="spanInfoInput">Formulário para cadastrar novo Usuário</span>

                    <div id="subDivCadastrarUsuario">
                        <form name="FormCadastrarUsuario" action="#" method="POST">
                            Nome:
                            <br>
                            <input class="inputCadUser" type="text" name="InputNome" value="" size="55" /><br>
                            Matrícula:<br>
                            <input class="inputCadUser" type="text" name="InputMatricula" value="" size="55" /><br>
                            Login:<br>
                            <input class="inputCadUser" type="text" name="InputLogin" value="" size="55" /><br>
                            Senha:<br>
                            <input class="inputCadUser" type="text" name="InputSenha" value="" size="55" /><br>
                            CPF:<br>
                            <input class="inputCadUser" type="text" name="InputCpf" value="" size="55" /><br>

                            <input class="btnLogin" type="submit" value="Cadastrar" name="btnCadastrarUsuario"/>
                        </form>
                    </div>
                </center>
            </div>
        </div>

        <%

            /* ao clicar no botão  */
            if (request.getParameter("btnCadastrarUsuario") != null) {
                if (request.getParameter("btnCadastrarUsuario").equals("Cadastrar")) {

                    Usuario u = new Usuario();

                    u.setNome(request.getParameter("InputNome"));
                    u.setMatricula(request.getParameter("InputMatricula"));
                    u.setLogin(request.getParameter("InputLogin"));
                    u.setSenha(request.getParameter("InputSenha"));
                    u.setCpf(request.getParameter("InputCpf"));
                    u.setNivel(2);

                    IsValidUser ivu = new IsValidUser();
                    if (ivu.isValid(u)) {

                        DaoUser dao = new DaoUser();
                        try {
                            dao.insert(u);

                        } catch (Exception e) {
                            throw new RuntimeException(e);
                        } finally {
                            dao.closeConnection();
                        }

                    }
                    out.write("<script>alert('");
                    out.write(ivu.getMessage());
                    out.write("');</script>");
                }
            }
        %>



    </body>
</html>
