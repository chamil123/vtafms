/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DAO;

import BIT.Project.VTAFMS.Model.Runner;

/**
 *
 * @author Chamil
 */
public interface RunnerDAO extends DAO {

    public Runner getAllRunnersByID(int id) throws Exception;

    public Runner getRunnersByName(String name) throws Exception;

    public double getRowCount() throws Exception;

    public Object limitResult(String page) throws Exception;

}
