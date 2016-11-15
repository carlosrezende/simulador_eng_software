<%@page import="simulador.regras_de_negocio.Investimento"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="simulador.jdbc.DAO_Inv"%>

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
        <title>Alteração de taxas</title>
        <link rel="stylesheet" type="text/css" href="css/alteracao_de_taxas.css">
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

        <div id="divMaior">

            <div id="divMenor">
                <p>
                    Página para alterar as taxas de investimentos:
                </p>
                <%
                    DAO_Inv dao = new DAO_Inv();
                    List<Investimento> lista;
                    lista = dao.getList();
                    dao.closeConnection();
                %>
                <table id="tableTaxas">
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Taxa</th>
                    </tr>
                    <%for (Investimento inv : lista) {%>
                    <tr>
                        <td><%out.print(inv.getId() + "");%></td>
                        <td><%out.print(inv.getNome() + "");%></td>
                        <td><%out.print(inv.getTaxa() + "");%></td>
                    </tr><%}%>
                </table>

                <form name="FormParaAlterarTaxa" action="alteracao_de_taxas.jsp" method="POST">
                    ID:<br>
                    <input type="text" name="InputId" value="" size="25" />
                    <br>
                    Nova Taxa:<br>
                    <input type="text" name="InputTaxa" value="" size="25" />
                    <br>
                    <input id="btnAlterarTaxa" type="submit" value="Alterar" name="btnAlterarTaxa" />
                </form>

                <%
                    if (request.getParameter("btnAlterarTaxa") != null) {
                        if (request.getParameter("btnAlterarTaxa").equals("Alterar")) {
                            String id = request.getParameter("InputId");
                            String taxa = request.getParameter("InputTaxa");

                            boolean continuar = true;
                            Integer ID = new Integer(0);
                            Double TAXA = new Double(0);
                            try {
                                ID = Integer.parseInt(id);
                                TAXA = Double.parseDouble(taxa);
                            } catch (Exception e) {
                                continuar = false;
                                e.printStackTrace();
                            }

                            if (continuar) {
                                try {
                                    DAO_Inv newDao = new DAO_Inv();
                                    try {
                                        newDao.updateTaxa(ID, TAXA);

                                        out.println("<script type=\"text/javascript\">");
                                        out.println("alert('A taxa foi alterada.');");
                                        out.println("</script>");
                                    } catch (Exception e) {

                                        out.println("<script type=\"text/javascript\">");
                                        out.println("alert('A taxa não foi alterada.');");
                                        out.println("</script>");

                                        e.printStackTrace();
                                    } finally {
                                        dao.closeConnection();
                                    }
                                } catch (Exception e) {
                                    out.println("<script type=\"text/javascript\">");
                                    out.println("alert('A taxa não foi alterada.');");
                                    out.println("</script>");
                                    e.printStackTrace();
                                }
                            }
                        }
                    }
                %>
            </div>
        </div>
    </body>
</html>
