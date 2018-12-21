/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DaoImpl;

import BIT.Project.VTAFMS.ConnectionFactory.ConnectionProviderFactory;
import BIT.Project.VTAFMS.DAO.RunnerDAO;
import BIT.Project.VTAFMS.Model.Runner;
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
public class RunnerDAOImpl implements RunnerDAO {

    @Override
    public int insert(Object object) throws Exception {
        Runner runner = (Runner) object;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();

        return stm.executeUpdate("INSERT into runner (runner_firstName,runner_lastName,runner_NIC,runner_mobileNumber,runner_homeNumber,runner_email,runner_address)  values('" + runner.getRunner_firstName() + "','" + runner.getRunner_lastName() + "','" + runner.getRunner_NIC()+ "','" + runner.getRunner_mobileNumber()+ "','" + runner.getRunner_homeNumber()+ "','" + runner.getRunner_email() + "','" + runner.getRunner_address() + "')");

    }

    @Override
    public Object search(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int update(Object model) throws Exception {
        Runner runner = (Runner) model;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("UPDATE runner set runner_firstName='" + runner.getRunner_firstName()+ "',runner_lastName='" + runner.getRunner_lastName()+ "',runner_NIC='" + runner.getRunner_NIC()+ "',runner_mobileNumber='" + runner.getRunner_mobileNumber()+ "',runner_homeNumber='" + runner.getRunner_homeNumber()+ "',runner_email='" + runner.getRunner_email()+ "',runner_address='" + runner.getRunner_address()+ "' WHERE runner_id='" + runner.getRunner_id()+ "'");
    }

    @Override
    public int delete(String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("DELETE FROM runner WHERE  runner_id='"+id+"'");
    }

    @Override
    public List<Object> viewAll() throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from runner");
        List<Object> list = new ArrayList<>();
        while (res.next()) {
            list.add(new Runner(res.getInt("runner_id"), res.getString("runner_firstName"), res.getString("runner_lastName"), res.getString("runner_NIC"), res.getString("runner_mobileNumber"), res.getString("runner_homeNumber"), res.getString("runner_email"), res.getString("runner_address")));
            //  list.add(new AddressModel(res.getInt("address_id"), res.getString("address_street1"), res.getString("address_street2"), res.getString("address_zip_code"), res.getInt("city_id"),res.getInt("state_id"), res.getInt("Person_person_id"), res.getString("address_person_type")));
        }

        return list;
    }

    @Override
    public Runner getAllRunnersByID(int id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from runner where runner_id='" + id + "'");
        if (res.next()) {
            return new Runner(res.getInt("runner_id"), res.getString("runner_firstName"), res.getString("runner_lastName"), res.getString("runner_NIC"), res.getString("runner_mobileNumber"), res.getString("runner_homeNumber"), res.getString("runner_email"), res.getString("runner_address"));

        }
        return null;
    }

    @Override
    public Runner getRunnersByName(String name) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public double getRowCount() throws Exception {
        int numberRow = 0;

        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("SELECT count(*) FROM runner");
        int lastid = 0;
        while (res.next()) {
            numberRow = res.getInt("count(*)");
        }
        return numberRow;
    }

    @Override
    public Object limitResult(String page) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from runner ORDER BY runner_id ASC limit " + page + ",10");
        List<Object> list = new ArrayList<>();
        while (res.next()) {

            list.add(new Runner(res.getInt("runner_id"), res.getString("runner_firstName"), res.getString("runner_lastName"), res.getString("runner_NIC"), res.getString("runner_mobileNumber"), res.getString("runner_homeNumber"), res.getString("runner_email"), res.getString("runner_address")));

        }

        return list;
    }

}
