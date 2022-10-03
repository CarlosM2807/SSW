package Containers;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.Serializable;

/**
 *
 * @author alepuli
 */
public class claseAhorro implements Serializable{
    private String idUser;
    private String nombre;
    private double cantidad;
    private int meses;
    
    public claseAhorro() {
        idUser = "";
        nombre = "";
        cantidad =0;
        meses =0;
    }
    
    public claseAhorro(String idUser, String nombre, Double cantidad, int meses ) {
        this.idUser = idUser;
        this.nombre = nombre;
        this.cantidad = cantidad;
        this.meses = meses;
    }

    public String getIdUser() {
        return idUser;
    }
    
    
    public String getNombre() {
        return nombre;
    }
    
    public Double getCantidad() {
        return cantidad;
    }
    
    public int getMeses(){
        return meses;
    }
    
    public void setNombre(String nombre) {
        this.nombre=nombre;
    }
   
    public void setCantidad(double cantidad) {
        this.cantidad = cantidad;
    }

    public void setMeses(int meses) {
        this.meses = meses;
    }

    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }
    
}