/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import control.jpa.AditivosJpaController;
import control.jpa.ContratosJpaController;
import control.jpa.ItensJpaController;
import java.io.IOException;
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
import model.Aditivos;
import model.Contratos;
import model.Itens;

/**
 *
 * @author Raphael Policena
 */
@WebServlet(name = "infoContratosServlet", urlPatterns = {"/infoContratosServlet"})
public class infoContratosServlet extends HttpServlet {

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

        String id = request.getParameter("id");

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("SenadoPU");
        AditivosJpaController adjpa = new AditivosJpaController(emf);
        adjpa.getEntityManager();

        ItensJpaController itjpa = new ItensJpaController(emf);
        itjpa.getEntityManager();

        ContratosJpaController cjpa = new ContratosJpaController(emf);
        cjpa.getEntityManager();
        /*
        List<Contratos> listcontratos = new ArrayList<Contratos>();
        
        
        
         */
        Contratos co = new Contratos();
        Itens it = new Itens();
        Aditivos ad = new Aditivos();

        co = cjpa.findContratos(id);
        
        //ItensPK itpk = new ItensPK();
       // itpk.setNumerocontrato(id);
        
        List<Itens> itens = new ArrayList<Itens>();
        EntityManager em = emf.createEntityManager();
        //Todos os itens
        Query totalItem = em.createNamedQuery("Itens.findByNumerocontrato")
                .setParameter("numerocontrato", id);
        itens = totalItem.getResultList();
        
              
        //Todos os aditivos
        List<Aditivos> listaditivos = new ArrayList<Aditivos>();
        Query totaladitivos = em.createNamedQuery("Aditivos.findByNumerocontratos")
                .setParameter("numerocontratos", id);
        listaditivos = totaladitivos.getResultList();

        //itens = itjpa.findItens(itpk);
        request.setAttribute("contrato", co);
        request.setAttribute("it", itens);
        request.setAttribute("ad", listaditivos);

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
