/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Controller;



import BIT.Project.VTAFMS.DAO.RoleDAO;
import BIT.Project.VTAFMS.DaoImpl.RoleDAOImpl;
import BIT.Project.VTAFMS.DaoImpl.UserDAOImpl;
import BIT.Project.VTAFMS.Model.Role;
import BIT.Project.VTAFMS.Model.User;

/**
 *
 * @author Chamil
 */
public class RoleController {
    private static RoleDAO roleDao = new RoleDAOImpl();
       // private static UserDAO UserDao = new UserDAOImpl();

    public static int insertRole(Role role) throws Exception {

        return roleDao.insert(role);

    }

    public static Role searchRoleById(int id) throws Exception {
        return roleDao.searchRoleById(id);
    }

    public static Object getAllRoles() throws Exception {
        return roleDao.viewAll();
    }

    public static int updateRole(Role role) throws Exception {
        return roleDao.update(role);
    }

    public static Object DeleteRoleById(String id) throws Exception {
        return roleDao.delete(id);
    }
  
}
