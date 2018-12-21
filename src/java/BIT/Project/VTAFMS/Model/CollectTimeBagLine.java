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
public class CollectTimeBagLine {

    private Integer collection_timeBag_line_id;
    private String collection_timeBag_line_timeValue;
    private String collection_timeBag_line_OpenTime;
    private String collection_timeBag_line_closeTime;
    private int collection_timeBag_id;
    private String time_bag_Code;
    private String collection_timeBag_line_rateAmount;

    public CollectTimeBagLine(Integer collection_timeBag_line_id, String collection_timeBag_line_timeValue, String collection_timeBag_line_OpenTime, String collection_timeBag_line_closeTime, int collection_timeBag_id, String time_bag_Code, String collection_timeBag_line_rateAmount) {
        this.collection_timeBag_line_id = collection_timeBag_line_id;
        this.collection_timeBag_line_timeValue = collection_timeBag_line_timeValue;
        this.collection_timeBag_line_OpenTime = collection_timeBag_line_OpenTime;
        this.collection_timeBag_line_closeTime = collection_timeBag_line_closeTime;
        this.collection_timeBag_id = collection_timeBag_id;
        this.time_bag_Code = time_bag_Code;
        this.collection_timeBag_line_rateAmount = collection_timeBag_line_rateAmount;
    }

    /**
     * @return the collection_timeBag_line_id
     */
    public Integer getCollection_timeBag_line_id() {
        return collection_timeBag_line_id;
    }

    /**
     * @param collection_timeBag_line_id the collection_timeBag_line_id to set
     */
    public void setCollection_timeBag_line_id(Integer collection_timeBag_line_id) {
        this.collection_timeBag_line_id = collection_timeBag_line_id;
    }

    /**
     * @return the collection_timeBag_line_timeValue
     */
    public String getCollection_timeBag_line_timeValue() {
        return collection_timeBag_line_timeValue;
    }

    /**
     * @param collection_timeBag_line_timeValue the collection_timeBag_line_timeValue to set
     */
    public void setCollection_timeBag_line_timeValue(String collection_timeBag_line_timeValue) {
        this.collection_timeBag_line_timeValue = collection_timeBag_line_timeValue;
    }

    /**
     * @return the collection_timeBag_line_OpenTime
     */
    public String getCollection_timeBag_line_OpenTime() {
        return collection_timeBag_line_OpenTime;
    }

    /**
     * @param collection_timeBag_line_OpenTime the collection_timeBag_line_OpenTime to set
     */
    public void setCollection_timeBag_line_OpenTime(String collection_timeBag_line_OpenTime) {
        this.collection_timeBag_line_OpenTime = collection_timeBag_line_OpenTime;
    }

    /**
     * @return the collection_timeBag_line_closeTime
     */
    public String getCollection_timeBag_line_closeTime() {
        return collection_timeBag_line_closeTime;
    }

    /**
     * @param collection_timeBag_line_closeTime the collection_timeBag_line_closeTime to set
     */
    public void setCollection_timeBag_line_closeTime(String collection_timeBag_line_closeTime) {
        this.collection_timeBag_line_closeTime = collection_timeBag_line_closeTime;
    }

    /**
     * @return the collection_timeBag_id
     */
    public int getCollection_timeBag_id() {
        return collection_timeBag_id;
    }

    /**
     * @param collection_timeBag_id the collection_timeBag_id to set
     */
    public void setCollection_timeBag_id(int collection_timeBag_id) {
        this.collection_timeBag_id = collection_timeBag_id;
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
     * @return the collection_timeBag_line_rateAmount
     */
    public String getCollection_timeBag_line_rateAmount() {
        return collection_timeBag_line_rateAmount;
    }

    /**
     * @param collection_timeBag_line_rateAmount the collection_timeBag_line_rateAmount to set
     */
    public void setCollection_timeBag_line_rateAmount(String collection_timeBag_line_rateAmount) {
        this.collection_timeBag_line_rateAmount = collection_timeBag_line_rateAmount;
    }

   
}
