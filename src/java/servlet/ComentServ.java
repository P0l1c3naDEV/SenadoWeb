/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import control.jpa.ComentarioJpaController;
import control.jpa.LogJpaController;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javafx.scene.chart.PieChart;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Comentario;
import model.Log;
import model.Usuario;

/**
 *
 * @author muril
 */
@WebServlet(name = "ComentServ", urlPatterns = {"/ComentServ"})
public class ComentServ extends HttpServlet {

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

        HttpSession session = request.getSession();

        String texto = request.getParameter("texto");
        String url = (String) session.getAttribute("url");
        List<Usuario> user = new ArrayList<>();

        if (session.getAttribute("user") == null) {
            //Enciar para a pagina de login
            response.sendRedirect("./login.jsp");
        } else {
            user = (List<Usuario>) session.getAttribute("user");

            EntityManagerFactory emfUsuario = Persistence.createEntityManagerFactory("UsuarioPU");
            ComentarioJpaController comentJpa = new ComentarioJpaController(emfUsuario);
            
            EntityManagerFactory emfSenado = Persistence.createEntityManagerFactory("SenadoPU");
            LogJpaController logJpa = new LogJpaController(emfSenado);
            
            Comentario comentario = new Comentario();
            comentario.setId(null);
            comentario.setCommentText(texto);
            comentario.setCommentUser(user.get(0).getNome());
            Date date = new Date();
            comentario.setCommentData(date);
            comentario.setIdUsuario(user.get(0).getUsuarioPK().getId());
            comentario.setUrl(url);

            Log log = new Log();
            //log.setId(null);
            log.setCreateTime(date);
            log.setMsg("[COMENTARIO - REALIZADO] - Usuario: " + user.get(0).getUsuarioPK().getEmail() + " - URL: " + url);
            logJpa.create(log);

            comentJpa.create(comentario);

            response.sendRedirect(url);
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
