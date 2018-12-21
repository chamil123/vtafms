/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DaoImpl;

import BIT.Project.VTAFMS.ConnectionFactory.ConnectionProviderFactory;
import BIT.Project.VTAFMS.DAO.CenterExpensesDAO;
import BIT.Project.VTAFMS.Model.CenterExpenses;
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
public class CenterExpensesDAOImpl implements CenterExpensesDAO {

    @Override
    public int insert(Object object) throws Exception {
        CenterExpenses centerexpenses = (CenterExpenses) object;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        return stm.executeUpdate("INSERT into center_expenses (center_expenses_expenseName,center_expenses_amount,center_id)  values('" + centerexpenses.getCenter_expenses_expenseName() + "',"
                + "'" + centerexpenses.getCenter_expenses_amount() + "',"
                + "'" + centerexpenses.getCenter_id() + "')");
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
    public List<Object> getAllcenterExpensesByCenterID(String id) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();

        ResultSet res = stm.executeQuery("select * from center_expenses where center_id='" + id + "'");
        List<Object> list = new ArrayList<>();
        while (res.next()) {
            list.add(new CenterExpenses(res.getInt("center_expenses_id"), res.getString("center_expenses_expenseName"),
                    res.getDouble("center_expenses_amount"), res.getString("center_id")));
        }
        return list;

    }

}
