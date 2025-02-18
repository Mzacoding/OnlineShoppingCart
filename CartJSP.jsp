
<%@page import="ac.za.tut.carttotals.CartTotals"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.concurrent.ConcurrentHashMap"%>
<%@page import="java.util.Map"%>
<%@page import="ac.za.product.Product"%>
<%@page import="ac.za.product.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=close" />
        <link href="CartStyle.css" rel="stylesheet">
    </head>
    <body>


        <%
            Map<String, Product> cart = (Map<String, Product>) session.getAttribute("cart");

            if (cart == null) {

                cart = new ConcurrentHashMap();
                session.setAttribute("cart", cart);
            }

            CartTotals cartTotals = (CartTotals) session.getAttribute("cartTotals");

            if (cartTotals == null) {
                cartTotals = new CartTotals(cart);

                session.setAttribute("cartTotals", cartTotals);
            }


        %>

        <div class="cartSession">

            <div class="cartDeatails">

                <table>


                    <%                        DecimalFormat f = new DecimalFormat("R#,##0.00");

                        for (Product products : cart.values()) {

                    %>
                    <tr>

                        <td class="imgSession">

                            <img src="Pictures/<%=products.getProduct_img()%>">
                            <p><%=products.getProduct_name()%></p>
                        </td> 

                        <td class="Column_third"><label><%=f.format(Double.parseDouble(products.getProduct_price()))%></label></td> 


                        <td><a href="CartUpdateServlet?Product_Id=<%=products.getProduct_Id()%>">

                                <span class="material-symbols-outlined">
                                    close
                                </span></a>
                        </td>
                    </tr>

                    <% }%>


                </table>
            </div>



            <div class="cartTotals">




                <div class="total">

                    <h4>Cart Totals</h4>



                    <form >

                        <table>
                            <tr>

                                <td><label>Sub Total </label></td>  
                                <td><label ><%=f.format(cartTotals.getSubTotal())%> </label></td>  
                            </tr>
                            <tr>

                                <td><label>Delivery Fee </label></td>  
                                <td><label ><%=f.format(cartTotals.getDeliveryFee())%> </label></td>  
                            </tr>

                            <tr>
                                <td><label class="overAllPrice">Total </label></td>  
                                <td><label class="overAllPrice"><%=f.format(cartTotals.getOverAllTotal())%> </label></td>  
                            </tr>

                            <tr>
                                <td></td>  
                                <td><input type="submit" value="Place Order" class="CheckOutBtn"></td>  
                            </tr>
                        </table> 

                    </form>   


                </div>


            </div>



        </div>


    </body>
</html>
