package Transito;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;


public class TramiteForm extends ActionForm {
  private String aduana = "";
  private String gestion = "";
  private String registro = "";
  private String saduana = "";
  private boolean tna = false;
  private String deposito = "";

  public void reset(ActionMapping mapping, HttpServletRequest request) {
    super.reset(mapping, request);
  }

  public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
    return super.validate(mapping, request);
  }

  public String getAduana() {
    return aduana;
  }

  public void setAduana(String newAduana) {
    aduana = newAduana;
  }

  public String getGestion() {
    return gestion;
  }

  public void setGestion(String newViaje) {
    gestion = newViaje;
  }

  public String getRegistro() {
    return registro;
  }

  public void setRegistro(String newFecha) {
    registro = newFecha;
  }

  public String getSaduana() {
    return saduana;
  }

  public void setSaduana(String newSaduana) {
    saduana = newSaduana;
  }

  public boolean isTna() {
    return tna;
  }

  public void setTna(boolean newTna) {
    tna = newTna;
  }

    public void setDeposito(String deposito) {
        this.deposito = deposito;
    }

    public String getDeposito() {
        return deposito;
    }
}
