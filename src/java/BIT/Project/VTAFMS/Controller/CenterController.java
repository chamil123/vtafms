/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Controller;

import BIT.Project.VTAFMS.DAO.CenterDAO;
import BIT.Project.VTAFMS.DaoImpl.CenterDAOImpl;
import BIT.Project.VTAFMS.Model.Center;

/**
 *
 * @author Chamil
 */
public class CenterController {

    private static CenterDAO centerDao = new CenterDAOImpl();
    // private static UserDAO UserDao = new UserDAOImpl();

    public static int insertCenter(Center center) throws Exception {

        return centerDao.insert(center);

    }

    public static Center searchCenterById(int id) throws Exception {
        return centerDao.getAllCenterByID(id);
    }

    public static Object getAllCenters() throws Exception {
        return centerDao.viewAll();
    }

    public static int updateUser(Center center) throws Exception {
        return centerDao.update(center);
    }

    public static int DeleteCenterById(String id) throws Exception {
        return centerDao.delete(id);
    }

    public static Center getAllCenterByID2(String id) throws Exception {
        return centerDao.getAllCenterByID2(id);
    }

    public static int deactivateCenter(String id) throws Exception {
        return centerDao.deactivateCenter(id);
    }

    public static int activateCenter(String id) throws Exception {
        return centerDao.activateCenter(id);
    }

    public static double getRowCount() throws Exception {
        return centerDao.getRowCount();
    }

    public static Object limitresult(String page) throws Exception {
        return centerDao.limitResult(page);
    }

    public static Center searchCenterByName(String name) throws Exception {
        return centerDao.searchCenterByName(name);
    }

    public static Object searchCenterByAgentId(String id) throws Exception {
        return centerDao.searchCenterByAgentId(id);
    }

}
