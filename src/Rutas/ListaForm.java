package Rutas;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;


public class ListaForm extends ActionForm {
  private short opcion = 0;
  private String boton = "";
  private String script = "";
  private String codigo = "";
  private String aduana = "";
  private String hrs = "";
  private String tiptra = "";

  public void reset(ActionMapping mapping, HttpServletRequest request) {
    super.reset(mapping, request);
  }

  public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
    return super.validate(mapping, request);
  }

  public short getOpcion() {
    return opcion;
  }

  public void setOpcion(short newOpcion) {
    opcion = newOpcion;
  }

  public String getBoton() {
    return boton;
  }

  public void setBoton(String newBoton) {
    boton = newBoton;
  }

  public String getScript() {
    return script;
  }

  public void setScript(String newScript) {
    script = newScript;
  }

  public String getCodigo() {
    return codigo;
  }

  public void setCodigo(String newCodigo) {
    codigo = newCodigo;
  }

  public String getAduana() {
    return aduana;
  }

  public void setAduana(String newAdupar) {
    aduana = newAdupar;
  }

  public String getHrs() {
    return hrs;
  }

  public void setHrs(String newHrs) {
    hrs = newHrs;
  }

  public String getTiptra() {
    return tiptra;
  }

  public void setTiptra(String newTiptra) {
    tiptra = newTiptra;
  }
}
