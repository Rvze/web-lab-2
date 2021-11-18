package com.lab2.demo.model;

import java.util.ArrayList;

public class ResultsTable {
    private final ArrayList<Result> results;

    public ResultsTable() {
        results = new ArrayList<>();
    }

    public void add(Result result) {
        results.add(result);
    }

    public void clear() {
        results.clear();
    }

    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        for (Result result : results) {
            stringBuilder.append(result);
        }
        return stringBuilder.toString();
    }

    public StringBuilder toSVGs() {
        StringBuilder stringBuilder = new StringBuilder();
        for (Result result : results) {
            stringBuilder.append(result.toSVG());
        }
        return stringBuilder;
    }
}
