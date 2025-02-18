 
package ac.za.tut.cartrepository;



 
public interface CarRepository<k> {
    
    void add(String Product_ID);
    
   void delete(String Product_ID);   
   void update(String Product_ID,int quantity);  
}
