/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DaoImpl;

import BIT.Project.VTAFMS.ConnectionFactory.ConnectionProviderFactory;
import BIT.Project.VTAFMS.DAO.TransactionDAO;
import BIT.Project.VTAFMS.Model.Account;
import BIT.Project.VTAFMS.Model.AccountCategory;
import BIT.Project.VTAFMS.Model.CenterCash;
import BIT.Project.VTAFMS.Model.Expenses;
import BIT.Project.VTAFMS.Model.Transaction;
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
public class TransactionDAOImpl implements TransactionDAO {

    @Override
    public int insert(Object object) throws Exception {
        Transaction transaction = (Transaction) object;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();

        return stm.executeUpdate("INSERT into transaction (transaction_date,transaction_payee,transaction_amount,transaction_type,account_id)  values('" + transaction.getTransaction_date() + "','" + transaction.getTransaction_payee() + "','" + transaction.getTransaction_amount() + "','" + transaction.getTransaction_type() + "','" + transaction.getAccount_id() + "')");
    }

    @Override
    public Object search(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(Object model) throws Exception {
        Transaction transaction = (Transaction) model;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("UPDATE transaction set transaction_date='" + transaction.getTransaction_date() + "',transaction_payee='" + transaction.getTransaction_payee() + "',transaction_amount='" + transaction.getTransaction_amount() + "',transaction_type='" + transaction.getTransaction_type() + "',account_id='" + transaction.getAccount_id() + "' WHERE transaction_id='" + transaction.getTransaction_id() + "'");
    }

    @Override
    public int delete(String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("DELETE FROM transaction WHERE  transaction_id='" + id + "'");
    }

    @Override
    public List<Object> viewAll() throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        String acName = "Expenses";
        ResultSet res = stm.executeQuery("select * from transaction t,account a,account_category ac WHERE t.account_id=a.account_id AND a.account_category_id=ac.account_category_id AND account_category_name='" + acName + "'");
        List<Object> list = new ArrayList<>();
        while (res.next()) {
            list.add(new Transaction(res.getInt("transaction_id"), res.getString("transaction_date"), res.getString("transaction_payee"), res.getDouble("transaction_amount"), res.getString("transaction_type"), res.getInt("account_id")));

        }

        return list;
    }

    @Override
    public int getRowCount() throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        String acName = "Expenses";
        ResultSet res = stm.executeQuery("select * from transaction t INNER JOIN account a ON a.account_id=t.account_id INNER JOIN account_category ac ON a.account_category_id=ac.account_category_id WHERE ac.account_category_name='" + acName + "'");
        int count = 0;
        while (res.next()) {
            // System.out.print("date eka : "+res.getString("transaction_date"));
            count++;
        }

        return count;
    }

    @Override
    public List<Object> limitResult(String page) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        String acName = "Expenses";
        ResultSet res = stm.executeQuery("select * from transaction t INNER JOIN account a ON a.account_id=t.account_id INNER JOIN account_category ac ON a.account_category_id=ac.account_category_id WHERE account_category_name='" + acName + "' ORDER BY transaction_id ASC limit " + page + ",8");
        List<Object> list = new ArrayList<>();
        while (res.next()) {

            list.add(new Transaction(res.getInt("transaction_id"), res.getString("transaction_date"), res.getString("transaction_payee"), res.getDouble("transaction_amount"), res.getString("transaction_type"), res.getInt("account_id")));
//  list.add(new AddressModel(res.getInt("address_id"), res.getString("address_street1"), res.getString("address_street2"), res.getString("address_zip_code"), res.getInt("city_id"),res.getInt("state_id"), res.getInt("Person_person_id"), res.getString("address_person_type")));
        }

        return list;
    }

    @Override
    public Object searchAndlimitResult(String name, String page) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        String acName = "Expenses";
        ResultSet res = stm.executeQuery("select * from transaction t INNER JOIN account a ON a.account_id=t.account_id INNER JOIN account_category ac ON a.account_category_id=ac.account_category_id WHERE account_category_name='" + acName + "' AND transaction_payee='" + name + "'  ORDER BY transaction_id ASC limit " + page + ",8");
        List<Object> list = new ArrayList<>();
        while (res.next()) {

            list.add(new Transaction(res.getInt("transaction_id"), res.getString("transaction_date"), res.getString("transaction_payee"), res.getDouble("transaction_amount"), res.getString("transaction_type"), res.getInt("account_id")));
//  list.add(new AddressModel(res.getInt("address_id"), res.getString("address_street1"), res.getString("address_street2"), res.getString("address_zip_code"), res.getInt("city_id"),res.getInt("state_id"), res.getInt("Person_person_id"), res.getString("address_person_type")));
        }

        return list;
    }

    @Override
    public int getRowCountSearch(String name) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        String acName = "Expenses";
        ResultSet res = stm.executeQuery("select * from transaction t INNER JOIN account a ON a.account_id=t.account_id INNER JOIN account_category ac ON a.account_category_id=ac.account_category_id WHERE ac.account_category_name='" + acName + "' AND transaction_payee='" + name + "'");
        int count = 0;
        while (res.next()) {
            // System.out.print("date eka : "+res.getString("transaction_date"));
            count++;
        }

        return count;
    }

    /*   @Override
    public Object getTotalTransactionAmountByAccount() throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select SUM(transaction_amount),account_id,transaction_id,transaction_date,transaction_payee,transaction_type FROM transaction GROUP BY account_id");// t INNER JOIN account a ON t.account_id=a.account_id
        List<Object> list = new ArrayList<>();
        double Summer_slippaytot = 0;
        double summery_lcnc = 0;
        double summery_papercash = 0;
        double Summery_compay = 0;
        while (res.next()) {
           // System.out.println("total : " + res.getString("summery_date") + " " + res.getInt("summery_id") + "tot : " + res.getDouble("SUM(Summer_slippaytot)") + " lcnc : " + res.getDouble("SUM(summery_lcnc)") + " papercash : " + res.getDouble("SUM(summery_papercash)") + " compay : " + res.getDouble("SUM(Summery_compay)"));
            //System.out.println("total : "+res.getDouble("SUM(Summer_slippaytot)"));
             list.add( new Transaction(res.getInt("transaction_id"), res.getString("transaction_date"), res.getString("transaction_payee"), res.getDouble("SUM(transaction_amount)"), res.getString("transaction_type"), res.getInt("account_id")));
        }

        return list; 
    }
     */
    @Override
    public Transaction getTotalTransactionAmountByAccount(int id, String fromdate, String todate) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res;
        if (fromdate == null && todate == null) {
            res = stm.executeQuery("select SUM(transaction_amount),account_id,transaction_id,transaction_date,transaction_payee,transaction_type FROM transaction WHERE account_id='" + id + "'");
            if (res.next()) {
                return new Transaction(res.getInt("transaction_id"), res.getString("transaction_date"), res.getString("transaction_payee"), res.getDouble("SUM(transaction_amount)"), res.getString("transaction_type"), res.getInt("account_id"));
            }
        } else {
            res = stm.executeQuery("select SUM(transaction_amount),account_id,transaction_id,transaction_date,transaction_payee,transaction_type FROM transaction WHERE account_id='" + id + "' AND transaction_date BETWEEN '" + fromdate + "' AND '" + todate + "'");
            if (res.next()) {
                return new Transaction(res.getInt("transaction_id"), res.getString("transaction_date"), res.getString("transaction_payee"), res.getDouble("SUM(transaction_amount)"), res.getString("transaction_type"), res.getInt("account_id"));
            }
        }
        return null;

    }

    @Override
    public double getSumAccountCategoryValues(int id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select*from transaction t,account a,account_category ac WHERE a.account_id=t.account_id AND a.account_category_id=ac.account_category_id AND ac.account_category_id='" + id + "'");
        double transaction_amount = 0;
        while (res.next()) {
            transaction_amount += res.getDouble("transaction_amount");
        }

        return transaction_amount;
    }

    @Override
    public Transaction getAllRunnersByID(String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from transaction where transaction_id='" + id + "'");
        if (res.next()) {
            return new Transaction(res.getInt("transaction_id"), res.getString("transaction_date"), res.getString("transaction_payee"), res.getDouble("transaction_amount"), res.getString("transaction_type"), res.getInt("account_id"));
        }
        return null;
    }

    @Override
    public double travelExpensesBetweenDates(String fromdate, String todate) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        double totltravelExp = 0;
        double total = 0;

        ResultSet res = stm.executeQuery("SELECT SUM(transaction_amount) AS tottravelExp FROM transaction WHERE transaction_date BETWEEN '" + fromdate + "' AND '" + todate + "' AND account_id='" + 2 + "' ORDER BY transaction_id");//SUM(centerCash_details_cash) AS totcash,centerCash_details_date 
        while (res.next()) {
            totltravelExp = res.getDouble("tottravelExp");
            total += totltravelExp;
        }
        return total;
    }

    @Override
    public double shopRentalExpensesBetweenDates(String fromdate, String todate) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        double totlshopRentalExp = 0;
        double total = 0;

        ResultSet res = stm.executeQuery("SELECT SUM(transaction_amount) AS totshopRental FROM transaction WHERE transaction_date BETWEEN '" + fromdate + "' AND '" + todate + "' AND account_id='" + 4 + "' ORDER BY transaction_id");//SUM(centerCash_details_cash) AS totcash,centerCash_details_date 
        while (res.next()) {
            totlshopRentalExp = res.getDouble("totshopRental");
            total += totlshopRentalExp;
        }
        return total;
    }

    @Override
    public double slabourExpensesBetweenDates(String fromdate, String todate) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        double totllabourExp = 0;
        double total = 0;

        ResultSet res = stm.executeQuery("SELECT SUM(transaction_amount) AS labourExp FROM transaction WHERE transaction_date BETWEEN '" + fromdate + "' AND '" + todate + "' AND account_id='" + 5 + "' ORDER BY transaction_id");//SUM(centerCash_details_cash) AS totcash,centerCash_details_date 
        while (res.next()) {
            totllabourExp = res.getDouble("labourExp");
            total += totllabourExp;
        }
        return total;
    }

    @Override
    public double repairExpensesBetweenDates(String fromdate, String todate) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        double totlrepairExp = 0;
        double total = 0;

        ResultSet res = stm.executeQuery("SELECT SUM(transaction_amount) AS repairExp FROM transaction WHERE transaction_date BETWEEN '" + fromdate + "' AND '" + todate + "' AND account_id='" + 6 + "' ORDER BY transaction_id");//SUM(centerCash_details_cash) AS totcash,centerCash_details_date 
        while (res.next()) {
            totlrepairExp = res.getDouble("repairExp");
            total += totlrepairExp;
        }
        return total;
    }

    @Override
    public double payrollExpensesBetweenDates(String fromdate, String todate) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        double totlpayrollExp = 0;
        double total = 0;

        ResultSet res = stm.executeQuery("SELECT SUM(transaction_amount) AS payrollExp FROM transaction WHERE transaction_date BETWEEN '" + fromdate + "' AND '" + todate + "' AND account_id='" + 7 + "' ORDER BY transaction_id");//SUM(centerCash_details_cash) AS totcash,centerCash_details_date 
        while (res.next()) {
            totlpayrollExp = res.getDouble("payrollExp");
            total += totlpayrollExp;
        }
        return total;
    }

    @Override
    public double generalExpensesBetweenDates(String fromdate, String todate) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        double totlgeneralExp = 0;
        double total = 0;

        ResultSet res = stm.executeQuery("SELECT SUM(transaction_amount) AS generalExp FROM transaction WHERE transaction_date BETWEEN '" + fromdate + "' AND '" + todate + "' AND account_id='" + 8 + "' ORDER BY transaction_id");//SUM(centerCash_details_cash) AS totcash,centerCash_details_date 
        while (res.next()) {
            totlgeneralExp = res.getDouble("generalExp");
            total += totlgeneralExp;
        }
        return total;
    }

    @Override
    public double mealsExpensesBetweenDates(String fromdate, String todate) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        double totlmealExp = 0;
        double total = 0;

        ResultSet res = stm.executeQuery("SELECT SUM(transaction_amount) AS mealsExp FROM transaction WHERE transaction_date BETWEEN '" + fromdate + "' AND '" + todate + "' AND account_id='" + 9 + "' ORDER BY transaction_id");//SUM(centerCash_details_cash) AS totcash,centerCash_details_date 
        while (res.next()) {
            totlmealExp = res.getDouble("mealsExp");
            total += totlmealExp;
        }
        return total;
    }

    @Override
    public double commsionExpensesBetweenDates(String fromdate, String todate) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        double totlmealExp = 0;
        double total = 0;

        ResultSet res = stm.executeQuery("SELECT SUM(transaction_amount) AS commisionExp FROM transaction WHERE transaction_date BETWEEN '" + fromdate + "' AND '" + todate + "' AND account_id='" + 13 + "' ORDER BY transaction_id");//SUM(centerCash_details_cash) AS totcash,centerCash_details_date 
        while (res.next()) {
            totlmealExp = res.getDouble("commisionExp");
            total += totlmealExp;
        }
        return total;
    }

}
