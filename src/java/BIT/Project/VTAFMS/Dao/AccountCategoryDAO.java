/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DAO;

import BIT.Project.VTAFMS.Model.AccountCategory;

/**
 *
 * @author Chamil
 */
public interface AccountCategoryDAO extends DAO{

    public AccountCategory searchAccountCategoryById(int id)throws Exception;
    
}
