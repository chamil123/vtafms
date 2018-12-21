/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DAO;

import BIT.Project.VTAFMS.Model.Summery;
import java.util.List;

/**
 *
 * @author Chamil
 */
public interface SummeryDAO extends DAO {

    public Summery getAllSummerysByID(int id) throws Exception;

    public int getMaxId() throws Exception;

    public int getRowCount() throws Exception;

    public List<Object> limitResult(String page) throws Exception;

    public Summery searchAvailableSummery(String date, String cname) throws Exception;

    public List<Object> getAllSummerysTypeGen() throws Exception;

    public Object getPaymentOrderBydate(String fromdate, String todate) throws Exception;

    public double getSumAccountCategoryValues(int id) throws Exception;

    public Object getPaymentOrderBydate() throws Exception;

    public double nclcBetweenDates(String fromdate, String todate) throws Exception;

    public double papercashBetweenDates(String fromdate, String todate) throws Exception;

    public double paymentSlipBetweenDates(String fromdate, String todate) throws Exception;

    public Object summeryBetweenDates(String fromdate, String todate, String centername) throws Exception;

    public int UpdateSummeryStatus(String summery_id, String status) throws Exception;

    public Object summeryFromDates(String dates) throws Exception;

    public Summery searchSummerysBydateandCenterNumber(String center_id, String date)throws Exception;

    public Object summeryBetweenDatesByAgentId(String fromdate, String todate,String agentname)throws Exception;

    public int getSummeryDailyCount(String date)throws Exception;

    public Object getDailyAgentIncome(String date, Integer agent_id)throws Exception;

    public Object getAgentIncomeExp(Integer agent_id)throws Exception;

}
