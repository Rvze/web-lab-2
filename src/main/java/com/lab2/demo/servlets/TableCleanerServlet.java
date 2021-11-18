package com.lab2.demo.servlets;

import com.lab2.demo.model.ResultsTable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name = "clearTableServlet", value = "/clearTableServlet")
public class TableCleanerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ResultsTable resultsTable = (ResultsTable) req.getSession().getAttribute("result");
        if (resultsTable == null) {
            resultsTable = new ResultsTable();
        }
        resultsTable.clear();
        req.getSession().setAttribute("result", resultsTable);
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}
