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
public interface CollectTimeBagLineDAO extends DAO {

    public int getcountByID(int id) throws Exception;

    public Object getAllCollectTimeBagLinesById(int id) throws Exception;

    public Object getAllCollectTimeBagLinesBytimebagId(String id) throws Exception;
}
