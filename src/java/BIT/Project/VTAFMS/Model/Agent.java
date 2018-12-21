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
public class Agent {

    private Integer agent_id;
    private String agent_name;
    private int agent_commision;
    private int agent_noCommision;
    private int agent_lessComission;
    private int agent_availableCenters;
    private String agent_location;
    private String agent_mobileNumber;
    private String agent_officeNumber;
    private String agent_faxNumber;
    private String agent_email;
     private double agent_paperCash;

    public Agent(Integer agent_id, String agent_name, int agent_commision, int agent_noCommision, int agent_lessComission, int agent_availableCenters, String agent_location, String agent_mobileNumber, String agent_officeNumber, String agent_faxNumber, String agent_email, double agent_paperCash) {
        this.agent_id = agent_id;
        this.agent_name = agent_name;
        this.agent_commision = agent_commision;
        this.agent_noCommision = agent_noCommision;
        this.agent_lessComission = agent_lessComission;
        this.agent_availableCenters = agent_availableCenters;
        this.agent_location = agent_location;
        this.agent_mobileNumber = agent_mobileNumber;
        this.agent_officeNumber = agent_officeNumber;
        this.agent_faxNumber = agent_faxNumber;
        this.agent_email = agent_email;
        this.agent_paperCash = agent_paperCash;
    }

    /**
     * @return the agent_id
     */
    public Integer getAgent_id() {
        return agent_id;
    }

    /**
     * @param agent_id the agent_id to set
     */
    public void setAgent_id(Integer agent_id) {
        this.agent_id = agent_id;
    }

    /**
     * @return the agent_name
     */
    public String getAgent_name() {
        return agent_name;
    }

    /**
     * @param agent_name the agent_name to set
     */
    public void setAgent_name(String agent_name) {
        this.agent_name = agent_name;
    }

    /**
     * @return the agent_commision
     */
    public int getAgent_commision() {
        return agent_commision;
    }

    /**
     * @param agent_commision the agent_commision to set
     */
    public void setAgent_commision(int agent_commision) {
        this.agent_commision = agent_commision;
    }

    /**
     * @return the agent_noCommision
     */
    public int getAgent_noCommision() {
        return agent_noCommision;
    }

    /**
     * @param agent_noCommision the agent_noCommision to set
     */
    public void setAgent_noCommision(int agent_noCommision) {
        this.agent_noCommision = agent_noCommision;
    }

    /**
     * @return the agent_lessComission
     */
    public int getAgent_lessComission() {
        return agent_lessComission;
    }

    /**
     * @param agent_lessComission the agent_lessComission to set
     */
    public void setAgent_lessComission(int agent_lessComission) {
        this.agent_lessComission = agent_lessComission;
    }

    /**
     * @return the agent_availableCenters
     */
    public int getAgent_availableCenters() {
        return agent_availableCenters;
    }

    /**
     * @param agent_availableCenters the agent_availableCenters to set
     */
    public void setAgent_availableCenters(int agent_availableCenters) {
        this.agent_availableCenters = agent_availableCenters;
    }

    /**
     * @return the agent_location
     */
    public String getAgent_location() {
        return agent_location;
    }

    /**
     * @param agent_location the agent_location to set
     */
    public void setAgent_location(String agent_location) {
        this.agent_location = agent_location;
    }

    /**
     * @return the agent_mobileNumber
     */
    public String getAgent_mobileNumber() {
        return agent_mobileNumber;
    }

    /**
     * @param agent_mobileNumber the agent_mobileNumber to set
     */
    public void setAgent_mobileNumber(String agent_mobileNumber) {
        this.agent_mobileNumber = agent_mobileNumber;
    }

    /**
     * @return the agent_officeNumber
     */
    public String getAgent_officeNumber() {
        return agent_officeNumber;
    }

    /**
     * @param agent_officeNumber the agent_officeNumber to set
     */
    public void setAgent_officeNumber(String agent_officeNumber) {
        this.agent_officeNumber = agent_officeNumber;
    }

    /**
     * @return the agent_faxNumber
     */
    public String getAgent_faxNumber() {
        return agent_faxNumber;
    }

    /**
     * @param agent_faxNumber the agent_faxNumber to set
     */
    public void setAgent_faxNumber(String agent_faxNumber) {
        this.agent_faxNumber = agent_faxNumber;
    }

    /**
     * @return the agent_email
     */
    public String getAgent_email() {
        return agent_email;
    }

    /**
     * @param agent_email the agent_email to set
     */
    public void setAgent_email(String agent_email) {
        this.agent_email = agent_email;
    }

    /**
     * @return the agent_paperCash
     */
    public double getAgent_paperCash() {
        return agent_paperCash;
    }

    /**
     * @param agent_paperCash the agent_paperCash to set
     */
    public void setAgent_paperCash(double agent_paperCash) {
        this.agent_paperCash = agent_paperCash;
    }
    
}
