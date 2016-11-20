<%@page import="db.IsValidInv"%>
<%@page import="business_rules.Investimento"%>
<%@page import="db.DaoInv"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page session="true"%>

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

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de investimento</title>
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
            <div id="boxCadInv">
                <center>
                    <span  class="spanInfoInput">Formulário para cadastrar novo Investimento</span>

                    <div id="subDivCadastrarUsuario">
                        <form name="FormCadastrarInvestimento" action="#" method="POST">
                            Nome:<br>
                            <input class="inputCadUser" type="text" name="InputNome" value="" size="55" /><br>
                            Valor mínimo:<br>
                            <input class="inputCadUser" type="text" name="InputValorMin" value="" size="55" /><br>
                            Taxa: (% ao mês):<br>
                            <input class="inputCadUser" type="text" name="InputTaxa" value="" size="55" /><br>

                            <input class="btnCadInv" type="submit" value="Cadastrar Investimento" name="btnCadastrarInvestimento"/>
                        </form>
                    </div>
                </center>
            </div>
        </div>


        <%
            /*ao clicar no botão*/
            if (request.getParameter("btnCadastrarInvestimento") != null) {
                if (request.getParameter("btnCadastrarInvestimento").equals("Cadastrar Investimento")) {

                    IsValidInv ivi = new IsValidInv();
                    String nome, vMin, taxa;
                    nome = request.getParameter("InputNome").toString();
                    vMin = request.getParameter("InputValorMin").toString();
                    taxa = request.getParameter("InputTaxa").toString();

                    /*se os dados inseridos são válidos*/
                    if (ivi.isValid(nome, vMin, taxa)) {
                        DaoInv dao = new DaoInv();
                        try {
                            /*criar objeto para adicionar no banco*/
                            Investimento inv = new Investimento();
                            inv.setNome(nome.toString());
                            inv.setValor_minimo(Double.parseDouble(vMin.toString().replaceFirst(",", ".")));
                            inv.setTaxa(Double.parseDouble(taxa.toString().replaceFirst(",", ".")));

                            /*tentar inserir*/
                            dao.insert(inv);

                            /*mostrar mensagem de sucesso*/
                            out.write("<script>alert('");
                            out.write("O investimento " + nome + " foi cadastrado com sucesso.");
                            out.write("');</script>");

                        } catch (Exception e) {
                            /*se acontecer algum erro*/
                            e.printStackTrace();
                            out.write("<script>alert('");
                            out.write("Ocorreu um erro ao cadastrar o investimento.");
                            out.write("');</script>");
                        } finally {
                            /*fechar conexão com o banco*/
                            dao.closeConnection();
                        }
                    } else {
                        /*se existir algum dado inválido*/
                        out.write("<script>alert('");
                        out.write(ivi.getMessage());
                        out.write("');</script>");
                    }
                }
            }
        %>
    </body>
</html>
