/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Controller;

import BIT.Project.VTAFMS.DAO.SummeryLineDAO;
import BIT.Project.VTAFMS.DaoImpl.SummeryLineDAOImpl;
import BIT.Project.VTAFMS.Model.SummeryLine;

/**
 *
 * @author Chamil
 */
public class SummeryLineController {

    private static SummeryLineDAO summerylineDao = new SummeryLineDAOImpl();
    // private static UserDAO UserDao = new UserDAOImpl();

    public static int insertSummeryLine(SummeryLine summeryline) throws Exception {

        return summerylineDao.insert(summeryline);

    }

    public static SummeryLine searchSummeryLineById(int id) throws Exception {
        return summerylineDao.getAllSummeryLineByID(id);
    }

    public static Object getAllSummeryLineBysummeryID(int id) throws Exception {
        return summerylineDao.getAllSummeryLineBysummeryID(id);
    }

    public static Object getAllSummeryLines() throws Exception {
        return summerylineDao.viewAll();
    }

    public static int updateSummeryLine(SummeryLine summeryline) throws Exception {
        return summerylineDao.update(summeryline);
    }

    public static int DeleteSummeryLineById(String id) throws Exception {
        return summerylineDao.delete(id);
    }

    public static int DeleteSummeryLineByDateAndSummeryId(String date, String summery_id) throws Exception {
      return summerylineDao.DeleteSummeryLineByDateAndSummeryId(date,summery_id);
    }
}
