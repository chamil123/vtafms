/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.ResourceConnection;

import java.sql.SQLException;

/**
 *
 * @author Chamil
 */
public interface ResourecConnection {
     public Object getConnection()throws ClassNotFoundException,SQLException;
}
