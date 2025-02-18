 
package ac.za.cartupdate;

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

 
public class CartUpdateServlet extends HttpServlet {

     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
        
        HttpSession session =request.getSession();
        
         Map<String, Product> cart = (Map<String, Product>) session.getAttribute("cart");
        
            if (cart == null) {

                cart = new ConcurrentHashMap();
                session.setAttribute("cart", cart);
            }

        String productId = request.getParameter("Product_Id");

        Cart myCart = (Cart) session.getAttribute("myCart");

        if (myCart == null) {
            myCart = new Cart(cart);
        }

        myCart.delete(productId);

        cart = myCart.getCart();

        session.setAttribute("cart", cart);

        request.getRequestDispatcher("CartViewController").forward(request, response);
       
    }

     

}
