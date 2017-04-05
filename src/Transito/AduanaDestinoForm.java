package Transito;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;


public class AduanaDestinoForm extends ActionForm {
  private String aduana = "";
  private int opcion = 0;

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

  public int getOpcion() {
    return opcion;
  }

  public void setOpcion(int newOpcion) {
    opcion = newOpcion;
  }
}
