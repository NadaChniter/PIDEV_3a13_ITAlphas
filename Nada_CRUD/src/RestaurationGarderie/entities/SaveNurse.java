/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RestaurationGarderie.entities;

import java.sql.Date;

/**
 *
 * @author nada
 */
public class SaveNurse {
    private int id;
    private Date date_begin;
    private Date date_end;

    public SaveNurse(int id, Date date_begin, Date date_end) {
        this.id = id;
        this.date_begin = date_begin;
        this.date_end = date_end;
    }

  
    public int getId() {
        return id;
    }

    public Date getDate_begin() {
        return date_begin;
    }

    public Date getDate_end() {
        return date_end;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setDate_begin(Date date_begin) {
        this.date_begin = date_begin;
    }

    public void setDate_end(Date date_end) {
        this.date_end = date_end;
    }

    @Override
    public String toString() {
        return "SaveNurse{" + "id=" + id + ", date_begin=" + date_begin + ", date_end=" + date_end + '}';
    }
    
}
