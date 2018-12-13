<%-- 
    Document   : contratacoes
    Created on : 20/11/2018, 10:07:53
    Author     : muril
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="../assets/icons/politician.png" type="image/x-icon" /><meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- PAGE settings -->
        <title>Informa Senado | Contratações</title>
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
        <jsp:include page="/ContratosServlet" flush="true" />        
        <%@include  file="../header.jsp" %>
        <div class="pt-5 text-center" style="">
            <div class="container">
                <div class="row">
                    <div class="col-md-9 mx-auto">
                        <h1 class="display-4">Contratações</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <p class="text-center">Nesta seção será possível vizualizar informações relativas às contratações, seus itens e aditivos, efetuadas pelo Senado Federal, obtidas com base nos dados abertos disponibilizados no site <a href="https://www12.senado.leg.br/dados-abertos" target="_blank"> Dados Abertos.</a>&nbsp;Os dados aqui mostrados foram previamente escolhidos, com o intuito de informar aos brasileiros sobre gastos específicos realizados pelo Senado Federal. </p>
                    </div>
                </div>
            </div>
        </div>
            
        <div class="py-3" >
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                            <form class="form-inline justify-content-end" action="../InfoBuscaPorAno" method="GET">
                            <div class="input-group">
                                <input type="text" class="form-control" id="ano" placeholder="Ex: 2018" name="ano">
                                <div class="input-group-append"><button class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div> 

        <!--<div class="py-0" style="">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header text-center" style=""> Contratos</div>
                        </div>
                        <div class="card">
                        </div>
                    </div>
                </div>
            </div>
        </div>-->      
        
        
        <div class="py-0">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-striped table-borderless">
                                <thead>
                                    <tr class="table-primary">
                                        <th scope="col">Numero do Contrato</th>
                                        <th scope="col">Empresa Contratada</th>
                                        <th scope="col">Inicio da Vigencia</th>
                                        <th>Fim da Vigencia</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="contrato" items="${listContratos}">
                                        <tr>
                                            <td>${contrato.numerocontratos}</td>
                                            <td><a href="InfoContrato.jsp?id=${contrato.numerocontratos}"> ${contrato.contratada}</td>
                                            <td>${contrato.iniciovigencia}</td>
                                            <td>${contrato.fimvigencia}</td>
                                        </c:forEach>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<%@include  file="../footer.jsp" %>
</body>
</html>
