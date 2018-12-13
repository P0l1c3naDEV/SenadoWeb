<%-- 
    Document   : forgotPassword
    Created on : 11/12/2018, 19:11:00
    Author     : Raphael Policena
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="../assets/icons/politician.png" type="image/x-icon" /><meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- PAGE settings -->
        <title>Informa Senado | Recuperar senha</title>
        <meta name="description" content="Informações sobre a parte administrativa do senada federal do Brasil.">
        <meta name="keywords" content="Senado
              Brasil
              Administração
              Senadores">
        <!-- CSS dependencies -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="../wireframe.css">
    </head>
    <body>
        <%@include  file="header.jsp" %>

        <div class="py-5 text-center" style="background-color: ;background-size:cover;" >
            <div class="container">
                <div class="row">
                    <div class="mx-auto col-md-6 col-10 bg-white p-5 shadow-lg">
                        <h1 class="mb-4">Recuperar Senha</h1>
                        <form action="ForgotPassword">
                            <div class="form-group"> <input type="email" placeholder="Email" id="mail" name="mail" class="form-control" maxlength="50"> </div>
                            <div class="form-group mb-3"> <small class="form-text text-muted text-right">
                                </small> 
                                <div class="form-group">
                                </div> <button type="submit" class="btn btn-primary text-right justify-content-end">Enviar</button>
                            </div>
                        </form>
                        <h6 class="h6">Insira seu email para a senha!<br>Você receberá um link de acessar a página de recuperação.</h6>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

        <%@include  file="footer.jsp" %></body>
</html>
