/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DaoImpl;

import BIT.Project.VTAFMS.ConnectionFactory.ConnectionProviderFactory;
import BIT.Project.VTAFMS.DAO.AccountDAO;
import BIT.Project.VTAFMS.Model.Account;
import BIT.Project.VTAFMS.Model.Center;
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
public class AccountDAOImpl implements AccountDAO {

    @Override
    public int insert(Object object) throws Exception {
        Account account = (Account) object;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("INSERT into account (account_name,account_correntBalance,account_category_id,account_description)  values('" + account.getAccount_name() + "',"
                + "'" + account.getAccount_correntBalance() + "',"
                + "'" + account.getAccount_category_id() + "',"
                + "'" + account.getAccount_description() + "')");
    }

    @Override
    public Object search(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(Object model) throws Exception {
         Account account = (Account) model;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("UPDATE account set account_name='" + account.getAccount_name()+ "',account_correntBalance='" + account.getAccount_correntBalance()+ "',account_category_id='" + account.getAccount_category_id()+ "',account_description='" + account.getAccount_description()+ "' WHERE account_id='" + account.getAccount_id()+ "'");
    }

    @Override
    public int delete(String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("DELETE FROM account WHERE  account_id='"+id+"'");
    }

    @Override
    public List<Object> viewAll() throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from account");
        List<Object> list = new ArrayList<>();

        while (res.next()) {
            list.add(new Account(res.getInt("account_id"), res.getString("account_name"), res.getDouble("account_correntBalance"), res.getInt("account_category_id"), res.getString("account_description")));
        }
        return list;
    }

    @Override
    public Account getAllAccountByName(String name) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from account where account_name='" + name + "'");
        if (res.next()) {
            return new Account(res.getInt("account_id"), res.getString("account_name"), res.getDouble("account_correntBalance"), res.getInt("account_category_id"), res.getString("account_description"));

        }
        return null;
    }

    @Override
    public Account getAccountById(String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from account where account_id='" + id + "'");
        if (res.next()) {
            return new Account(res.getInt("account_id"), res.getString("account_name"), res.getDouble("account_correntBalance"), res.getInt("account_category_id"), res.getString("account_description"));

        }
        return null;
    }

    @Override
    public List<Object> getAllExpensesAccount() throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        String acName = "Expenses";

        ResultSet res = stm.executeQuery("SELECT*FROM account a INNER JOIN transaction t ON a.account_id=t.account_id INNER JOIN account_category ac ON a.account_category_id=ac.account_category_id WHERE account_category_name='" + acName + "' GROUP BY a.account_name ORDER BY transaction_id ");
        List<Object> list = new ArrayList<>();
        String expTot = null;
        while (res.next()) {
            //  vector.add(res.getString("account_name"));
            list.add(new Account(res.getInt("account_id"), res.getString("account_name"), res.getDouble("account_correntBalance"), res.getInt("account_category_id"), res.getString("account_description")));
        }
        return list;
    }

}
