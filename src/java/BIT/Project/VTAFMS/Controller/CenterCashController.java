/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Controller;

import BIT.Project.VTAFMS.DAO.CenterCashDAO;
import BIT.Project.VTAFMS.DaoImpl.CenterCashDAOImpl;
import BIT.Project.VTAFMS.Model.CenterCash;

/**
 *
 * @author Chamil
 */
public class CenterCashController {

    private static CenterCashDAO centerCashDao = new CenterCashDAOImpl();
    // private static UserDAO UserDao = new UserDAOImpl();

    public static int insertCenterCash(CenterCash centerCash) throws Exception {

        return centerCashDao.insert(centerCash);

    }

    public static CenterCash searchCenterCashById(String id) throws Exception {
        return centerCashDao.getAllCenterByID(id);
    }

    public static CenterCash searchCenterCashByCashId(String id) throws Exception {
        return centerCashDao.searchCenterCashByCashId(id);
    }

    public static CenterCash searchCenterCashByDateandId(String date, String id) throws Exception {
        return centerCashDao.getAllCenterByDateandID(date, id);
    }

    public static Object getAllCenterCash() throws Exception {
        return centerCashDao.viewAll();
    }

    public static int updateCenterCash(CenterCash centerCash) throws Exception {
        return centerCashDao.update(centerCash);
    }

    public static int DeleteCenterCashById(String id) throws Exception {
        return centerCashDao.delete(id);
    }

    public static double getAllCenterByAccountID(int id) throws Exception {
        return centerCashDao.getAllCenterByAccountID(id);
    }

    public static Object getAllcashandPassDuesBydate() throws Exception {
        return centerCashDao.getAllcashandPassDuesBydate();
    }

    public static int getRowCount() throws Exception {
        return centerCashDao.getRowCount();
    }

    public static Object limitResult(String page) throws Exception {
        return centerCashDao.limitResult(page);
    }

    public static double monthlyCash(String date) throws Exception {
        return centerCashDao.monthlyCash(date);
    }

    public static double dailyCash(String date) throws Exception {
        return centerCashDao.dailyCash(date);
    }

    public static double monthlyFC(String date) throws Exception {
        return centerCashDao.monthlyFC(date);
    }

    public static double dailyFC(String date) throws Exception {
        return centerCashDao.dailyFC(date);
    }

    public static double totpastDue() throws Exception {
        return centerCashDao.totpastDue();
    }

    public static double getMonthlyCashTot(String month) throws Exception {
        return centerCashDao.getMonthlyCashTot(month);
    }

    public static double cashBetweenDates(String fromdate, String todate) throws Exception {
        return centerCashDao.cashBetweenDates(fromdate, todate);
    }

    public static double dueBetweenDates(String fromdate, String todate) throws Exception{
       return centerCashDao.dueBetweenDates(fromdate, todate);
    }

    

}
