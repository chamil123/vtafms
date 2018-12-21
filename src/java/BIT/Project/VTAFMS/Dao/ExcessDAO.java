/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DAO;

import BIT.Project.VTAFMS.Model.Excess;

/**
 *
 * @author Chamil
 */
public interface ExcessDAO extends DAO {

    public Excess getAllExcessByID(String id) throws Exception;

    public int getMaxId() throws Exception;

    public double getexcessTotalByidandDate(String id, String date) throws Exception;

    public double getexcessTotalByid(String id) throws Exception;

    public Excess getExcessById(String id)throws Exception;


}
