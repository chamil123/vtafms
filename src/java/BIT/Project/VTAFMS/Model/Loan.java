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
public class Loan {

    private Integer loan_id;
    private double loan_amount;
    private String loan_dateRelease;
    private String loan_status;
    private String loan_remark;
    private String loan_scheduleOfPayment;
    private String loan_interestRate;
    private String center_id;
    private int user_id;
    private int account_id;
    private double loan_balance;

    public Loan(Integer loan_id, double loan_amount, String loan_dateRelease, String loan_status, String loan_remark, String loan_scheduleOfPayment, String loan_interestRate, String center_id, int user_id, int account_id, double loan_balance) {
        this.loan_id = loan_id;
        this.loan_amount = loan_amount;
        this.loan_dateRelease = loan_dateRelease;
        this.loan_status = loan_status;
        this.loan_remark = loan_remark;
        this.loan_scheduleOfPayment = loan_scheduleOfPayment;
        this.loan_interestRate = loan_interestRate;
        this.center_id = center_id;
        this.user_id = user_id;
        this.account_id = account_id;
        this.loan_balance = loan_balance;
    }

    /**
     * @return the loan_id
     */
    public Integer getLoan_id() {
        return loan_id;
    }

    /**
     * @param loan_id the loan_id to set
     */
    public void setLoan_id(Integer loan_id) {
        this.loan_id = loan_id;
    }

    /**
     * @return the loan_amount
     */
    public double getLoan_amount() {
        return loan_amount;
    }

    /**
     * @param loan_amount the loan_amount to set
     */
    public void setLoan_amount(double loan_amount) {
        this.loan_amount = loan_amount;
    }

    /**
     * @return the loan_dateRelease
     */
    public String getLoan_dateRelease() {
        return loan_dateRelease;
    }

    /**
     * @param loan_dateRelease the loan_dateRelease to set
     */
    public void setLoan_dateRelease(String loan_dateRelease) {
        this.loan_dateRelease = loan_dateRelease;
    }

    /**
     * @return the loan_status
     */
    public String getLoan_status() {
        return loan_status;
    }

    /**
     * @param loan_status the loan_status to set
     */
    public void setLoan_status(String loan_status) {
        this.loan_status = loan_status;
    }

    /**
     * @return the loan_remark
     */
    public String getLoan_remark() {
        return loan_remark;
    }

    /**
     * @param loan_remark the loan_remark to set
     */
    public void setLoan_remark(String loan_remark) {
        this.loan_remark = loan_remark;
    }

    /**
     * @return the loan_scheduleOfPayment
     */
    public String getLoan_scheduleOfPayment() {
        return loan_scheduleOfPayment;
    }

    /**
     * @param loan_scheduleOfPayment the loan_scheduleOfPayment to set
     */
    public void setLoan_scheduleOfPayment(String loan_scheduleOfPayment) {
        this.loan_scheduleOfPayment = loan_scheduleOfPayment;
    }

    /**
     * @return the loan_interestRate
     */
    public String getLoan_interestRate() {
        return loan_interestRate;
    }

    /**
     * @param loan_interestRate the loan_interestRate to set
     */
    public void setLoan_interestRate(String loan_interestRate) {
        this.loan_interestRate = loan_interestRate;
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
     * @return the user_id
     */
    public int getUser_id() {
        return user_id;
    }

    /**
     * @param user_id the user_id to set
     */
    public void setUser_id(int user_id) {
        this.user_id = user_id;
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

    /**
     * @return the loan_balance
     */
    public double getLoan_balance() {
        return loan_balance;
    }

    /**
     * @param loan_balance the loan_balance to set
     */
    public void setLoan_balance(double loan_balance) {
        this.loan_balance = loan_balance;
    }

}
