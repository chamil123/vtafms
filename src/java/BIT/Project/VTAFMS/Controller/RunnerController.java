/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Controller;

import BIT.Project.VTAFMS.DAO.RunnerDAO;
import BIT.Project.VTAFMS.DaoImpl.RunnerDAOImpl;
import BIT.Project.VTAFMS.Model.Runner;

/**
 *
 * @author Chamil
 */
public class RunnerController {

    private static RunnerDAO runnerDao = new RunnerDAOImpl();

    public static int insertRunner(Runner runner) throws Exception {
        return runnerDao.insert(runner);

    }

    public static Runner searchRunnerById(int id) throws Exception {
        return runnerDao.getAllRunnersByID(id);
    }

    public static Object getAllRunners() throws Exception {
        return runnerDao.viewAll();
    }

    public static int updateRunner(Runner runner) throws Exception {
        return runnerDao.update(runner);
    }

    public static int DeleteRunnerById(String id) throws Exception {
        return runnerDao.delete(id);
    }

    public static Runner getRunnersByName(String name) throws Exception {
        return runnerDao.getRunnersByName(name);
    }

    public static double getRowCount() throws Exception {
        return runnerDao.getRowCount();
    }

    public static Object limitresult(String page) throws Exception {
        return runnerDao.limitResult(page);
    }

}
