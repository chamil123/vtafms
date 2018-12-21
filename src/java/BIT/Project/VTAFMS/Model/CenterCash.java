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
public class CenterCash {
    private Integer centerCash_details_id;
    private double centerCash_details_FullCollection;
    private double centerCash_details_cash;
    private String centerCash_details_date;
    private double centerCash_details_passDue;
    private String center_id;
    private int account_id;

    public CenterCash(Integer centerCash_details_id, double centerCash_details_FullCollection, double centerCash_details_cash, String centerCash_details_date, double centerCash_details_passDue, String center_id, int account_id) {
        this.centerCash_details_id = centerCash_details_id;
        this.centerCash_details_FullCollection = centerCash_details_FullCollection;
        this.centerCash_details_cash = centerCash_details_cash;
        this.centerCash_details_date = centerCash_details_date;
        this.centerCash_details_passDue = centerCash_details_passDue;
        this.center_id = center_id;
        this.account_id = account_id;
    }

    /**
     * @return the centerCash_details_id
     */
    public Integer getCenterCash_details_id() {
        return centerCash_details_id;
    }

    /**
     * @param centerCash_details_id the centerCash_details_id to set
     */
    public void setCenterCash_details_id(Integer centerCash_details_id) {
        this.centerCash_details_id = centerCash_details_id;
    }

    /**
     * @return the centerCash_details_FullCollection
     */
    public double getCenterCash_details_FullCollection() {
        return centerCash_details_FullCollection;
    }

    /**
     * @param centerCash_details_FullCollection the centerCash_details_FullCollection to set
     */
    public void setCenterCash_details_FullCollection(double centerCash_details_FullCollection) {
        this.centerCash_details_FullCollection = centerCash_details_FullCollection;
    }

    /**
     * @return the centerCash_details_cash
     */
    public double getCenterCash_details_cash() {
        return centerCash_details_cash;
    }

    /**
     * @param centerCash_details_cash the centerCash_details_cash to set
     */
    public void setCenterCash_details_cash(double centerCash_details_cash) {
        this.centerCash_details_cash = centerCash_details_cash;
    }

    /**
     * @return the centerCash_details_date
     */
    public String getCenterCash_details_date() {
        return centerCash_details_date;
    }

    /**
     * @param centerCash_details_date the centerCash_details_date to set
     */
    public void setCenterCash_details_date(String centerCash_details_date) {
        this.centerCash_details_date = centerCash_details_date;
    }

    /**
     * @return the centerCash_details_passDue
     */
    public double getCenterCash_details_passDue() {
        return centerCash_details_passDue;
    }

    /**
     * @param centerCash_details_passDue the centerCash_details_passDue to set
     */
    public void setCenterCash_details_passDue(double centerCash_details_passDue) {
        this.centerCash_details_passDue = centerCash_details_passDue;
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
