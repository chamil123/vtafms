/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DAO;

import BIT.Project.VTAFMS.Model.Account;
import BIT.Project.VTAFMS.Model.Expenses;
import java.util.Vector;

/**
 *
 * @author Chamil
 */
public interface ExpensesDAO extends DAO {

    public Expenses getAllExpensesByID(int id) throws Exception;

    public double getAllexpensesAmount() throws Exception;

    public double getAllexpensesAmountbydate(String date) throws Exception;

    public double getAllexpensesAmountbyaccountID(String id) throws Exception;

}
