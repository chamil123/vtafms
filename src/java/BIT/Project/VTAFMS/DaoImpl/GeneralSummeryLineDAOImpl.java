/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DaoImpl;

import BIT.Project.VTAFMS.ConnectionFactory.ConnectionProviderFactory;
import BIT.Project.VTAFMS.DAO.GeneralSummeryLineDAO;
import BIT.Project.VTAFMS.Model.GeneralSummeryLine;
import BIT.Project.VTAFMS.ResourceConnectionImpl.ResoureConnectionImpl;
import java.sql.Connection;
import java.sql.Statement;
import java.util.List;

/**
 *
 * @author Chamil
 */
public class GeneralSummeryLineDAOImpl implements GeneralSummeryLineDAO {

    @Override
    public int insert(Object object) throws Exception {
        GeneralSummeryLine generalsummeryline = (GeneralSummeryLine) object;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();

        return stm.executeUpdate("INSERT into accountgeneral_line (accountGeneral_line_summeryName ,accountGeneral_line_fullCollection , accountGeneral_line_payment  ,accountGeneral_id  ,summery_id )  values('" + generalsummeryline.getAccountGeneral_line_summeryName() + "',"
                + "'" + generalsummeryline.getAccountGeneral_line_fullCollection() + "',"
                + "'" + generalsummeryline.getAccountGeneral_line_payment() + "',"
                + "'" + generalsummeryline.getAccountGeneral_id() + "',"
                + "'" + generalsummeryline.getSummery_id() + "')");

    }

    @Override
    public Object search(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(Object model) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Object> viewAll() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
