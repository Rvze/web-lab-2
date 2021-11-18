package com.lab2.demo.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllerServlet", value = "/controllerServlet")
public class ControllerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("submit") != null) {
            String x = req.getParameter("x");
            String y = req.getParameter("y_value");
            String r = req.getParameter("r");
            if (isDoubles(x, y, r))
                req.getRequestDispatcher("/areaCheckServlet").forward(req, resp);
            else
                getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);

        } else if (req.getParameter("resetTable") != null) {
            getServletContext().getRequestDispatcher("/clearTableServlet").forward(req, resp);
        }
    }

    private boolean isDoubles(String... args) {
        try {
            for (String s : args) {
                if (s == null) {
                    return false;
                }
                Double.parseDouble(s.replace(',', '.'));
            }
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}