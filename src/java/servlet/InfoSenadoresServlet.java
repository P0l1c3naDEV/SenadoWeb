/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;


import control.clienteREST.Senadores;
import java.io.IOException;
import java.io.PrintWriter;
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
import jaxb.Parlamentar;
import model.Despesa;
import model.Escritorio;
import model.Imovel;

/**
 *
 * @author muril
 */
@WebServlet(name = "InfoSenadoresServlet", urlPatterns = {"/InfoSenadoresServlet"})
public class InfoSenadoresServlet extends HttpServlet {

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

        //Informacoes pessoais dos senadores
        int id = Integer.parseInt(request.getParameter("id"));
        Senadores senadores = new Senadores();
        Parlamentar parlamentar = senadores.callSenadoresID(id);

        //Informacoes de despesa dos senadores
        //DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("SenadoPU");
        EntityManager em = emf.createEntityManager();
        
        //Despesas dos senadores
        Query infoDespesaSenador = em.createNamedQuery("Despesa.findBySenador")
                .setParameter("senador", parlamentar.getIdentificacaoParlamentar().getNomeParlamentar());
        List<Despesa> despesaLista = infoDespesaSenador.getResultList();
        
        //Valor reembolsado total por senador
        Query despesaTotal = em.createNamedQuery("Despesa.findByValorReembolsadoTotal")
                .setParameter("senador", parlamentar.getIdentificacaoParlamentar().getNomeParlamentar());
        List total = despesaTotal.getResultList();
        String valortotal = String.format("%.2f", total.get(0));
        
        //Escritorios dos senadores
        Query infoEscritorios = em.createNamedQuery("Escritorio.findByNome")
                .setParameter("nome", parlamentar.getIdentificacaoParlamentar().getNomeParlamentar());
        List<Escritorio> escritorioLista = infoEscritorios.getResultList();
        
        //Imovel
        Query infoImovel = em.createNamedQuery("Imovel.findByNome")
                .setParameter("nome", parlamentar.getIdentificacaoParlamentar().getNomeParlamentar());
        List<Imovel> imovelLista = infoImovel.getResultList();
        
        request.setAttribute("despesas", despesaLista);
        request.setAttribute("escritorios", escritorioLista);
        request.setAttribute("imoveis", imovelLista.get(0));
        request.setAttribute("despesaTotal", valortotal);
        request.setAttribute("parlamentar", parlamentar);

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
