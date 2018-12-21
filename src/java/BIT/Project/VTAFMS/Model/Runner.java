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
public class Runner {
    private Integer runner_id;
    private String runner_firstName;
    private String runner_lastName;
    private String runner_NIC;
    private String runner_mobileNumber;
    private String runner_homeNumber;
    private String runner_email;
    private String runner_address;

    public Runner(Integer runner_id, String runner_firstName, String runner_lastName, String runner_NIC, String runner_mobileNumber, String runner_homeNumber, String runner_email, String runner_address) {
        this.runner_id = runner_id;
        this.runner_firstName = runner_firstName;
        this.runner_lastName = runner_lastName;
        this.runner_NIC = runner_NIC;
        this.runner_mobileNumber = runner_mobileNumber;
        this.runner_homeNumber = runner_homeNumber;
        this.runner_email = runner_email;
        this.runner_address = runner_address;
    }

    /**
     * @return the runner_id
     */
    public Integer getRunner_id() {
        return runner_id;
    }

    /**
     * @param runner_id the runner_id to set
     */
    public void setRunner_id(Integer runner_id) {
        this.runner_id = runner_id;
    }

    /**
     * @return the runner_firstName
     */
    public String getRunner_firstName() {
        return runner_firstName;
    }

    /**
     * @param runner_firstName the runner_firstName to set
     */
    public void setRunner_firstName(String runner_firstName) {
        this.runner_firstName = runner_firstName;
    }

    /**
     * @return the runner_lastName
     */
    public String getRunner_lastName() {
        return runner_lastName;
    }

    /**
     * @param runner_lastName the runner_lastName to set
     */
    public void setRunner_lastName(String runner_lastName) {
        this.runner_lastName = runner_lastName;
    }

    /**
     * @return the runner_NIC
     */
    public String getRunner_NIC() {
        return runner_NIC;
    }

    /**
     * @param runner_NIC the runner_NIC to set
     */
    public void setRunner_NIC(String runner_NIC) {
        this.runner_NIC = runner_NIC;
    }

    /**
     * @return the runner_mobileNumber
     */
    public String getRunner_mobileNumber() {
        return runner_mobileNumber;
    }

    /**
     * @param runner_mobileNumber the runner_mobileNumber to set
     */
    public void setRunner_mobileNumber(String runner_mobileNumber) {
        this.runner_mobileNumber = runner_mobileNumber;
    }

    /**
     * @return the runner_homeNumber
     */
    public String getRunner_homeNumber() {
        return runner_homeNumber;
    }

    /**
     * @param runner_homeNumber the runner_homeNumber to set
     */
    public void setRunner_homeNumber(String runner_homeNumber) {
        this.runner_homeNumber = runner_homeNumber;
    }

    /**
     * @return the runner_email
     */
    public String getRunner_email() {
        return runner_email;
    }

    /**
     * @param runner_email the runner_email to set
     */
    public void setRunner_email(String runner_email) {
        this.runner_email = runner_email;
    }

    /**
     * @return the runner_address
     */
    public String getRunner_address() {
        return runner_address;
    }

    /**
     * @param runner_address the runner_address to set
     */
    public void setRunner_address(String runner_address) {
        this.runner_address = runner_address;
    }
    
    
}
