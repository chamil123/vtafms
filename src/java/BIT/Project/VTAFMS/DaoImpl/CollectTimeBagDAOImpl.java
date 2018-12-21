/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DaoImpl;

import BIT.Project.VTAFMS.ConnectionFactory.ConnectionProviderFactory;
import BIT.Project.VTAFMS.DAO.CollectTimeBagDAO;
import BIT.Project.VTAFMS.Model.CollectTimeBag;
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
public class CollectTimeBagDAOImpl implements CollectTimeBagDAO {

    @Override
    public int insert(Object object) throws Exception {
        CollectTimeBag collecttimebag = (CollectTimeBag) object;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();

        return stm.executeUpdate("INSERT into collection_timebag (Collection_timeBag_date,runner_id,user_id,agent_id) values('" + collecttimebag.getCollection_timeBag_date() + "',"
                + "'" + collecttimebag.getRunner_id() + "',"
                + "'" + collecttimebag.getUser_id() + "','" + collecttimebag.getAgent_id() + "')");
    }

    @Override
    public Object search(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(Object model) throws Exception {
        CollectTimeBag collectTimeBag = (CollectTimeBag) model;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("UPDATE collection_timebag set Collection_timeBag_date='" + collectTimeBag.getCollection_timeBag_date()+ "',runner_id='" + collectTimeBag.getRunner_id()+ "',user_id='" + collectTimeBag.getUser_id()+ "',agent_id='" + collectTimeBag.getAgent_id()+ "' WHERE collection_timeBag_id='" + collectTimeBag.getCollection_timeBag_id()+ "'");
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
        ResultSet res = stm.executeQuery("select * from collection_timebag ");
        List<Object> list = new ArrayList<>();
        while (res.next()) {
            list.add(new CollectTimeBag(res.getInt("collection_timeBag_id"),
                    res.getString("Collection_timeBag_date"),
                    res.getInt("runner_id"),
                    res.getInt("user_id"),
                    res.getInt("agent_id")));

        }
        return list;
    }

    @Override
    public CollectTimeBag getAllCollectTimeBagByID(int id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from collection_timebag where collection_timeBag_id='" + id + "'");
        if (res.next()) {
            return new CollectTimeBag(res.getInt("collection_timeBag_id"),
                    res.getString("Collection_timeBag_date"),
                    res.getInt("runner_id"),
                    res.getInt("user_id"),
                    res.getInt("agent_id"));
        }
        return null;
    }

    @Override
    public int getMaxId() throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("SELECT MAX(collection_timeBag_id) AS id FROM collection_timebag");
        int lastid = 0;
        while (res.next()) {
            lastid = res.getInt("id");
        }

        return lastid;
    }

    @Override
    public Object getAllTimebagLineByRunner(String rnum) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        
      //   res = stm.executeQuery("select SUM(summery_lcnc),SUM(Summery_expences),summery_date,summery_id from summery INNER JOIN center ON center.center_id=summery.center_id WHERE center.agent_id='" + agent_id + "'  GROUP BY summery.summery_date ORDER BY summery.summery_id");
        
        
       // ResultSet res = stm.executeQuery("select * from collection_timebag_line INNER JOIN collection_timebag ON  collection_timebag.collection_timeBag_id=collection_timebag_line.collection_timeBag_id AND collection_timebag.runner_id='"+rnum+"'  ");
       ResultSet res = stm.executeQuery("select * from collection_timebag INNER JOIN collection_timebag_line ON  collection_timebag.collection_timeBag_id=collection_timebag_line.collection_timeBag_id AND collection_timebag.runner_id='"+rnum+"'  ");
        List<Object> list = new ArrayList<>();
        while (res.next()) {
            
            list.add(new CollectTimeBagLine(res.getInt("collection_timeBag_line_id"),
                    res.getString("collection_timeBag_line_timeValue"),
                    res.getString("collection_timeBag_line_OpenTime"),
                    res.getString("collection_timeBag_line_closeTime"),
                    res.getInt("collection_timeBag_id"),res.getString("time_bag_Code"),res.getString("collection_timeBag_line_rateAmount")));
            
            System.out.println("asdasdasdd : "+res.getString("collection_timeBag_line_rateAmount")+" id : "+res.getString("collection_timeBag_id"));

        }
        return list;
    }

}
