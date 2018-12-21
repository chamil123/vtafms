/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DAO;

import java.util.List;

/**
 *
 * @author Chamil
 */
public interface CenterExpensesDAO extends DAO{
    public List<Object> getAllcenterExpensesByCenterID(String id) throws Exception;
}
