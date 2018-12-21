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
public class GeneralCash {

    private Integer generalCash_details_id;
    private double generalCash_details_cash;
    private double generalCash_details_passDue;
    private String generalCash_details_date;
    private int agent_id;

    public GeneralCash(Integer generalCash_details_id, double generalCash_details_cash, double generalCash_details_passDue, String generalCash_details_date, int agent_id) {
        this.generalCash_details_id = generalCash_details_id;
        this.generalCash_details_cash = generalCash_details_cash;
        this.generalCash_details_passDue = generalCash_details_passDue;
        this.generalCash_details_date = generalCash_details_date;
        this.agent_id = agent_id;
    }

    /**
     * @return the generalCash_details_id
     */
    public Integer getGeneralCash_details_id() {
        return generalCash_details_id;
    }

    /**
     * @param generalCash_details_id the generalCash_details_id to set
     */
    public void setGeneralCash_details_id(Integer generalCash_details_id) {
        this.generalCash_details_id = generalCash_details_id;
    }

    /**
     * @return the generalCash_details_cash
     */
    public double getGeneralCash_details_cash() {
        return generalCash_details_cash;
    }

    /**
     * @param generalCash_details_cash the generalCash_details_cash to set
     */
    public void setGeneralCash_details_cash(double generalCash_details_cash) {
        this.generalCash_details_cash = generalCash_details_cash;
    }

    /**
     * @return the generalCash_details_passDue
     */
    public double getGeneralCash_details_passDue() {
        return generalCash_details_passDue;
    }

    /**
     * @param generalCash_details_passDue the generalCash_details_passDue to set
     */
    public void setGeneralCash_details_passDue(double generalCash_details_passDue) {
        this.generalCash_details_passDue = generalCash_details_passDue;
    }

    /**
     * @return the generalCash_details_date
     */
    public String getGeneralCash_details_date() {
        return generalCash_details_date;
    }

    /**
     * @param generalCash_details_date the generalCash_details_date to set
     */
    public void setGeneralCash_details_date(String generalCash_details_date) {
        this.generalCash_details_date = generalCash_details_date;
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
    
}
