/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Angelo
 */
@Stateless
public class ShopCartFacade extends AbstractFacade<ShopCart> {

    @PersistenceContext(unitName = "ElectronicaPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ShopCartFacade() {
        super(ShopCart.class);
    }
    
}
