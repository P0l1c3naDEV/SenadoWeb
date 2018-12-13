<%-- 
    Document   : home
    Created on : 20/11/2018, 13:35:01
    Author     : muril
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- PAGE settings -->
        <meta name="description" content="Informações sobre a parte administrativa do senada federal do Brasil.">
        <meta name="keywords" content="Senado
              Brasil
              Administração
              Senadores">
        <!-- CSS dependencies -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="wireframe.css">
    </head>
    <body class="bg-light">
        <div class="pt-5 text-center">
            <div class="container">
                <div class="row">
                    <div class="col-md-9 mx-auto">
                        <h1 class="display-4">Encontre os dados</h1>
                        <p class="lead">Os dados estão organizados em três seções. Escolha uma delas abaixo.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="text-center" style="">
            <div class="container">
                <div class="row pt-4">
                    <div class="col-md-6">
                        <div class="card mb-4 box-shadow">
                            <div class="card-header">
                                <h4 class="my-0 font-weight-normal">Contratações</h4>
                            </div>
                            <div class="card-body">
                                <i class="fa fa-4x fa-file"></i>
                                <ul class="list-unstyled mt-3 mb-4">
                                    <li>Dados relativos a contratos firmados pelo Senado Federal.</li>
                                </ul>
                                <button type="button" class="btn btn-lg btn-block btn-primary" onclick="location.href = './Contratos/contratacoes.jsp';">Ver dados</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6" style="">
                        <div class="card mb-4 box-shadow">
                            <div class="card-header">
                                <h4 class="my-0 font-weight-normal">Senadores</h4>
                            </div>
                            <div class="card-body">
                                <i class="fa fa-4x fa-male"></i>
                                <ul class="list-unstyled mt-3 mb-4">
                                    <li>Dados relativos a gastos, benefícios e aposentadoria.</li>
                                </ul>
                                <button type="button" class="btn btn-lg btn-block btn-primary" onclick="location.href = './Senadores/senadores.jsp';">Ver dados</button>
                            </div>
                        </div>
                    </div>
                    <!--
                    <div class="col-md-4">
                        <div class="card mb-4 box-shadow">
                            <div class="card-header">
                                <h4 class="my-0 font-weight-normal">Gestão de pessoas</h4>
                            </div>
                            <div class="card-body">
                                <i class="fa fa-4x fa-users"></i>
                                <ul class="list-unstyled mt-3 mb-4">
                                    <li>Servidores aposentados, pensionistas, estagiários e terceirizados.</li>
                                </ul>
                                <button type="button" class="btn btn-lg btn-block btn-primary" onclick="location.href = './Gestao/gestao.html';">Ver dados</button>
                            </div>
                        </div>
                    </div>
                    -->
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>
