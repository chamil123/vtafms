/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DaoImpl;

import BIT.Project.VTAFMS.ConnectionFactory.ConnectionProviderFactory;
import BIT.Project.VTAFMS.DAO.UserDAO;
import BIT.Project.VTAFMS.Model.User;
import BIT.Project.VTAFMS.ResourceConnectionImpl.ResoureConnectionImpl;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Chamil
 */
public class UserDAOImpl implements UserDAO {

    @Override
    public User searchUserByName(String name) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from User where user_uname='" + name + "'");
        if (res.next()) {
            return new User(res.getInt("user_id"),
                    res.getString("user_firstName"),
                    res.getString("user_lastName"),
                    res.getString("user_email"),
                    res.getString("user_status"),
                    res.getString("user_image"),
                    res.getString("user_phoneNumber"),
                    res.getString("user_gender"),
                    res.getString("user_dob"),
                    res.getString("user_nic"),
                    res.getString("user_address"), res.getString("user_uname"), res.getInt("role_id"));
        }
        return null;
    }

    @Override
    public User getAllUsersByID(int id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from User where user_id='" + id + "'");
        if (res.next()) {
            return new User(res.getInt("user_id"),
                    res.getString("user_firstName"),
                    res.getString("user_lastName"),
                    res.getString("user_email"),
                    res.getString("user_status"),
                    res.getString("user_image"),
                    res.getString("user_phoneNumber"),
                    res.getString("user_gender"),
                    res.getString("user_dob"),
                    res.getString("user_nic"),
                    res.getString("user_address"), res.getString("user_uname"), res.getInt("role_id"));
        }
        return null;
    }

    @Override
    public int insert(Object object) throws Exception {
        User user = (User) object;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("INSERT into user (user_firstName,user_lastName,user_email,user_status,user_image,user_phoneNumber,user_gender,user_dob,user_nic,user_address,user_uname,role_id) values('" + user.getUser_firstName() + "','" + user.getUser_lastName() + "','" + user.getUser_email() + "','" + user.getUser_status() + "','" + user.getUser_image() + "','" + user.getUser_phoneNumber() + "','" + user.getUser_gender() + "','" + user.getUser_dob() + "','" + user.getUser_nic() + "','" + user.getUser_address() + "','" + user.getUser_uname() + "','" + user.getRole_id() + "')");

    }

    @Override
    public Object search(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(Object model) throws Exception {
        User user = (User) model;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("UPDATE user set user_firstName='" + user.getUser_firstName() + "',user_lastName='" + user.getUser_lastName() + "',user_email='" + user.getUser_email() + "',user_image='" + user.getUser_image() + "',user_phoneNumber='" + user.getUser_phoneNumber() + "',user_gender='" + user.getUser_gender() + "',user_dob='" + user.getUser_dob() + "',user_nic='" + user.getUser_nic() + "',user_address='" + user.getUser_address() + "',user_uname='" + user.getUser_uname() + "',role_id='" + user.getRole_id() + "' WHERE user_id='" + user.getUser_id() + "'");
    }

    @Override
    public int delete(String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("DELETE user,login FROM user,login WHERE user.user_id='" + id + "' AND user.user_id=login.user_id");
    }

    @Override
    public List<Object> viewAll() throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from User");
        List<Object> list = new ArrayList<>();
        while (res.next()) {
            list.add(new User(res.getInt("user_id"), res.getString("user_firstName"), res.getString("user_lastName"), res.getString("user_email"), res.getString("user_status"), res.getString("user_image"), res.getString("user_phoneNumber"), res.getString("user_gender"), res.getString("user_dob"), res.getString("user_nic"), res.getString("user_address"), res.getString("user_uname"), res.getInt("role_id")));
        }
        return list;
    }

    @Override
    public int deactivateUser(String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("UPDATE user set user_status='Deactivate' WHERE user_id='" + id + "'");
    }

    @Override
    public int activateUser(String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("UPDATE user set user_status='Activate' WHERE user_id='" + id + "'");

    }

    @Override
    public int availableUserName(String uname) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from User where user_uname='" + uname + "'");
        int val = 0;
        if (res.next()) {
            val = 1;
        }
        return val;
    }

    @Override
    public double getRowCount() throws Exception {
        int numberRow = 0;

        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("SELECT count(*) FROM user");
        int lastid = 0;
        while (res.next()) {
            numberRow = res.getInt("count(*)");
        }
        return numberRow;
    }

    @Override
    public Object limitResult(String page) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from user ORDER BY user_id ASC limit " + page + ",10");
        List<Object> list = new ArrayList<>();
        while (res.next()) {
            list.add(new User(res.getInt("user_id"), res.getString("user_firstName"), res.getString("user_lastName"), res.getString("user_email"), res.getString("user_status"), res.getString("user_image"), res.getString("user_phoneNumber"), res.getString("user_gender"), res.getString("user_dob"), res.getString("user_nic"), res.getString("user_address"), res.getString("user_uname"), res.getInt("role_id")));
        }
        return list;
    }

    @Override
    public int getMaxId() throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("SELECT MAX(user_id) AS id FROM user");
        int lastid = 0;
        while (res.next()) {
            lastid = res.getInt("id");
        }
        return lastid;
    }

    @Override
    public int getRowCountSearch(String name) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * FROM user WHERE user_firstName='" + name + "'");
        int count = 0;
        while (res.next()) {
            count++;
        }
        return count;
    }

    @Override
    public Object searchAndlimitResult(String name, String page) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from user  WHERE  user_firstName='" + name + "'  ORDER BY user_id ASC limit " + page + ",10");
        List<Object> list = new ArrayList<>();
        while (res.next()) {
            list.add(new User(res.getInt("user_id"), res.getString("user_firstName"), res.getString("user_lastName"), res.getString("user_email"), res.getString("user_status"), res.getString("user_image"), res.getString("user_phoneNumber"), res.getString("user_gender"), res.getString("user_dob"), res.getString("user_nic"), res.getString("user_address"), res.getString("user_uname"), res.getInt("role_id")));
        }
        return list;
    }

    @Override
    public int updateUserProfile(User model) throws Exception {
       User user = (User) model;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("UPDATE user set user_firstName='" + user.getUser_firstName() + "',user_lastName='" + user.getUser_lastName() + "',user_email='" + user.getUser_email() + "',user_image='" + user.getUser_image() + "',user_phoneNumber='" + user.getUser_phoneNumber() + "',user_gender='" + user.getUser_gender() + "',user_dob='" + user.getUser_dob() + "',user_nic='" + user.getUser_nic() + "',user_address='" + user.getUser_address() + "',user_uname='" + user.getUser_uname() + "' WHERE user_id='" + user.getUser_id() + "'");
    }

   

}
