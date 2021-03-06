/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nadaproject.Gui;

import NadaProject.Service.SaveNurseService;
import NadaProject.entities.SaveNurse;
import java.net.URL;
import java.sql.SQLException;
import java.util.Optional;
import java.util.ResourceBundle;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;

/**
 * FXML Controller class
 *
 * @author nada
 */
public class AddNurseryController implements Initializable {

    @FXML
    private TextField idF;
    @FXML
    private TextField startF;
    @FXML
    private TextField endF;
    @FXML
    private Button submitbtn;

    /**
     * Initializes the controller class.
     * @param url
     * @param rb
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {

        
// TODO
    }    

    @FXML
    private void ajouterSubNurs(MouseEvent event) throws SQLException {

 if(idF.getText().isEmpty()||startF.getText().isEmpty()||endF.getText().isEmpty())                   
 {
            Alert e=new Alert(Alert.AlertType.WARNING);
            e.setTitle("Error, You can't Add");
            e.setHeaderText(null);
            e.setContentText("Please complete all fields !");
            Optional <ButtonType> action = e.showAndWait();
        }
        else{
            String id1 = idF.getText();
            String date_begin = startF.getText();
            String date_end = endF.getText();
     
            int id = Integer.parseInt(id1);
            SaveNurseService cs = new SaveNurseService();
            SaveNurse a = new  SaveNurse(id,date_begin,date_end);
            cs.ajouter(a);
            System.out.println("YAY");

        }
    
     }
    
}
