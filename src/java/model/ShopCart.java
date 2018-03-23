/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Angelo
 */
@Entity
@Table(name = "shop_cart")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ShopCart.findAll", query = "SELECT s FROM ShopCart s")
    , @NamedQuery(name = "ShopCart.findById", query = "SELECT s FROM ShopCart s WHERE s.id = :id")
    , @NamedQuery(name = "ShopCart.findByName", query = "SELECT s FROM ShopCart s WHERE s.name = :name")
    , @NamedQuery(name = "ShopCart.findByPrice", query = "SELECT s FROM ShopCart s WHERE s.price = :price")
    , @NamedQuery(name = "ShopCart.findByImage", query = "SELECT s FROM ShopCart s WHERE s.image = :image")})
public class ShopCart implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @NotNull
    @Column(name = "price")
    private float price;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "image")
    private String image;

    public ShopCart() {
    }

    public ShopCart(Long id) {
        this.id = id;
    }

    public ShopCart(Long id, String name, float price, String image) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.image = image;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ShopCart)) {
            return false;
        }
        ShopCart other = (ShopCart) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.ShopCart[ id=" + id + " ]";
    }
    
}
