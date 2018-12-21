/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DAO;

import BIT.Project.VTAFMS.Model.Account;
import java.util.List;

/**
 *
 * @author Chamil
 */
public interface AccountDAO extends DAO {

    public Account getAllAccountByName(String name) throws Exception;

    public Account getAccountById(String id) throws Exception;

    public List<Object> getAllExpensesAccount() throws Exception;
}
