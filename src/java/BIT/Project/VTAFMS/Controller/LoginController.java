/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Controller;

import BIT.Project.VTAFMS.DAO.LoginDAO;
import BIT.Project.VTAFMS.DaoImpl.LoginDAOImpl;
import BIT.Project.VTAFMS.Model.Login;

/**
 *
 * @author Chamil
 */
public class LoginController {

    //create LoginDapImpl object using LiginDAO referance
    private static LoginDAO loginDao = new LoginDAOImpl();

    public static int insertlogin(Login account) throws Exception {
        return loginDao.insert(account);
    }

    public static Object getAllLogin() throws Exception {
        return loginDao.viewAll();
    }

    public static int updateLogin(Login account) throws Exception {
        return loginDao.update(account);
    }

    public static int DeleteLoginById(String id) throws Exception {
        return loginDao.delete(id);
    }

    //get parameter from servlet and pass it lognDAOImpl
    public static Login serchLoginByUsernameAndPassword(String uname, String pword) throws Exception {
        return loginDao.serchLoginByUsernameAndPassword(uname, pword);
    }

    public static int resetPassword(String user_id, String password) throws Exception {
        return loginDao.resetPassword(user_id, password);
    }

    public static Login searchUserById(int id) throws Exception {
        return loginDao.searchUserById(id);
    }

    public static int resetPasswordAndUsername(String user_id, String password, String uname) throws Exception {
        return loginDao.resetPasswordAndUsername(user_id, password, uname);
    }
}
