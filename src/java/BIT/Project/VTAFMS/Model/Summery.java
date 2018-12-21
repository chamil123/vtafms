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
public class Summery {

    private Integer summery_id;
    private String summery_date;
    private String summery_name;
    private double summery_noCommisionAmount;
    private double summery_lessCommisionAmount;
    private double summery_due;
    private double summery_pay;
    private String center_id;
    private int user_id;
    private int centerCash_details_id;
    private double summery_lcnc;
    private double summery_papercash;
    private double Summery_compay;
    private double Summery_expences;
    private double Summery_slippaytot;
    private double summery_loan;
    private double summery_excess;
    private String summery_status;

    public Summery(Integer summery_id, String summery_date, String summery_name, double summery_noCommisionAmount, double summery_lessCommisionAmount, double summery_due, double summery_pay, String center_id, int user_id, int centerCash_details_id, double summery_lcnc, double summery_papercash, double Summery_compay, double Summery_expences, double Summery_slippaytot, double summery_loan, double summery_excess, String summery_status) {
        this.summery_id = summery_id;
        this.summery_date = summery_date;
        this.summery_name = summery_name;
        this.summery_noCommisionAmount = summery_noCommisionAmount;
        this.summery_lessCommisionAmount = summery_lessCommisionAmount;
        this.summery_due = summery_due;
        this.summery_pay = summery_pay;
        this.center_id = center_id;
        this.user_id = user_id;
        this.centerCash_details_id = centerCash_details_id;
        this.summery_lcnc = summery_lcnc;
        this.summery_papercash = summery_papercash;
        this.Summery_compay = Summery_compay;
        this.Summery_expences = Summery_expences;
        this.Summery_slippaytot = Summery_slippaytot;
        this.summery_loan = summery_loan;
        this.summery_excess = summery_excess;
        this.summery_status = summery_status;
    }

    /**
     * @return the summery_id
     */
    public Integer getSummery_id() {
        return summery_id;
    }

    /**
     * @param summery_id the summery_id to set
     */
    public void setSummery_id(Integer summery_id) {
        this.summery_id = summery_id;
    }

    /**
     * @return the summery_date
     */
    public String getSummery_date() {
        return summery_date;
    }

    /**
     * @param summery_date the summery_date to set
     */
    public void setSummery_date(String summery_date) {
        this.summery_date = summery_date;
    }

    /**
     * @return the summery_name
     */
    public String getSummery_name() {
        return summery_name;
    }

    /**
     * @param summery_name the summery_name to set
     */
    public void setSummery_name(String summery_name) {
        this.summery_name = summery_name;
    }

    /**
     * @return the summery_noCommisionAmount
     */
    public double getSummery_noCommisionAmount() {
        return summery_noCommisionAmount;
    }

    /**
     * @param summery_noCommisionAmount the summery_noCommisionAmount to set
     */
    public void setSummery_noCommisionAmount(double summery_noCommisionAmount) {
        this.summery_noCommisionAmount = summery_noCommisionAmount;
    }

    /**
     * @return the summery_lessCommisionAmount
     */
    public double getSummery_lessCommisionAmount() {
        return summery_lessCommisionAmount;
    }

    /**
     * @param summery_lessCommisionAmount the summery_lessCommisionAmount to set
     */
    public void setSummery_lessCommisionAmount(double summery_lessCommisionAmount) {
        this.summery_lessCommisionAmount = summery_lessCommisionAmount;
    }

    /**
     * @return the summery_due
     */
    public double getSummery_due() {
        return summery_due;
    }

    /**
     * @param summery_due the summery_due to set
     */
    public void setSummery_due(double summery_due) {
        this.summery_due = summery_due;
    }

    /**
     * @return the summery_pay
     */
    public double getSummery_pay() {
        return summery_pay;
    }

    /**
     * @param summery_pay the summery_pay to set
     */
    public void setSummery_pay(double summery_pay) {
        this.summery_pay = summery_pay;
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
     * @return the centerCash_details_id
     */
    public int getCenterCash_details_id() {
        return centerCash_details_id;
    }

    /**
     * @param centerCash_details_id the centerCash_details_id to set
     */
    public void setCenterCash_details_id(int centerCash_details_id) {
        this.centerCash_details_id = centerCash_details_id;
    }

    /**
     * @return the summery_lcnc
     */
    public double getSummery_lcnc() {
        return summery_lcnc;
    }

    /**
     * @param summery_lcnc the summery_lcnc to set
     */
    public void setSummery_lcnc(double summery_lcnc) {
        this.summery_lcnc = summery_lcnc;
    }

    /**
     * @return the summery_papercash
     */
    public double getSummery_papercash() {
        return summery_papercash;
    }

    /**
     * @param summery_papercash the summery_papercash to set
     */
    public void setSummery_papercash(double summery_papercash) {
        this.summery_papercash = summery_papercash;
    }

    /**
     * @return the Summery_compay
     */
    public double getSummery_compay() {
        return Summery_compay;
    }

    /**
     * @param Summery_compay the Summery_compay to set
     */
    public void setSummery_compay(double Summery_compay) {
        this.Summery_compay = Summery_compay;
    }

    /**
     * @return the Summery_expences
     */
    public double getSummery_expences() {
        return Summery_expences;
    }

    /**
     * @param Summery_expences the Summery_expences to set
     */
    public void setSummery_expences(double Summery_expences) {
        this.Summery_expences = Summery_expences;
    }

    /**
     * @return the Summery_slippaytot
     */
    public double getSummery_slippaytot() {
        return Summery_slippaytot;
    }

    /**
     * @param Summery_slippaytot the Summery_slippaytot to set
     */
    public void setSummery_slippaytot(double Summery_slippaytot) {
        this.Summery_slippaytot = Summery_slippaytot;
    }

    /**
     * @return the summery_loan
     */
    public double getSummery_loan() {
        return summery_loan;
    }

    /**
     * @param summery_loan the summery_loan to set
     */
    public void setSummery_loan(double summery_loan) {
        this.summery_loan = summery_loan;
    }

    /**
     * @return the summery_excess
     */
    public double getSummery_excess() {
        return summery_excess;
    }

    /**
     * @param summery_excess the summery_excess to set
     */
    public void setSummery_excess(double summery_excess) {
        this.summery_excess = summery_excess;
    }

    /**
     * @return the summery_status
     */
    public String getSummery_status() {
        return summery_status;
    }

    /**
     * @param summery_status the summery_status to set
     */
    public void setSummery_status(String summery_status) {
        this.summery_status = summery_status;
    }

    
}
