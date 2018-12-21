/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DaoImpl;

import BIT.Project.VTAFMS.ConnectionFactory.ConnectionProviderFactory;
import BIT.Project.VTAFMS.DAO.ExcessDAO;
import BIT.Project.VTAFMS.Model.Excess;
import BIT.Project.VTAFMS.Model.ExcessLine;
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
public class ExcessDAOImpl implements ExcessDAO {

    @Override
    public int insert(Object object) throws Exception {
        Excess excess = (Excess) object;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("INSERT into excess (center_id,excess_date,excess_total) values('" + excess.getCenter_id() + "','" + excess.getExcess_date() + "','" + excess.getExcess_total() + "')");

    }

    @Override
    public Object search(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(Object model) throws Exception {
        Excess excess = (Excess) model;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        System.out.print("total is : " + excess.getExcess_total() + " excess id is :" + excess.getExcess_id());
        return stm.executeUpdate("UPDATE excess set center_id='" + excess.getCenter_id() + "',excess_date='" + excess.getExcess_date() + "',excess_total='" + excess.getExcess_total() + "' WHERE excess_id='" + excess.getExcess_id() + "'");
    }

    @Override
    public int delete(String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("DELETE FROM excess WHERE excess_id='" + id + "'");
    }

    @Override
    public List<Object> viewAll() throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from excess ");
        List<Object> list = new ArrayList<>();
        while (res.next()) {
            list.add(new Excess(res.getInt("excess_id"),
                    res.getString("center_id"),
                    res.getString("excess_date"), res.getDouble("excess_total")));

        }
        return list;
    }

    @Override
    public Excess getAllExcessByID(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int getMaxId() throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("SELECT MAX(excess_id) AS id FROM excess");
        int lastid = 0;
        while (res.next()) {
            lastid = res.getInt("id");
        }

        return lastid;
    }

    @Override
    public double getexcessTotalByidandDate(String id, String date) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("SELECT excess_total from excess WHERE center_id='" + id + "' AND excess_date='" + date + "'");
        double tot = 0;
        while (res.next()) {
            tot = res.getDouble("excess_total");
        }

        return tot;
    }

    @Override
    public double getexcessTotalByid(String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("SELECT excess_total from excess ");
        double tot = 0;
        while (res.next()) {
            tot = res.getDouble("excess_total");
        }

        return tot;
    }

    @Override
    public Excess getExcessById(String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from excess where excess_id='" + id + "'");
        if (res.next()) {
            return new Excess(res.getInt("excess_id"),
                    res.getString("center_id"),
                    res.getString("excess_date"), res.getDouble("excess_total"));
        }
        return null;
    }

}
