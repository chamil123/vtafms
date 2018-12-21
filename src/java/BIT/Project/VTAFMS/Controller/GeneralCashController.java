/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Controller;

import BIT.Project.VTAFMS.DAO.GeneralCashDAO;
import BIT.Project.VTAFMS.DaoImpl.GeneralCashDAOImpl;
import BIT.Project.VTAFMS.Model.GeneralCash;

/**
 *
 * @author Chamil
 */
public class GeneralCashController {
        private static GeneralCashDAO generalCashDao = new GeneralCashDAOImpl();
    // private static UserDAO UserDao = new UserDAOImpl();

    public static int insertCenterCash(GeneralCash generalCash) throws Exception {

        return generalCashDao.insert(generalCash);

    }

    public static GeneralCash searchGeneralCashById(String id) throws Exception {
        return generalCashDao.searchGeneralCashById(id);
    }
    public static GeneralCash searchGeneralCashByDateandId(String date,String id) throws Exception {
        return generalCashDao.searchGeneralCashByDateandId(date,id);
    }
   
    public static Object getAllGeneralCash() throws Exception {
        return generalCashDao.viewAll();
    }

    public static int updateGeneralCash(GeneralCash generalCash) throws Exception {
        return generalCashDao.update(generalCash);
    }

    public static int DeleteGeneralCashById(String id) throws Exception {
        return generalCashDao.delete(id);
    }
    public static double getAllGeneralCashAccountID(int id) throws Exception {
        return generalCashDao.getAllGeneralCashAccountID(id);
    }
    public static Object getAllcashandPassDuesBydate() throws Exception {
        return generalCashDao.getAllcashandPassDuesBydate();
    }
}
