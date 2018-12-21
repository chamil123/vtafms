/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DaoImpl;

import BIT.Project.VTAFMS.ConnectionFactory.ConnectionProviderFactory;
import BIT.Project.VTAFMS.DAO.CollectTimeBagLineDAO;
import BIT.Project.VTAFMS.Model.CollectTimeBagLine;
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
public class CollectTimeBagLineDAOImpl implements CollectTimeBagLineDAO {

    @Override
    public int insert(Object object) throws Exception {
        CollectTimeBagLine collecttimebagline = (CollectTimeBagLine) object;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();

        return stm.executeUpdate("INSERT into collection_timebag_line (collection_timeBag_line_timeValue,collection_timeBag_line_OpenTime,collection_timeBag_line_closeTime,collection_timeBag_id,time_bag_Code,collection_timeBag_line_rateAmount) values('" + collecttimebagline.getCollection_timeBag_line_timeValue() + "',"
                + "'" + collecttimebagline.getCollection_timeBag_line_OpenTime() + "',"
                + "'" + collecttimebagline.getCollection_timeBag_line_closeTime() + "',"
                + "'" + collecttimebagline.getCollection_timeBag_id() + "',"
                + "'" + collecttimebagline.getTime_bag_Code() + "','"+collecttimebagline.getCollection_timeBag_line_rateAmount()+"')");
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
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("DELETE FROM collection_timebag_line WHERE collection_timeBag_id='" + id + "'");
    }

    @Override
    public List<Object> viewAll() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int getcountByID(int id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select collection_timeBag_id from collection_timebag_line WHERE  collection_timeBag_id='" + id + "'");
        int count = 0;
        while (res.next()) {

            // total += res.getDouble("excess_line_totalPayment");
            count++;
        }
        return count;
    }

    @Override
    public Object getAllCollectTimeBagLinesById(int id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        List<Object> list = new ArrayList<>();
        ResultSet res = stm.executeQuery("select * from collection_timebag_line WHERE collection_timeBag_id='" + id + "'");
        while (res.next()) {
            list.add(new CollectTimeBagLine(res.getInt("collection_timeBag_line_id"),
                    res.getString("collection_timeBag_line_timeValue"),
                    res.getString("collection_timeBag_line_OpenTime"),
                    res.getString("collection_timeBag_line_closeTime"),
                    res.getInt("collection_timeBag_id"),res.getString("time_bag_Code"),res.getString("collection_timeBag_line_rateAmount")));
        }

        return list;
    }

    @Override
    public Object getAllCollectTimeBagLinesBytimebagId(String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from collection_timebag_line WHERE collection_timeBag_id='" + id + "'");
        List<Object> list = new ArrayList<>();
       
        while (res.next()) {
            list.add(new CollectTimeBagLine(res.getInt("collection_timeBag_line_id"),
                    res.getString("collection_timeBag_line_timeValue"),
                    res.getString("collection_timeBag_line_OpenTime"),
                    res.getString("collection_timeBag_line_closeTime"),
                    res.getInt("collection_timeBag_id"),res.getString("time_bag_Code"),res.getString("collection_timeBag_line_rateAmount")));
        }

        return list;
    }

}
