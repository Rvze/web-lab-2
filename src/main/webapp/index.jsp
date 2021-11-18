<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.lab2.demo.model.ResultsTable" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Лабораторная работа №2</title>
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">

</head>
<body>
<div>
    <header>
        <h1>Проверка попадания точки на заданную область</h1>
        <p>
            Макаров Ньургун Михайлович P3214
            <a class="link" href="https://github.com/Rvze" target="_blank">
                <img alt=github src="img/github.png">
            </a>
            Вариант: 14111
        </p>
    </header>
</div>
<div class="flex flex-col">
    <div class="grid grid-cols-2 divide-x divide-green-500">
        <div class="container ml-28">
            <form class="form" method="get" action="controllerServlet" name="form"
                  id="form">
                <div class="grid grid-cols-2 divide-x divide-green-500">
                    <div class="text-center">
                        <label class="block text-gray-700 text-sm font-bold mb-2">
                            Координата X:
                            <input class="item-x mt-10 shadow appearance-none border rounded py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                   id="item-x" placeholder="(-3;5)" name="x" size="8">
                        </label>
                        <div>
                            <label class="block text-gray-700 text-sm font-bold mb-2">
                                Радиус R:
                                <select name="r" id="r" onchange="changeR()"
                                        class="appearance-none mt-5 shadow appearance-none border rounded py-2 px-16 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                                    <option class="r" name="r" id="r1" value="1">1</option>
                                    <option class="r" name="r" id="r1.5" value="1.5">1.5</option>
                                    <option class="r" name="r" id="r2" value="2">2</option>
                                    <option class="r" name="r" id="r2.5" value="2.5">2.5</option>
                                    <option class="r" name="r" id="r3" value="3">3</option>
                                </select>
                            </label>
                        </div>
                    </div>
                </div>

                <label>
                    <input name="y_value" value="y_value" id="y_hidden" type="text" style="visibility: hidden"/>
                </label>
                <div class="box-border ">
                    <table class="table-fixed">
                        <thead>
                        <tr>
                            <th class="w-1/3">
                                Координата Y:
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="border border-green-800">
                                <label>
                                    <input class="item-y bg-green-500 hover:bg-green-700 text-white font-bold py-1 px-2 rounded-full"
                                           id="y_-5" name="y" value="-5" type="button" onclick="setY(-5)">
                                    -5
                                </label>

                            </td>
                            <td class="border border-green-800">
                                <label>
                                    <input class="item-y bg-green-500 hover:bg-green-700 text-white font-bold py-1 px-2 rounded-full"
                                           id="y_-4" name="y" type="button" value="-4" onclick="setY(-4)">
                                    -4
                                </label>
                            </td>
                            <td class="border border-green-800">
                                <label>
                                    <input class="item-y bg-green-500 hover:bg-green-700 text-white font-bold py-1 px-2 rounded-full"
                                           id="y_-3" name="y" type="button" value="-3" onclick="setY(-3)">
                                    -3
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td class="border border-green-800">
                                <label>
                                    <input class="item-y bg-green-500 hover:bg-green-700 text-white font-bold py-1 px-2 rounded-full"
                                           id="y_-2" name="y" type="button" value="-2" onclick="setY(-2)">
                                    -2
                                </label>
                            </td>
                            <td class="border border-green-800">
                                <label>
                                    <input class="item-y bg-green-500 hover:bg-green-700 text-white font-bold py-1 px-2 rounded-full"
                                           id="y_-1" name="y" type="button" value="-1" onclick="setY(-1)">
                                    -1
                                </label>
                            </td>
                            <td class="border border-green-800">
                                <label>
                                    <input class="item-y bg-green-500 hover:bg-green-700 text-white font-bold py-1 px-3 rounded-full"
                                           id="y_0" name="y" type="button" value="0" onclick="setY(0)">
                                    0
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td class="border border-green-800">
                                <label>
                                    <input class="item-y bg-green-500 hover:bg-green-700 text-white font-bold py-1 px-3 rounded-full"
                                           id="y_1" name="y" type="button" value="1" onclick="setY(1)">
                                    1
                                </label>
                            </td>
                            <td class="border border-green-800">
                                <label>
                                    <input class="item-y bg-green-500 hover:bg-green-700 text-white font-bold py-1 px-3 rounded-full"
                                           id="y_2" name="y" type="button" value="2" onclick="setY(2)">
                                    2
                                </label>
                            </td>
                            <td class="border border-green-800">
                                <label>
                                    <input class="item-y bg-green-500 hover:bg-green-700 text-white font-bold py-1 px-3 rounded-full"
                                           id="y_3" name="y" value="3" type="button" onclick="setY(3)">
                                    3
                                </label>
                            </td>
                        </tr>
                        </tbody>


                    </table>

                </div>
                <button type="submit" id="submit" name="submit" value="submit"
                        class="bg-transparent hover:bg-green-800 text-green-700 font-semibold hover:text-white py-1 px-3 border border-green-700 hover:border-transparent rounded">
                    Отправить
                </button>
                <button type="submit" value="resetTable" name="resetTable"
                        class="bg-transparent hover:bg-green-800 text-green-700 font-semibold hover:text-white py-1 px-3 border border-green-700 hover:border-transparent rounded">
                    Очистить таблицу
                </button>
            </form>
            <div class="draw_axis">
                <svg class="svg-axis" xmlns="http://www.w3.org/2000/svg" width="300" height="300" id="area">
                    <%
                        ResultsTable resultTable = (ResultsTable) session.getAttribute("result");
                        if (resultTable == null) {
                            resultTable = new ResultsTable();
                        }
                    %>
                    <%--draw axis--%>
                    <line x1="0" y1="150" x2="300" y2="150" stroke="#003"></line>
                    <line x1="150" y1="0" x2="150" y2="300" stroke="#003"></line>
                    <polygon points="300,150 295,145 295,155" fill="#003" stroke="#000"></polygon>
                    <polygon points="150,0 145,5 155,5" fill="#003" stroke="#000"></polygon>
                    <line x1="270" y1="155" x2="270" y2="145" stroke="#000"></line>
                    <text x="265" y="140" class="axis-text" id="radius-text-right">1</text>
                    <line x1="210" y1="155" x2="210" y2="145" stroke="#000"></line>
                    <%--                    <text x="200" y="140" class="axis-text" id="radius-text-right-half">R/2</text>--%>
                    <line x1="90" y1="155" x2="90" y2="145" stroke="#000"></line>
                    <%--                    <text x="75" y="140" class="axis-text" id="radius-text-left-half">-R/2</text>--%>
                    <line x1="30" y1="155" x2="30" y2="145" stroke="#000"></line>
                    <text x="23" y="140" class="axis-text" id="radius-text-left">-1</text>
                    <line x1="145" y1="30" x2="155" y2="30" stroke="#000"></line>
                    <text x="157" y="35" class="axis-text" id="radius-text-top">1</text>
                    <line x1="145" y1="90" x2="155" y2="90" stroke="#000"></line>
                    <%--                    <text x="157" y="95" class="axis-text" id="radius-text-top-half">R/2</text>--%>
                    <line x1="145" y1="210" x2="155" y2="210" stroke="#000"></line>
                    <%--                    <text x="157" y="215" class="axis-text" id="radius-text-bottom-half">-R/2</text>--%>
                    <line x1="145" y1="270" x2="155" y2="270" stroke="#000"></line>
                    <text x="157" y="275" class="axis-text" id="radius-text-bottom">-1</text>

                    <!-- draw figures - -->
                    <polygon points="210,150 150,270 150,150" fill="#00f" stroke="#003" fill-opacity="0.5"></polygon>
                    <rect height="120" width="120" x="150" y="30" fill-opacity="0.5" fill="#a0f" stroke="#003"></rect>
                    <path stroke="#003" d=" M 90 150
                          h60
                          v-60
                          A70 70 0 0 0 90 150" fill-opacity="0.5"></path>

                    <%=resultTable.toSVGs()%>
                </svg>
            </div>

        </div>
        <table class="table-fixed border-collapse border border-green-800 table1 mobile-table">
            <thead>
            <tr>
                <td class=" border border-green-800 ">X</td>
                <td class=" border border-green-800">Y</td>
                <td class=" border border-green-800">R</td>
                <td class=" border border-green-800 ">Попал?</td>
                <td class="border border-green-800">Время</td>
                <td class="border border-green-800 w-1/3">Время выполнения</td>
            </tr>
            </thead>
            <tbody>
            <%=resultTable.toString()%>
            </tbody>
        </table>
    </div>
</div>


</body>
<script src="js/validator.js"></script>
<script src="js/shooter.js"></script>



