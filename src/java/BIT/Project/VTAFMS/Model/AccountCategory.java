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
public class AccountCategory {
    
    private Integer account_category_id;
    private String account_category_name;
    private String account_category_description;

    public AccountCategory(Integer account_category_id, String account_category_name, String account_category_description) {
        this.account_category_id = account_category_id;
        this.account_category_name = account_category_name;
        this.account_category_description = account_category_description;
    }

    /**
     * @return the account_category_id
     */
    public Integer getAccount_category_id() {
        return account_category_id;
    }

    /**
     * @param account_category_id the account_category_id to set
     */
    public void setAccount_category_id(Integer account_category_id) {
        this.account_category_id = account_category_id;
    }

    /**
     * @return the account_category_name
     */
    public String getAccount_category_name() {
        return account_category_name;
    }

    /**
     * @param account_category_name the account_category_name to set
     */
    public void setAccount_category_name(String account_category_name) {
        this.account_category_name = account_category_name;
    }

    /**
     * @return the account_category_description
     */
    public String getAccount_category_description() {
        return account_category_description;
    }

    /**
     * @param account_category_description the account_category_description to set
     */
    public void setAccount_category_description(String account_category_description) {
        this.account_category_description = account_category_description;
    }
    
}
