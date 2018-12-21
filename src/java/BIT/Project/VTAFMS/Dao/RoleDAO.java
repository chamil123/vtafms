/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DAO;

import BIT.Project.VTAFMS.Model.Role;
import BIT.Project.VTAFMS.Model.User;

/**
 *
 * @author Chamil
 */
public interface RoleDAO extends DAO{

    public Role searchRoleByName(String name) throws Exception;

    public Role searchRoleById(int id) throws Exception;

    
}
