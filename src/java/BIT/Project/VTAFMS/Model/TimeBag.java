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
public class TimeBag {

    private String time_bag_Code;
    private String Time_bag_type;
    private int Time_bag_availableCenters;
    private int runner_id;

    public TimeBag(String time_bag_Code, String Time_bag_type, int Time_bag_availableCenters, int runner_id) {
        this.time_bag_Code = time_bag_Code;
        this.Time_bag_type = Time_bag_type;
        this.Time_bag_availableCenters = Time_bag_availableCenters;
        this.runner_id = runner_id;
    }

    /**
     * @return the time_bag_Code
     */
    public String getTime_bag_Code() {
        return time_bag_Code;
    }

    /**
     * @param time_bag_Code the time_bag_Code to set
     */
    public void setTime_bag_Code(String time_bag_Code) {
        this.time_bag_Code = time_bag_Code;
    }

    /**
     * @return the Time_bag_type
     */
    public String getTime_bag_type() {
        return Time_bag_type;
    }

    /**
     * @param Time_bag_type the Time_bag_type to set
     */
    public void setTime_bag_type(String Time_bag_type) {
        this.Time_bag_type = Time_bag_type;
    }

    /**
     * @return the Time_bag_availableCenters
     */
    public int getTime_bag_availableCenters() {
        return Time_bag_availableCenters;
    }

    /**
     * @param Time_bag_availableCenters the Time_bag_availableCenters to set
     */
    public void setTime_bag_availableCenters(int Time_bag_availableCenters) {
        this.Time_bag_availableCenters = Time_bag_availableCenters;
    }

    /**
     * @return the runner_id
     */
    public int getRunner_id() {
        return runner_id;
    }

    /**
     * @param runner_id the runner_id to set
     */
    public void setRunner_id(int runner_id) {
        this.runner_id = runner_id;
    }
    
}
