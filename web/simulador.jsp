<%@page import="simulador.jdbc.DAO_Inv"%>
<%@page import="java.util.List"%>
<%@page import="simulador.regras_de_negocio.Investimento"%>
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

        <script language="JavaScript">
            function imprimir(text) {
                text = document
                print(text)
            }
        </script>



        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Simulador</title>
        <link rel="stylesheet" type="text/css" href="css/simulador.css">
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

        <div id="divMaior">
            <div id="divMenor">
                <p>Página para alterar as taxas de investimentos:</p>
                <%
                    DAO_Inv dao = new DAO_Inv();
                    List<Investimento> lista;
                    lista = dao.getList();
                    dao.closeConnection();
                %>
                <table id="tableInvs">
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Valor Mínimo</th>
                        <th>Taxa</th>
                    </tr>
                    <%for (Investimento inv : lista) {%>
                    <tr>
                        <td><%out.print(inv.getId() + "");%></td>
                        <td><%out.print(inv.getNome() + "");%></td>
                        <td><%out.print(inv.getValor_minimo() + "");%></td>
                        <td><%out.print(inv.getTaxa() + "");%></td>
                    </tr><%}%>
                </table>

                <form name="FormParaSimular" action="#" method="POST">

                    ID:<br>
                    <select name="InputId">
                         <%for (Investimento inv : lista) {%>
                    
                      
                    
                    <option value='<%out.print(inv.getId());%>'><%out.print(inv.getNome() + "");%> </option>
                    <%}%>
                    <option></option>
                        <option></option>
                        <option></option>
                        <option></option>
                    </select>
                   
                    <br>

                    Valor do investimento: (R$)<br>
                    <input type="text" name="InputValor" value="" size="25" />
                    <br>

                    Tempo: (meses)<br>
                    <input type="text" name="InputTempo" value="" size="25" />
                    <br>

                    <input id="btnSimular" type="submit" value="Simular" name="btnSimular" />
                </form>

                <%
                    if (request.getParameter("btnSimular") != null) {
                        if (request.getParameter("btnSimular").equals("Simular")) {
                            String id = request.getParameter("InputId");
                            String valor = request.getParameter("InputValor");
                            String tempo = request.getParameter("InputTempo");

                            boolean continuar = true;
                            Integer ID = new Integer(0);
                            Double VALOR = new Double(0);
                            Integer TEMPO = new Integer(0);
                            try {
                                ID = Integer.parseInt(id);
                                VALOR = Double.parseDouble(valor);
                                TEMPO = Integer.parseInt(tempo);
                            } catch (Exception e) {

                                out.println("<script type=\"text/javascript\">");
                                out.println("alert('Um ou mais campos foram digitados de forma errada.');");
                                out.println("</script>");
                                continuar = false;
                                e.printStackTrace();
                            }

                            Investimento invest = new Investimento();
                            Double lucro = new Double(0);
                            if (continuar) {
                                for (Investimento x : lista) {
                                    if (ID.equals(x.getId())) {

                                        if (VALOR.compareTo(x.getValor_minimo()) < 0) {
                                            invest = null;
                                        } else {
                                            invest.setId(ID);
                                            invest.setNome(x.getNome());
                                            invest.setValor(VALOR);
                                            invest.setValor_minimo(x.getValor_minimo());
                                            invest.setTaxa(x.getTaxa());
                                            invest.setTempo(TEMPO);
                                            break;
                                        }
                                    }
                                }
                                if (invest != null) {
                %>
                <table id="tableInvs">
                    <tr>
                        <th>Nome</th>
                        <th>Valor do investimento</th>
                        <th>Tempo do investimento</th>
                        <th>Resultado</th>
                    </tr>                    
                    <tr>
                        <td><%out.print(invest.getNome() + "");%></td>
                        <td><%out.print(invest.getValor() + "");%></td>
                        <td><%out.print(invest.getTempo() + "");%></td>
                        <td><%out.print(invest.getValorTotal() + "");%></td>
                    </tr>
                </table>
                <%

                                } else {
                                    out.println("<script type=\"text/javascript\">");
                                    out.println("alert('O valor não pode ser menor que o valor mínimo e o ID digitado deve ser da tabela.');");
                                    out.println("</script>");
                                }
                            }
                        }
                    }
                %> 
                <form>
                    <input id="btnPrint" name="print" type="button" value="Imprimir esta página" onclick="imprimir()">
                </form>
            </div>
        </div>
    </body>
</html>
