package com.lab2.demo.servlets;

import com.lab2.demo.model.ResultsTable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class DrawServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ResultsTable resultsTable = (ResultsTable) session.getAttribute("result");
        if (resultsTable == null) {
            resultsTable = new ResultsTable();
        }
        session.setAttribute("result", resultsTable);
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

}
