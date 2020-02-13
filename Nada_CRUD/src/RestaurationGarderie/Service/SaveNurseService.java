/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RestaurationGarderie.Service;

import RestaurationGarderie.IService.SaveNurseInterface;
import RestaurationGarderie.Utils.Database;
import RestaurationGarderie.entities.Menu;
import RestaurationGarderie.entities.SaveNurse;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nada
 */
public class SaveNurseService implements SaveNurseInterface<SaveNurse>
{
    private Connection con;
    private Statement ste;

    public SaveNurseService() {
        con = Database.getInstance().getConnection();
}

    @Override
    public SaveNurse getById(int id) throws SQLException {
        ste=con.createStatement();
        String query="select * from save_nurse where id="+id;
        ResultSet rs=ste.executeQuery(query);
        while(rs.next())
        {
            SaveNurse s;
            s = new SaveNurse(rs.getInt("id"),rs.getDate("date_begin"),rs.getDate("date_end"));
            return s;
        }
        return null;
    }

    @Override
    public Boolean exist(int id) throws SQLException {
         if(getById(id)!=null)
        {
            return true;
        }
        return false;
    }

    @Override
    public void ajouter(SaveNurse s) throws SQLException {
        ste = con.createStatement();
        String requeteInsert = "INSERT INTO `kindo`.`save_nurse` (`date_begin`, `date_end`) VALUES ( '" + s.getDate_begin()+ "', '" + s.getDate_end() + "');";
        ste.executeUpdate(requeteInsert);
    }

    @Override
    public boolean delete(int id) throws SQLException {
           ste=con.createStatement();
        String query="delete from save_nurse where id="+id;
        if(exist(id))
        {
            ste.execute(query);
            return true;
        }
        System.out.println("doesnt exist!!!!");
        return false; 

    }

    @Override
    public boolean update(int id, Date date_begin, Date date_end) throws SQLException {
        if(exist(id))
        {
        ste=con.createStatement();
         String query="UPDATE save_nurse set date_begin='"+date_begin+"',date_end='"+date_end+"' where id="+id;
         ste.execute(query);
         return true;
        }
        System.out.println("User does not exist");
        return false;
    }

    @Override
    public List<SaveNurse> readAll() throws SQLException {
 List<SaveNurse> arr=new ArrayList<>();
    ste=con.createStatement();
    ResultSet rs=ste.executeQuery("select * from save_nurse");
     while (rs.next()) {                
               int id=rs.getInt(1);
               Date date_begin=rs.getDate("date_begin");
               Date date_end=rs.getDate("date_end");

        
               SaveNurse s=new SaveNurse(id, date_begin, date_end);
     arr.add(s);
     }
    return arr;
    }
}

    
