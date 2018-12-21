/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DaoImpl;

import BIT.Project.VTAFMS.ConnectionFactory.ConnectionProviderFactory;
import BIT.Project.VTAFMS.DAO.CenterDAO;
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
public class CenterDAOImpl implements CenterDAO {

    @Override
    public Center searchCenterame(String name) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Center getAllCenterByID(int id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from center where center_number='" + id + "'");
        if (res.next()) {
            return new Center(res.getString("center_id"), res.getInt("center_number"),
                    res.getString("center_name"), res.getInt("center_commision"),
                    res.getInt("center_noCommision"), res.getInt("center_lessCommision"),
                    res.getInt("center_paperCash"), res.getString("center_moboleNumber"),
                    res.getString("center_officeNumber"), res.getString("center_accountType"),
                    res.getString("center_status"), res.getString("center_address"),
                    res.getInt("agent_id"), res.getDouble("center_expenses"));
        }
        return null;
    }

    @Override
    public Center getAllCenterByID2(String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from center where center_id='" + id + "'");
        if (res.next()) {
            return new Center(res.getString("center_id"), res.getInt("center_number"),
                    res.getString("center_name"), res.getInt("center_commision"),
                    res.getInt("center_noCommision"), res.getInt("center_lessCommision"),
                    res.getInt("center_paperCash"), res.getString("center_moboleNumber"),
                    res.getString("center_officeNumber"), res.getString("center_accountType"),
                    res.getString("center_status"), res.getString("center_address"),
                    res.getInt("agent_id"), res.getDouble("center_expenses"));
        }
        return null;
    }

    @Override
    public int insert(Object object) throws Exception {
        Center center = (Center) object;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("INSERT into center (center_id,center_number,center_name,center_commision,center_noCommision,center_lessCommision,center_paperCash,center_moboleNumber,center_officeNumber,center_accountType,center_status,center_address,agent_id,center_expenses)  values('" + center.getCenter_id() + "',"
                + "'" + center.getCenter_number() + "','" + center.getCenter_Name() + "',"
                + "'" + center.getCenter_com() + "','" + center.getCenter_nc() + "',"
                + "'" + center.getCenter_lc() + "','" + center.getCenter_papercash() + "',"
                + "'" + center.getCenter_mobile() + "','" + center.getCenter_officenumber() + "',"
                + "'" + center.getCenter_accountType() + "','" + center.getCenter_status() + "',"
                + "'" + center.getCenter_address() + "','" + center.getAgent_id() + "','" + center.getCenter_expenses() + "')");
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
        List<Object> list = new ArrayList<>();
        String status = "Activate";
        ResultSet res = stm.executeQuery("select * from center WHERE center_status='" + status + "'");
        while (res.next()) {
            list.add(new Center(res.getString("center_id"),
                    res.getInt("center_number"),
                    res.getString("center_name"),
                    res.getInt("center_commision"),
                    res.getInt("center_noCommision"),
                    res.getInt("center_lessCommision"),
                    res.getInt("center_paperCash"),
                    res.getString("center_moboleNumber"),
                    res.getString("center_officeNumber"),
                    res.getString("center_accountType"),
                    res.getString("center_status"),
                    res.getString("center_address"),
                    res.getInt("agent_id"),
                    res.getDouble("center_expenses")));
        }

        return list;
    }

    @Override
    public int activateCenter(String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        System.out.println("deactivate : " + id);
        return stm.executeUpdate("UPDATE center set center_status='Activate' WHERE center_number='" + id + "'");

    }

    @Override
    public int deactivateCenter(String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        System.out.println("ctivate : " + id);
        return stm.executeUpdate("UPDATE center set center_status='Deactivate' WHERE center_number='" + id + "'");
    }

    @Override
    public double getRowCount() throws Exception {
        int numberRow = 0;

        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("SELECT count(*) FROM center");
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
        ResultSet res = stm.executeQuery("select * from center ORDER BY center_number ASC limit " + page + ",10");
        List<Object> list = new ArrayList<>();
        while (res.next()) {

            list.add(new Center(res.getString("center_id"),
                    res.getInt("center_number"),
                    res.getString("center_name"),
                    res.getInt("center_commision"),
                    res.getInt("center_noCommision"),
                    res.getInt("center_lessCommision"),
                    res.getInt("center_paperCash"),
                    res.getString("center_moboleNumber"),
                    res.getString("center_officeNumber"),
                    res.getString("center_accountType"),
                    res.getString("center_status"),
                    res.getString("center_address"),
                    res.getInt("agent_id"),
                    res.getDouble("center_expenses")));

        }

        return list;
    }

    @Override
    public Center searchCenterByName(String name) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from center where center_name='" + name + "'");
        if (res.next()) {
            return new Center(res.getString("center_id"), res.getInt("center_number"),
                    res.getString("center_name"), res.getInt("center_commision"),
                    res.getInt("center_noCommision"), res.getInt("center_lessCommision"),
                    res.getInt("center_paperCash"), res.getString("center_moboleNumber"),
                    res.getString("center_officeNumber"), res.getString("center_accountType"),
                    res.getString("center_status"), res.getString("center_address"),
                    res.getInt("agent_id"), res.getDouble("center_expenses"));
        }
        return null;
    }

    @Override
    public Object searchCenterByAgentId(String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        
       String type="General";
        ResultSet res = stm.executeQuery("select * from center WHERE agent_id='"+id+"' AND center_accountType='"+type+"'");
        List<Object> list = new ArrayList<>();
        while (res.next()) {
             System.out.println("ssssssssssssssssss ddddddddd : "+res.getInt("center_number"));
            list.add(new Center(res.getString("center_id"),
                    res.getInt("center_number"),
                    res.getString("center_name"),
                    res.getInt("center_commision"),
                    res.getInt("center_noCommision"),
                    res.getInt("center_lessCommision"),
                    res.getInt("center_paperCash"),
                    res.getString("center_moboleNumber"),
                    res.getString("center_officeNumber"),
                    res.getString("center_accountType"),
                    res.getString("center_status"),
                    res.getString("center_address"),
                    res.getInt("agent_id"),
                    res.getDouble("center_expenses")));
        }
        return list;
    }

}
