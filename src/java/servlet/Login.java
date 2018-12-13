/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import control.jpa.LogJpaController;
import control.secutity.SecurityCrypto;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Log;
import model.Usuario;

/**
 *
 * @author Raphael Policena
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String email = request.getParameter("mail");
        String password = SecurityCrypto.encrypt(request.getParameter("senha"));

        EntityManagerFactory emfUsuario = Persistence.createEntityManagerFactory("UsuarioPU");
        EntityManager emUsuario = emfUsuario.createEntityManager();

        EntityManagerFactory emfApplication = Persistence.createEntityManagerFactory("SenadoPU");
        LogJpaController logJpa = new LogJpaController(emfApplication);

        List<Usuario> user = new ArrayList();
        Query userQuery = emUsuario.createNamedQuery("Usuario.findByEmail")
                .setParameter("email", email);
        user = userQuery.getResultList();

        HttpSession session = request.getSession();

        if (email.equals(user.get(0).getUsuarioPK().getEmail()) && password.equals(user.get(0).getPassword()) == true && user.get(0).getBloqueado() != Boolean.TRUE) {
            session.setAttribute("user", user);
            session.setAttribute("userName", user.get(0).getNome());
            session.setAttribute("userEmail", user.get(0).getUsuarioPK().getEmail());
            response.sendRedirect("index.jsp");

            java.util.Date date = new Date();
            Log log = new Log();
            log.setId(null);
            log.setCreateTime(date);
            log.setMsg("[LOGIN - SUCESSO] - " + email);
            logJpa.create(log);

        } else {

            if (user.get(0).getTentativas() > 7) {
                emUsuario.getTransaction().begin();
                Query q = emUsuario.createNamedQuery("Usuario.updateBloqueado")
                        .setParameter("bloqueado", Boolean.TRUE)
                        .setParameter("id", user.get(0).getUsuarioPK().getId());
                q.executeUpdate();
                emUsuario.getTransaction().commit();

                java.util.Date date = new Date();
                Log log = new Log();
                log.setId(null);
                log.setCreateTime(date);
                log.setMsg("[LOGIN - USUARIO BLOQUEADO] - Tentou se conectar: " + email);
                logJpa.create(log);

                //MANDAR P O PHAEL SE VIRAR
                response.sendRedirect("index.jsp");
            } else {
                emUsuario.getTransaction().begin();
                Query q = emUsuario.createNamedQuery("Usuario.updateTentativas")
                        .setParameter("tentativas", user.get(0).getTentativas() + 1)
                        .setParameter("id", user.get(0).getUsuarioPK().getId());
                q.executeUpdate();
                emUsuario.getTransaction().commit();
                
                java.util.Date date = new Date();
                Log log = new Log();
                log.setId(null);
                log.setCreateTime(date);
                log.setMsg("[LOGIN - ERRO DE SENHA] - Tentou se conectar: " + email);
                logJpa.create(log);

                response.sendRedirect("login.jsp");
            }
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
