/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DAO;

import BIT.Project.VTAFMS.Model.Login;

/**
 *
 * @author Chamil
 */
public interface LoginDAO extends DAO {

    public Login serchLoginByUsernameAndPassword(String uname, String pword) throws Exception;

    public int resetPassword(String user_id, String password) throws Exception;

    public Login searchUserById(int id)throws Exception;

    public int resetPasswordAndUsername(String user_id, String password, String uname)throws Exception;
}
