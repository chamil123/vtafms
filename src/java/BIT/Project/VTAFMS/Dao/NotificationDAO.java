/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DAO;

/**
 *
 * @author Chamil
 */
public interface NotificationDAO extends DAO{

    public int getAlluncheckNotificationCount()throws Exception;

    public Object limitResult(String page)throws Exception;
    
}
