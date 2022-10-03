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
public class Movimiento implements Serializable{
    private String id_user;
    private String tipo;
    private String concepto;
    private String fecha;
    private String cantidad;
 
    
    public Movimiento(){
        id_user = "";
        tipo = "";
        concepto ="";
        fecha="";
        cantidad="";
    }
    
     public Movimiento(String id_user, String tipo, String  concepto, String fecha, String cantidad){
        this.id_user = id_user;
        this.tipo = tipo;
        this.concepto = concepto;
        this.fecha = fecha;
        this.cantidad = cantidad;
    }
    
      public String getId_User() {
        return id_user;
    }

  
     
     
    public String getCantidad() {
        return cantidad;
    }

    public String getConcepto() {
        return concepto;
    }

    public String getFecha() {
        return fecha;
    }

    public String getTipo() {
        return tipo;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public void setConcepto(String concepto) {
        this.concepto = concepto;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public void setId_user(String id_user) {
        this.id_user = id_user;
    }
    

     
    
   
    @Override public String toString()
        {
        String mensaje = "\n"+"\nTipo: "+tipo+"\nConcepto: "+concepto+"\nFecha: "+fecha+"\nCantidad: "+cantidad;
        return mensaje;
        }

  
}