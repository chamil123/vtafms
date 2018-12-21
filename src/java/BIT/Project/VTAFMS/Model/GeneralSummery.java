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
public class GeneralSummery {

    private Integer accountGeneral_id;
    private String accountGeneral_date;
    private String accountGeneral_name;
    private double accountGeneral_noCommisionAmount;
    private double accountGeneral_lessCommisionAmount;
    private double accountGeneral_due;
    private double accountGeneral_pay;
    private double accountGeneral_lcnc;
    private double accountGeneral_papercash;
    private double accountGeneral_compay;
    private double accountGeneral_expenses;
    private double AccountGeneral_totalsumpay;
    private double accountGeneral_loan;
    private double accountGeneral_excess;
    private String accountGeneral_status;
    private int agent_id;
    private int user_id;
    private int generalCash_details_id;

    public GeneralSummery(Integer accountGeneral_id, String accountGeneral_date, String accountGeneral_name, double accountGeneral_noCommisionAmount, double accountGeneral_lessCommisionAmount, double accountGeneral_due, double accountGeneral_pay, double accountGeneral_lcnc, double accountGeneral_papercash, double accountGeneral_compay, double accountGeneral_expenses, double AccountGeneral_totalsumpay, double accountGeneral_loan, double accountGeneral_excess, String accountGeneral_status, int agent_id, int user_id, int generalCash_details_id) {
        this.accountGeneral_id = accountGeneral_id;
        this.accountGeneral_date = accountGeneral_date;
        this.accountGeneral_name = accountGeneral_name;
        this.accountGeneral_noCommisionAmount = accountGeneral_noCommisionAmount;
        this.accountGeneral_lessCommisionAmount = accountGeneral_lessCommisionAmount;
        this.accountGeneral_due = accountGeneral_due;
        this.accountGeneral_pay = accountGeneral_pay;
        this.accountGeneral_lcnc = accountGeneral_lcnc;
        this.accountGeneral_papercash = accountGeneral_papercash;
        this.accountGeneral_compay = accountGeneral_compay;
        this.accountGeneral_expenses = accountGeneral_expenses;
        this.AccountGeneral_totalsumpay = AccountGeneral_totalsumpay;
        this.accountGeneral_loan = accountGeneral_loan;
        this.accountGeneral_excess = accountGeneral_excess;
        this.accountGeneral_status = accountGeneral_status;
        this.agent_id = agent_id;
        this.user_id = user_id;
        this.generalCash_details_id = generalCash_details_id;
    }

    /**
     * @return the accountGeneral_id
     */
    public Integer getAccountGeneral_id() {
        return accountGeneral_id;
    }

    /**
     * @param accountGeneral_id the accountGeneral_id to set
     */
    public void setAccountGeneral_id(Integer accountGeneral_id) {
        this.accountGeneral_id = accountGeneral_id;
    }

    /**
     * @return the accountGeneral_date
     */
    public String getAccountGeneral_date() {
        return accountGeneral_date;
    }

    /**
     * @param accountGeneral_date the accountGeneral_date to set
     */
    public void setAccountGeneral_date(String accountGeneral_date) {
        this.accountGeneral_date = accountGeneral_date;
    }

    /**
     * @return the accountGeneral_name
     */
    public String getAccountGeneral_name() {
        return accountGeneral_name;
    }

    /**
     * @param accountGeneral_name the accountGeneral_name to set
     */
    public void setAccountGeneral_name(String accountGeneral_name) {
        this.accountGeneral_name = accountGeneral_name;
    }

    /**
     * @return the accountGeneral_noCommisionAmount
     */
    public double getAccountGeneral_noCommisionAmount() {
        return accountGeneral_noCommisionAmount;
    }

    /**
     * @param accountGeneral_noCommisionAmount the accountGeneral_noCommisionAmount to set
     */
    public void setAccountGeneral_noCommisionAmount(double accountGeneral_noCommisionAmount) {
        this.accountGeneral_noCommisionAmount = accountGeneral_noCommisionAmount;
    }

    /**
     * @return the accountGeneral_lessCommisionAmount
     */
    public double getAccountGeneral_lessCommisionAmount() {
        return accountGeneral_lessCommisionAmount;
    }

    /**
     * @param accountGeneral_lessCommisionAmount the accountGeneral_lessCommisionAmount to set
     */
    public void setAccountGeneral_lessCommisionAmount(double accountGeneral_lessCommisionAmount) {
        this.accountGeneral_lessCommisionAmount = accountGeneral_lessCommisionAmount;
    }

    /**
     * @return the accountGeneral_due
     */
    public double getAccountGeneral_due() {
        return accountGeneral_due;
    }

    /**
     * @param accountGeneral_due the accountGeneral_due to set
     */
    public void setAccountGeneral_due(double accountGeneral_due) {
        this.accountGeneral_due = accountGeneral_due;
    }

    /**
     * @return the accountGeneral_pay
     */
    public double getAccountGeneral_pay() {
        return accountGeneral_pay;
    }

    /**
     * @param accountGeneral_pay the accountGeneral_pay to set
     */
    public void setAccountGeneral_pay(double accountGeneral_pay) {
        this.accountGeneral_pay = accountGeneral_pay;
    }

    /**
     * @return the accountGeneral_lcnc
     */
    public double getAccountGeneral_lcnc() {
        return accountGeneral_lcnc;
    }

    /**
     * @param accountGeneral_lcnc the accountGeneral_lcnc to set
     */
    public void setAccountGeneral_lcnc(double accountGeneral_lcnc) {
        this.accountGeneral_lcnc = accountGeneral_lcnc;
    }

    /**
     * @return the accountGeneral_papercash
     */
    public double getAccountGeneral_papercash() {
        return accountGeneral_papercash;
    }

    /**
     * @param accountGeneral_papercash the accountGeneral_papercash to set
     */
    public void setAccountGeneral_papercash(double accountGeneral_papercash) {
        this.accountGeneral_papercash = accountGeneral_papercash;
    }

    /**
     * @return the accountGeneral_compay
     */
    public double getAccountGeneral_compay() {
        return accountGeneral_compay;
    }

    /**
     * @param accountGeneral_compay the accountGeneral_compay to set
     */
    public void setAccountGeneral_compay(double accountGeneral_compay) {
        this.accountGeneral_compay = accountGeneral_compay;
    }

    /**
     * @return the accountGeneral_expenses
     */
    public double getAccountGeneral_expenses() {
        return accountGeneral_expenses;
    }

    /**
     * @param accountGeneral_expenses the accountGeneral_expenses to set
     */
    public void setAccountGeneral_expenses(double accountGeneral_expenses) {
        this.accountGeneral_expenses = accountGeneral_expenses;
    }

    /**
     * @return the AccountGeneral_totalsumpay
     */
    public double getAccountGeneral_totalsumpay() {
        return AccountGeneral_totalsumpay;
    }

    /**
     * @param AccountGeneral_totalsumpay the AccountGeneral_totalsumpay to set
     */
    public void setAccountGeneral_totalsumpay(double AccountGeneral_totalsumpay) {
        this.AccountGeneral_totalsumpay = AccountGeneral_totalsumpay;
    }

    /**
     * @return the accountGeneral_loan
     */
    public double getAccountGeneral_loan() {
        return accountGeneral_loan;
    }

    /**
     * @param accountGeneral_loan the accountGeneral_loan to set
     */
    public void setAccountGeneral_loan(double accountGeneral_loan) {
        this.accountGeneral_loan = accountGeneral_loan;
    }

    /**
     * @return the accountGeneral_excess
     */
    public double getAccountGeneral_excess() {
        return accountGeneral_excess;
    }

    /**
     * @param accountGeneral_excess the accountGeneral_excess to set
     */
    public void setAccountGeneral_excess(double accountGeneral_excess) {
        this.accountGeneral_excess = accountGeneral_excess;
    }

    /**
     * @return the accountGeneral_status
     */
    public String getAccountGeneral_status() {
        return accountGeneral_status;
    }

    /**
     * @param accountGeneral_status the accountGeneral_status to set
     */
    public void setAccountGeneral_status(String accountGeneral_status) {
        this.accountGeneral_status = accountGeneral_status;
    }

    /**
     * @return the agent_id
     */
    public int getAgent_id() {
        return agent_id;
    }

    /**
     * @param agent_id the agent_id to set
     */
    public void setAgent_id(int agent_id) {
        this.agent_id = agent_id;
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
     * @return the generalCash_details_id
     */
    public int getGeneralCash_details_id() {
        return generalCash_details_id;
    }

    /**
     * @param generalCash_details_id the generalCash_details_id to set
     */
    public void setGeneralCash_details_id(int generalCash_details_id) {
        this.generalCash_details_id = generalCash_details_id;
    }
    
}
