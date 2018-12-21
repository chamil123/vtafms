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
public class Excess {

    private Integer excess_id;
    private String center_id;
    private String excess_date;
    private double excess_total;

    public Excess(Integer excess_id, String center_id, String excess_date, double excess_total) {
        this.excess_id = excess_id;
        this.center_id = center_id;
        this.excess_date = excess_date;
        this.excess_total = excess_total;
    }

    /**
     * @return the excess_id
     */
    public Integer getExcess_id() {
        return excess_id;
    }

    /**
     * @param excess_id the excess_id to set
     */
    public void setExcess_id(Integer excess_id) {
        this.excess_id = excess_id;
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
     * @return the excess_date
     */
    public String getExcess_date() {
        return excess_date;
    }

    /**
     * @param excess_date the excess_date to set
     */
    public void setExcess_date(String excess_date) {
        this.excess_date = excess_date;
    }

    /**
     * @return the excess_total
     */
    public double getExcess_total() {
        return excess_total;
    }

    /**
     * @param excess_total the excess_total to set
     */
    public void setExcess_total(double excess_total) {
        this.excess_total = excess_total;
    }
    

}
