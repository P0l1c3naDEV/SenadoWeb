<%-- 
    Document   : header
    Created on : 20/11/2018, 13:32:29
    Author     : muril
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- CSS dependencies -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="wireframe.css">
    </head>  
    
    <body class="bg-light">
        <script type="text/javascript">
            function logout(){
                session.invalidate();
            } 
        </script>
        <jsp:include page="/UsuarioServlet" flush="true" /> 
        <div class="d-flex flex-column flex-md-row align-items-center p-3 mb-3 box-shadow border-bottom">
            <h5 class="my-0 mr-md-auto font-weight-normal">Informa Senado</h5>
            <nav class="my-2 my-md-0 mr-md-3">
                <a class="p-2 text-dark" href="../../../SenadoWeb/index.jsp">Início</a>
                <a class="p-2 text-dark" href="../../../SenadoWeb/Contratos/contratacoes.jsp">Contratos</a>
                <a class="p-2 text-dark" href="../../../SenadoWeb/Senadores/senadores.jsp">Senadores</a>           
                <%
                    //Object sessaum = request.getAttribute("user");
                    if (session.getAttribute("user") == null) {
                %>            
                <a class="p-2 text-dark" href="../../../SenadoWeb/login.jsp">Login</a>
                <%
                } else {
                %>
                Olá, ${nome} |<a href="../../../SenadoWeb/Logout" > Logout</a>
                <%
                    }
                %>
            </nav>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>
