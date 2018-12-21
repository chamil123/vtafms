/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DAO;

import BIT.Project.VTAFMS.Model.GeneralSummery;

/**
 *
 * @author Chamil
 */
public interface GeneralSummeryDAO extends DAO{

    public GeneralSummery getAllGeneralSummerysByID(int id)throws Exception;

    public int getMaxId()throws Exception;

    public Object generalsummeryBetweenDates(String fromdate, String todate, String centername)throws Exception;
    
}
