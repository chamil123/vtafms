/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DAO;

import BIT.Project.VTAFMS.Model.ExcessLine;

/**
 *
 * @author Chamil
 */
public interface ExcessLineDAO extends DAO {

    public ExcessLine getAllExcessLineByID(String id) throws Exception;

    public double getduepaymentByID(int id) throws Exception;

    public double gettotalpaymentByID(int id) throws Exception;

    public int getcountByID(int id) throws Exception;

    public Object searchAllExcessLineById(String id)throws Exception;

    public Object getAllExcessLineByExcessID(String id)throws Exception;

}
