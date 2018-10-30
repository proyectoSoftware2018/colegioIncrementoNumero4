/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Aula;
import modelo.EsNumero;

/**
 *
 * @author KandL
 */
public class ControladorEditarAula extends HttpServlet {

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
       String grado = request.getParameter("grado");
        String seccion = request.getParameter("sec");
        String profesor = request.getParameter("comboPro");
        String cant = request.getParameter("cant");

        if (grado.equals("") || seccion.equals("") || profesor.equals("") || cant.equals("")) {
            String error = "Falta llenar todos los datos";
            request.getSession().setAttribute("error", error);
            request.getRequestDispatcher("errorAdmi.jsp").forward(request, response);
        } else {
            if (EsNumero.validar(cant) == false) {
                String error = "Hay un error en la cantidad no es número";
                request.getSession().setAttribute("error", error);
                request.getRequestDispatcher("errorAdmi.jsp").forward(request, response);
            } else {
                int cantMax = Integer.parseInt(cant);
                Aula au = new Aula(grado, seccion, profesor, cantMax);
                if (au.editar() == false) {
                    String error = "No se pudo Editar error";
                    request.getSession().setAttribute("error", error);
                    request.getRequestDispatcher("errorAdmi.jsp").forward(request, response);
                }else{
                    request.getSession().setAttribute("aula", au);
                    request.getRequestDispatcher("inforAula.jsp").forward(request, response);
                }
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
