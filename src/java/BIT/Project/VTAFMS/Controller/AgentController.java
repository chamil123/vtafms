/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Controller;

import BIT.Project.VTAFMS.DAO.AgentDAO;
import BIT.Project.VTAFMS.DaoImpl.AgentDAOImpl;
import BIT.Project.VTAFMS.Model.Agent;

/**
 *
 * @author Chamil
 */
public class AgentController {

    private static AgentDAO agentDao = new AgentDAOImpl();

    // private static UserDAO UserDao = new UserDAOImpl();
    public static int insertUser(Agent agent) throws Exception {
        return agentDao.insert(agent);
    }

    public static Agent searchAgentById(int id) throws Exception {
        return agentDao.getAllAgentsByID(id);
    }

    public static Object getAllAgents() throws Exception {
        return agentDao.viewAll();
    }

    public static int updateAgent(Agent agent) throws Exception {
        return agentDao.update(agent);
    }

    public static int DeleteAgentById(String id) throws Exception {
        return agentDao.delete(id);
    }

}
