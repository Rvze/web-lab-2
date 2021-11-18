package com.lab2.demo.servlets;

import com.lab2.demo.model.Point;
import com.lab2.demo.model.Result;
import com.lab2.demo.model.ResultsTable;
import com.lab2.demo.model.Time;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "areaCheckServlet", value = "/areaCheckServlet")
public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Time time = new Time();
        time.start();
        HttpSession session = req.getSession(true);
        String x, y, r;
        x = req.getParameter("x");
        y = req.getParameter("y_value");
        r = req.getParameter("r");
        double newX = inDouble(x);
        double newY = inDouble(y);
        double newR = inDouble(r);
        Point point = new Point(newX, newY, newR);
        point.setResult(isAreaHit(newX, newY, newR));
        ResultsTable resultsTable = getResult(point, session, req, time);
        session.setAttribute("result", resultsTable);
        req.getRequestDispatcher("/index.jsp").forward(req, resp);

    }

    private ResultsTable getResult(Point point, HttpSession session, HttpServletRequest req, Time time) {
        ResultsTable resultsTable = (ResultsTable) session.getAttribute("result");
        if (resultsTable == null) {
            resultsTable = new ResultsTable();
        }
        Result result = new Result(point.getX(), point.getY(), point.getR(), point.isResult());
        time.finish();
        result.setTime(time.getTime());
        result.setCurTime(time.getDateString());

        resultsTable.add(result);
        return resultsTable;
    }

    public Double inDouble(String arg) {
        return Double.parseDouble(arg.replace(',', '.'));
    }

    public boolean isAreaHit(double x, double y, double r) {
        return (x >= 0 && y <= 0 && y >= x - r/2) ||
                (x <= 0 && y >= 0 && x * x + y * y <= r / 2 * r / 2) ||
                (x >= 0 && y >= 0 && y <= r && x <= r);
    }

    private boolean isValid(double x) {
        return x > -3d && x < 5d;
    }
}