<%@page import="simulador.jdbc.DAO_Inv"%>
<%@page import="simulador.regras_de_negocio.Investimento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page session="true"%>

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
        <title>Cadastro de investimento</title>
        <link rel="stylesheet" type="text/css" href="css/cadastro_de_investimento.css">
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
        <div id="divCadastrarInvestimento">
            Formulário para cadastrar novo Investimento
            <div id="subDivCadastrarInvestimento">

                <form name="FormCadastrarInvestimento" action="#" method="POST">
                    Nome:<br>
                    <input type="text" name="InputNome" value="" size="55" /><br>
                    Valor:<br>
                    <input type="text" name="InputValor" value="" size="55" /><br>
                    Valor mínimo:<br>
                    <input type="text" name="InputValorMin" value="" size="55" /><br>
                    Taxa: (% ao mês)<br>
                    <input type="text" name="InputTaxa" value="" size="55" /><br>
                    Tempo: (Meses)<br>
                    <input type="text" name="InputTempo" value="" size="55" /><br>

                    <input id="btnCadastrarInvestimento" type="submit" value="Cadastrar Investimento" name="btnCadastrarInvestimento"/>
                </form>
            </div>
        </div>

        <%
            /*ao clicar no botão*/
            if (request.getParameter("btnCadastrarInvestimento") != null) {
                if (request.getParameter("btnCadastrarInvestimento").equals("Cadastrar Investimento")) {

                    /*criar investimento*/
                    Investimento inv = new Investimento();

                    /*setar os atributos*/
                    inv.setNome(request.getParameter("InputNome"));

                    boolean continuar = true;

                    /*setar valor*/
                    Double valor = new Double(0);
                    try {
                        valor = Double.parseDouble(request.getParameter("InputValor"));
                        inv.setValor(valor);
                    } catch (Exception e) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('O valor foi inserido de forma errada.');");
                        out.println("</script>");
                        e.printStackTrace();
                        continuar = false;
                    }

                    /*setar valor mínimo*/
                    Double valorMin = new Double(0);
                    if (continuar) {
                        try {
                            valorMin = Double.parseDouble(request.getParameter("InputValorMin"));
                            inv.setValor_minimo(valorMin);
                        } catch (Exception e) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('O valor mínimo foi inserido de forma errada.');");
                            out.println("</script>");
                            e.printStackTrace();
                            continuar = false;
                        }
                    }

                    if (continuar) {
                        /*verificar se o valor mínimo é menor ou igual ao valor*/
                        if (valor.compareTo(valorMin) >= 0) {
                            continuar = true;
                        } else {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('O valor do investimento não pode ser menor que o valor mínimo.');");
                            out.println("</script>");
                            continuar = false;
                        }
                    }


                    /*setar taxa*/
                    if (continuar) {
                        try {
                            Double taxa = Double.parseDouble(request.getParameter("InputTaxa"));
                            inv.setTaxa(taxa);
                        } catch (Exception e) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('O valor da taxa foi inserido de forma errada.');");
                            out.println("</script>");
                            e.printStackTrace();
                            continuar = false;
                        }
                    }

                    /*setar tempo*/
                    if (continuar) {
                        try {
                            Integer tempo = Integer.parseInt(request.getParameter("InputTempo"));
                            inv.setTempo(tempo);
                        } catch (Exception e) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('O tempo foi inserido de forma errada.');");
                            out.println("</script>");
                            e.printStackTrace();
                            continuar = false;
                        }
                    }

                    if (continuar) {

                        try {
                            /*criar um objeto para adicionar um investimento no banco*/
                            DAO_Inv dao = new DAO_Inv();

                            try {
                                /*inserir o investimento no banco*/
                                dao.insert(inv);

                                out.println("<script type=\"text/javascript\">");
                                out.println("alert('O Investimento foi cadastrado com sucesso.');");
                                out.println("</script>");

                            } catch (Exception e) {

                                e.printStackTrace();

                                out.println("<script type=\"text/javascript\">");
                                out.println("alert('Erro ao cadastrar investimento.');");
                                out.println("</script>");

                            } finally {
                                /*encerrar a conexão*/
                                dao.closeConnection();
                            }

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        %>
    </body>
</html>
