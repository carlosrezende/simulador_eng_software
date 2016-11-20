
<%@page import="db.IsValidChange"%>
<%@page import="db.DaoInv"%>
<%@page import="business_rules.Investimento"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

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

        <title>Alteração de taxas</title>

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

        <!------------------------------------------------------------------------------------------------->

        <div id="below">
            <div id="boxSimulador">
                <center>
                    <%
                        /*Ao clicar no botão de alterar taxa*/
                        if (request.getParameter("btnAlterar") != null) {
                            if (request.getParameter("btnAlterar").equals("Alterar")) {

                                /*pegar os dados*/
                                String id, taxa;
                                id = request.getParameter("dropId");
                                taxa = request.getParameter("InputValue");

                                /*testar se o usuário digitou corretamente*/
                                IsValidChange ivc = new IsValidChange();

                                if (ivc.isValid(id, taxa)) {

                                    /*tentar atualizar no banco*/
                                    DaoInv daoChange = new DaoInv();
                                    Integer ID = ivc.getID();
                                    Double TAXA = ivc.getTAXA();

                                    /*se conseguir atualizar*/
                                    if (daoChange.updateTaxa(ID, TAXA)) {
                                        out.write("<script>alert('");
                                        out.write("A alteração foi realizada com sucesso.");
                                        out.write("');</script>");
                                    } else {
                                        out.write("<script>alert('");
                                        out.write("Ocorreu um erro. Atualize a página e tente novamente.");
                                        out.write("');</script>");
                                    }
                                    /*fechar conexão*/
                                    daoChange.closeConnection();
                                } /*imprimir informações sobre dados errados*/ else {
                                    out.write("<script>alert('");
                                    out.write(ivc.getMessage());
                                    out.write("');</script>");
                                }
                            }
                        }
                    %>

                    <!--CRIAR TABELA COM OS INVESTIMENTOS-->

                    <span class="spanInfoInput">Tipos de investimento</span><br>
                    <%
                        DaoInv dao = new DaoInv();
                        List<Investimento> list;
                        list = dao.getList();
                        dao.closeConnection();
                    %>
                    <table>
                        <tr>
                            <th>Nome</th>
                            <th>Valor mínimo</th>
                            <th>Valor atual da taxa</th>
                        </tr>
                        <%for (Investimento i : list) {%>
                        <tr>
                            <td><% out.write(i.getNome()); %></td>
                            <%
                                String vMin = Double.toString(i.getValor_minimo());
                                vMin = vMin.replace(".", ",");
                            %>
                            <td>R$ <% out.write(vMin); %></td>
                            <%
                                String taxa = Double.toString(i.getTaxa());
                                taxa = taxa.replace(".", ",");
                            %>
                            <td><% out.write(taxa); %> %</td>
                        </tr>
                        <%}%>
                    </table>

                    <form name="FormSimular" action=""  method="POST">
                        <br>Selecione o investimento:<br>
                        <select name="dropId" class="dropSimulador">
                            <%for (Investimento i : list) {%>
                            <option value="<%out.write(Integer.toString(i.getId()));%>">
                                <%out.write(i.getNome());%>
                            </option>
                            <%}%>
                        </select>
                        <br>Nova taxa:<br>
                        <input class="inputSimulador" type="text" name="InputValue" value="" size="55" /><br>
                        <input class="btnAlterar" type="submit" value="Alterar" name="btnAlterar"/>
                    </form>
                </center>
            </div>
        </div>
    </body>
</html>
