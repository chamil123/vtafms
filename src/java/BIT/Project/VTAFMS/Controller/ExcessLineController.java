/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Controller;

import BIT.Project.VTAFMS.DAO.ExcessLineDAO;
import BIT.Project.VTAFMS.DaoImpl.ExcessLineDAOImpl;
import BIT.Project.VTAFMS.Model.ExcessLine;

/**
 *
 * @author Chamil
 */
public class ExcessLineController {

    private static ExcessLineDAO excesslineDao = new ExcessLineDAOImpl();
    // private static UserDAO UserDao = new UserDAOImpl();

    public static int insertExcessLine(ExcessLine excessline) throws Exception {

        return excesslineDao.insert(excessline);

    }

    public static ExcessLine searchExcessLineById(String id) throws Exception {
        return excesslineDao.getAllExcessLineByID(id);
    }

    public static Object getAllExcessLine() throws Exception {
        return excesslineDao.viewAll();
    }

    public static int updateExcess(ExcessLine excessline) throws Exception {
        return excesslineDao.update(excessline);
    }

    public static int DeleteExcessLineById(String id) throws Exception {
        return excesslineDao.delete(id);
    }

    public static double getduepaymentByID(int id) throws Exception {
        return excesslineDao.getduepaymentByID(id);
    }

    public static double gettotalpaymentByID(int id) throws Exception {
        return excesslineDao.gettotalpaymentByID(id);
    }

    public static int getcountByID(int id) throws Exception {
        return excesslineDao.getcountByID(id);
    }

    public static Object searchAllExcessLineById(String id) throws Exception {
        return excesslineDao.searchAllExcessLineById(id);
    }
    public static Object getAllExcessLineByExcessID(String id) throws Exception {
        return excesslineDao.getAllExcessLineByExcessID(id);
    }

}
