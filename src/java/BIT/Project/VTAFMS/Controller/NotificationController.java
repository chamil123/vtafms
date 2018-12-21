/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Controller;

import BIT.Project.VTAFMS.DAO.NotificationDAO;
import BIT.Project.VTAFMS.DaoImpl.NotificationDAOImpl;
import BIT.Project.VTAFMS.Model.Notification;

/**
 *
 * @author Chamil
 */
public class NotificationController {
      private static NotificationDAO notificationDao = new NotificationDAOImpl();

    public static int insertNotification(Notification notification) throws Exception {
        return notificationDao.insert(notification);
    }

    public static Object getAllNotification() throws Exception {
        return notificationDao.viewAll();
    }

    public static int updateNotification(Notification notification) throws Exception {
        return notificationDao.update(notification);
    }

    public static int DeleteNotificationById(String id) throws Exception {
        return notificationDao.delete(id);
    }
    public static int getAlluncheckNotificationCount() throws Exception {
        return notificationDao.getAlluncheckNotificationCount();
    }
     public static Object limitResult(String page) throws Exception {
        return notificationDao.limitResult(page);
    }
   
}
