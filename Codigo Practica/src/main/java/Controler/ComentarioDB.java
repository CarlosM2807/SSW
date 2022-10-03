/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controler;

import java.sql.*;
import Containers.Comentario;
/**
 *
 * @author alons
 */
public class ComentarioDB {
     public static int nuevoComentario(Comentario com){
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query="INSERT INTO Comentario(id_user,fecha,coment) VALUES(?,?,?);";
        
        try {
        ps = connection.prepareStatement(query);
        ps.setString(1, com.getIdUsuario());
        ps.setString(2, com.getFecha());
        ps.setString(3, com.getComentario());
        
        int res = ps.executeUpdate();
        ps.close();
        
        return res;
        } catch (SQLException e) {
        e.printStackTrace();
        return 0;
        }
    }
}
