/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DAO;

import BIT.Project.VTAFMS.Model.GeneralCash;

/**
 *
 * @author Chamil
 */
public interface GeneralCashDAO extends DAO{

    public GeneralCash searchGeneralCashById(String id)throws Exception;

    public GeneralCash searchGeneralCashByDateandId(String date, String id)throws Exception;

    public double getAllGeneralCashAccountID(int id)throws Exception;

    public Object getAllcashandPassDuesBydate()throws Exception;
    
}
