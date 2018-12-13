<%-- 
    Document   : cadastro
    Created on : 28/11/2018, 11:07:20
    Author     : Raphael Policena
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="../assets/icons/politician.png" type="image/x-icon" /><meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- PAGE settings -->
        <title>Informa Senado | Cadastro</title>
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
        <%@include  file="/header.jsp" %>

        <div class="py-5 text-center" style="">
            <div class=" text-center" style="" >
                <div class="container">
                    <div class="row py-5 shadow-lg">
                        <div class="mx-auto col-lg-6 col-10">
                            <h1>Cadastro</h1>
                            <!--<p class="mb-3">Aqui você pode fazer seu cadastro gratuito em nosso site, para poder fazer comentários em nosso fórum. Ao finalizar, você será redirecionado automaticamente para a tela de Login!</p>-->
                            <form class="text-left" action="Cadastro" onsubmit="validatePassword()">
                                <div class="form-group"> <label for="nome">Nome</label> <input type="text" class="form-control" id="nome" placeholder="Insira seu nome" required="required" name="nome" maxlength="50"> </div>
                                <div class="form-group"> <label for="email">E-mail</label> <input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" class="form-control" id="email" placeholder="seuemail@email.com" required="required" name="email" maxlength="50"> </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6"> <label for="password">Senha</label> <input type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{8,}" title="
                                                                                                                 Deve conter pelo menos um número e uma letra maiúscula, caracteres especiais e minúscula e pelo menos 8 ou mais caracteres" class="form-control" id="password" placeholder="*****" required="required" name="password" maxlength="50"> </div>
                                    <div class="form-group col-md-6"> <label for="passwordconfirm">Confirme a senha</label> <input type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{8,}" title="
                                                                                                                                   Deve conter pelo menos um número e uma letra maiúscula e minúscula, caracteres especiais e pelo menos 8 ou mais caracteres" class="form-control" id="passwordconfirm" placeholder="*****" required="required" name="passwordconfirm" maxlength="50"> </div>
                                    <br> 

                                    <script type="text/javascript">
                                        var password = document.getElementById("password")
                                                , confirm_password = document.getElementById("passwordconfirm");

                                        function validatePassword() {
                                            if (password.value !== confirm_password.value) {
                                                confirm_password.setCustomValidity("As senhas não são iguais! Por favor, insira sua senha corretamente!");
                                            } else {
                                                confirm_password.setCustomValidity('');
                                            }
                                        }

                                        password.onchange = validatePassword;
                                        confirm_password.onkeyup = validatePassword;
                                    </script>

                                </div>


                                <div class="form-group">
                                    <%-- <div class="form-check"> <input class="form-check-input" type="checkbox" id="form21" value="on" required="required"> <label class="form-check-label" for="form21">Eu aceito os termos e condições do serviço</label> </div> --%>
                                </div> <button type="submit" class="btn btn-primary text-center">Cadastrar</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        </div>
        <%@include  file="/footer.jsp" %>
</html>
