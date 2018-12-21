/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Controller;

import BIT.Project.VTAFMS.DAO.SummeryDAO;
import BIT.Project.VTAFMS.DaoImpl.SummeryDAOImpl;
import BIT.Project.VTAFMS.Model.Summery;

/**
 *
 * @author Chamil
 */
public class SummeryController {

    private static SummeryDAO summeryDao = new SummeryDAOImpl();
    //private static SummeryDAO summeryDao = new SummeryDAOImpl();
    // private static UserDAO UserDao = new UserDAOImpl();

    public static int insertSummery(Summery summery) throws Exception {

        return summeryDao.insert(summery);

    }

    public static Summery searchSummeryById(int id) throws Exception {
        return summeryDao.getAllSummerysByID(id);
    }

    public static Object getAllSummerys() throws Exception {
        return summeryDao.viewAll();
    }

    public static int updateSummery(Summery summery) throws Exception {
        return summeryDao.update(summery);
    }

    public static int DeleteSummeryById(String id) throws Exception {
        return summeryDao.delete(id);
    }

    public static int getMaxId() throws Exception {
        return summeryDao.getMaxId();
    }

    public static Summery searchAvailableSummery(String date, String cname) throws Exception {
        return summeryDao.searchAvailableSummery(date, cname);
    }

    public static int getRowCount() throws Exception {
        return summeryDao.getRowCount();
    }

    public static Object limitResult(String page) throws Exception {
        return summeryDao.limitResult(page);
    }

    public static Object getAllSummerysTypeGen() throws Exception {
        return summeryDao.getAllSummerysTypeGen();
    }

    public static Object getPaymentOrderBydate(String fromdate, String todate) throws Exception {
        return summeryDao.getPaymentOrderBydate(fromdate, todate);
    }

    public static double getSumAccountCategoryValues(int id) throws Exception {
        return summeryDao.getSumAccountCategoryValues(id);
    }

    public static Object searchPaymentsOrderByMonth() throws Exception {
        return summeryDao.getPaymentOrderBydate();
    }

    public static double nclcBetweenDates(String fromdate, String todate) throws Exception {
        return summeryDao.nclcBetweenDates(fromdate, todate);
    }

    public static double papercashBetweenDates(String fromdate, String todate) throws Exception {
        return summeryDao.papercashBetweenDates(fromdate, todate);
    }

    public static double paymentSlipBetweenDates(String fromdate, String todate) throws Exception {
        return summeryDao.paymentSlipBetweenDates(fromdate, todate);
    }

    public static Object summeryBetweenDates(String fromdate, String todate, String centername) throws Exception {
        return summeryDao.summeryBetweenDates(fromdate, todate, centername);
    }

    public static int UpdateSummeryStatus(String summery_id, String status) throws Exception {
        return summeryDao.UpdateSummeryStatus(summery_id, status);
    }

    public static Object summeryFromDates(String dates) throws Exception {
        return summeryDao.summeryFromDates(dates);
    }

    public static Summery searchSummerysBydateandCenterNumber(String center_id, String date) throws Exception {
        return summeryDao.searchSummerysBydateandCenterNumber(center_id, date);
    }

    public static Object summeryBetweenDatesByAgentId(String fromdate, String todate,String agentname) throws Exception {
        return summeryDao.summeryBetweenDatesByAgentId(fromdate, todate,agentname);
    }

    public static int getSummeryDailyCount(String date)throws Exception{
        return summeryDao.getSummeryDailyCount(date);
    }

    public static Object getDailyAgentIncome(String date, Integer agent_id)throws Exception {
        return summeryDao.getDailyAgentIncome(date,agent_id);
    }

    public static Object getAgentIncomeExp(Integer agent_id)throws Exception{
        return summeryDao.getAgentIncomeExp(agent_id);
    }

}
