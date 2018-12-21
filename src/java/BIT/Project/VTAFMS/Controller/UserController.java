/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Controller;

import BIT.Project.VTAFMS.DAO.UserDAO;
import BIT.Project.VTAFMS.DaoImpl.UserDAOImpl;
import BIT.Project.VTAFMS.Model.User;

/**
 *
 * @author Chamil
 */
public class UserController {

    private static UserDAO userDao = new UserDAOImpl();
    // private static UserDAO UserDao = new UserDAOImpl();

    public static int insertUser(User user) throws Exception {

        return userDao.insert(user);

    }

    public static User searchUserById(int id) throws Exception {
        return userDao.getAllUsersByID(id);
    }

    public static Object getAllUsers() throws Exception {
        return userDao.viewAll();
    }

    public static int updateUser(User user) throws Exception {
        return userDao.update(user);
    }

    public static int DeleteUserById(String id) throws Exception {
        return userDao.delete(id);
    }

    public static int deactivateUser(String id) throws Exception {
        return userDao.deactivateUser(id);
    }

    public static int activateUser(String id) throws Exception {
        return userDao.activateUser(id);
    }

    public static int availableUserName(String uname) throws Exception {
        return userDao.availableUserName(uname);
    }

    public static double getRowCount() throws Exception {
        return userDao.getRowCount();
    }

    public static int getRowCountSearch(String name) throws Exception {
        return userDao.getRowCountSearch(name);
    }

    public static Object limitresult(String page) throws Exception {
        return userDao.limitResult(page);
    }

    public static Object searchAndlimitResult(String name, String page) throws Exception {
        return userDao.searchAndlimitResult(name, page);
    }

    public static int getMaxId() throws Exception {
        return userDao.getMaxId();
    }

    public static User searchUserByName(String name) throws Exception {
        return userDao.searchUserByName(name);
    }

    public static int updateUserProfile(User user) throws Exception {
        return userDao.updateUserProfile(user);
    }

}
