/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DAO;

import BIT.Project.VTAFMS.Model.SummeryLine;
import java.util.List;

/**
 *
 * @author Chamil
 */
public interface SummeryLineDAO extends DAO {

    public SummeryLine getAllSummeryLineByID(int id) throws Exception;

    public List<Object> getAllSummeryLineBysummeryID(int id) throws Exception;

    public int DeleteSummeryLineByDateAndSummeryId(String date, String summery_id) throws Exception;


}
