/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Model;

import java.util.Date;

/**
 *
 * @author Chamil
 */
public class User {

    private Integer user_id;
    private String user_firstName;
    private String user_lastName;
    private String user_email;
    private String user_status;
    private String user_image;
    private String user_phoneNumber;
    private String user_gender;
    private String user_dob;
    private String user_nic;
    private String user_address;
    private String user_uname;
    private int role_id;

    public User(Integer user_id, 
            String user_firstName,
            String user_lastName,
            String user_email,
            String user_status,
            String user_image,
            String user_phoneNumber, 
            String user_gender,
            String user_dob,
            String user_nic,
            String user_address, 
            String user_uname, int role_id) {
        this.user_id = user_id;
        this.user_firstName = user_firstName;
        this.user_lastName = user_lastName;
        this.user_email = user_email;
        this.user_status = user_status;
        this.user_image = user_image;
        this.user_phoneNumber = user_phoneNumber;
        this.user_gender = user_gender;
        this.user_dob = user_dob;
        this.user_nic = user_nic;
        this.user_address = user_address;
        this.user_uname = user_uname;
        this.role_id = role_id;
    }

    /**
     * @return the user_id
     */
    public Integer getUser_id() {
        return user_id;
    }

    /**
     * @param user_id the user_id to set
     */
    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    /**
     * @return the user_firstName
     */
    public String getUser_firstName() {
        return user_firstName;
    }

    /**
     * @param user_firstName the user_firstName to set
     */
    public void setUser_firstName(String user_firstName) {
        this.user_firstName = user_firstName;
    }

    /**
     * @return the user_lastName
     */
    public String getUser_lastName() {
        return user_lastName;
    }

    /**
     * @param user_lastName the user_lastName to set
     */
    public void setUser_lastName(String user_lastName) {
        this.user_lastName = user_lastName;
    }

    /**
     * @return the user_email
     */
    public String getUser_email() {
        return user_email;
    }

    /**
     * @param user_email the user_email to set
     */
    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    /**
     * @return the user_status
     */
    public String getUser_status() {
        return user_status;
    }

    /**
     * @param user_status the user_status to set
     */
    public void setUser_status(String user_status) {
        this.user_status = user_status;
    }

    /**
     * @return the user_image
     */
    public String getUser_image() {
        return user_image;
    }

    /**
     * @param user_image the user_image to set
     */
    public void setUser_image(String user_image) {
        this.user_image = user_image;
    }

    /**
     * @return the user_phoneNumber
     */
    public String getUser_phoneNumber() {
        return user_phoneNumber;
    }

    /**
     * @param user_phoneNumber the user_phoneNumber to set
     */
    public void setUser_phoneNumber(String user_phoneNumber) {
        this.user_phoneNumber = user_phoneNumber;
    }

    /**
     * @return the user_gender
     */
    public String getUser_gender() {
        return user_gender;
    }

    /**
     * @param user_gender the user_gender to set
     */
    public void setUser_gender(String user_gender) {
        this.user_gender = user_gender;
    }

    /**
     * @return the user_dob
     */
    public String getUser_dob() {
        return user_dob;
    }

    /**
     * @param user_dob the user_dob to set
     */
    public void setUser_dob(String user_dob) {
        this.user_dob = user_dob;
    }

    /**
     * @return the user_nic
     */
    public String getUser_nic() {
        return user_nic;
    }

    /**
     * @param user_nic the user_nic to set
     */
    public void setUser_nic(String user_nic) {
        this.user_nic = user_nic;
    }

    /**
     * @return the user_address
     */
    public String getUser_address() {
        return user_address;
    }

    /**
     * @param user_address the user_address to set
     */
    public void setUser_address(String user_address) {
        this.user_address = user_address;
    }

    /**
     * @return the user_uname
     */
    public String getUser_uname() {
        return user_uname;
    }

    /**
     * @param user_uname the user_uname to set
     */
    public void setUser_uname(String user_uname) {
        this.user_uname = user_uname;
    }

    /**
     * @return the role_id
     */
    public int getRole_id() {
        return role_id;
    }

    /**
     * @param role_id the role_id to set
     */
    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

  
    

}   