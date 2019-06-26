/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import control.secutity.SecurityCrypto;
import control.secutity.Token;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.SignatureException;
import java.io.IOException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Raphael Policena
 */
@WebServlet(name = "RecoveryPassword", urlPatterns = {"/RecoveryPassword"})
public class RecoveryPassword extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @param filterChain javax filterChain
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String token = request.getParameter("id");
        try {
            Claims parser = Token.validateToken(token);
            //Verificando se o token está vazio
            
            if (token == null || token.trim().isEmpty()) {
                response.setStatus(401);
                return;
            }
            //Adquirindo o parâmetro para a atualização de email
            String email = String.valueOf(parser.getSubject());

            //Realizando o update
            if (request.getParameter("password") != null) {
                //List<Usuario> user = new ArrayList();
                EntityManagerFactory emf = Persistence.createEntityManagerFactory("UsuarioPU");
                EntityManager em = emf.createEntityManager();
                String password = SecurityCrypto.encrypt(request.getParameter("password"));
                em.getTransaction().begin();
                Query userQuery = em.createNamedQuery("Usuario.updatePassword")
                        .setParameter("bloqueado", false)
                        .setParameter("tentativas", 0)
                        .setParameter("password", password)
                        .setParameter("email", email);
                userQuery.executeUpdate();
                em.getTransaction().commit();

                response.sendRedirect("login.jsp");
            }
            
        } catch (SignatureException e) {
            //Se o token estiver sido modificado a página não responderá
            response.setStatus(401);
            System.out.println("Token Inválido! ");
        } 
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
