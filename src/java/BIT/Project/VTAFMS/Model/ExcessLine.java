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
public class ExcessLine {

    private Integer excess_line_id;
    private int excess_id;
    private String excess_line_chitNumber;
    private int excess_line_repeatCount;
    private double excess_line_totalPayment;
    private double excess_line_duePayment;
    private String excess_line_reason;

    public ExcessLine(Integer excess_line_id, int excess_id, String excess_line_chitNumber, int excess_line_repeatCount, double excess_line_totalPayment, double excess_line_duePayment, String excess_line_reason) {
        this.excess_line_id = excess_line_id;
        this.excess_id = excess_id;
        this.excess_line_chitNumber = excess_line_chitNumber;
        this.excess_line_repeatCount = excess_line_repeatCount;
        this.excess_line_totalPayment = excess_line_totalPayment;
        this.excess_line_duePayment = excess_line_duePayment;
        this.excess_line_reason = excess_line_reason;
    }

    /**
     * @return the excess_line_id
     */
    public Integer getExcess_line_id() {
        return excess_line_id;
    }

    /**
     * @param excess_line_id the excess_line_id to set
     */
    public void setExcess_line_id(Integer excess_line_id) {
        this.excess_line_id = excess_line_id;
    }

    /**
     * @return the excess_id
     */
    public int getExcess_id() {
        return excess_id;
    }

    /**
     * @param excess_id the excess_id to set
     */
    public void setExcess_id(int excess_id) {
        this.excess_id = excess_id;
    }

    /**
     * @return the excess_line_chitNumber
     */
    public String getExcess_line_chitNumber() {
        return excess_line_chitNumber;
    }

    /**
     * @param excess_line_chitNumber the excess_line_chitNumber to set
     */
    public void setExcess_line_chitNumber(String excess_line_chitNumber) {
        this.excess_line_chitNumber = excess_line_chitNumber;
    }

    /**
     * @return the excess_line_repeatCount
     */
    public int getExcess_line_repeatCount() {
        return excess_line_repeatCount;
    }

    /**
     * @param excess_line_repeatCount the excess_line_repeatCount to set
     */
    public void setExcess_line_repeatCount(int excess_line_repeatCount) {
        this.excess_line_repeatCount = excess_line_repeatCount;
    }

    /**
     * @return the excess_line_totalPayment
     */
    public double getExcess_line_totalPayment() {
        return excess_line_totalPayment;
    }

    /**
     * @param excess_line_totalPayment the excess_line_totalPayment to set
     */
    public void setExcess_line_totalPayment(double excess_line_totalPayment) {
        this.excess_line_totalPayment = excess_line_totalPayment;
    }

    /**
     * @return the excess_line_duePayment
     */
    public double getExcess_line_duePayment() {
        return excess_line_duePayment;
    }

    /**
     * @param excess_line_duePayment the excess_line_duePayment to set
     */
    public void setExcess_line_duePayment(double excess_line_duePayment) {
        this.excess_line_duePayment = excess_line_duePayment;
    }

    /**
     * @return the excess_line_reason
     */
    public String getExcess_line_reason() {
        return excess_line_reason;
    }

    /**
     * @param excess_line_reason the excess_line_reason to set
     */
    public void setExcess_line_reason(String excess_line_reason) {
        this.excess_line_reason = excess_line_reason;
    }
    

}
