package Transito;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;


public class ActaTnaForm extends ActionForm {
  private ClaseLista[] lista;
  private int opcion = 0;
  private String placa = "";
  private String aduana;

  public void reset(ActionMapping mapping, HttpServletRequest request) {
    super.reset(mapping, request);
  }

  public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
    return super.validate(mapping, request);
  }

  public int getOpcion() {
    return opcion;
  }

  public void setOpcion(int newOpcion) {
    opcion = newOpcion;
  }

  public String getPlaca() {
    return placa;
  }

  public void setPlaca(String newPlaca) {
    placa = newPlaca;
  }

  public ClaseLista[] getLista() {
    return lista;
  }

  public void setLista(ClaseLista[] newLlista) {
    lista = newLlista;
  }

  public ClaseLista getLista(int index) {
    return lista[index];
  }

  public void setLista(ClaseLista newLopcion, int i) {
    lista[i] = newLopcion;
  }

  public void setLista(int i) {
    lista = new ClaseLista[i];
  }

    public void setAduana(String aduana) {
        this.aduana = aduana;
    }

    public String getAduana() {
        return aduana;
    }
}
