package Controler;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Containers.Movimiento;
import Controler.ConnectionPool;
import java.sql.*;

/**
 *
 * @author carlo
 */
public class MovimientoDB {
    public static int insert(Movimiento dato) {
   
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query="INSERT INTO movimiento (id_user, tipoPago, concepto, fecha, cantidad) VALUES (?,?,?,?,?)";
        try {
        ps = connection.prepareStatement(query);
        ps.setString(1, dato.getId_User());
        ps.setString(2, dato.getTipo());
        ps.setString(3, dato.getConcepto());
        ps.setString(4, dato.getFecha());
        ps.setString(5, dato.getCantidad());
        
        int res = ps.executeUpdate();
        ps.close();
        
        return res;
        } catch (SQLException e) {
        e.printStackTrace();
        return 0;
        }
    }
    
    //Metodo que obtiene todos los datos de un movimiento para la clase ingresaMov
    public static ResultSet selectMovimientos(String id) {
        Statement sta;
        ResultSet rs = null;

        try {
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection cnx = pool.getConnection();
            sta = cnx.createStatement();

            rs = sta.executeQuery("select * from movimiento where id_user='" + id + "'");
        } catch (Exception e) {
        }
        return rs;
    }

    //Metodo que obtiene Tipo de pago, concepto y cantidad de un movimiento para el resumen
    public static ResultSet selectMovimientosResumen(String id) {
        Statement sta;
        ResultSet rs = null;

        try {
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection cnx = pool.getConnection();
            sta = cnx.createStatement();

            rs = sta.executeQuery("SELECT TIPOPAGO, CONCEPTO, CANTIDAD FROM MOVIMIENTO " + "where id_user = " + "'" + id + "'");
        } catch (Exception e) {
        }
        return rs;
    }
 }