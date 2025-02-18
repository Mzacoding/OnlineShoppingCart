package ac.za.tut.cartservlet;

import ac.za.product.Product;
import ac.za.tut.cart.Cart;
import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddToCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Map<String, Product> cart = (Map<String, Product>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ConcurrentHashMap<>();
            session.setAttribute("cart", cart);
        }

        String productId = request.getParameter("Product_Id");

        Map<String, Product> products = (Map<String, Product>) session.getAttribute("products");

        if (products == null) {
            products = new ConcurrentHashMap<>();
            session.setAttribute("products", products);
        }

        Cart myCart = (Cart) session.getAttribute("myCart");

        if (myCart == null) {
            myCart = new Cart(products, cart);
        }

        myCart.add(productId);

        cart = myCart.getCart();

        session.setAttribute("cart", cart);
        
        
       

        request.getRequestDispatcher("/ProductSession.jsp").forward(request, response);

    }

}
