/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DaoImpl;

import BIT.Project.VTAFMS.ConnectionFactory.ConnectionProviderFactory;
import BIT.Project.VTAFMS.DAO.SummeryLineDAO;
import BIT.Project.VTAFMS.Model.SummeryLine;
import BIT.Project.VTAFMS.ResourceConnectionImpl.ResoureConnectionImpl;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Chamil
 */
public class SummeryLineDAOImpl implements SummeryLineDAO {

    @Override
    public SummeryLine getAllSummeryLineByID(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int insert(Object object) throws Exception {
        SummeryLine summeryline = (SummeryLine) object;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();

        return stm.executeUpdate("INSERT into summery_line (summery_id,summery_line_chitNumber,Summery_line_Investment,Summery_line_payment,Summery_lin_date)  values('" + summeryline.getSummery_id() + "',"
                + "'" + summeryline.getSummery_line_chitNumber() + "',"
                + "'" + summeryline.getSummery_line_Investment() + "',"
                + "'" + summeryline.getSummery_line_payment() + "',"
                + "'" + summeryline.getSummery_lin_date() + "')");

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

    @Override           
    public List<Object> getAllSummeryLineBysummeryID(int id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from summery_line WHERE summery_id='" + id + "'");
        List<Object> list = new ArrayList<>();
        while (res.next()) {
            list.add(new SummeryLine(res.getInt("summery_line_id"), res.getInt("summery_id"), res.getString("summery_line_chitNumber"), res.getDouble("Summery_line_Investment"), res.getDouble("Summery_line_payment"), res.getString("Summery_lin_date")));
            //  list.add(new AddressModel(res.getInt("address_id"), res.getString("address_street1"), res.getString("address_street2"), res.getString("address_zip_code"), res.getInt("city_id"),res.getInt("state_id"), res.getInt("Person_person_id"), res.getString("address_person_type")));
        }

        return list;
    }

    @Override
    public int DeleteSummeryLineByDateAndSummeryId(String date, String summery_id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("DELETE  FROM summery_line WHERE Summery_lin_date='" + date + "' AND summery_id='" + summery_id + "'");
    }

}
