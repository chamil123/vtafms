/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Controller;

import BIT.Project.VTAFMS.DAO.GeneralSummeryLineDAO;
import BIT.Project.VTAFMS.DaoImpl.GeneralSummeryLineDAOImpl;
import BIT.Project.VTAFMS.Model.GeneralSummeryLine;

/**
 *
 * @author Chamil
 */
public class GeneralSummeryLineController {

    private static GeneralSummeryLineDAO generalsummeryLineDao = new GeneralSummeryLineDAOImpl();

    public static int insertGeneralSummery(GeneralSummeryLine generalSummeryLine) throws Exception {
        return generalsummeryLineDao.insert(generalSummeryLine);
    }

    public static Object getAllGeneralSummeryLines() throws Exception {
        return generalsummeryLineDao.viewAll();
    }

    public static int updateGeneralSummeryLine(GeneralSummeryLine generalSummeryLine) throws Exception {
        return generalsummeryLineDao.update(generalSummeryLine);
    }

    public static int DeleteGeneralSummeryLineById(String id) throws Exception {
        return generalsummeryLineDao.delete(id);
    }

}
