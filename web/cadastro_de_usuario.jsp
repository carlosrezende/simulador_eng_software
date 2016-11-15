<%@page import="simulador.jdbc.DAO_Usuario"%>
<%@page import="simulador.usuarios.Usuario"%>
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
        <title>Cadastro de Usuários</title>
        <link rel="stylesheet" type="text/css" href="css/cadastro_de_usuario.css">
    </head>
    <body>
        <div id="menu" >

            <form name="FormHome" action="index.jsp" method="POST">
                <input id="btns" type="submit" value="Home" name="btnHome" />
            </form>

            <form name="FormIrParaAdmin" action="admin.jsp" method="POST">
                <input id="btns" type="submit" value="Administrador" name="btnAdmin" />
            </form>
        </div>

        <div id="divCadastrarUsuario">
            Formulário para cadastrar novo Usuário
            <div id="subDivCadastrarUsuario">
                <form name="FormCadastrarUsuario" action="#" method="POST">
                    Nome:<br>
                    <input type="text" name="InputNome" value="" size="55" /><br>
                    Matrícula:<br>
                    <input type="text" name="InputMatricula" value="" size="55" /><br>
                    Login:<br>
                    <input type="text" name="InputLogin" value="" size="55" /><br>
                    Senha:<br>
                    <input type="text" name="InputSenha" value="" size="55" /><br>
                    CPF:<br>
                    <input type="text" name="InputCpf" value="" size="55" /><br>

                    <input id="btnCadastrarUsuario" type="submit" value="Cadastrar" name="btnCadastrarUsuario"/>
                </form>
            </div>
        </div>

        <%
            /*ao clicar no botão*/
            if (request.getParameter("btnCadastrarUsuario") != null) {
                if (request.getParameter("btnCadastrarUsuario").equals("Cadastrar")) {

                    /*criar usuário*/
                    Usuario user = new Usuario();

                    /*setar os atributos*/
                    user.setNome(request.getParameter("InputNome"));
                    user.setMatricula(request.getParameter("InputMatricula"));
                    user.setLogin(request.getParameter("InputLogin"));
                    user.setSenha(request.getParameter("InputSenha"));
                    user.setCpf(request.getParameter("InputCpf"));
                    user.setNivel(2);

                    boolean continuar = true;
                    if (user.getNome().equals("")) {
                        continuar = false;
                    }
                    if (user.getMatricula().equals("")) {
                        continuar = false;
                    }
                    if (user.getLogin().equals("")) {
                        continuar = false;
                    }
                    if (user.getSenha().equals("")) {
                        continuar = false;
                    }
                    if (user.getCpf().equals("")) {
                        continuar = false;
                    }

                    if (continuar == false) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Os campos não podem ficar vazios.');");
                        out.println("</script>");
                    }

                    if (continuar) {
                        try {
                            /*criar um objeto para adicionar o usuário no banco*/
                            DAO_Usuario dao = new DAO_Usuario();
                            try {
                                /*inserir usuário no banco*/
                                dao.insert(user);
                                out.println("<script type=\"text/javascript\">");
                                out.println("alert('O Usuário foi cadastrado com sucesso.');");
                                out.println("</script>");
                            } catch (Exception e) {
                                out.println("<script type=\"text/javascript\">");
                                out.println("alert('Erro ao cadastrar usuário.');");
                                out.println("</script>");
                                e.printStackTrace();
                            } finally {
                                /*encerrar conexão*/
                                dao.closeConnection();
                            }
                        } catch (Exception e) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Erro ao cadastrar usuário.');");
                            out.println("</script>");
                            e.printStackTrace();
                        }
                    }
                }
            }
        %>
    </body>
</html>
