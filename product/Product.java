package ac.za.product;

public class Product {

    private String product_Id;
    private int product_Quantity;
    private String product_name;
    private String product_price;
    private String product_img;

    public Product(String product_Id, String product_name, String product_price, String product_img, int product_Quantity) {
        this.product_Id = product_Id;
        this.product_name = product_name;
        this.product_price = product_price;
        this.product_img = product_img;
        this.product_Quantity = product_Quantity;
    }

    public int getProduct_Quantity() {
        return product_Quantity;
    }

    public void setProduct_Quantity(int product_Quantity) {
        this.product_Quantity = product_Quantity;
    }

    public String getProduct_Id() {
        return product_Id;
    }

    public void setProduct_Id(String product_Id) {
        this.product_Id = product_Id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProduct_price() {
        return product_price;
    }

    public void setProduct_price(String product_price) {
        this.product_price = product_price;
    }

    public String getProduct_img() {
        return product_img;
    }

    public void setProduct_img(String product_img) {
        this.product_img = product_img;
    }

}
