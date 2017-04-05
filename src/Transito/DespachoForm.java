package Transito;

import org.apache.struts.action.ActionForm;

public class DespachoForm extends ActionForm {
  private String aduana = "";
  private String gestion = "";
  private String registro = "";
  private String lista = "";
  private int opcion = 0;

  public void setAduana(String aduana) {
    this.aduana = aduana;
  }

  public String getAduana() {
    return aduana;
  }

  public void setGestion(String gestion) {
    this.gestion = gestion;
  }

  public String getGestion() {
    return gestion;
  }

  public void setRegistro(String registro) {
    this.registro = registro;
  }

  public String getRegistro() {
    return registro;
  }

  public void setLista(String lista) {
    this.lista = lista;
  }

  public String getLista() {
    return lista;
  }

  public void setOpcion(int opcion) {
    this.opcion = opcion;
  }

  public int getOpcion() {
    return opcion;
  }
}
