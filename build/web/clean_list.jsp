<%-- 
    Document   : clean_list
    Created on : 23/11/2017, 09:50:16 AM
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
         ArrayList<Product> list = productList.getProductList();
         productList.getProductList().clear();
         //out.println("<script type=\"text/javascript\">var r = confirm(\"Selecciona tu metodo de pago.\");if (r == true) {}</script>");
          response.sendRedirect("view_products.jsp");
         %>
        <h1>Hello World!</h1>
    </body>
</html>
