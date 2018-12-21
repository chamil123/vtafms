/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Controller;

import BIT.Project.VTAFMS.DAO.AccountDAO;
import BIT.Project.VTAFMS.DaoImpl.AccountDAOImpl;
import BIT.Project.VTAFMS.Model.Account;

/**
 *
 * @author Chamil
 */
public class AccountController {

    private static AccountDAO accountDao = new AccountDAOImpl();
    // private static UserDAO UserDao = new UserDAOImpl();

    public static int insertAccount(Account account) throws Exception {

        return accountDao.insert(account);

    }

    public static Object getAllAccounts() throws Exception {
        return accountDao.viewAll();
    }

    public static int updateAccount(Account account) throws Exception {
        return accountDao.update(account);
    }

    public static int DeleteAccountById(String id) throws Exception {
        return accountDao.delete(id);
    }

    public static Account getAllAccountByName(String id) throws Exception {
        return accountDao.getAllAccountByName(id);
    }
    public static Account getAccountById(String id) throws Exception {
        return accountDao.getAccountById(id);
    }
     public static Object getAllExpensesAccount() throws Exception {
        return accountDao.getAllExpensesAccount();
    }

}
