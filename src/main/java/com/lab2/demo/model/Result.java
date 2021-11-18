package com.lab2.demo.model;

import lombok.Getter;
import lombok.Setter;

public class Result {
    @Getter
    private final double x;
    @Getter
    private final double y;
    @Getter
    private final double r;
    @Setter
    private String curTime;
    @Setter
    private String time;
    private final boolean shot;


    public Result(double x, double y, double r, boolean shot) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.shot = shot;
    }

    @Override
    public String toString() {
        return "<tr>" +
                "<td>" + x + "</td>" +
                "<td>" + y + "</td>" +
                "<td>" + r + "</td>" +
                "<td>" + shot + "</td>" +
                "<td>" + curTime + "</td>" +
                "<td>" + time + "</td></tr>";
    }

    public String toSVG() {
        double radius = 120;
        double delta = 30;
        double xCor = ((x / r) * radius) + (radius + delta);
        double yCor = ((((-y) / r) * radius) + (radius + delta));
        String color = ("\"red\"");
        return "<circle class=\"coordinate-dot\" r=\"2.5\" cx=\"" + xCor + "\" cy=\"" + yCor + "\" stroke=" + color + " fill=" + color + "></circle>\n";
    }
}