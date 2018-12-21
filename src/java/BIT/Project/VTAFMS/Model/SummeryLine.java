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
public class SummeryLine {

    private Integer summery_line_id;
    private int summery_id;
    private String summery_line_chitNumber;
    private double Summery_line_Investment;
    private double Summery_line_payment;
    private String Summery_lin_date;

    public SummeryLine(Integer summery_line_id, int summery_id, String summery_line_chitNumber, double Summery_line_Investment, double Summery_line_payment, String Summery_lin_date) {
        this.summery_line_id = summery_line_id;
        this.summery_id = summery_id;
        this.summery_line_chitNumber = summery_line_chitNumber;
        this.Summery_line_Investment = Summery_line_Investment;
        this.Summery_line_payment = Summery_line_payment;
        this.Summery_lin_date = Summery_lin_date;
    }

    /**
     * @return the summery_line_id
     */
    public Integer getSummery_line_id() {
        return summery_line_id;
    }

    /**
     * @param summery_line_id the summery_line_id to set
     */
    public void setSummery_line_id(Integer summery_line_id) {
        this.summery_line_id = summery_line_id;
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

    /**
     * @return the summery_line_chitNumber
     */
    public String getSummery_line_chitNumber() {
        return summery_line_chitNumber;
    }

    /**
     * @param summery_line_chitNumber the summery_line_chitNumber to set
     */
    public void setSummery_line_chitNumber(String summery_line_chitNumber) {
        this.summery_line_chitNumber = summery_line_chitNumber;
    }

    /**
     * @return the Summery_line_Investment
     */
    public double getSummery_line_Investment() {
        return Summery_line_Investment;
    }

    /**
     * @param Summery_line_Investment the Summery_line_Investment to set
     */
    public void setSummery_line_Investment(double Summery_line_Investment) {
        this.Summery_line_Investment = Summery_line_Investment;
    }

    /**
     * @return the Summery_line_payment
     */
    public double getSummery_line_payment() {
        return Summery_line_payment;
    }

    /**
     * @param Summery_line_payment the Summery_line_payment to set
     */
    public void setSummery_line_payment(double Summery_line_payment) {
        this.Summery_line_payment = Summery_line_payment;
    }

    /**
     * @return the Summery_lin_date
     */
    public String getSummery_lin_date() {
        return Summery_lin_date;
    }

    /**
     * @param Summery_lin_date the Summery_lin_date to set
     */
    public void setSummery_lin_date(String Summery_lin_date) {
        this.Summery_lin_date = Summery_lin_date;
    }
    
}
