/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DaoImpl;

import BIT.Project.VTAFMS.ConnectionFactory.ConnectionProviderFactory;
import BIT.Project.VTAFMS.DAO.GeneralCashDAO;
import BIT.Project.VTAFMS.Model.GeneralCash;
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
public class GeneralCashDAOImpl implements GeneralCashDAO{

    @Override
    public GeneralCash searchGeneralCashById(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public GeneralCash searchGeneralCashByDateandId(String date, String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from generalcash_details where generalCash_details_date='" + date + "' AND agent_id='" + id + "' ");
        if (res.next()) {
            return new GeneralCash(res.getInt("generalCash_details_id"), res.getDouble("generalCash_details_cash"), res.getDouble("generalCash_details_passDue"), res.getString("generalCash_details_date"), res.getInt("agent_id"));

        }

        return null;
    }

    @Override
    public double getAllGeneralCashAccountID(int id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getAllcashandPassDuesBydate() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int insert(Object object) throws Exception {
       GeneralCash centerCash = (GeneralCash) object;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();

        return stm.executeUpdate("INSERT into generalcash_details (generalCash_details_cash,generalCash_details_passDue,generalCash_details_date,agent_id)  values('" + centerCash.getGeneralCash_details_cash()+ "','" + centerCash.getGeneralCash_details_passDue()+ "','" + centerCash.getGeneralCash_details_date()+ "','" + centerCash.getAgent_id()+ "')");
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
        ResultSet res = stm.executeQuery("select * from generalcash_details");
        List<Object> list = new ArrayList<>();
        while (res.next()) {
            list.add(new GeneralCash(res.getInt("generalCash_details_id"),
                    res.getDouble("generalCash_details_cash"),
                    res.getDouble("generalCash_details_passDue"),
                    res.getString("generalCash_details_date"),
                    res.getInt("agent_id")));
        }

        return list;
    }
    
}
