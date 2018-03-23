<%-- 
    Document   : remove_product
    Created on : 22/11/2017, 09:44:49 PM
    Author     : Angelo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="domainmodel.Product"%>
<%@page import="domainmodel.ShopCartList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            ShopCartList productList;
            Product product;

            if (session.getAttribute("productList") == null) {
                productList = new ShopCartList();
                session.setAttribute("productList", productList);
            } else {
                productList = (ShopCartList) session.getAttribute("productList");
            }
            if(!productList.getProductList().isEmpty())
            productList.quitProduct(request.getParameter("name"));
            response.sendRedirect("view_products.jsp");

        %>
    </body>
</html>
