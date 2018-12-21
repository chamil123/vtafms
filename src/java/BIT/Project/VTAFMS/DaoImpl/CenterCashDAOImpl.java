/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DaoImpl;

import BIT.Project.VTAFMS.ConnectionFactory.ConnectionProviderFactory;
import BIT.Project.VTAFMS.DAO.CenterCashDAO;
import BIT.Project.VTAFMS.Model.CenterCash;
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
public class CenterCashDAOImpl implements CenterCashDAO {

    @Override
    public CenterCash getAllCenterByID(String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        System.out.print(" center id ID : " + id);
        ResultSet res = stm.executeQuery("select * from centercash_details where center_id='" + id + "' ");
        if (res.next()) {
            return new CenterCash(res.getInt("centerCash_details_id"), res.getDouble("centerCash_details_FullCollection"), res.getDouble("centerCash_details_cash"), res.getString("centerCash_details_date"), res.getDouble("centerCash_details_passDue"), res.getString("center_id"), res.getInt("account_id"));

        }

        return null;
    }

    @Override
    public int insert(Object object) throws Exception {
        CenterCash centerCash = (CenterCash) object;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();

        return stm.executeUpdate("INSERT into centercash_details (centerCash_details_FullCollection,centerCash_details_cash,centerCash_details_date,centerCash_details_passDue,center_id,account_id)  values('" + centerCash.getCenterCash_details_FullCollection() + "','" + centerCash.getCenterCash_details_cash() + "','" + centerCash.getCenterCash_details_date() + "','" + centerCash.getCenterCash_details_passDue() + "','" + centerCash.getCenter_id() + "','" + centerCash.getAccount_id() + "')");
    }

    @Override
    public Object search(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(Object model) throws Exception {
        CenterCash centerCash = (CenterCash) model;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("UPDATE centercash_details set centerCash_details_FullCollection='" + centerCash.getCenterCash_details_FullCollection() + "',"
                + "centerCash_details_cash='" + centerCash.getCenterCash_details_cash() + "',centerCash_details_date='" + centerCash.getCenterCash_details_date() + "',"
                + "centerCash_details_passDue='" + centerCash.getCenterCash_details_passDue() + "',"
                + "center_id='" + centerCash.getCenter_id() + "',account_id='" + centerCash.getAccount_id() + "' WHERE centerCash_details_id='" + centerCash.getCenterCash_details_id() + "'");
    }

    @Override
    public int delete(String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        System.out.println("c cash id : " + id);
        return stm.executeUpdate("DELETE FROM centercash_details WHERE centerCash_details_id='" + id + "'");
    }

    @Override
    public List<Object> viewAll() throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from centercash_details");
        List<Object> list = new ArrayList<>();
        while (res.next()) {
            list.add(new CenterCash(res.getInt("centerCash_details_id"),
                    res.getDouble("centerCash_details_FullCollection"),
                    res.getDouble("centerCash_details_cash"),
                    res.getString("centerCash_details_date"),
                    res.getDouble("centerCash_details_passDue"),
                    res.getString("center_id"), res.getInt("account_id")));
        }

        return list;
    }

    @Override
    public double getAllCenterByAccountID(int id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        Double total = 0.00;
        ResultSet res = stm.executeQuery("select * from centercash_details where account_id='" + id + "'");
        while (res.next()) {
            total = total + res.getDouble("centerCash_details_cash");

        }

        return total;

    }

    @Override
    public List<Object> getAllcashandPassDuesBydate() throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();

        List<Object> listotal = new ArrayList<>();

        ResultSet res = stm.executeQuery("select centerCash_details_id,centerCash_details_FullCollection,center_id,account_id,centerCash_details_date,SUM(centerCash_details_cash),SUM(centerCash_details_passDue) from centercash_details GROUP BY centerCash_details_date");
        while (res.next()) {
            listotal.add(new CenterCash(res.getInt("centerCash_details_id"),
                    res.getDouble("centerCash_details_FullCollection"),
                    res.getDouble("SUM(centerCash_details_cash)"),
                    res.getString("centerCash_details_date"),
                    res.getDouble("SUM(centerCash_details_passDue)"),
                    res.getString("center_id"), res.getInt("account_id")));

            // System.out.print(res.getDouble("account_id"));
        }

        return listotal;
    }

    @Override
    public CenterCash getAllCenterByDateandID(String date, String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from centercash_details where centerCash_details_date='" + date + "' AND center_id='" + id + "' ");
        if (res.next()) {
            return new CenterCash(res.getInt("centerCash_details_id"), res.getDouble("centerCash_details_FullCollection"), res.getDouble("centerCash_details_cash"), res.getString("centerCash_details_date"), res.getDouble("centerCash_details_passDue"), res.getString("center_id"), res.getInt("account_id"));

        }

        return null;
    }

    @Override
    public int getRowCount() throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from centercash_details");
        int count = 0;
        while (res.next()) {
            // System.out.print("date eka : "+res.getString("transaction_date"));
            count++;
        }

        return count;
    }

    @Override
    public Object limitResult(String page) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from centercash_details  ORDER BY centerCash_details_id ASC limit " + page + ",8");
        List<Object> list = new ArrayList<>();
        while (res.next()) {

            list.add(new CenterCash(res.getInt("centerCash_details_id"), res.getDouble("centerCash_details_FullCollection"), res.getDouble("centerCash_details_cash"), res.getString("centerCash_details_date"), res.getDouble("centerCash_details_passDue"), res.getString("center_id"), res.getInt("account_id")));
//  list.add(new AddressModel(res.getInt("address_id"), res.getString("address_street1"), res.getString("address_street2"), res.getString("address_zip_code"), res.getInt("city_id"),res.getInt("state_id"), res.getInt("Person_person_id"), res.getString("address_person_type")));
        }

        return list;
    }

    @Override
    public double monthlyCash(String date) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        String month = date.substring(5, 7);
        double totcash = 0;
        double total = 0;
        String dateVal, submonth;
        ResultSet res = stm.executeQuery("SELECT*FROM centercash_details  ORDER BY centerCash_details_id ");//SUM(centerCash_details_cash) AS totcash,centerCash_details_date 
        while (res.next()) {
            dateVal = res.getString("centerCash_details_date");
            submonth = dateVal.substring(5, 7);
            if (month.equals(submonth)) {
                totcash = res.getDouble("centerCash_details_cash");
                total += totcash;
            }
        }
        return total;
    }

    @Override
    public double dailyCash(String date) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        double totcash = 0;
        double total = 0;
        String submonth;

        ResultSet res = stm.executeQuery("SELECT SUM(centerCash_details_cash) AS totcash FROM centercash_details WHERE centerCash_details_date='" + date + "' ORDER BY centerCash_details_id ");//SUM(centerCash_details_cash) AS totcash,centerCash_details_date 
        while (res.next()) {
            totcash = res.getDouble("totcash");
            total += totcash;
        }
        return total;
    }

    @Override
    public double monthlyFC(String date) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        String month = date.substring(5, 7);
        double totfc = 0;
        double total = 0;
        String dateVal, submonth;
        ResultSet res = stm.executeQuery("SELECT*FROM centercash_details  ORDER BY centerCash_details_id ");//SUM(centerCash_details_cash) AS totcash,centerCash_details_date 
        while (res.next()) {
            dateVal = res.getString("centerCash_details_date");
            submonth = dateVal.substring(5, 7);
            if (month.equals(submonth)) {
                totfc = res.getDouble("centerCash_details_FullCollection");
                total += totfc;
            }
        }
        return total;
    }

    @Override
    public double dailyFC(String date) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        double totdc = 0;
        double total = 0;
        String submonth;

        ResultSet res = stm.executeQuery("SELECT SUM(centerCash_details_FullCollection) AS totfc FROM centercash_details WHERE centerCash_details_date='" + date + "' ORDER BY centerCash_details_id ");//SUM(centerCash_details_cash) AS totcash,centerCash_details_date 
        while (res.next()) {
            totdc = res.getDouble("totfc");
            total += totdc;
        }
        return total;
    }

    @Override
    public double totpastDue() throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        double totpd = 0;
        double total = 0;
        String submonth;

        ResultSet res = stm.executeQuery("SELECT SUM(centerCash_details_passDue) AS totpd FROM centercash_details ORDER BY centerCash_details_id ");//SUM(centerCash_details_cash) AS totcash,centerCash_details_date 
        while (res.next()) {
            totpd = res.getDouble("totpd");
            total += totpd;
        }
        return total;
    }

    @Override
    public CenterCash searchCenterCashByCashId(String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from centercash_details where centerCash_details_id='" + id + "' ");
        if (res.next()) {
            return new CenterCash(res.getInt("centerCash_details_id"), res.getDouble("centerCash_details_FullCollection"), res.getDouble("centerCash_details_cash"), res.getString("centerCash_details_date"), res.getDouble("centerCash_details_passDue"), res.getString("center_id"), res.getInt("account_id"));

        }

        return null;
    }

    @Override
    public double getMonthlyCashTot(String month) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
//         System.out.println("tot cas ekassssssssssssssssssrrrr :"); 
        double totcash = 0;
        ResultSet res = stm.executeQuery("SELECT centerCash_details_cash,centerCash_details_date FROM  centercash_details");
        String monthSub = month.substring(5, 7);
        String datesql;
        String datesub;
//SUM(centerCash_details_cash) AS totcash,centerCash_details_date 
        //  ResultSet res = stm.executeQuery("SELECT EXTRACT(MONTH FROM centerCash_details_date) AS OrderMonth ,SUM(centerCash_details_cash) FROM centercash_details ");//SUM(centerCash_details_cash) AS totcash,centerCash_details_date 
        while (res.next()) {

            datesql = res.getString("centerCash_details_date");
            datesub = datesql.substring(5, 7);
            if (monthSub.equals(datesub)) {
                totcash += res.getDouble("centerCash_details_cash");
                //System.out.println("tot cas ekassssssssssssssssss :"+datesub); 
            }
            //if (res.getString("OrderMonth").equals(month)) {
            //totcash = res.getDouble("SUM(centerCash_details_cash)");

            // }
        }
        System.out.println("tot cas ekassssssssssssssssss :" + totcash);
        return totcash;
    }

    @Override
    public double cashBetweenDates(String fromdate, String todate) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        double totcash = 0;
        double total = 0;
        String submonth;

        ResultSet res = stm.executeQuery("SELECT SUM(centerCash_details_cash) AS totcash FROM centercash_details WHERE centerCash_details_date BETWEEN '" + fromdate + "' AND '" + todate + "' ORDER BY centerCash_details_id ");//SUM(centerCash_details_cash) AS totcash,centerCash_details_date 
        while (res.next()) {
            totcash = res.getDouble("totcash");
            total += totcash;

            System.out.println("From date : " + fromdate + "  " + todate);
        }
        return total;
    }

    @Override
    public double dueBetweenDates(String fromdate, String todate) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        double totdue = 0;
        double total = 0;


        ResultSet res = stm.executeQuery("SELECT SUM(centerCash_details_passDue) AS totdue FROM centercash_details WHERE centerCash_details_date BETWEEN '" + fromdate + "' AND '" + todate + "' ORDER BY centerCash_details_id ");//SUM(centerCash_details_cash) AS totcash,centerCash_details_date 
        while (res.next()) {
            totdue = res.getDouble("totdue");
            total += totdue;

        }
        return total;
    }

  

}
