/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DaoImpl;

import BIT.Project.VTAFMS.ConnectionFactory.ConnectionProviderFactory;
import BIT.Project.VTAFMS.DAO.SummeryDAO;
import BIT.Project.VTAFMS.Model.Summery;
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
public class SummeryDAOImpl implements SummeryDAO {

    @Override
    public int insert(Object object) throws Exception {
        Summery summery = (Summery) object;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();

        return stm.executeUpdate("INSERT into summery (summery_date,summery_name,summery_noCommisionAmount,summery_lessCommisionAmount,summery_due,summery_pay,center_id,user_id,centerCash_details_id,summery_lcnc,summery_papercash,Summery_compay,Summery_expences,Summer_slippaytot,summery_loan,summery_excess,summery_status)  values('" + summery.getSummery_date() + "',"
                + "'" + summery.getSummery_name() + "','" + summery.getSummery_noCommisionAmount() + "',"
                + "'" + summery.getSummery_lessCommisionAmount() + "','" + summery.getSummery_due() + "',"
                + "'" + summery.getSummery_pay() + "','" + summery.getCenter_id() + "','" + summery.getUser_id() + "',"
                + "'" + summery.getCenterCash_details_id() + "',"
                + "'" + summery.getSummery_lcnc() + "',"
                + "'" + summery.getSummery_papercash() + "',"
                + "'" + summery.getSummery_compay() + "','" + summery.getSummery_expences() + "','" + summery.getSummery_slippaytot() + "','" + summery.getSummery_loan() + "','" + summery.getSummery_excess() + "','" + summery.getSummery_status() + "')");

    }

    @Override
    public Object search(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(Object model) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.

//        Summery summery = (Summery) model;
//        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
//        Connection conn = (Connection) connectionProvider.getConnection();
//        Statement stm = conn.createStatement();
//        return stm.executeUpdate("UPDATE summery set summery_date='" + summery.getSummery_date()+ "',summery_name='" + summery.getSummery_name()+ "',summery_noCommisionAmount='" + summery.getSummery_noCommisionAmount()+ "',"
//                + "summery_lessCommisionAmount='"+summery.getSummery_noCommisionAmount()+"' WHERE excess_id='" + excess.getExcess_id() + "'");
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
        ResultSet res = stm.executeQuery("select * from summery");
        List<Object> list = new ArrayList<>();
        while (res.next()) {
            list.add(new Summery(res.getInt("summery_id"), res.getString("summery_date"), res.getString("summery_name"), res.getDouble("summery_noCommisionAmount"), res.getDouble("summery_lessCommisionAmount"), res.getDouble("summery_due"), res.getDouble("summery_pay"), res.getString("center_id"), res.getInt("user_id"), res.getInt("centerCash_details_id"), res.getDouble("summery_lcnc"), res.getDouble("summery_papercash"), res.getDouble("Summery_compay"), res.getDouble("Summery_expences"), res.getDouble("Summer_slippaytot"), res.getDouble("summery_loan"), res.getDouble("summery_excess"), res.getString("summery_status")));
            //  list.add(new AddressModel(res.getInt("address_id"), res.getString("address_street1"), res.getString("address_street2"), res.getString("address_zip_code"), res.getInt("city_id"),res.getInt("state_id"), res.getInt("Person_person_id"), res.getString("address_person_type")));
        }

        return list;
    }

    @Override
    public Summery getAllSummerysByID(int id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from summery where summery_id='" + id + "'");
        if (res.next()) {
            return new Summery(res.getInt("summery_id"),
                    res.getString("summery_date"),
                    res.getString("summery_name"),
                    res.getDouble("summery_noCommisionAmount"),
                    res.getDouble("summery_lessCommisionAmount"),
                    res.getDouble("summery_due"),
                    res.getDouble("summery_pay"),
                    res.getString("center_id"),
                    res.getInt("user_id"),
                    res.getInt("centerCash_details_id"),
                    res.getDouble("summery_lcnc"),
                    res.getDouble("summery_papercash"),
                    res.getDouble("Summery_compay"),
                    res.getDouble("Summery_expences"),
                    res.getDouble("Summer_slippaytot"),
                    res.getDouble("summery_loan"),
                    res.getDouble("summery_excess"),
                    res.getString("summery_status"));
        }
        return null;
    }

    @Override
    public int getMaxId() throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("SELECT MAX(summery_id) AS id FROM summery");
        int lastid = 0;
        while (res.next()) {
            lastid = res.getInt("id");
        }

        return lastid;
    }

    @Override
    public Summery searchAvailableSummery(String date, String cname) throws Exception {
//       ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
//        Connection conn = (Connection) connectionProvider.getConnection();
//        Statement stm = conn.createStatement();
//        ResultSet res = stm.executeQuery("select * from center where center_number='" + id + "'");
//        if (res.next()) {
//            return new Center(res.getString("center_id"),res.getInt("center_number"),
//                    res.getString("center_name"), res.getInt("center_commision"),
//                    res.getInt("center_noCommision"), res.getInt("center_lessCommision"),
//                    res.getInt("center_paperCash"), res.getString("center_moboleNumber"),
//                    res.getString("center_officeNumber"), res.getString("center_accountType"),
//                    res.getString("center_status"), res.getString("center_address"),
//                    res.getInt("agent_id"), res.getDouble("center_expenses"));
//        }
        return null;
    }

    @Override
    public int getRowCount() throws Exception {
        int numberRow = 0;

        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("SELECT count(*) FROM summery");
        int lastid = 0;
        while (res.next()) {
            numberRow = res.getInt("count(*)");
        }
        return numberRow;
    }

    @Override
    public List<Object> limitResult(String page) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from summery ORDER BY summery_id ASC limit " + page + ",12");
        List<Object> list = new ArrayList<>();
        while (res.next()) {

            list.add(new Summery(res.getInt("summery_id"), res.getString("summery_date"), res.getString("summery_name"), res.getDouble("summery_noCommisionAmount"), res.getDouble("summery_lessCommisionAmount"), res.getDouble("summery_due"), res.getDouble("summery_pay"), res.getString("center_id"), res.getInt("user_id"), res.getInt("centerCash_details_id"), res.getDouble("summery_lcnc"), res.getDouble("summery_papercash"), res.getDouble("Summery_compay"), res.getDouble("Summery_expences"), res.getDouble("Summer_slippaytot"), res.getDouble("summery_loan"), res.getDouble("summery_excess"), res.getString("summery_status")));
            //  list.add(new AddressModel(res.getInt("address_id"), res.getString("address_street1"), res.getString("address_street2"), res.getString("address_zip_code"), res.getInt("city_id"),res.getInt("state_id"), res.getInt("Person_person_id"), res.getString("address_person_type")));
        }

        return list;
    }

    @Override
    public List<Object> getAllSummerysTypeGen() throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        // ResultSet res = stm.executeQuery("select * from summery,center WHERE summery.center_id=center.center_id AND center_accountType='General'");
        ResultSet res = stm.executeQuery("select * from summery s,center c WHERE s.center_id=c.center_id AND c.center_accountType='General'");
        List<Object> list = new ArrayList<>();
        while (res.next()) {
            System.out.println("cccccc cccccccc cccccc : " + res.getString("summery_date"));
            list.add(new Summery(res.getInt("summery_id"),
                    res.getString("summery_date"),
                    res.getString("summery_name"),
                    res.getDouble("summery_noCommisionAmount"),
                    res.getDouble("summery_lessCommisionAmount"),
                    res.getDouble("summery_due"),
                    res.getDouble("summery_pay"),
                    res.getString("center_id"),
                    res.getInt("user_id"),
                    res.getInt("centerCash_details_id"),
                    res.getDouble("summery_lcnc"),
                    res.getDouble("summery_papercash"),
                    res.getDouble("Summery_compay"),
                    res.getDouble("Summery_expences"),
                    res.getDouble("Summer_slippaytot"),
                    res.getDouble("summery_loan"),
                    res.getDouble("summery_excess"),
                    res.getString("summery_status")));
        }

        return list;
    }

    @Override
    public Object getPaymentOrderBydate(String fromdate, String todate) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res;
        List<Object> list = new ArrayList<>();
        if (fromdate == null && todate == null) {

            res = stm.executeQuery("select SUM(Summer_slippaytot),SUM(summery_lcnc),SUM(summery_papercash),SUM(Summery_compay),summery_date,summery_id from summery GROUP BY summery_date ORDER BY summery_id");

            double Summer_slippaytot = 0;
            double summery_lcnc = 0;
            double summery_papercash = 0;
            double Summery_compay = 0;
            while (res.next()) {
                Summer_slippaytot += res.getDouble("SUM(Summer_slippaytot)");
                summery_lcnc += res.getDouble("SUM(summery_lcnc)");
                summery_papercash += res.getDouble("SUM(summery_papercash)");
                Summery_compay += res.getDouble("SUM(Summery_compay)");
                System.out.println("total : " + res.getString("summery_date") + " " + res.getInt("summery_id") + "tot : " + res.getDouble("SUM(Summer_slippaytot)") + " lcnc : " + res.getDouble("SUM(summery_lcnc)") + " papercash : " + res.getDouble("SUM(summery_papercash)") + " compay : " + res.getDouble("SUM(Summery_compay)"));
                //System.out.println("total : "+res.getDouble("SUM(Summer_slippaytot)"));
            }
            list.add(Summer_slippaytot);
            list.add(summery_lcnc);
            list.add(summery_papercash);
            list.add(Summery_compay);

        } else {

            res = stm.executeQuery("select SUM(Summer_slippaytot),SUM(summery_lcnc),SUM(summery_papercash),SUM(Summery_compay),summery_date,summery_id from summery WHERE summery_date BETWEEN '" + fromdate + "' AND '" + todate + "' GROUP BY summery_date ORDER BY summery_id");

            double Summer_slippaytot = 0;
            double summery_lcnc = 0;
            double summery_papercash = 0;
            double Summery_compay = 0;
            while (res.next()) {
                Summer_slippaytot += res.getDouble("SUM(Summer_slippaytot)");
                summery_lcnc += res.getDouble("SUM(summery_lcnc)");
                summery_papercash += res.getDouble("SUM(summery_papercash)");
                Summery_compay += res.getDouble("SUM(Summery_compay)");
                // System.out.println("total : " + res.getString("summery_date") + " " + res.getInt("summery_id") + "tot : " + res.getDouble("SUM(Summer_slippaytot)") + " lcnc : " + res.getDouble("SUM(summery_lcnc)") + " papercash : " + res.getDouble("SUM(summery_papercash)") + " compay : " + res.getDouble("SUM(Summery_compay)"));
                //System.out.println("total : "+res.getDouble("SUM(Summer_slippaytot)"));
                System.out.println("total : " + res.getString("summery_date"));
            }
            list.add(Summer_slippaytot);
            list.add(summery_lcnc);
            list.add(summery_papercash);
            list.add(Summery_compay);

        }
        return list;

    }

    @Override
    public double getSumAccountCategoryValues(int id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res;
        double total = 0;
        res = stm.executeQuery("SELECT*FROM summery s,account a INNER JOIN account_category ac ON a.account_category_id=ac.account_category_id AND ac.account_category_id='" + id + "' ");

        while (res.next()) {

            if (res.getString("account_name").equals("Paper Cash")) {
                total += res.getDouble("summery_papercash");
            }
            if (res.getString("account_name").equals("Betting Slip Payment")) {
                total += res.getDouble("Summer_slippaytot");
            }
            if (res.getString("account_name").equals("Commision Given")) {
                total += res.getDouble("summery_lcnc");
            }
            if (res.getString("account_name").equals("Commissions and fees")) {
                total += res.getDouble("Summery_compay");
            }

        }
        return total;
    }

    @Override
    public List<Object> getPaymentOrderBydate() throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        List<Object> list = new ArrayList<>();
        ResultSet res = stm.executeQuery("SELECT EXTRACT(MONTH FROM summery_date) AS reference_month,summery_id, summery_date,summery_name,summery_noCommisionAmount,summery_lessCommisionAmount,summery_due,summery_pay,center_id,user_id,centerCash_details_id,SUM(summery_lcnc),SUM(summery_papercash),SUM(Summery_compay),SUM(Summery_expences), SUM(Summer_slippaytot),SUM(summery_loan),SUM(summery_excess),summery_status FROM summery GROUP BY EXTRACT(MONTH FROM summery_date) ORDER BY summery_date");
        while (res.next()) {
            list.add(new Summery(res.getInt("summery_id"),
                    res.getString("summery_date"),
                    res.getString("summery_name"),
                    res.getDouble("summery_noCommisionAmount"),
                    res.getDouble("summery_lessCommisionAmount"),
                    res.getDouble("summery_due"),
                    res.getDouble("summery_pay"),
                    res.getString("center_id"),
                    res.getInt("user_id"),
                    res.getInt("centerCash_details_id"),
                    res.getDouble("SUM(summery_lcnc)"),
                    res.getDouble("SUM(summery_papercash)"),
                    res.getDouble("SUM(Summery_compay)"),
                    res.getDouble("SUM(Summery_expences)"),
                    res.getDouble("SUM(Summer_slippaytot)"),
                    res.getDouble("SUM(summery_loan)"),
                    res.getDouble("SUM(summery_excess)"),
                    res.getString("summery_status")));
            // }
        }
        return list;
    }

    @Override
    public double nclcBetweenDates(String fromdate, String todate) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        double totlcnc = 0;
        double total = 0;

        ResultSet res = stm.executeQuery("SELECT SUM(summery_lcnc) AS totlcnc FROM summery WHERE summery_date BETWEEN '" + fromdate + "' AND '" + todate + "' ORDER BY summery_id ");//SUM(centerCash_details_cash) AS totcash,centerCash_details_date 
        while (res.next()) {
            totlcnc = res.getDouble("totlcnc");
            total += totlcnc;
        }
        return total;
    }

    @Override
    public double papercashBetweenDates(String fromdate, String todate) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        double totlpc = 0;
        double total = 0;

        ResultSet res = stm.executeQuery("SELECT SUM(summery_papercash) AS totlpc FROM summery WHERE summery_date BETWEEN '" + fromdate + "' AND '" + todate + "' ORDER BY summery_id ");//SUM(centerCash_details_cash) AS totcash,centerCash_details_date 
        while (res.next()) {
            totlpc = res.getDouble("totlpc");
            total += totlpc;
        }
        return total;
    }

    @Override
    public double paymentSlipBetweenDates(String fromdate, String todate) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        double totlslipPay = 0;
        double total = 0;

        ResultSet res = stm.executeQuery("SELECT SUM(Summer_slippaytot) AS totlslipPay FROM summery WHERE summery_date BETWEEN '" + fromdate + "' AND '" + todate + "' ORDER BY summery_id ");//SUM(centerCash_details_cash) AS totcash,centerCash_details_date 
        while (res.next()) {
            totlslipPay = res.getDouble("totlslipPay");
            total += totlslipPay;
        }
        return total;
    }

    @Override
    public List<Object> summeryBetweenDates(String fromdate, String todate, String centername) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        List<Object> list = new ArrayList<>();
        ResultSet res = stm.executeQuery("select * from summery where summery_date BETWEEN '" + fromdate + "' AND '" + todate + "' AND summery_name='" + centername + "'");
        while (res.next()) {
            list.add(new Summery(res.getInt("summery_id"),
                    res.getString("summery_date"),
                    res.getString("summery_name"),
                    res.getDouble("summery_noCommisionAmount"),
                    res.getDouble("summery_lessCommisionAmount"),
                    res.getDouble("summery_due"),
                    res.getDouble("summery_pay"),
                    res.getString("center_id"),
                    res.getInt("user_id"),
                    res.getInt("centerCash_details_id"),
                    res.getDouble("summery_lcnc"),
                    res.getDouble("summery_papercash"),
                    res.getDouble("Summery_compay"),
                    res.getDouble("Summery_expences"),
                    res.getDouble("Summer_slippaytot"),
                    res.getDouble("summery_loan"),
                    res.getDouble("summery_excess"),
                    res.getString("summery_status")));
        }
        return list;
    }

    @Override
    public int UpdateSummeryStatus(String summery_id, String status) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("UPDATE summery set summery_status='" + status + "' WHERE summery_id='" + summery_id + "'");
    }

    @Override
    public Object summeryFromDates(String dates) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        List<Object> list = new ArrayList<>();
        System.out.println("datesssssssssssssssssssssssssss : " + dates);
        ResultSet res = stm.executeQuery("select * from summery where summery_date='" + dates + "'");
        while (res.next()) {
            list.add(new Summery(res.getInt("summery_id"),
                    res.getString("summery_date"),
                    res.getString("summery_name"),
                    res.getDouble("summery_noCommisionAmount"),
                    res.getDouble("summery_lessCommisionAmount"),
                    res.getDouble("summery_due"),
                    res.getDouble("summery_pay"),
                    res.getString("center_id"),
                    res.getInt("user_id"),
                    res.getInt("centerCash_details_id"),
                    res.getDouble("summery_lcnc"),
                    res.getDouble("summery_papercash"),
                    res.getDouble("Summery_compay"),
                    res.getDouble("Summery_expences"),
                    res.getDouble("Summer_slippaytot"),
                    res.getDouble("summery_loan"),
                    res.getDouble("summery_excess"),
                    res.getString("summery_status")));
        }
        return list;
    }

    @Override
    public Summery searchSummerysBydateandCenterNumber(String center_id, String date) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from summery WHERE center_id='" + center_id + "' AND summery_date='" + date + "'");
        if (res.next()) {
            return new Summery(res.getInt("summery_id"),
                    res.getString("summery_date"),
                    res.getString("summery_name"),
                    res.getDouble("summery_noCommisionAmount"),
                    res.getDouble("summery_lessCommisionAmount"),
                    res.getDouble("summery_due"),
                    res.getDouble("summery_pay"),
                    res.getString("center_id"),
                    res.getInt("user_id"),
                    res.getInt("centerCash_details_id"),
                    res.getDouble("summery_lcnc"),
                    res.getDouble("summery_papercash"),
                    res.getDouble("Summery_compay"),
                    res.getDouble("Summery_expences"),
                    res.getDouble("Summer_slippaytot"),
                    res.getDouble("summery_loan"),
                    res.getDouble("summery_excess"),
                    res.getString("summery_status"));
        }
        return null;
    }

    @Override
    public Object summeryBetweenDatesByAgentId(String fromdate, String todate, String agentNumber) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        List<Object> list = new ArrayList<>();
        ResultSet res = stm.executeQuery("select * from summery s,center c where s.summery_date BETWEEN '" + fromdate + "' AND '" + todate + "' AND s.center_id=c.center_id AND c.agent_id='" + agentNumber + "' GROUP BY s.summery_id ");
        while (res.next()) {

            list.add(new Summery(res.getInt("summery_id"),
                    res.getString("summery_date"),
                    res.getString("summery_name"),
                    res.getDouble("summery_noCommisionAmount"),
                    res.getDouble("summery_lessCommisionAmount"),
                    res.getDouble("summery_due"),
                    res.getDouble("summery_pay"),
                    res.getString("center_id"),
                    res.getInt("user_id"),
                    res.getInt("centerCash_details_id"),
                    res.getDouble("summery_lcnc"),
                    res.getDouble("summery_papercash"),
                    res.getDouble("Summery_compay"),
                    res.getDouble("Summery_expences"),
                    res.getDouble("Summer_slippaytot"),
                    res.getDouble("summery_loan"),
                    res.getDouble("summery_excess"),
                    res.getString("summery_status")));
        }
        return list;
    }

    @Override
    public int getSummeryDailyCount(String date) throws Exception {
        int numberRow = 0;

        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("SELECT count(*) FROM summery WHERE summery_date='" + date + "'");
        int lastid = 0;
        while (res.next()) {
            numberRow = res.getInt("count(*)");
        }
        return numberRow;
    }

    @Override
    public String getDailyAgentIncome(String date, Integer agent_id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res;
        String valus;
        res = stm.executeQuery("select SUM(summery_lcnc),SUM(Summery_expences),summery_date,summery_id from summery INNER JOIN center ON center.center_id=summery.center_id WHERE summery.summery_date='" + date + "' AND center.agent_id='" + agent_id + "'  GROUP BY summery.summery_date ORDER BY summery.summery_id");
        double summery_lcnc = 0;
        double Summery_exp = 0;
        while (res.next()) {
            summery_lcnc += res.getDouble("SUM(summery_lcnc)");
            Summery_exp += res.getDouble("SUM(Summery_expences)");
        }

        valus = "" + summery_lcnc + ":" + Summery_exp;
        return valus;
    }

    @Override
    public String getAgentIncomeExp(Integer agent_id)throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res;
        String valus;
        res = stm.executeQuery("select SUM(summery_lcnc),SUM(Summery_expences),summery_date,summery_id from summery INNER JOIN center ON center.center_id=summery.center_id WHERE center.agent_id='" + agent_id + "'  GROUP BY summery.summery_date ORDER BY summery.summery_id");
        double summery_lcnc = 0;
        double Summery_exp = 0;
        while (res.next()) {
            summery_lcnc += res.getDouble("SUM(summery_lcnc)");
            Summery_exp += res.getDouble("SUM(Summery_expences)");
        }

        valus = "" + summery_lcnc + ":" + Summery_exp;
        return valus;
    }

}
