package Containers;

import java.io.Serializable;

/**
 *
 * @author alons
 */
public class Comentario implements Serializable{
    private String idUsuario;
    private String comentario;
    private String fecha;
    
    public Comentario(){
        idUsuario = "";
        comentario = "";
        fecha = "";
    }

    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

}
