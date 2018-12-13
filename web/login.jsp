<%-- 
    Document   : login
    Created on : 28/11/2018, 10:45:55
    Author     : Raphael Policena
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="theme.css" type="text/css">
    </head>

    <body>
        <%@include  file="header.jsp" %>
       
        <div class="py-5 text-center" style="background-color: ;background-size:cover;">
            <div class="container">
                <div class="row">
                    <div class="mx-auto col-md-6 col-10 bg-white p-5 shadow-lg">
                        <h1 class="mb-4">Log in</h1>
                        <form action="Login" method="POST">
                            <div class="form-group"> <input type="email" maxlength="" class="form-control" placeholder="Email" id="mail" name="mail" maxlength="50"> </div>
                            <div class="form-group mb-3"> <input type="password" class="form-control" placeholder="Senha" id="senha" name="senha" maxlength="50"> <small class="form-text text-muted text-right">
                                    <a href="forgotPassword.jsp"> Esqueceu sua senha?</a> <br>
                                    <a href="cadastro.jsp"> Cadastrar</a>
                                </small> </div> 
                            <div class="form-group">                                
                            </div> <button type="submit" class="btn btn-primary text-right justify-content-end">Entrar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <%@include  file="footer.jsp" %>
    </body>
</html>
