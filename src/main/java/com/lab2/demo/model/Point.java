package com.lab2.demo.model;

import lombok.Getter;
import lombok.Setter;

public class Point {

    private final double x;
    private final double y;
    private final double r;
    @Setter
    private boolean isValid;
    @Getter
    @Setter
    private boolean result;

    public Point(double x, double y, double r) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.isValid = true;
    }

    public double getX() {
        return Math.round(x * 100.0) / 100.0;
    }

    public double getY() {
        return Math.round(y * 100.0) / 100.0;
    }

    public double getR() {
        return Math.round(r * 100.0) / 100.0;
    }
}
