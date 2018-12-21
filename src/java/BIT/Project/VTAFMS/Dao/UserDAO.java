/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DAO;

import BIT.Project.VTAFMS.Model.User;
import java.util.List;

/**
 *
 * @author Chamil
 */
public interface UserDAO extends DAO {

    public User searchUserByName(String name) throws Exception;

    public User getAllUsersByID(int id) throws Exception;

    public int deactivateUser(String id) throws Exception;

    public int activateUser(String id) throws Exception;

    public int availableUserName(String uname)throws Exception;

    public double getRowCount()throws Exception;

    public Object limitResult(String page)throws Exception;

    public int getMaxId()throws Exception;

    public int getRowCountSearch(String name)throws Exception;

    public Object searchAndlimitResult(String name, String page)throws Exception;

    public int updateUserProfile(User user)throws Exception;

   
}
