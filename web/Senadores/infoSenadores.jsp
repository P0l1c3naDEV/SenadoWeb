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

        <jsp:include page="/InfoSenadoresServlet" flush="true" />
        <%@include  file="../header.jsp" %>
        <div class="pt-5 text-center" style="">
            <div class="container">
                <div class="row">
                    <div class="col-md-9 mx-auto">
                        <h1 class="display-4">Senador</h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="pt-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-4"><img class="img-fluid d-block rounded-circle mx-auto" src="${parlamentar.identificacaoParlamentar.urlFotoParlamentar}" width="65%" height="75%"></div>
                    <div class="col-md-8">
                        <p class="lead text-left" >Codigo: ${parlamentar.identificacaoParlamentar.codigoParlamentar}<br>Nome: ${parlamentar.identificacaoParlamentar.nomeCompletoParlamentar}<br>Sexo: ${parlamentar.identificacaoParlamentar.sexoParlamentar}<br>Email: ${parlamentar.identificacaoParlamentar.emailParlamentar}<br>Estado: ${parlamentar.identificacaoParlamentar.ufParlamentar}<br>Partido: ${parlamentar.identificacaoParlamentar.siglaPartidoParlamentar}
                            <br>Tratamento: ${parlamentar.identificacaoParlamentar.formaTratamento}<br>Valor Reembolsado (R$): ${despesaTotal}<br>
                            Imóvel funcional: ${imoveis.imovelFuncional}<br>Auxílio Moradia: ${imoveis.auxilioMoradia}
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="py-3">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <ul class="nav nav-tabs">
                            <li class="nav-item"> <a href="" class="active nav-link" data-toggle="pill" data-target="#tabone"><i class="fa fa-usd"></i>&nbsp;Despesas</a> </li>
                            <li class="nav-item"> <a class="nav-link" href="" data-toggle="pill" data-target="#tabtwo"><i class="fa fa-briefcase"></i>&nbsp;Escritórios</a> </li>
                        </ul>
                        <div class="tab-content mt-2">
                            <div class="tab-pane fade show active" id="tabone" role="tabpanel">
                                <div class="table-responsive">
                                    <table class="table table-striped table-borderless">
                                        <thead class="table-primary">
                                            <tr>
                                                <th scope="col">Data</th>
                                                <th scope="col">Tipo</th>
                                                <th scope="col">Valor Reembolsado</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${despesas}" var="despesa">
                                                <tr>
                                                    <td>${despesa.data}</td>
                                                    <td><a href="infoDespesa.jsp?id=${despesa.id}">${despesa.tipoDespesa}</a></td>
                                                    <td>${despesa.valorReembolsado}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="tabtwo" role="tabpanel">
                                <div class="table-responsive">
                                    <table class="table table-striped table-borderless">
                                        <thead class="table-primary">
                                            <tr>
                                                <th scope="col">Estado</th>
                                                <th scope="col">Endereço</th>
                                                <th scope="col">Telefone</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${escritorios}" var="escritorio">
                                                <tr>
                                                    <td>${escritorio.estado}</td>
                                                    <td>${escritorio.endereco}</td>
                                                    <td>${escritorio.telefone}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

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
