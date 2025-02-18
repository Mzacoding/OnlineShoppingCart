 
package ac.za.cartController;

import ac.za.product.Product;
import ac.za.tut.carttotals.CartTotals;
import java.io.IOException;
 
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

 
public class CartViewController extends HttpServlet {

        @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

      HttpSession session = request.getSession();
     Map<String, Product> cart = (Map<String, Product>) session.getAttribute("cart");
        
            if (cart == null) {

                cart = new ConcurrentHashMap();
                session.setAttribute("cart", cart);
            }

        CartTotals cartTotals =new CartTotals(cart);
        
        session.setAttribute("cartTotals", cartTotals);
        
          request.getRequestDispatcher("/CartJSP.jsp").forward(request, response);
        
}
   
}
