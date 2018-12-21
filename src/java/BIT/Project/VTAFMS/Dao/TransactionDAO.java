/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DAO;

import BIT.Project.VTAFMS.Model.Transaction;
import java.util.List;

/**
 *
 * @author Chamil
 */
public interface TransactionDAO extends DAO {

    public int getRowCount() throws Exception;

    public int getRowCountSearch(String name) throws Exception;

    public List<Object> limitResult(String page) throws Exception;

    public Object searchAndlimitResult(String name, String page) throws Exception;

    public Transaction getTotalTransactionAmountByAccount(int id, String fromdate, String todate) throws Exception;

    public double getSumAccountCategoryValues(int id) throws Exception;

    public Transaction getAllRunnersByID(String id)throws Exception;

    public double travelExpensesBetweenDates(String fromdate, String todate)throws Exception;

    public double shopRentalExpensesBetweenDates(String fromdate, String todate)throws Exception;

    public double slabourExpensesBetweenDates(String fromdate, String todate)throws Exception;

    public double repairExpensesBetweenDates(String fromdate, String todate)throws Exception;

    public double payrollExpensesBetweenDates(String fromdate, String todate)throws Exception;

    public double generalExpensesBetweenDates(String fromdate, String todate)throws Exception;

    public double mealsExpensesBetweenDates(String fromdate, String todate)throws Exception;

    public double commsionExpensesBetweenDates(String fromdate, String todate)throws Exception;
}
