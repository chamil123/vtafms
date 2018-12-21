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
public class Login {
    private int user_id;
    private String login_username;
    private String login_password;

    public Login(int user_id, String login_username, String login_password) {
        this.user_id = user_id;
        this.login_username = login_username;
        this.login_password = login_password;
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
     * @return the login_username
     */
    public String getLogin_username() {
        return login_username;
    }

    /**
     * @param login_username the login_username to set
     */
    public void setLogin_username(String login_username) {
        this.login_username = login_username;
    }

    /**
     * @return the login_password
     */
    public String getLogin_password() {
        return login_password;
    }

    /**
     * @param login_password the login_password to set
     */
    public void setLogin_password(String login_password) {
        this.login_password = login_password;
    }
    
}
