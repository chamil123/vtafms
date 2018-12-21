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
public class Center {

    private String center_id;
    private int center_number;
    private String center_Name;
    private int center_com;
    private int center_nc;
    private int center_lc;
    private double center_papercash;
    private String center_mobile;
    private String center_officenumber;
    private String center_accountType;
    private String center_status;
    private String center_address;
    private int agent_id;
    private double center_expenses;

    public Center(String center_id, int center_number, String center_Name, int center_com, int center_nc, int center_lc, double center_papercash, String center_mobile, String center_officenumber, String center_accountType, String center_status, String center_address, int agent_id, double center_expenses) {
        this.center_id = center_id;
        this.center_number = center_number;
        this.center_Name = center_Name;
        this.center_com = center_com;
        this.center_nc = center_nc;
        this.center_lc = center_lc;
        this.center_papercash = center_papercash;
        this.center_mobile = center_mobile;
        this.center_officenumber = center_officenumber;
        this.center_accountType = center_accountType;
        this.center_status = center_status;
        this.center_address = center_address;
        this.agent_id = agent_id;
        this.center_expenses = center_expenses;
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
     * @return the center_number
     */
    public int getCenter_number() {
        return center_number;
    }

    /**
     * @param center_number the center_number to set
     */
    public void setCenter_number(int center_number) {
        this.center_number = center_number;
    }

    /**
     * @return the center_Name
     */
    public String getCenter_Name() {
        return center_Name;
    }

    /**
     * @param center_Name the center_Name to set
     */
    public void setCenter_Name(String center_Name) {
        this.center_Name = center_Name;
    }

    /**
     * @return the center_com
     */
    public int getCenter_com() {
        return center_com;
    }

    /**
     * @param center_com the center_com to set
     */
    public void setCenter_com(int center_com) {
        this.center_com = center_com;
    }

    /**
     * @return the center_nc
     */
    public int getCenter_nc() {
        return center_nc;
    }

    /**
     * @param center_nc the center_nc to set
     */
    public void setCenter_nc(int center_nc) {
        this.center_nc = center_nc;
    }

    /**
     * @return the center_lc
     */
    public int getCenter_lc() {
        return center_lc;
    }

    /**
     * @param center_lc the center_lc to set
     */
    public void setCenter_lc(int center_lc) {
        this.center_lc = center_lc;
    }

    /**
     * @return the center_papercash
     */
    public double getCenter_papercash() {
        return center_papercash;
    }

    /**
     * @param center_papercash the center_papercash to set
     */
    public void setCenter_papercash(double center_papercash) {
        this.center_papercash = center_papercash;
    }

    /**
     * @return the center_mobile
     */
    public String getCenter_mobile() {
        return center_mobile;
    }

    /**
     * @param center_mobile the center_mobile to set
     */
    public void setCenter_mobile(String center_mobile) {
        this.center_mobile = center_mobile;
    }

    /**
     * @return the center_officenumber
     */
    public String getCenter_officenumber() {
        return center_officenumber;
    }

    /**
     * @param center_officenumber the center_officenumber to set
     */
    public void setCenter_officenumber(String center_officenumber) {
        this.center_officenumber = center_officenumber;
    }

    /**
     * @return the center_accountType
     */
    public String getCenter_accountType() {
        return center_accountType;
    }

    /**
     * @param center_accountType the center_accountType to set
     */
    public void setCenter_accountType(String center_accountType) {
        this.center_accountType = center_accountType;
    }

    /**
     * @return the center_status
     */
    public String getCenter_status() {
        return center_status;
    }

    /**
     * @param center_status the center_status to set
     */
    public void setCenter_status(String center_status) {
        this.center_status = center_status;
    }

    /**
     * @return the center_address
     */
    public String getCenter_address() {
        return center_address;
    }

    /**
     * @param center_address the center_address to set
     */
    public void setCenter_address(String center_address) {
        this.center_address = center_address;
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
     * @return the center_expenses
     */
    public double getCenter_expenses() {
        return center_expenses;
    }

    /**
     * @param center_expenses the center_expenses to set
     */
    public void setCenter_expenses(double center_expenses) {
        this.center_expenses = center_expenses;
    }

    
}
