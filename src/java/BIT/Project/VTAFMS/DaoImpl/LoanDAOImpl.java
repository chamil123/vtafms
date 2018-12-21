/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DaoImpl;

import BIT.Project.VTAFMS.ConnectionFactory.ConnectionProviderFactory;
import BIT.Project.VTAFMS.DAO.LoanDAO;
import BIT.Project.VTAFMS.Model.Loan;
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
public class LoanDAOImpl implements LoanDAO {

    @Override
    public int insert(Object object) throws Exception {
        Loan loan = (Loan) object;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();

        System.out.println("date rele : " + loan.getLoan_dateRelease());
        return stm.executeUpdate("INSERT into loan (loan_amount,loan_dateRelease,loan_status,loan_remark,loan_scheduleOfPayment,loan_interestRate,center_id,user_id,account_id,loan_balance)  values('" + loan.getLoan_amount() + "',"
                + "'" + loan.getLoan_dateRelease() + "',"
                + "'" + loan.getLoan_status() + "','" + loan.getLoan_remark() + "',"
                + "'" + loan.getLoan_scheduleOfPayment() + "',"
                + "'" + loan.getLoan_interestRate() + "',"
                + "'" + loan.getCenter_id() + "',"
                + "'" + loan.getUser_id() + "',"
                + "'" + loan.getAccount_id() + "','" + loan.getLoan_balance() + "')");

    }

    @Override
    public Object search(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(Object model) throws Exception {
        Loan loan = (Loan) model;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("UPDATE loan set loan_amount='" + loan.getLoan_amount() + "',loan_dateRelease='" + loan.getLoan_dateRelease() + "',loan_status='" + loan.getLoan_status() + "',loan_remark='" + loan.getLoan_remark() + "',loan_scheduleOfPayment='" + loan.getLoan_scheduleOfPayment() + "',loan_interestRate='" + loan.getLoan_interestRate() + "',center_id='" + loan.getCenter_id() + "',user_id='" + loan.getUser_id() + "',account_id='" + loan.getAccount_id() + "',loan_balance='" + loan.getLoan_balance() + "' WHERE loan_id='" + loan.getLoan_id() + "'");
    }

    @Override
    public int delete(String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        System.out.println("sssssssssssssssssssssssssssssssssssssssssssssss : " + id);
        return stm.executeUpdate("DELETE  FROM loan WHERE loan_id='" + id + "'");
    }

    @Override
    public List<Object> viewAll() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Loan searchLoanById(int id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from loan where loan_id='" + id + "'");
        if (res.next()) {
            return new Loan(res.getInt("loan_id"), res.getDouble("loan_amount"), res.getString("loan_dateRelease"), res.getString("loan_status"), res.getString("loan_remark"), res.getString("loan_scheduleOfPayment"), res.getString("loan_interestRate"), res.getString("center_id"), res.getInt("user_id"), res.getInt("account_id"), res.getDouble("loan_balance"));
        }
        return null;
    }

    @Override
    public List<Object> getLoansByCenterID(String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        String status = "Pending";
        ResultSet res = stm.executeQuery("select * from loan WHERE center_id='" + id + "' AND loan_status='" + status + "'");
        List<Object> list = new ArrayList<>();
        while (res.next()) {
            System.out.println("loand tik : " + res.getString("loan_dateRelease"));
            list.add(new Loan(res.getInt("loan_id"), res.getDouble("loan_amount"), res.getString("loan_dateRelease"), res.getString("loan_status"), res.getString("loan_remark"), res.getString("loan_scheduleOfPayment"), res.getString("loan_interestRate"), res.getString("center_id"), res.getInt("user_id"), res.getInt("account_id"), res.getDouble("loan_balance")));
        }
        return list;
    }

    @Override
    public int updateLoanByIdAndBalance(int id, double balance) throws Exception {
        //  Loan account = (Loan) model;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("UPDATE loan set loan_balance='" + balance + "' WHERE loan_id='" + id + "'");
    }

    @Override
    public int updateLoanByIdAndBalaandStatus(int id, double balance, String status) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("UPDATE loan set loan_balance='" + balance + "',loan_status='" + status + "' WHERE loan_id='" + id + "'");
    }

    @Override
    public double getRowCount() throws Exception {
        int numberRow = 0;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("SELECT count(*) FROM loan");
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
        ResultSet res = stm.executeQuery("select * from loan ORDER BY loan_id ASC limit " + page + ",10");
        List<Object> list = new ArrayList<>();
        while (res.next()) {
            list.add(new Loan(res.getInt("loan_id"), res.getDouble("loan_amount"), res.getString("loan_dateRelease"), res.getString("loan_status"), res.getString("loan_remark"), res.getString("loan_scheduleOfPayment"), res.getString("loan_interestRate"), res.getString("center_id"), res.getInt("user_id"), res.getInt("account_id"), res.getDouble("loan_balance")));
        }
        return list;
    }

    @Override
    public int getRowCountSearch(String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * FROM loan WHERE center_id='" + id + "'");
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
        ResultSet res = stm.executeQuery("select * from loan WHERE center_id='" + name + "'  ORDER BY loan_id ASC limit " + page + ",10");
        List<Object> list = new ArrayList<>();
        while (res.next()) {
            list.add(new Loan(res.getInt("loan_id"), res.getDouble("loan_amount"), res.getString("loan_dateRelease"), res.getString("loan_status"), res.getString("loan_remark"), res.getString("loan_scheduleOfPayment"), res.getString("loan_interestRate"), res.getString("center_id"), res.getInt("user_id"), res.getInt("account_id"), res.getDouble("loan_balance")));
        }
        return list;
    }

}
