package Controler;
import Containers.claseAhorro;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.*;
import javax.swing.JOptionPane;
/**
 *
 * @author alepuli
 */
public class claseAhorroDB {
    public static int insert(claseAhorro ahorro) {
   
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps;
        String query="INSERT INTO plan (id_user, nombre, mes, cantidad) VALUES (?,?,?,?)";
        try {
        ps = connection.prepareStatement(query);
        ps.setString(1, ahorro.getIdUser());
        ps.setString(2, ahorro.getNombre());
        ps.setDouble(4, ahorro.getCantidad());
        ps.setInt(3, ahorro.getMeses());
        
        int res = ps.executeUpdate();
        ps.close();
        
        return res;
        } catch (SQLException e) {
        e.printStackTrace();
        return 0;
    }}

    public static ResultSet sacaPlanEPA(String cod){
        Statement sta;
        ResultSet rs = null;

        try {
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection cnx = pool.getConnection();
            sta = cnx.createStatement();
            rs = sta.executeQuery("Select * from plan where id='"+cod+"'");
    }catch(Exception e){}
        return rs;
    }
    
    public static ResultSet sacaPlanLPA(String id){
        Statement sta;
        ResultSet rs = null;

        try {
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection cnx = pool.getConnection();
            sta = cnx.createStatement();
            rs = sta.executeQuery("select * from plan where id_user='"+id+"'");
            
    }catch(Exception e){}
        return rs;
    }
    
    public static int actualizaPlan(String name, String cant, String month, String cod){
        Statement sta;

        try {
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection cnx = pool.getConnection();
            sta = cnx.createStatement();
            sta.executeUpdate("UPDATE plan SET nombre='"+name+"',mes='"+month+"',cantidad='"+cant+"' WHERE id='"+cod+"'");
            
    }catch(Exception e){}
        return 0;
    }
    public static int borraPlan(String cod){
        Statement sta;
            try {
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection cnx = pool.getConnection();
            sta = cnx.createStatement();
            System.out.println(cod+" codigo");
            sta.executeUpdate("DELETE FROM plan WHERE id='"+cod+"'");
            
            }catch(Exception e){}
            return 0;
    }
}


