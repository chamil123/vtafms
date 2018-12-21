/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DAO;

import BIT.Project.VTAFMS.Model.Agent;

/**
 *
 * @author Chamil
 */
public interface AgentDAO extends DAO{

   // public Agent getAllAgentByID(int id) throws Exception;

    public Agent getAllAgentsByID(int id)throws Exception;
  
    
}
