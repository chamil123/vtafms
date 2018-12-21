/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Controller;

import BIT.Project.VTAFMS.DAO.TimeBagDAO;
import BIT.Project.VTAFMS.DaoImpl.TimeBagDAOImpl;
import BIT.Project.VTAFMS.Model.TimeBag;

/**
 *
 * @author Chamil
 */
public class TimeBagController {
    private static TimeBagDAO timebagDao = new TimeBagDAOImpl();
    // private static UserDAO UserDao = new UserDAOImpl();

    public static int insertTimeBag(TimeBag timebag) throws Exception {

        return timebagDao.insert(timebag);

    }

    public static TimeBag searchTimeBagById(String id) throws Exception {
        return timebagDao.getAllTimeBagsByID(id);
    }

    public static Object getAllTimeBags() throws Exception {
        return timebagDao.viewAll();
    }

    public static int updateTimeBag(TimeBag timebag) throws Exception {
        return timebagDao.update(timebag);
    }

    public static int DeleteTimeBagById(String id) throws Exception {
        return timebagDao.delete(id);
    }
}
