package Transito;

import org.apache.struts.action.ActionForm;


public class LectorForm extends ActionForm {
  private String etiqueta = "";
  private int opcion = 0;
    private String aduana = "";
    private String gestion = "";
    private String registro = "";
    private String peso = "";

  public String getEtiqueta() {
    return etiqueta;
  }

  public void setEtiqueta(String newEtiqueta) {
    etiqueta = newEtiqueta;
  }

  public int getOpcion() {
    return opcion;
  }

  public void setOpcion(int newOpcion) {
    opcion = newOpcion;
  }

    public String getAduana() {
        return aduana;
    }

    public void setAduana(String aduana) {
        this.aduana = aduana;
    }

    public String getGestion() {
        return gestion;
    }

    public void setGestion(String gestion) {
        this.gestion = gestion;
    }

    public String getRegistro() {
        return registro;
    }

    public void setRegistro(String registro) {
        this.registro = registro;
    }

    public String getPeso() {
        return peso;
    }

    public void setPeso(String peso) {
        this.peso = peso;
    }
}
