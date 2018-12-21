/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.Model;

/**
 *
 * @author Chamil
 */
public class Notification {

    private Integer notification_id;
    private String notification_Own;
    private String notificationDescription;
    private String notification_status;

    public Notification(Integer notification_id, String notification_Own, String notificationDescription, String notification_status) {
        this.notification_id = notification_id;
        this.notification_Own = notification_Own;
        this.notificationDescription = notificationDescription;
        this.notification_status = notification_status;
    }

    /**
     * @return the notification_id
     */
    public Integer getNotification_id() {
        return notification_id;
    }

    /**
     * @param notification_id the notification_id to set
     */
    public void setNotification_id(Integer notification_id) {
        this.notification_id = notification_id;
    }

    /**
     * @return the notification_Own
     */
    public String getNotification_Own() {
        return notification_Own;
    }

    /**
     * @param notification_Own the notification_Own to set
     */
    public void setNotification_Own(String notification_Own) {
        this.notification_Own = notification_Own;
    }

    /**
     * @return the notificationDescription
     */
    public String getNotificationDescription() {
        return notificationDescription;
    }

    /**
     * @param notificationDescription the notificationDescription to set
     */
    public void setNotificationDescription(String notificationDescription) {
        this.notificationDescription = notificationDescription;
    }

    /**
     * @return the notification_status
     */
    public String getNotification_status() {
        return notification_status;
    }

    /**
     * @param notification_status the notification_status to set
     */
    public void setNotification_status(String notification_status) {
        this.notification_status = notification_status;
    }
    

}
