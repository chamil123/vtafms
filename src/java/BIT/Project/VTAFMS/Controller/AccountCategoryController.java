/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Controller;

import BIT.Project.VTAFMS.DAO.AccountCategoryDAO;
import BIT.Project.VTAFMS.DaoImpl.AccountCategoryDAOImpl;
import BIT.Project.VTAFMS.Model.AccountCategory;

/**
 *
 * @author Chamil
 */
public class AccountCategoryController {
     private static AccountCategoryDAO accountcategoryDao = new AccountCategoryDAOImpl();
    // private static UserDAO UserDao = new UserDAOImpl();

    public static int insertAccountCategory(AccountCategory accountcat) throws Exception {

        return accountcategoryDao.insert(accountcat);

    }
    public static Object getAllAccountsCategory() throws Exception {
        return accountcategoryDao.viewAll();
    }

    public static int updateAccountCategory(AccountCategory accountcat) throws Exception {
        return accountcategoryDao.update(accountcat);
    }

    public static int DeleteAccountCategoryById(String id) throws Exception {
        return accountcategoryDao.delete(id);
    }
    public static AccountCategory searchAccountCategoryById(int id) throws Exception {
        return accountcategoryDao.searchAccountCategoryById(id);
    }
}
