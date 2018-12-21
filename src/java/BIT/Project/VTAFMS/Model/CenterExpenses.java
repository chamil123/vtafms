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
public class CenterExpenses {

    private Integer center_expenses_id;
    private String center_expenses_expenseName;
    private double center_expenses_amount;
    private String center_id;

    public CenterExpenses(Integer center_expenses_id, String center_expenses_expenseName, double center_expenses_amount, String center_id) {
        this.center_expenses_id = center_expenses_id;
        this.center_expenses_expenseName = center_expenses_expenseName;
        this.center_expenses_amount = center_expenses_amount;
        this.center_id = center_id;
    }

    /**
     * @return the center_expenses_id
     */
    public Integer getCenter_expenses_id() {
        return center_expenses_id;
    }

    /**
     * @param center_expenses_id the center_expenses_id to set
     */
    public void setCenter_expenses_id(Integer center_expenses_id) {
        this.center_expenses_id = center_expenses_id;
    }

    /**
     * @return the center_expenses_expenseName
     */
    public String getCenter_expenses_expenseName() {
        return center_expenses_expenseName;
    }

    /**
     * @param center_expenses_expenseName the center_expenses_expenseName to set
     */
    public void setCenter_expenses_expenseName(String center_expenses_expenseName) {
        this.center_expenses_expenseName = center_expenses_expenseName;
    }

    /**
     * @return the center_expenses_amount
     */
    public double getCenter_expenses_amount() {
        return center_expenses_amount;
    }

    /**
     * @param center_expenses_amount the center_expenses_amount to set
     */
    public void setCenter_expenses_amount(double center_expenses_amount) {
        this.center_expenses_amount = center_expenses_amount;
    }

    /**
     * @return the center_id
     */
    public String getCenter_id() {
        return center_id;
    }

    /**
     * @param center_id the center_id to set
     */
    public void setCenter_id(String center_id) {
        this.center_id = center_id;
    }
    
}
