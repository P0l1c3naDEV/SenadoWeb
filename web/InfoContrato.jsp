<%-- 
    Document   : InfoContrato
    Created on : 28/11/2018, 14:01:53
    Author     : Raphael Policena
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="/assets/icons/politician.png" type="image/x-icon" /><meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- PAGE settings -->
        <title>Informa Senado | Contrato</title>
        <meta name="description" content="Informações sobre a parte administrativa do senada federal do Brasil.">
        <meta name="keywords" content="Senado
              Brasil
              Administração
              Senadores">
        <!-- CSS dependencies -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="/wireframe.css">
    </head>
<%@include  file="/header.jsp" %>
<jsp:include page="/infoContratosServlet" flush="true" /> 
<body class="">
  <div class="pt-5 text-center" style="">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1 class="">Contrato ${contrato.numerocontratos}</h1>
        </div>
      </div>
    </div>
  </div>
  <div class="pt-5" style="">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="card">
            <div class="card-header">Descrição</div>
            <div class="card-body">
              <blockquote class="blockquote mb-0">
                <p>${contrato.objeto}.</p>
                
              </blockquote>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="py-5">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <ul class="nav nav-tabs">
            <li class="nav-item"> <a href="" class="active nav-link" data-toggle="pill" data-target="#tabone"><i class="fa fa-cog fa-lg"></i>&nbsp;Itens Adquridos</a> </li>
            <li class="nav-item"> <a class="nav-link" href="" data-toggle="pill" data-target="#tabtwo"><i class="fa fa-plus-square fa-lg"></i>&nbsp;Aditivos</a> </li>
          </ul>
          <div class="tab-content mt-2">
            <div class="tab-pane fade show active" id="tabone" role="tabpanel">
              <div class="table-responsive">
                <table class="table table-striped table-borderless">
                  <thead class="table-primary">
                    <tr>
                      <th scope="col">Itens Adquiridos</th>
                      <th scope="col">Quantidade</th>
                    </tr>
                  </thead>
                  <tbody>
                      <c:forEach items="${it}" var="item">
                    <tr>
                      <td>${item.descricao}</td>
                      <td>${item.quantidadecontratada}</td>
                    </tr>
                    <tr></tr>
                    <tr></tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="tab-pane fade" id="tabtwo" role="tabpanel">
              <div class="table-responsive">
                <table class="table table-striped table-borderless">
                  <thead class="table-primary" >
                    <tr>
                      <th scope="col">Descrição</th>
                      <th>Publicação</th>
                    </tr>
                  </thead>
                  <tbody>
                       <c:forEach items="${ad}" var="ad">
                    <tr></tr>
                    <tr></tr>
                    <tr>
                      <td>${ad.descricao}</td>
                      <td>${ad.datapublicacao}</td>
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
                <%@include  file="/coment.jsp" %>        
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  <%@include  file="/footer.jsp" %>
</body>
</html>
