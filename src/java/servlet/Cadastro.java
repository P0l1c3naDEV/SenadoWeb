/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import control.jpa.LogJpaController;
import control.jpa.UsuarioJpaController;
import control.secutity.SecurityCrypto;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Log;
import model.Usuario;
import model.UsuarioPK;

/**
 *
 * @author Raphael Policena
 */
@WebServlet(name = "Cadastro", urlPatterns = {"/Cadastro"})
public class Cadastro extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("UsuarioPU");

        UsuarioJpaController usuarioJPA = new UsuarioJpaController(emf);
        usuarioJPA.getEntityManager();

        EntityManagerFactory emfSenado = Persistence.createEntityManagerFactory("SenadoPU");
        LogJpaController logJpa = new LogJpaController(emfSenado);

        try {
            String password = SecurityCrypto.encrypt(request.getParameter("password"));

            UsuarioPK userpk = new UsuarioPK(0, email);
            java.util.Date date = new Date();
            Usuario user = new Usuario();
            user.setUsuarioPK(userpk);
            user.setNome(nome);
            user.setPassword(password);
            user.setCreateTime(date);
            user.setBloqueado(Boolean.FALSE);
            user.setTentativas(0);

            usuarioJPA.create(user);

            //Log
            Log log = new Log();
            log.setId(null);
            log.setCreateTime(date);
            log.setMsg("[CADASTRO] - " + email);
            logJpa.create(log);

            response.sendRedirect("login.jsp");
        } catch (Exception ex) {
            response.sendRedirect("cadastro.jsp");

            java.util.Date date = new Date();
            Log log = new Log();
            log.setId(null);
            log.setCreateTime(date);
            log.setMsg("[ERRO CADASTRO] - " + email);
            logJpa.create(log);

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
