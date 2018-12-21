/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DAO;

import java.util.List;

/**
 *
 * @author Chamil
 */
public interface DAO {

    public int insert(Object object) throws Exception;

    public Object search(String id) throws Exception;

    public int update(Object model) throws Exception;

    public int delete(String id) throws Exception;

    public List<Object> viewAll() throws Exception;
}
