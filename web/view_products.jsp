<%-- 
    Document   : view_products
    Created on : 22/11/2017, 08:58:06 PM
    Author     : Angelo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domainmodel.Product"%>
<%@page import="domainmodel.ShopCartList"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resources/css/home.css">
        <style type="text/css">
            table {
                font-family: "TCM";
                font-size: 25px;
                border-collapse: collapse;
                width: 100%;
                background-color: #8fc6eb;
                box-shadow: 1px 1px 10px #111;
                size: 5px;
                border-radius: 20px;
            }

            th, td {
                size: 4px;
                font-family: "TCM";
                text-align: center;
                padding-bottom: 5px;
                padding-top: 5px;
                padding-left: 8px;
                padding-right: 8px;
            }

            tr:nth-child(even){
                background-color: #f2f2f2;
            }

            a {
                text-decoration: none;
                color: black;
                padding:10px;

            }

            a:hover {
                background-color: white;

            }

        </style>

        <title>Productos en carrito</title>

    </head>
    <body bgcolor="#dee9f1">
        <%
            ShopCartList productList;
            Product product;

            if (session.getAttribute("productList") == null) {
                productList = new ShopCartList();
                session.setAttribute("productList", productList);
            } else {
                productList = (ShopCartList) session.getAttribute("productList");
            }
            ArrayList<Product> list = productList.getProductList();
            if (!list.isEmpty()) {
        %>

        <table>
            <tr>
                <th>NOMBRE</th>
                <th>CANTIDAD</th>
                <th>PRECIO</th>
                <th>SUBTOTAL</th>
                <th>TOTAL</th>
            </tr>   
            <%
                for (Product element : list) {
            %>

            <tr>
                <td><%=element.getName()%></td>
                <td><%=element.getAmount()%></td>
                <td>$ <%=element.getPrice()%></td>
                <td>$ <%=(element.getPrice() * element.getAmount())%></td>
                <td><a href="remove_product.jsp?name=<%=element.getName()%>">QUITAR</a></td>

            </tr>
            <%
                }
            %>
            <tr ><td colspan="10" style="margin: 100px;"><b>Total: $ <%=productList.getTotal()%></b></td> </tr>
            <tr ><td colspan="10" style="margin: 100px;"><b><a href="clean_list.jsp">PAGAR $ <%out.println(productList.getTotal());
                    //session.invalidate();
                            %> 
                        </a></b></td> </tr>
                        <%
                            } else
                                out.println("<h1>No tienes productos en tu carrito.</h1>");
                        %>
            <br>
            <a href="faces/index.xhtml"><h1>Regresar</h1></a>
            <br>
        </table>
    </body>
</html>
