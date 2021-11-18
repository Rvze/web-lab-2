package com.lab2.demo.model;

import lombok.Getter;

import java.text.DateFormat;
import java.util.Locale;

public class Time {
    private final long dateString;
    @Getter
    private double start;
    @Getter
    private double finish;

    public Time() {
        dateString = System.nanoTime();

    }

    public void start() {
        start = (double) System.nanoTime();
    }

    public void finish() {
        finish = (double) System.nanoTime() - start;
    }

    public String getDateString() {
        return DateFormat.getTimeInstance(DateFormat.DEFAULT, new Locale("RU", "ru")).format(new java.util.Date());
    }

    public String getTime() {
        return String.format("%4.2f", (finish) / 100000) + "ms";
    }
}
