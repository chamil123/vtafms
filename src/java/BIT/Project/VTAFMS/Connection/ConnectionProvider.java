/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Connection;

/**
 *
 * @author Chamil
 */
public interface ConnectionProvider {
    
      Object getConnection()throws Exception;
}
