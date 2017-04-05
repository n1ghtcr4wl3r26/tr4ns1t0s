package DepositoTrans;

import org.apache.struts.action.ActionForm;

public class RegistroDepositoForm extends ActionForm {
   
      private String nit;
      private String nro_res;
      private String distancia;
      private String tiempo;
      private String boton;
      private String coddeposito;
      private String codusu;


    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getNit() {
        return nit;
    }

    public void setNro_res(String nro_res) {
        this.nro_res = nro_res;
    }

    public String getNro_res() {
        return nro_res;
    }

    public void setDistancia(String distancia) {
        this.distancia = distancia;
    }

    public String getDistancia() {
        return distancia;
    }

    public void setTiempo(String tiempo) {
        this.tiempo = tiempo;
    }

    public String getTiempo() {
        return tiempo;
    }

    public void setBoton(String boton) {
        this.boton = boton;
    }

    public String getBoton() {
        return boton;
    }

    public void setCodusu(String codusu) {
        this.codusu = codusu;
    }

    public String getCodusu() {
        return codusu;
    }

    public void setCoddeposito(String coddeposito) {
        this.coddeposito = coddeposito;
    }

    public String getCoddeposito() {
        return coddeposito;
    }
}

