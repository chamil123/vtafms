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
public class Role {

    private Integer role_id;
    private String role_name;

    public Role(Integer role_id, String role_name) {
        this.role_id = role_id;
        this.role_name = role_name;
    }

    /**
     * @return the role_id
     */
    public Integer getRole_id() {
        return role_id;
    }

    /**
     * @param role_id the role_id to set
     */
    public void setRole_id(Integer role_id) {
        this.role_id = role_id;
    }

    /**
     * @return the role_name
     */
    public String getRole_name() {
        return role_name;
    }

    /**
     * @param role_name the role_name to set
     */
    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }
    

}
