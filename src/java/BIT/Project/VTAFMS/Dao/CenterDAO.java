/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


package BIT.Project.VTAFMS.DAO;
import BIT.Project.VTAFMS.Model.Center;

/**
 *
 * @author Chamil
 */
public interface CenterDAO extends DAO {

    public Center searchCenterame(String name) throws Exception;

    public Center getAllCenterByID(int id) throws Exception;

    public Center getAllCenterByID2(String id)throws Exception;

    public int activateCenter(String id)throws Exception;

    public int deactivateCenter(String id)throws Exception;

    public double getRowCount()throws Exception;

    public Object limitResult(String page)throws Exception;

    public Center searchCenterByName(String name)throws Exception;

    public Object searchCenterByAgentId(String id)throws Exception;
    
    

}
