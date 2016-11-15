<%@page import="simulador.usuarios.Usuario"%>
<%@page import="simulador.jdbc.DAO_Cliente"%>
<%@page import="simulador.usuarios.Cliente"%>
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
        <title>Cadastro de Clientes</title>
        <link rel="stylesheet" type="text/css" href="css/cadastro_de_cliente.css">
    </head>
    <body>
        
        <div id="menu" >

            <form name="FormHome" action="index.jsp" method="POST">
                <input id="btns" type="submit" value="Home" name="btnHome" />
            </form>

            <form name="FormIrParaUsuario" action="usuario.jsp" method="POST">
                <input id="btns" type="submit" value="Usuário" name="btnAdmin" />
            </form>
        </div>
        
        
        <div id="divCadCli">
            Formulário para cadastrar novo Cliente
            <div id="subDivCadCli">
                <form name="FormCadCli" action="#" method="POST">
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
                    <input id="btnCadCli" type="submit" value="Cadastrar" name="btnCadCli"/>
                </form>
            </div>
        </div>

        <%
            if (request.getParameter("btnCadCli") != null) {
                if (request.getParameter("btnCadCli").equals("Cadastrar")) {
                    /*criar cliente*/
                    Cliente cliente = new Cliente();

                    /*setar os atributos*/
                    cliente.setNome(request.getParameter("InputNome"));
                    cliente.setMatricula(request.getParameter("InputMatricula"));
                    cliente.setLogin(request.getParameter("InputLogin"));
                    cliente.setSenha(request.getParameter("InputSenha"));
                    cliente.setCpf(request.getParameter("InputCpf"));
                    cliente.setNivel(1);

                    boolean continuar = true;
                    if (cliente.getNome().equals("")) {
                        continuar = false;
                    }
                    if (cliente.getMatricula().equals("")) {
                        continuar = false;
                    }
                    if (cliente.getLogin().equals("")) {
                        continuar = false;
                    }
                    if (cliente.getSenha().equals("")) {
                        continuar = false;
                    }
                    if (cliente.getCpf().equals("")) {
                        continuar = false;
                    }

                    if (continuar == false) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Os campos não podem ficar vazios.');");
                        out.println("</script>");
                    }

                    if (continuar) {
                        try {
                            /*criar um objeto para adicionar o cliente no banco*/
                            DAO_Cliente dao = new DAO_Cliente();
                            try {
                                /*inserir cliente no banco*/
                                dao.insert(cliente);
                                out.println("<script type=\"text/javascript\">");
                                out.println("alert('O Cliente foi cadastrado com sucesso.');");
                                out.println("</script>");
                            } catch (Exception e) {
                                out.println("<script type=\"text/javascript\">");
                                out.println("alert('Erro ao cadastrar cliente.');");
                                out.println("</script>");
                                e.printStackTrace();
                            } finally {
                                /*encerrar conexão*/
                                dao.closeConnection();
                            }
                        } catch (Exception e) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Erro ao cadastrar cliente.');");
                            out.println("</script>");
                            e.printStackTrace();
                        }
                    }
                }
            }
        %>
    </body>
</html>
