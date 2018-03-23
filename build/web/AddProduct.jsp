<%-- 
    Document   : AddProduct
    Created on : 22/11/2017, 02:36:05 PM
    Author     : Angelo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="domainmodel.Product"%>
<%@page import="domainmodel.ShopCartList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add to cart</title>
        <%

            Connection conexion = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conexion = DriverManager.getConnection("jdbc:mysql://127.0.0.1/electronica", "root", "xbox360elite");
                //out.println("Conexión realizada con éxito a: " + conexion.getCatalog());
            } catch (SQLException ex) {
            } catch (Exception ex) {
            }%>
    </head>
    <body>
        <%

            Statement consulta = conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = consulta.executeQuery("SELECT * FROM shop_cart where id=" + request.getParameter("id"));
            rs.first();

            String name = rs.getString(2);
            float price = Float.parseFloat(rs.getString(3));
            String image = rs.getString(4);

            ShopCartList productList;
            Product product;

            if (session.getAttribute("productList") == null) {
                productList = new ShopCartList();
                session.setAttribute("productList", productList);
            } else {
                productList = (ShopCartList) session.getAttribute("productList");
            }

            if (!productList.productExists(name)) {
                product = new Product();
                product.setName(name);
                product.setPrice(price);
                product.setImage(image);
                productList.addProduct(product);
            } else {
                product = productList.getExistingProduct(name);
                product.setAmount(product.getAmount() + 1);
            }

            ArrayList<Product> list = productList.getProductList();
        %>

        <table>
            <%
                for (Product element : list) {
            %>
            <tr>
                <td><%=element.getName()%></td>
            </tr>
            <%
                }
                rs.close();
                consulta.close();
                conexion.close();
                response.sendRedirect("index.xhtml");
%>
        </table>

    </body>
</html>
