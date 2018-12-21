/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DaoImpl;

import BIT.Project.VTAFMS.ConnectionFactory.ConnectionProviderFactory;
import BIT.Project.VTAFMS.DAO.ExcessLineDAO;
import BIT.Project.VTAFMS.Model.ExcessLine;
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
public class ExcessLineDAOImpl implements ExcessLineDAO {

    @Override
    public int insert(Object object) throws Exception {
        ExcessLine excessline = (ExcessLine) object;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("INSERT into excess_line (excess_id,excess_line_chitNumber,excess_line_repeatCount,excess_line_totalPayment,excess_line_duePayment,excess_line_reason) values('" + excessline.getExcess_id() + "',"
                + "'" + excessline.getExcess_line_chitNumber() + "',"
                + "'" + excessline.getExcess_line_repeatCount() + "',"
                + "'" + excessline.getExcess_line_totalPayment() + "',"
                + "'" + excessline.getExcess_line_duePayment() + "',"
                + "'" + excessline.getExcess_line_reason() + "')");

    }

    @Override
    public Object search(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(Object model) throws Exception {

        ExcessLine excessline = (ExcessLine) model;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        if (excessline.getExcess_line_id() != 0) {
            return stm.executeUpdate("DELETE FROM excess_line WHERE excess_line_id='" + excessline.getExcess_line_id() + "'");
        }
        return 0;
        //System.out.println("fffffffffffffffffffffffff");

//        return stm.executeUpdate("INSERT into excess_line (excess_id,excess_line_chitNumber,excess_line_repeatCount,excess_line_totalPayment,excess_line_duePayment,excess_line_reason) values('" + excessline.getExcess_id() + "',"
//                + "'" + excessline.getExcess_line_chitNumber() + "',"
//                + "'" + excessline.getExcess_line_repeatCount() + "',"
//                + "'" + excessline.getExcess_line_totalPayment() + "',"
//                + "'" + excessline.getExcess_line_duePayment() + "',"
//                + "'" + excessline.getExcess_line_reason() + "')");
    }

    @Override
    public int delete(String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("DELETE FROM excess_line WHERE excess_id='" + id + "'");
    }

    @Override
    public List<Object> viewAll() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ExcessLine getAllExcessLineByID(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public double getduepaymentByID(int id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select excess_line_duePayment from excess_line WHERE  excess_id='" + id + "'");
        double total = 0;
        while (res.next()) {

            total += res.getDouble("excess_line_duePayment");

        }
        return total;
    }

    @Override
    public double gettotalpaymentByID(int id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select excess_line_totalPayment from excess_line WHERE  excess_id='" + id + "'");
        double total = 0;
        while (res.next()) {

            total += res.getDouble("excess_line_totalPayment");

        }
        return total;
    }

    @Override
    public int getcountByID(int id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select excess_id from excess_line WHERE  excess_id='" + id + "'");
        int count = 0;
        while (res.next()) {

            // total += res.getDouble("excess_line_totalPayment");
            count++;
        }
        return count;
    }

    @Override
    public List<Object> searchAllExcessLineById(String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from excess_line WHERE excess_id='" + id + "' ");
        List<Object> list = new ArrayList<>();
        while (res.next()) {
            list.add(new ExcessLine(res.getInt("excess_line_id"), res.getInt("excess_id"),
                    res.getString("excess_line_chitNumber"),
                    res.getInt("excess_line_repeatCount"), res.getDouble("excess_line_totalPayment"), res.getDouble("excess_line_duePayment"), res.getString("excess_line_reason")));

        }
        return list;
    }

    @Override
    public Object getAllExcessLineByExcessID(String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from excess_line WHERE excess_id='" + id + "'");
        List<Object> list = new ArrayList<>();
        while (res.next()) {
            list.add(new ExcessLine(res.getInt("excess_line_id"), res.getInt("excess_id"),
                    res.getString("excess_line_chitNumber"),
                    res.getInt("excess_line_repeatCount"), res.getDouble("excess_line_totalPayment"), res.getDouble("excess_line_duePayment"), res.getString("excess_line_reason")));
            //  list.add(new AddressModel(res.getInt("address_id"), res.getString("address_street1"), res.getString("address_street2"), res.getString("address_zip_code"), res.getInt("city_id"),res.getInt("state_id"), res.getInt("Person_person_id"), res.getString("address_person_type")));
        }

        return list;
    }

}
