<%@page import="db.IsValidSimulation"%>
<%@page import="java.util.ArrayList"%>
<%@page import="business_rules.Investimento"%>
<%@page import="db.DaoInv"%>
<%@page import="java.util.List"%>
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

        <!--função para imprimir-->
        <script>
            function imprimir(text) {
                text = document;
                print(text);
            }
        </script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Simulador</title>
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
            <div id="boxSimulador">
                <center>
                    <%
                        if (request.getParameter("btnSimular") != null) {
                            if (request.getParameter("btnSimular").equals("Simular")) {

                                String id, valor, tempo;

                                id = request.getParameter("dropId");
                                valor = request.getParameter("InputValue");
                                tempo = request.getParameter("InputTime");

                                IsValidSimulation ivs = new IsValidSimulation();

                                if (ivs.isValid(id, valor, tempo)) {

                                    Investimento inv = ivs.getInvestment();
                    %>

                    <span class="spanInfoInput">Resultado da simulação</span><br>
                    <table>
                        <tr>
                            <th>Nome</th>
                            <th>Valor</th>
                            <th>Meses</th>
                            <th>Resultado</th>
                        </tr>
                        <tr>
                            <td>
                                <% out.write(inv.getNome()); %>
                            </td>
                            <td>
                                <% out.write(inv.getValorString()); %>
                            </td>
                            <td>
                                <% out.write(Integer.toString(inv.getTempo())); %>
                            </td>
                            <td>
                                <% out.write(inv.getValorTotalString()); %>
                            </td>
                        </tr>
                    </table>

                    <%
                                } else {
                                    out.write("<script>alert('");
                                    out.write(ivs.getMessage());
                                    out.write("');</script>");
                                }
                            }
                        }
                    %>


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
                            <th>Lucro mensal</th>
                        </tr>
                        <%
                            for (Investimento i : list) {
                        %>
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
                        <%
                            }
                        %>
                    </table>



                    <form name="FormSimular" action="#"  method="POST">
                        <br>Selecione o tipo:<br>
                        <select name="dropId" class="dropSimulador">
                            <%for (Investimento i : list) {%>
                            <option value="<%out.write(Integer.toString(i.getId()));%>">
                                <%out.write(i.getNome());%>
                            </option>
                            <%}%>
                        </select>
                        <br>
                        Valor do investimento:<br>
                        <input class="inputSimulador" type="text" name="InputValue" value="" size="55" /><br>
                        Quantidade de meses:<br>
                        <input class="inputSimulador" type="text" name="InputTime" value="" size="55" />
                        <br>
                        <input class="btnSimulador" type="submit" value="Simular" name="btnSimular"/>
                    </form>

                    <form>
                        <input class="btnSimulador" name="print" type="button" value="Imprimir página" onclick="imprimir()">
                    </form>

                </center>
            </div>

        </div>
    </body>
</html>
