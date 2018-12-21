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
public class CollectTimeBag {
    
    private Integer collection_timeBag_id;
    private String Collection_timeBag_date;
    private int runner_id;
    private int user_id;
    private int agent_id;

    public CollectTimeBag(Integer collection_timeBag_id, String Collection_timeBag_date, int runner_id, int user_id, int agent_id) {
        this.collection_timeBag_id = collection_timeBag_id;
        this.Collection_timeBag_date = Collection_timeBag_date;
        this.runner_id = runner_id;
        this.user_id = user_id;
        this.agent_id = agent_id;
    }

    /**
     * @return the collection_timeBag_id
     */
    public Integer getCollection_timeBag_id() {
        return collection_timeBag_id;
    }

    /**
     * @param collection_timeBag_id the collection_timeBag_id to set
     */
    public void setCollection_timeBag_id(Integer collection_timeBag_id) {
        this.collection_timeBag_id = collection_timeBag_id;
    }

    /**
     * @return the Collection_timeBag_date
     */
    public String getCollection_timeBag_date() {
        return Collection_timeBag_date;
    }

    /**
     * @param Collection_timeBag_date the Collection_timeBag_date to set
     */
    public void setCollection_timeBag_date(String Collection_timeBag_date) {
        this.Collection_timeBag_date = Collection_timeBag_date;
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

    /**
     * @return the user_id
     */
    public int getUser_id() {
        return user_id;
    }

    /**
     * @param user_id the user_id to set
     */
    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    /**
     * @return the agent_id
     */
    public int getAgent_id() {
        return agent_id;
    }

    /**
     * @param agent_id the agent_id to set
     */
    public void setAgent_id(int agent_id) {
        this.agent_id = agent_id;
    }

   
    
}
