/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DaoImpl;

import BIT.Project.VTAFMS.ConnectionFactory.ConnectionProviderFactory;
import BIT.Project.VTAFMS.DAO.AgentDAO;
import BIT.Project.VTAFMS.Model.Agent;
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
public class AgentDAOImpl implements AgentDAO {

    @Override
    public int insert(Object object) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
        ResultSet res = stm.executeQuery("select * from agent");
        List<Object> list = new ArrayList<>();
        while (res.next()) {
            list.add(new Agent(res.getInt("agent_id"), res.getString("agent_name"), res.getInt("agent_commision"), res.getInt("agent_noCommision"), res.getInt("agent_lessComission"), res.getInt("agent_availableCenters"), res.getString("agent_location"), res.getString("agent_mobileNumber"), res.getString("agent_officeNumber"), res.getString("agent_faxNumber"), res.getString("agent_email"),res.getDouble("agent_paperCash")));
        }
      
        return list;
    }

    @Override
    public Agent getAllAgentsByID(int id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from agent where agent_id='" + id + "'");
        if (res.next()) {
            return new Agent(res.getInt("agent_id"), res.getString("agent_name"), res.getInt("agent_commision"), res.getInt("agent_noCommision"), res.getInt("agent_lessComission"), res.getInt("agent_availableCenters"), res.getString("agent_location"), res.getString("agent_mobileNumber"), res.getString("agent_officeNumber"), res.getString("agent_faxNumber"), res.getString("agent_email"),res.getDouble("agent_paperCash"));

        }
      
        return null;
    }

}
