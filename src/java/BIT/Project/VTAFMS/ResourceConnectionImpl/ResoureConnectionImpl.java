/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.ResourceConnectionImpl;

import BIT.Project.VTAFMS.ResourceConnection.ResourecConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author chamil
 */
public class ResoureConnectionImpl implements ResourecConnection {

    private static Connection con;

    public ResoureConnectionImpl() {

    }

    @Override
    public Connection getConnection() throws ClassNotFoundException, SQLException {

        if (con == null) {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/vtafms", "root", "");
            return con;

        }
        return con;
    }

}
