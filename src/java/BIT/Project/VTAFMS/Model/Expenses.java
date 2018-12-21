/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Model;

import java.util.Date;

/**
 *
 * @author Chamil
 */
public class Expenses {

    private Integer expences_id;
    private String expences_name;
    private double expences_amount;
    private String expences_remark;
    private String expences_addDate;
    private String expences_type;
    private int account_id;

    
    public Expenses(Integer expences_id, String expences_name, double expences_amount, String expences_remark, String expences_addDate, String expences_type, int account_id) {
        this.expences_id = expences_id;
        this.expences_name = expences_name;
        this.expences_amount = expences_amount;
        this.expences_remark = expences_remark;
        this.expences_addDate = expences_addDate;
        this.expences_type = expences_type;
        this.account_id = account_id;
    }

    /**
     * @return the expences_id
     */
    public Integer getExpences_id() {
        return expences_id;
    }

    /**
     * @param expences_id the expences_id to set
     */
    public void setExpences_id(Integer expences_id) {
        this.expences_id = expences_id;
    }

    /**
     * @return the expences_name
     */
    public String getExpences_name() {
        return expences_name;
    }

    /**
     * @param expences_name the expences_name to set
     */
    public void setExpences_name(String expences_name) {
        this.expences_name = expences_name;
    }

    /**
     * @return the expences_amount
     */
    public double getExpences_amount() {
        return expences_amount;
    }

    /**
     * @param expences_amount the expences_amount to set
     */
    public void setExpences_amount(double expences_amount) {
        this.expences_amount = expences_amount;
    }

    /**
     * @return the expences_remark
     */
    public String getExpences_remark() {
        return expences_remark;
    }

    /**
     * @param expences_remark the expences_remark to set
     */
    public void setExpences_remark(String expences_remark) {
        this.expences_remark = expences_remark;
    }

    /**
     * @return the expences_addDate
     */
    public String getExpences_addDate() {
        return expences_addDate;
    }

    /**
     * @param expences_addDate the expences_addDate to set
     */
    public void setExpences_addDate(String expences_addDate) {
        this.expences_addDate = expences_addDate;
    }

    /**
     * @return the expences_type
     */
    public String getExpences_type() {
        return expences_type;
    }

    /**
     * @param expences_type the expences_type to set
     */
    public void setExpences_type(String expences_type) {
        this.expences_type = expences_type;
    }

    /**
     * @return the account_id
     */
    public int getAccount_id() {
        return account_id;
    }

    /**
     * @param account_id the account_id to set
     */
    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    
}
