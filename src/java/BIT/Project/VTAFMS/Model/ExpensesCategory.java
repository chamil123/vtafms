/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Model;

/**
 *
 * @author Chamil
 */
public class ExpensesCategory {
    private Integer expences_category_id;
    private String expences_category_name;

    public ExpensesCategory(Integer expences_category_id, String expences_category_name) {
        this.expences_category_id = expences_category_id;
        this.expences_category_name = expences_category_name;
    }

    /**
     * @return the expences_category_id
     */
    public Integer getExpences_category_id() {
        return expences_category_id;
    }

    /**
     * @param expences_category_id the expences_category_id to set
     */
    public void setExpences_category_id(Integer expences_category_id) {
        this.expences_category_id = expences_category_id;
    }

    /**
     * @return the expences_category_name
     */
    public String getExpences_category_name() {
        return expences_category_name;
    }

    /**
     * @param expences_category_name the expences_category_name to set
     */
    public void setExpences_category_name(String expences_category_name) {
        this.expences_category_name = expences_category_name;
    }
    
}
