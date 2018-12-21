/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DAO;

import BIT.Project.VTAFMS.Model.CenterCash;
import java.util.List;

/**
 *
 * @author Chamil
 */
public interface CenterCashDAO extends DAO {

    public CenterCash getAllCenterByID(String id) throws Exception;

    public double getAllCenterByAccountID(int id) throws Exception;

  //  public List<Object> ggetAllcashBydate() throws Exception;

    public List<Object> getAllcashandPassDuesBydate() throws Exception;

    public CenterCash getAllCenterByDateandID(String date, String id) throws Exception;

    public int getRowCount()throws Exception;

    public Object limitResult(String page)throws Exception;

    public double monthlyCash(String date)throws Exception;

    public double dailyCash(String date)throws Exception;

    public double monthlyFC(String date)throws Exception;

    public double dailyFC(String date)throws Exception;

    public double totpastDue()throws Exception;

    public CenterCash searchCenterCashByCashId(String id) throws Exception;

    public double getMonthlyCashTot(String month) throws Exception;

    public double cashBetweenDates(String fromdate, String todate)throws Exception;

    public double dueBetweenDates(String fromdate, String todate)throws Exception;

    
}
