package Main;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;


public class MenuForm extends ActionForm {
  private short etapa = Ctte.eLogin;

  public void reset(ActionMapping mapping, HttpServletRequest request) {
    super.reset(mapping, request);
  }

  public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
    return super.validate(mapping, request);
  }

  public short getEtapa() {
    return etapa;
  }

  public void setEtapa(short newEtapa) {
    etapa = newEtapa;
  }
}
