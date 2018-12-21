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
public class GeneralSummeryLine {

    private Integer accountGeneral_line_id;
    private String accountGeneral_line_summeryName;
    private double accountGeneral_line_fullCollection;
    private double accountGeneral_line_payment;
    private int accountGeneral_id;
    private int summery_id;

    public GeneralSummeryLine(Integer accountGeneral_line_id, String accountGeneral_line_summeryName, double accountGeneral_line_fullCollection, double accountGeneral_line_payment, int accountGeneral_id, int summery_id) {
        this.accountGeneral_line_id = accountGeneral_line_id;
        this.accountGeneral_line_summeryName = accountGeneral_line_summeryName;
        this.accountGeneral_line_fullCollection = accountGeneral_line_fullCollection;
        this.accountGeneral_line_payment = accountGeneral_line_payment;
        this.accountGeneral_id = accountGeneral_id;
        this.summery_id = summery_id;
    }

    /**
     * @return the accountGeneral_line_id
     */
    public Integer getAccountGeneral_line_id() {
        return accountGeneral_line_id;
    }

    /**
     * @param accountGeneral_line_id the accountGeneral_line_id to set
     */
    public void setAccountGeneral_line_id(Integer accountGeneral_line_id) {
        this.accountGeneral_line_id = accountGeneral_line_id;
    }

    /**
     * @return the accountGeneral_line_summeryName
     */
    public String getAccountGeneral_line_summeryName() {
        return accountGeneral_line_summeryName;
    }

    /**
     * @param accountGeneral_line_summeryName the accountGeneral_line_summeryName to set
     */
    public void setAccountGeneral_line_summeryName(String accountGeneral_line_summeryName) {
        this.accountGeneral_line_summeryName = accountGeneral_line_summeryName;
    }

    /**
     * @return the accountGeneral_line_fullCollection
     */
    public double getAccountGeneral_line_fullCollection() {
        return accountGeneral_line_fullCollection;
    }

    /**
     * @param accountGeneral_line_fullCollection the accountGeneral_line_fullCollection to set
     */
    public void setAccountGeneral_line_fullCollection(double accountGeneral_line_fullCollection) {
        this.accountGeneral_line_fullCollection = accountGeneral_line_fullCollection;
    }

    /**
     * @return the accountGeneral_line_payment
     */
    public double getAccountGeneral_line_payment() {
        return accountGeneral_line_payment;
    }

    /**
     * @param accountGeneral_line_payment the accountGeneral_line_payment to set
     */
    public void setAccountGeneral_line_payment(double accountGeneral_line_payment) {
        this.accountGeneral_line_payment = accountGeneral_line_payment;
    }

    /**
     * @return the accountGeneral_id
     */
    public int getAccountGeneral_id() {
        return accountGeneral_id;
    }

    /**
     * @param accountGeneral_id the accountGeneral_id to set
     */
    public void setAccountGeneral_id(int accountGeneral_id) {
        this.accountGeneral_id = accountGeneral_id;
    }

    /**
     * @return the summery_id
     */
    public int getSummery_id() {
        return summery_id;
    }

    /**
     * @param summery_id the summery_id to set
     */
    public void setSummery_id(int summery_id) {
        this.summery_id = summery_id;
    }
    

}
