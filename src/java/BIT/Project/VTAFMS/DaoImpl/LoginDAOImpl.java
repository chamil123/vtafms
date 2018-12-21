/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DaoImpl;

import BIT.Project.VTAFMS.ConnectionFactory.ConnectionProviderFactory;
import BIT.Project.VTAFMS.DAO.LoginDAO;
import BIT.Project.VTAFMS.Model.Login;
import BIT.Project.VTAFMS.ResourceConnectionImpl.ResoureConnectionImpl;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

/**
 *
 * @author Chamil
 */
public class LoginDAOImpl implements LoginDAO {

    @Override
    public int insert(Object object) throws Exception {
        Login login = (Login) object;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();

        return stm.executeUpdate("INSERT into login (user_id,login_username,login_password)  values('" + login.getUser_id() + "','" + login.getLogin_username() + "','" + login.getLogin_password() + "')");
    }

    @Override
    public Object search(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(Object model) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Object> viewAll() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Login serchLoginByUsernameAndPassword(String uname, String pword) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from login where login_username='" + uname + "' AND login_password='" + pword + "'");
        if (res.next()) {
            return new Login(res.getInt("user_id"), res.getString("login_username"), res.getString("login_password"));
        }
        return null;
    }

    @Override
    public int resetPassword(String user_id, String password) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        System.out.println("password : " + password + " id : " + user_id);
        return stm.executeUpdate("UPDATE login SET login_password='" + password + "' WHERE user_id='" + user_id + "'");

    }

    @Override
    public Login searchUserById(int id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from login where user_id='" + id + "'");
        if (res.next()) {
            return new Login(res.getInt("user_id"), res.getString("login_username"), res.getString("login_password"));
        }
        return null;
    }

    @Override
    public int resetPasswordAndUsername(String user_id, String password, String uname) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("UPDATE login SET login_password='" + password + "',login_username='"+uname+"' WHERE user_id='" + user_id + "'");
    }

}
