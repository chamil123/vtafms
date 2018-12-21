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
public class Transaction {
     private Integer transaction_id;
    private String transaction_date;
    private String transaction_payee;
    private double transaction_amount;
    private String transaction_type;
    private int account_id;

    public Transaction(Integer transaction_id, String transaction_date, String transaction_payee, double transaction_amount, String transaction_type, int account_id) {
        this.transaction_id = transaction_id;
        this.transaction_date = transaction_date;
        this.transaction_payee = transaction_payee;
        this.transaction_amount = transaction_amount;
        this.transaction_type = transaction_type;
        this.account_id = account_id;
    }

    /**
     * @return the transaction_id
     */
    public Integer getTransaction_id() {
        return transaction_id;
    }

    /**
     * @param transaction_id the transaction_id to set
     */
    public void setTransaction_id(Integer transaction_id) {
        this.transaction_id = transaction_id;
    }

    /**
     * @return the transaction_date
     */
    public String getTransaction_date() {
        return transaction_date;
    }

    /**
     * @param transaction_date the transaction_date to set
     */
    public void setTransaction_date(String transaction_date) {
        this.transaction_date = transaction_date;
    }

    /**
     * @return the transaction_payee
     */
    public String getTransaction_payee() {
        return transaction_payee;
    }

    /**
     * @param transaction_payee the transaction_payee to set
     */
    public void setTransaction_payee(String transaction_payee) {
        this.transaction_payee = transaction_payee;
    }

    /**
     * @return the transaction_amount
     */
    public double getTransaction_amount() {
        return transaction_amount;
    }

    /**
     * @param transaction_amount the transaction_amount to set
     */
    public void setTransaction_amount(double transaction_amount) {
        this.transaction_amount = transaction_amount;
    }

    /**
     * @return the transaction_type
     */
    public String getTransaction_type() {
        return transaction_type;
    }

    /**
     * @param transaction_type the transaction_type to set
     */
    public void setTransaction_type(String transaction_type) {
        this.transaction_type = transaction_type;
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
