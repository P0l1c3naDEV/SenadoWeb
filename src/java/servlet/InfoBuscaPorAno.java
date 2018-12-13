/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import control.jpa.ContratosJpaController;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import model.Contratos;

/**
 *
 * @author Raphael Policena
 */
@WebServlet(name = "InfoBuscaPorAno", urlPatterns = {"/InfoBuscaPorAno"})
public class InfoBuscaPorAno extends HttpServlet {

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
       
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("SenadoPU");
        EntityManager em = emf.createEntityManager();
        ContratosJpaController cjpa = new ContratosJpaController(emf);
        List<Contratos> contratos = new ArrayList<Contratos>();
        
        String ano = request.getParameter("ano");
        String coringa = "%";
        StringBuffer str = new StringBuffer();
        str.append(coringa);
        str.append(ano);
        str.append(coringa);
        String v = String.valueOf(str);
       
        //Todos os contratos
        Query buscaContrato = em.createNamedQuery("Contratos.findByIniciovigencia")
                .setParameter("iniciovigencia", v);
        contratos = buscaContrato.getResultList();
        
        PrintWriter out = response.getWriter();
        //out.println(contratos);
        
        //request.setAttribute("listContratos", contratos);  
      
        request.getRequestDispatcher("/Contratos/contratacoes.jsp").forward(request, response);
        
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
