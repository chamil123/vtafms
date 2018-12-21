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
public class Account {

    private Integer account_id;
    private String account_name;
    private double account_correntBalance;
    private int account_category_id;
    private String account_description;

    public Account(Integer account_id, String account_name, double account_correntBalance, int account_category_id, String account_description) {
        this.account_id = account_id;
        this.account_name = account_name;
        this.account_correntBalance = account_correntBalance;
        this.account_category_id = account_category_id;
        this.account_description = account_description;
    }

    /**
     * @return the account_id
     */
    public Integer getAccount_id() {
        return account_id;
    }

    /**
     * @param account_id the account_id to set
     */
    public void setAccount_id(Integer account_id) {
        this.account_id = account_id;
    }

    /**
     * @return the account_name
     */
    public String getAccount_name() {
        return account_name;
    }

    /**
     * @param account_name the account_name to set
     */
    public void setAccount_name(String account_name) {
        this.account_name = account_name;
    }

    /**
     * @return the account_correntBalance
     */
    public double getAccount_correntBalance() {
        return account_correntBalance;
    }

    /**
     * @param account_correntBalance the account_correntBalance to set
     */
    public void setAccount_correntBalance(double account_correntBalance) {
        this.account_correntBalance = account_correntBalance;
    }

    /**
     * @return the account_category_id
     */
    public int getAccount_category_id() {
        return account_category_id;
    }

    /**
     * @param account_category_id the account_category_id to set
     */
    public void setAccount_category_id(int account_category_id) {
        this.account_category_id = account_category_id;
    }

    /**
     * @return the account_description
     */
    public String getAccount_description() {
        return account_description;
    }

    /**
     * @param account_description the account_description to set
     */
    public void setAccount_description(String account_description) {
        this.account_description = account_description;
    }
    
}
