/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domainmodel;

import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author Angelo
 */
public class ShopCartList {

    private final ArrayList<Product> productList;

    public ShopCartList() {
        productList = new ArrayList<>();
    }

    public ArrayList getProductList() {
        return this.productList;
    }

    public void addProduct(Product product) {
        productList.add(product);
    }

    public void deleteProduct(Product p) {
        productList.remove(p);
    }

    public void quitProduct(String name) {
        try {
            for (Product product : productList) {
                if (name.equals(product.getName())) {
                    if ((product.getAmount() - 1) == 0) {
                        productList.remove(product);
                    } else {
                        product.setAmount(product.getAmount() - 1);
                    }
                }
            }
        } catch (Exception e) {
        }
    }

    public boolean productExists(String name) {
        for (Product product : productList) {
            if (name.equals(product.getName())) {
                return true;
            }
        }
        return false;
    }

    public Product getExistingProduct(String name) {
        for (Product product : productList) {
            if (product.getName().equals(name)) {
                return product;
            }
        }
        return null;
    }

    public float getTotal() {
        float total = 0;
        for (Product product : productList) {
            total += product.getPrice() * product.getAmount();
        }
        return total;
    }
}
