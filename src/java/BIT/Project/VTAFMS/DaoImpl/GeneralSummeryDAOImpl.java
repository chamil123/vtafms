/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DaoImpl;

import BIT.Project.VTAFMS.ConnectionFactory.ConnectionProviderFactory;
import BIT.Project.VTAFMS.DAO.GeneralSummeryDAO;
import BIT.Project.VTAFMS.Model.GeneralSummery;
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
public class GeneralSummeryDAOImpl implements GeneralSummeryDAO {

    @Override
    public int insert(Object object) throws Exception {
        GeneralSummery generalsummery = (GeneralSummery) object;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();

        return stm.executeUpdate("INSERT into accountgeneral (accountGeneral_date,accountGeneral_name, accountGeneral_noCommisionAmount ,accountGeneral_lessCommisionAmount ,accountGeneral_due ,accountGeneral_pay ,accountGeneral_lcnc ,accountGeneral_papercash ,accountGeneral_compay ,accountGeneral_expenses ,AccountGeneral_totalsumpay ,accountGeneral_loan ,accountGeneral_excess ,accountGeneral_status ,agent_id ,user_id ,generalCash_details_id )  values('" + generalsummery.getAccountGeneral_date() + "',"
                + "'" + generalsummery.getAccountGeneral_name() + "',"
                + "'" + generalsummery.getAccountGeneral_noCommisionAmount() + "',"
                + "'" + generalsummery.getAccountGeneral_lessCommisionAmount() + "',"
                + "'" + generalsummery.getAccountGeneral_due() + "',"
                + "'" + generalsummery.getAccountGeneral_pay() + "',"
                + "'" + generalsummery.getAccountGeneral_lcnc() + "',"
                + "'" + generalsummery.getAccountGeneral_papercash() + "',"
                + "'" + generalsummery.getAccountGeneral_compay() + "',"
                + "'" + generalsummery.getAccountGeneral_expenses() + "',"
                + "'" + generalsummery.getAccountGeneral_totalsumpay() + "',"
                + "'" + generalsummery.getAccountGeneral_loan() + "',"
                + "'" + generalsummery.getAccountGeneral_excess() + "',"
                + "'" + generalsummery.getAccountGeneral_status() + "',"
                + "'" + generalsummery.getAgent_id() + "',"
                + "'" + generalsummery.getUser_id() + "',"
                + "'" + generalsummery.getGeneralCash_details_id() + "')");

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
    public GeneralSummery getAllGeneralSummerysByID(int id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int getMaxId() throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("SELECT MAX(accountGeneral_id) AS id FROM accountgeneral");
        int lastid = 0;
        while (res.next()) {
            lastid = res.getInt("id");
        }

        return lastid;
    }

    @Override
    public Object generalsummeryBetweenDates(String fromdate, String todate, String centername) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        List<Object> list = new ArrayList<>();
       
        ResultSet res = stm.executeQuery("select * from accountgeneral where accountGeneral_date BETWEEN '" + fromdate + "' AND '" + todate + "' AND accountGeneral_name='" + centername + "'");
        while (res.next()) {
            
            
            list.add(new GeneralSummery(res.getInt("accountGeneral_id"),
                    res.getString("accountGeneral_date"),
                    res.getString("accountGeneral_name"),
                    res.getDouble("accountGeneral_noCommisionAmount"),
                    res.getDouble("accountGeneral_lessCommisionAmount"),
                    res.getDouble("accountGeneral_due"),
                    res.getDouble("accountGeneral_pay"),
                    res.getDouble("accountGeneral_lcnc"),
                    res.getDouble("accountGeneral_papercash"),
                    res.getDouble("accountGeneral_compay"),
                    res.getDouble("accountGeneral_expenses"),
                    res.getDouble("AccountGeneral_totalsumpay"),
                    res.getDouble("accountGeneral_loan"),
                    res.getDouble("accountGeneral_excess"),
                    res.getString("accountGeneral_status"),
                    res.getInt("agent_id"),
                    res.getInt("user_id"),
                    res.getInt("generalCash_details_id")));
        }
        return list;
    }

}
