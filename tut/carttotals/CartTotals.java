package ac.za.tut.carttotals;

import ac.za.product.Product;
import java.util.Map;

public class CartTotals {

    private double subTotal;
    private double deliveryFee;
    private double overAllTotal;
    Map<String, Product> cart;

    public CartTotals(Map<String, Product> cart) {
        this.cart = cart;
        this.subTotal = calculateSubTotal();
        this.deliveryFee = calculateDeliveryFee();
        this.overAllTotal = CalGrandTotal();
    }

    private double calculateSubTotal() {

        double amount = 0;
        for (Map.Entry<String, Product> products : cart.entrySet()) {

            amount += subTotal = Double.parseDouble(products.getValue().getProduct_price());
        }
        return amount;

    }

    private double calculateDeliveryFee() {

        if (subTotal < 5) {

            deliveryFee = subTotal * 0.4;

        } else if (subTotal >= 5 && subTotal < 20) {

            deliveryFee = subTotal * 0.3;

        } else if (subTotal >= 20 && subTotal < 30) {
            deliveryFee = subTotal * 0.2;
        } 
        else if (subTotal >= 30 && subTotal < 50) {
            deliveryFee = subTotal * 0.1;
        } else {

            deliveryFee = 0;
        }
        return deliveryFee;

    }

    private double CalGrandTotal() {

        return deliveryFee + subTotal;
    }

    public double getSubTotal() {
        return subTotal;
    }

    public double getDeliveryFee() {
        return deliveryFee;
    }

    public double getOverAllTotal() {
        return overAllTotal;
    }

}
