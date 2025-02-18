
<%@page import="ac.za.tut.cart.Cart"%>
<%@page import="java.util.concurrent.ConcurrentHashMap"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="ac.za.product.Product"%>
<%@page import="java.util.Map"%>
<%@page import="ac.za.productrepositorymanager.ProductRepositoryManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Session</title>
        <link href="ProductStyle.css" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=shopping_bag" />

        <style>
            .cartValue{
                color: red;
            }
            .material-symbols-outlined {
                font-variation-settings:
                    'FILL' 0,
                    'wght' 400,
                    'GRAD' 0,
                    'opsz' 24;

            }

            .cart{
                display: flex;
                justify-content:flex-end;
                margin-right: 6rem;
                margin-top: 2rem;
            }

            button {
                background-color: #4CAF50;
                color: #000;
                padding: 10px 20px; /* Add some padding */
                border: none; /* Remove default border */
                border-radius: 5px; /* Add rounded corners */
                cursor: pointer; 
                transition: 0.5s;
                margin-left: 3rem;
            }
            button:hover{
                background-color: #3e8e41;
                color:white;
                transition: 0.5s;
            }
        </style>

    </head>

    <body>

        <%
            ProductRepositoryManager pmg = new ProductRepositoryManager();
            pmg.loadProductInformationFromFile();

            Map<String, Product> cart = (Map<String, Product>) session.getAttribute("cart");

            if (cart == null) {

                cart = new ConcurrentHashMap();
                session.setAttribute("cart", cart);

            }

            session.setAttribute("cartValue", String.valueOf(cart.size()));

            int cartValue = Integer.parseInt((String) session.getAttribute("cartValue"));
            session.setAttribute("products", pmg.getAllProducts());


        %>


        <div class="cart">
            <p class="cartValue" name="cart"  ><%=cartValue%></p>
            <a href="CartViewController?cart="<%=cart%>>
                <span class="material-symbols-outlined">
                    shopping_bag
                </span>
            </a>

        </div>

        <form  id="form" action="CartServlet" method="POST">


            <div class='ProduectSection'>   

                <%  DecimalFormat formt = new DecimalFormat("R#,##0.00");
                    for (Product p : pmg.getAllProducts().values()) {
                %>  

                <div class='productBox'>

                    <div class="product_IMG">

                        <img src="Pictures/<%=p.getProduct_img()%>" > 

                    </div>
                    <div class="Product_infor">

                        <div class="Product_name">
                            <h5><%=p.getProduct_name()%></h5>

                        </div>
                        <div class="Product_price">
                            <h5><%= formt.format(Double.parseDouble(p.getProduct_price()))%></h5>
                        </div>
                        <div class="cart_btn">



                            <button   value="Add to Cart" 
                                      onclick="setProductId('<%=p.getProduct_Id()%>')"    
                                      value="Add to Cart">Add To Cart

                            </button>
                        </div>
                    </div>


                </div> 


                <%
                    }

                %>


            </div>



        </form>


        <script>
            function setProductId(x) {

                document.getElementById('form').action = "CartServlet?Product_Id=" + x;


            }

        </script>


    </body>
</html>
