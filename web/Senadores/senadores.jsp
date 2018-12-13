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
        <title>Informa Senado | Senadores</title>
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
        <jsp:include page="/SenadoresServlet" flush="true" />
        <%@include  file="../header.jsp" %>
        <div class="pt-5 text-center">
            <div class="container">
                <div class="row">
                    <div class="col-md-9 mx-auto">
                        <h1 class="display-4">Senadores</h1>
                        <p class="lead">Dados relativos a gastos, benefícios e aposentadoria dos Senadores.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="py-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-borderless table-striped">
                                <thead>
                                    <tr class="table-primary">
                                        <th>ID</th>
                                        <th>Nome</th>
                                        <th>Estado</th>
                                        <th>Partido</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="parlamentar" items="${lista}">
                                        <tr>
                                            <td>${parlamentar.identificacaoParlamentar.codigoParlamentar}</td>
                                            <td><a href="infoSenadores.jsp?id=${parlamentar.identificacaoParlamentar.codigoParlamentar}">${parlamentar.identificacaoParlamentar.nomeParlamentar}</a></td>
                                            <td>${parlamentar.identificacaoParlamentar.ufParlamentar}</td>
                                            <td>${parlamentar.identificacaoParlamentar.siglaPartidoParlamentar}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include  file="../footer.jsp" %>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    </body>
</html>
