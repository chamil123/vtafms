/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Controller;

import BIT.Project.VTAFMS.DAO.CollectTimeBagLineDAO;
import BIT.Project.VTAFMS.DaoImpl.CollectTimeBagLineDAOImpl;
import BIT.Project.VTAFMS.Model.CollectTimeBagLine;

/**
 *
 * @author Chamil
 */
public class CollectTimeBagLineController {

    private static CollectTimeBagLineDAO collectmimebaglineDao = new CollectTimeBagLineDAOImpl();
    // private static UserDAO UserDao = new UserDAOImpl();

    public static int insertCollectTimeBagLine(CollectTimeBagLine collectmimebagline) throws Exception {

        return collectmimebaglineDao.insert(collectmimebagline);

    }

    public static Object getAllCollectTimeBagLines() throws Exception {
        return collectmimebaglineDao.viewAll();
    }

    public static int updateCollectTimeBagLine(CollectTimeBagLine collectmimebagline) throws Exception {
        return collectmimebaglineDao.update(collectmimebagline);
    }

    public static int DeleteCollectTimeBagLineById(String id) throws Exception {
        return collectmimebaglineDao.delete(id);
    }

    public static int getcountByID(int id) throws Exception {
        return collectmimebaglineDao.getcountByID(id);
    }

    public static Object getAllCollectTimeBagLinesById(int id) throws Exception {
        return collectmimebaglineDao.getAllCollectTimeBagLinesById(id);
    }

    public static Object getAllCollectTimeBagLinesBytimebagId(String id) throws Exception {
        return collectmimebaglineDao.getAllCollectTimeBagLinesBytimebagId(id);
    }
}
