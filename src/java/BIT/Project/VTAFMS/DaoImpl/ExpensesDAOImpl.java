/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DaoImpl;

import BIT.Project.VTAFMS.ConnectionFactory.ConnectionProviderFactory;
import BIT.Project.VTAFMS.DAO.ExpensesDAO;
import BIT.Project.VTAFMS.Model.Account;
import BIT.Project.VTAFMS.Model.Agent;
import BIT.Project.VTAFMS.Model.Expenses;
import BIT.Project.VTAFMS.ResourceConnectionImpl.ResoureConnectionImpl;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

/**
 *
 * @author Chamil
 */
public class ExpensesDAOImpl implements ExpensesDAO {

    @Override
    public int insert(Object object) throws Exception {
        Expenses expenses = (Expenses) object;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();

        return stm.executeUpdate("INSERT into expences (expences_name,expences_amount,expences_remark,expences_addDate,expences_type,account_id) values('" + expenses.getExpences_name() + "','" + expenses.getExpences_amount() + "','" + expenses.getExpences_remark() + "','" + expenses.getExpences_type() + "','" + expenses.getExpences_addDate() + "','" + expenses.getAccount_id() + "')");

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
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from expences");
        List<Object> list = new ArrayList<>();
        while (res.next()) {
            list.add(new Expenses(res.getInt("expences_id"), res.getString("expences_name"), res.getDouble("expences_amount"), res.getString("expences_remark"), res.getString("expences_type"), res.getString("expences_addDate"), res.getInt("account_id")));
        }
        return list;
    }

    @Override
    public Expenses getAllExpensesByID(int id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from expences where expences_id='" + id + "'");
        if (res.next()) {
            return new Expenses(res.getInt("expences_id"), res.getString("expences_name"), res.getDouble("expences_amount"), res.getString("expences_remark"), res.getString("expences_type"), res.getString("expences_addDate"), res.getInt("account_id"));

        }
        return null;
    }

    @Override
    public double getAllexpensesAmount() throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        String acName = "Expenses";

        ResultSet res = stm.executeQuery("SELECT SUM(transaction_amount) AS totexp FROM transaction t INNER JOIN account a ON a.account_id=t.account_id INNER JOIN account_category ac ON a.account_category_id=ac.account_category_id WHERE account_category_name='" + acName + "' ORDER BY transaction_id ");
        double expTot = 0;
        if (res.next()) {
            expTot = res.getDouble("totexp");
        }
        return expTot;
    }

    @Override
    public double getAllexpensesAmountbydate(String date) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        String acName = "Expenses";

        ResultSet res = stm.executeQuery("SELECT SUM(transaction_amount) AS totexp FROM transaction t INNER JOIN account a ON a.account_id=t.account_id INNER JOIN account_category ac ON a.account_category_id=ac.account_category_id WHERE account_category_name='" + acName + "' AND transaction_date='" + date + "'  ORDER BY transaction_id ");
        double expTot = 0;
        if (res.next()) {
            expTot = res.getDouble("totexp");
        }
        return expTot;
    }

    @Override
    public double getAllexpensesAmountbyaccountID(String id) throws Exception {

        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        String acName = "Expenses";

        ResultSet res = stm.executeQuery("SELECT SUM(transaction_amount) AS totexp FROM transaction t INNER JOIN account a ON a.account_id=t.account_id INNER JOIN account_category ac ON a.account_category_id=ac.account_category_id WHERE account_category_name='" + acName + "' AND a.account_id='" + id + "'  ORDER BY transaction_id ");
        double expTot = 0;
        if (res.next()) {
            expTot = res.getDouble("totexp");
        }
        return expTot;

    }

}
