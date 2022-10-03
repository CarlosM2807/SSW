package Controler;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.*;
import Containers.User;
/**
 *
 * @author carlo
 */
public class UserDB {
    public static int updateUsuario(User usuario, String id){
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query="UPDATE usuario SET nombre=?, email=?, passwd=?, sexo=?, fecha_nacimiento=? WHERE id=?";
        
        try {
        ps = connection.prepareStatement(query);
        ps.setString(1, usuario.getNombre());
        ps.setString(2, usuario.getCorreo());
        ps.setString(3, usuario.getContrasena());
        ps.setString(4, usuario.getSexo());
        ps.setString(5, usuario.getFecha());
        ps.setString(6, id);

        
        int res = ps.executeUpdate();
        ps.close();
        
        return res;
        } catch (SQLException e) {
        e.printStackTrace();
        return 0;
        }
    }
    
    public static int updateDatosEconomicos(User usuario, String id){
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "UPDATE usuario SET capital_inic=?, ingreso_mensual=?, gasto_mensual=? WHERE id=?";
        
        try{
            ps = connection.prepareStatement(query);
            ps.setString(1, usuario.getCapital());
            ps.setString(2, usuario.getIngreso());
            ps.setString(3, usuario.getGasto());
            ps.setString(4, id);
            
            int res = ps.executeUpdate();
            ps.close();
            
            return res;
            
        }catch (SQLException e){
            e.printStackTrace();
            return 0;
        }
    }
    
    public static int updatePermisos(User usuario, String id){
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query="UPDATE usuario SET gestion_correo=?, correo_app_relacion=?, anuncios=?, recomendacion=? WHERE id=?";
        
        try {
        ps = connection.prepareStatement(query);
        ps.setString(1, Integer.toString(usuario.getPermisoGestionCorreo()));
        ps.setString(2, Integer.toString(usuario.getPermisoAppRelacionadas()));
        ps.setString(3, Integer.toString(usuario.getPermisoAnuncios()));
        ps.setString(4, Integer.toString(usuario.getRecomendado()));
        ps.setString(5, id);

        
        int res = ps.executeUpdate();
        ps.close();
        
        return res;
        } catch (SQLException e) {
        e.printStackTrace();
        return 0;
        }
    }
    
    public static int updateDivisa(User usuario, String id){
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query="UPDATE usuario SET divisa=? WHERE id=?";
        
        try {
        ps = connection.prepareStatement(query);
        ps.setString(1, usuario.getDivisa());
        ps.setString(2, id);
        
        int res = ps.executeUpdate();
        ps.close();
        
        return res;
        } catch (SQLException e) {
        e.printStackTrace();
        return 0;
        }
    }
    
    
    public static int insert(User user) {
   
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query="INSERT INTO usuario (nombre, apellidos,email, passwd, capital_inic, ingreso_mensual,gasto_mensual) VALUES (?,?,?,?,?,?,?)";
        try {
        ps = connection.prepareStatement(query);
        ps.setString(1, user.getNombre());
        ps.setString(2, user.getApellidos());
        ps.setString(3, user.getCorreo());
        ps.setString(4, user.getContrasena());
        ps.setString(5, user.getCapital());
        ps.setString(6, user.getIngreso());
        ps.setString(7, user.getGasto());

        
        int res = ps.executeUpdate();
        ps.close();
        
        return res;
        } catch (SQLException e) {
        e.printStackTrace();
        return 0;
    }}
    
    public static boolean emailExists(String emailAddress) throws Exception {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        System.out.println("*********************************"+emailAddress);
        String query = "SELECT EMAIL FROM usuario "+
                "WHERE email = ?";
        
        try {  
            ps = connection.prepareStatement(query);
            ps.setString(1, emailAddress);
            rs = ps.executeQuery();
            boolean res = rs.next();
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return res;

            } catch (SQLException e) {
            e.printStackTrace();
            return false;
           }
       }
    
    
    public static boolean userExists(String user, String password) throws Exception {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;
        ResultSet rs = null;
        ResultSet rs2 = null;
        
        
        String query = "SELECT email FROM usuario "+
                "WHERE email = ?";
        String query2 = "SELECT passwd FROM usuario "+
                "WHERE passwd = ?";
        try {  
            ps = connection.prepareStatement(query);
            ps2 = connection.prepareStatement(query2);
            ps.setString(1, user);
            ps2.setString(1, password);
            rs = ps.executeQuery();
            rs2 = ps2.executeQuery();
            boolean res = rs.next();
            rs.close();
            ps.close();
            boolean res2 = rs2.next();
            rs2.close();
            ps2.close();
            
            pool.freeConnection(connection);
            if(res2  == true){
                return res;
            }
            } catch (SQLException e) {
            e.printStackTrace();
            return false;
           }
        return false;
       }
    
    public static User selectUser(String id) {
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement ps = null;
            ResultSet rs = null;
            String query = "SELECT * FROM usuario WHERE id=?";
            try {
                ps = connection.prepareStatement(query);
                ps.setString(1, id);
                rs = ps.executeQuery();
                User user = null;
                if (rs.next()) {
                    user = new User();
                    user.setNombre(rs.getString("nombre"));
                    user.setApellidos(rs.getString("apellidos"));
                    user.setFecha(rs.getString("fecha_nacimiento"));
                    user.setCorreo(rs.getString("email"));
                    user.setContrasena(rs.getString("passwd"));
                    user.setCapital(rs.getString("capital_inic"));
                    user.setIngreso(rs.getString("ingreso_mensual"));
                    user.setGasto(rs.getString("gasto_mensual"));
                    user.setSexo(rs.getString("sexo"));
                    user.setDivisa(rs.getString("divisa"));
                    user.setPermisoGestionCorreo(rs.getInt("gestion_correo"));
                    user.setPermisoAppRelacionadas(rs.getInt("correo_app_relacion"));
                    user.setPermisoAnuncios(rs.getInt("anuncios"));
                    user.setRecomendado(rs.getInt("recomendacion"));
                    
                    System.out.println("Otra vez usuario: "+user.toString());
                }
                rs.close();
                ps.close();
                user.toString();
                return user;
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            } 
    }  
    public static String selectUserByEmailPasswd(String usuario, String passwd) {
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement ps = null;
            ResultSet rs = null;
            String query = "SELECT id FROM usuario WHERE email=? AND passwd=?";
            try {
                ps = connection.prepareStatement(query);
                ps.setString(1, usuario);
                ps.setString(2, passwd);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return rs.getString("id");
                }
                rs.close();
                ps.close();
                return null;
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            } 
    }
    
    //Obtenemos el usuario en forma de Result set
    public static ResultSet sacaUsuarioRS(String id){
        Statement sta;
        ResultSet rs = null;

        try {
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection cnx = pool.getConnection();
            sta = cnx.createStatement();
            rs = sta.executeQuery("SELECT * FROM usuario "+"where id = "+"'"+id+"'");
    }catch(Exception e){}
        return rs;
    }
    

    

}
