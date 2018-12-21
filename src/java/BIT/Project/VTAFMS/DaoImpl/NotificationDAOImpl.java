/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DaoImpl;

import BIT.Project.VTAFMS.ConnectionFactory.ConnectionProviderFactory;
import BIT.Project.VTAFMS.DAO.NotificationDAO;
import BIT.Project.VTAFMS.Model.Notification;
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
public class NotificationDAOImpl implements NotificationDAO {

    @Override
    public int insert(Object object) throws Exception {
        Notification notification = (Notification) object;
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();

        return stm.executeUpdate("INSERT into notification (notification_Own,notificationDescription,notification_status)  values('" + notification.getNotification_Own() + "',"
                + "'" + notification.getNotificationDescription() + "',"
                + "'" + notification.getNotification_status() + "')");
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
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from notification");
        List<Object> list = new ArrayList<>();
        while (res.next()) {
            list.add(new Notification(res.getInt("notification_id"), res.getString("notification_Own"), res.getString("notificationDescription"), res.getString("notification_status")));
            //  list.add(new AddressModel(res.getInt("address_id"), res.getString("address_street1"), res.getString("address_street2"), res.getString("address_zip_code"), res.getInt("city_id"),res.getInt("state_id"), res.getInt("Person_person_id"), res.getString("address_person_type")));
        }

        return list;
    }

    @Override
    public int getAlluncheckNotificationCount() throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from notification WHERE notification_status='Active'");
        int count = 0;
        while (res.next()) {
            // System.out.print("date eka : "+res.getString("transaction_date"));
            count++;
        }

        return count;
    }

    @Override
    public Object limitResult(String page) throws Exception {
        ResoureConnectionImpl connectionProvider = ConnectionProviderFactory.getConnectionProvider();
        Connection conn = (Connection) connectionProvider.getConnection();
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from notification ORDER BY notification_id ASC limit " + page + ",12");
        List<Object> list = new ArrayList<>();
        while (res.next()) {
            list.add(new Notification(res.getInt("notification_id"), res.getString("notification_Own"), res.getString("notificationDescription"), res.getString("notification_status")));
        }
        return list;
    }

}
