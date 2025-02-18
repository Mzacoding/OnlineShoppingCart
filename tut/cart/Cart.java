package ac.za.tut.cart;

import ac.za.product.Product;
import ac.za.tut.cartrepository.CarRepository;
import java.util.Map;

public class Cart implements CarRepository<Product> {

    private Map<String, Product> products;

    private Map<String, Product> cart;

    
    public Cart(Map<String, Product> cart) {
        this.cart = cart;
    }

    public Cart(Map<String, Product> products, Map<String, Product> cart) {

        this.products = products;
        this.cart = cart;
    }

    @Override
    public void add(String Product_ID) {

        if (products.containsKey(Product_ID)) {

            cart.put(Product_ID, products.get(Product_ID));

        }
    }

    @Override
    
    public void delete(String Product_ID) {

        if (cart.containsKey(Product_ID)) {

            cart.remove(Product_ID);
             
        }
         

    }

    public Map<String, Product> getCart() {
        return cart;
    }

    @Override
    public void update(String Product_ID,int quantity) {
        
        if (cart.containsKey(Product_ID)) {
            
            cart.get(Product_ID).setProduct_Quantity(quantity);
            
        }
        
        
        
    }

}
