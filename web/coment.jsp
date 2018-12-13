<%-- 
    Document   : coment
    Created on : 10/12/2018, 16:17:24
    Author     : muril
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    </head>
    <body>
        <%
            String url = request.getRequestURL().toString() + "?id=" + request.getParameter("id").toString();
            session.setAttribute("url", url);
        %>
        <jsp:include page="/ComentReadServ" flush="true" />
        <div class="text-center text-white" style="">
            <div class="container">
                <div class="row">
                    <div class="mx-auto col-md-12">
                        <p class="lead text-body">Deixe seu comentário</p>
                        <form action="../ComentServ" method="GET">
                            <div class="form-group">
                                <input type="hidden" name="url2" value="<%= request.getRequestURL()%>?id=${id}<%=request.getParameter("id")%>">
                                <textarea name="texto" maxlength="500" class="form-control" id="form26" rows="3" placeholder="Seu comentário..." style=""></textarea><br>
                                <button type="submit" class="btn btn-primary btn-block">Comentar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">

                        <c:forEach items="${comentList}" var="lista">
                            <div class="pt-2">
                                <div class="card">
                                    <div class="card-header"> ${lista.commentUser}<br></div>
                                    <div class="card-body">
                                        <p>${lista.commentText}</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
