/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DAO;

import BIT.Project.VTAFMS.Model.CollectTimeBag;

/**
 *
 * @author Chamil
 */
public interface CollectTimeBagDAO extends DAO{

    public CollectTimeBag getAllCollectTimeBagByID(int id)throws Exception;
     public int getMaxId()throws Exception;

    public Object getAllTimebagLineByRunner(String name)throws Exception;
}
