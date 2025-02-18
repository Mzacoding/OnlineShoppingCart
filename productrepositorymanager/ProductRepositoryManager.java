package ac.za.productrepositorymanager;

import ac.za.product.Product;
import ac.za.productrepository.ProductRepository;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class ProductRepositoryManager implements ProductRepository {

    private final File productFile = new File("C:/Users/nyiko/Documents/NetBeansProjects/ShopingCartManagement/web/productItem.txt");

    private Map<String, Product> allProducts = new ConcurrentHashMap<>();

    public ProductRepositoryManager() {
    }

    @Override
    public void loadProductInformationFromFile() {

        String[] productItems = loadProductInformation();
        populateProducts(productItems);

    }

    private void populateProducts(String[] productItems) {

        for (String item : productItems) {

            String[] productinform = item.split("#");

            if (productinform.length >= 4) {
                String product_name = productinform[0];
                String product_price = productinform[1];
                String product_Id = productinform[2];

                String product_img = productinform[3];

                System.err.print(item);

                Product products = new Product(product_Id, product_name, product_price, product_img, 1);

                allProducts.put(product_Id, products);
            }

        }

    }

    public Map<String, Product> getAllProducts() {
        return allProducts;
    }

    private String[] loadProductInformation() {

        try (BufferedReader bfr = new BufferedReader(new FileReader(productFile))) {

            String fileData;
            String productInformation = "";

            while ((fileData = bfr.readLine()) != null) {
                productInformation += fileData + "\n";
            }

            return productInformation.split("\n");
        } catch (FileNotFoundException ex) {
            throw new RuntimeException("Failed to run from Text file " + ex.getMessage());
        } catch (IOException ex) {
            throw new RuntimeException("Failed to run from Text file " + ex.getMessage());
        }

    }

}
