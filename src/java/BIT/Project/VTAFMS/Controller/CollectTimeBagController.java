/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Controller;

import BIT.Project.VTAFMS.DAO.CollectTimeBagDAO;
import BIT.Project.VTAFMS.DaoImpl.CollectTimeBagDAOImpl;
import BIT.Project.VTAFMS.Model.CollectTimeBag;

/**
 *
 * @author Chamil
 */
public class CollectTimeBagController {

    private static CollectTimeBagDAO collecttimebagDao = new CollectTimeBagDAOImpl();

    // private static UserDAO UserDao = new UserDAOImpl();
    public static int insertCollectTimeBag(CollectTimeBag collectTimeBag) throws Exception {
        return collecttimebagDao.insert(collectTimeBag);
    }

    public static CollectTimeBag searchCollectTimeBagById(int id) throws Exception {
        return collecttimebagDao.getAllCollectTimeBagByID(id);
    }

    public static Object getAllCollectTimeBags() throws Exception {
        return collecttimebagDao.viewAll();
    }

    public static int updateCollectTimeBag(CollectTimeBag collectTimeBag) throws Exception {
        return collecttimebagDao.update(collectTimeBag);
    }

    public static int DeleteCollectTimeBagById(String id) throws Exception {
        return collecttimebagDao.delete(id);
    }

    public static int getMaxId() throws Exception {
        return collecttimebagDao.getMaxId();
    }

    public static Object getAllTimebagLineByRunner(String name) throws Exception {
        return collecttimebagDao.getAllTimebagLineByRunner(name);
    }
}
