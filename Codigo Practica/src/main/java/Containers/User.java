package Containers;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.Serializable;

/**
 *
 * @author carlo
 */
public class User implements Serializable{
    private int id;
    private String nombre;
    private String apellidos;
    private String correo;
    private String contrasena;
    private String fecha;
    private String sexo;
    private String capital;
    private String ingreso;
    private String gasto;
    private String divisa;
    private int permisoGestionCorreo;
    private int permisoAppRelacionadas;
    private int permisoAnuncios;
    private int recomendado;
 
    
    public User(){
        id = 0;
        nombre = "";
        apellidos = "";
        correo="";
        contrasena="";
        fecha="";
        sexo="";
        ingreso="";
        capital="";
        gasto="";
        divisa="";
        permisoGestionCorreo=0;
        permisoAppRelacionadas=0;
        permisoAnuncios=0;
        recomendado=0;
    }

    public String getApellidos() {
        return apellidos;
    }

    public String getCapital() {
        return capital;
    }

    public String getContrasena() {
        return contrasena;
    }

    public String getCorreo() {
        return correo;
    }

    public String getGasto() {
        return gasto;
    }

    public String getIngreso() {
        return ingreso;
    }

    public String getNombre() {
        return nombre;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public void setCapital(String capital) {
        this.capital = capital;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setGasto(String gasto) {
        this.gasto = gasto;
    }

    public void setIngreso(String ingreso) {
        this.ingreso = ingreso;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getDivisa() {
        return divisa;
    }

    public void setDivisa(String divisa) {
        this.divisa = divisa;
    }

    public int getPermisoGestionCorreo() {
        return permisoGestionCorreo;
    }

    public void setPermisoGestionCorreo(int permisoGestionCorreo) {
        this.permisoGestionCorreo = permisoGestionCorreo;
    }

    public int getPermisoAppRelacionadas() {
        return permisoAppRelacionadas;
    }

    public void setPermisoAppRelacionadas(int permisoAppRelacionadas) {
        this.permisoAppRelacionadas = permisoAppRelacionadas;
    }

    public int getPermisoAnuncios() {
        return permisoAnuncios;
    }

    public void setPermisoAnuncios(int permisoAnuncios) {
        this.permisoAnuncios = permisoAnuncios;
    }

    public int getRecomendado() {
        return recomendado;
    }

    public void setRecomendado(int recomendado) {
        this.recomendado = recomendado;
    }
   
    @Override public String toString()
        {
        String mensaje = "\n"+"\nNombre: "+nombre+"\nApellidos: "+apellidos+"\nCorreo: "+correo+"\nContrsena: "+contrasena+"\nIngresos: "+ingreso
                +"\nGasto: "+gasto+"\nCapital: "+capital; 
        return mensaje;
        }
    
}