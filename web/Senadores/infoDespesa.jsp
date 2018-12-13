<%-- 
    Document   : senadores
    Created on : 20/11/2018, 13:24:26
    Author     : muril
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="../assets/icons/politician.png" type="image/x-icon" /><meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- PAGE settings -->
        <title>Informa Senado | Senador</title>
        <meta name="description" content="Informações sobre a parte administrativa do senada federal do Brasil.">
        <meta name="keywords" content="Senado
              Brasil
              Administração
              Senadores">
        <!-- CSS dependencies -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="../wireframe.css">
    </head>
    <body class="bg-light">
        <jsp:include page="/InfoDespesaServlet" flush="true" />
        <%@include  file="../header.jsp" %>
        <div class="pt-5 text-center" style="">
            <div class="container">
                <div class="row">
                    <div class="col-md-9 mx-auto">
                        <h1 class="display-4">Despesa</h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="pt-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-striped table-borderless">
                                <thead class="table-primary">
                                    <tr>
                                        <th scope="col">Dado</th>
                                        <th scope="col">Descrição</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">Mês</th>
                                        <td>${despesa.mes}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Ano</th>
                                        <td>${despesa.ano}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Senador</th>
                                        <td>${despesa.senador}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Tipo</th>
                                        <td>${despesa.tipoDespesa}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">CNPJ/CPF</th>
                                        <td>${despesa.cnpjCpf}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Fornecedor</th>
                                        <td>${despesa.fornecedor}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Documento</th>
                                        <td>${despesa.documento}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Data</th>
                                        <td>${despesa.data}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Detalhamento</th>
                                        <td>${despesa.detalhamento}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Valor reembolsado</th>
                                        <td>${despesa.valorReembolsado}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include  file="../coment.jsp" %>
        <%@include  file="../footer.jsp" %>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    </body>
</html>
