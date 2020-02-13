/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nada_crud;

import RestaurationGarderie.Service.MenuService;
import RestaurationGarderie.Service.SaveNurseService;
import RestaurationGarderie.entities.Menu;
import RestaurationGarderie.entities.SaveNurse;
import java.sql.SQLException;
import java.util.List;
import java.sql.Date;


/**
 *
 * @author nada
 */
public class Nada_CRUD {

    
    public static void main(String[] args)  {
       
     
        String str="2020-01-22";      
        Date date=Date.valueOf(str);//converting string into sql date  
        
        String str2="2021-05-23";  
        Date date2=Date.valueOf(str2);
        
        SaveNurseService ser = new SaveNurseService();
    
        try {
            
         
            SaveNurse s=new SaveNurse(1,date,date2);
            ser.ajouter(s);
            //ser.ajouter(m1);//WORKS
            //ser.ajouter(m2);//WORKS
            //ser.update(4,date,"kosksi","slata","makrouna");//WORKS
           // ser.delete(4);//WORKS
            //ser.ajouter(m2);//WORKS
            //ser.ajouter(s1);//WORKS
            //ser.update(1, date2, date); //WORKS
            //ser.delete(1);//WORKS
           
            List<SaveNurse> list = ser.readAll();
            System.out.println(list);
           
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        
    }
    
}
