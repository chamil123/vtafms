/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BIT.Project.VTAFMS.DAO;

import BIT.Project.VTAFMS.Model.Loan;

/**
 *
 * @author Chamil
 */
public interface LoanDAO extends DAO{

    public Loan searchLoanById(int id)throws Exception;

    public Object getLoansByCenterID(String id)throws Exception;

    public int updateLoanByIdAndBalance(int id,double balance)throws Exception;

    public int updateLoanByIdAndBalaandStatus(int id, double balance, String status)throws Exception;

    public double getRowCount()throws Exception;

    public Object limitResult(String page)throws Exception;

    public int getRowCountSearch(String id)throws Exception;

    public Object searchAndlimitResult(String name, String page)throws Exception;
    
}
