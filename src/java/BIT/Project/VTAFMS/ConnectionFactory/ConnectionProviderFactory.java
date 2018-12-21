/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package BIT.Project.VTAFMS.ConnectionFactory;

import BIT.Project.VTAFMS.ResourceConnectionImpl.ResoureConnectionImpl;


/**
 *
 * @author chamil
 */
public class ConnectionProviderFactory {
    private ConnectionProviderFactory(){
        
    }
    public static ResoureConnectionImpl getConnectionProvider(){
        return new ResoureConnectionImpl();
    }
}
