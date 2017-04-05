package Transito;


import Main.ClaseSession;
import Main.Ctte;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;


public class CierraRutaPlazoAction extends Action {
  public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    CierraRutaPlazoForm bCierra = (CierraRutaPlazoForm)form;
    ActionMessages msg = new ActionMessages();

    ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");

    if (cs == null)
      return mapping.findForward("usuario");

    if (bCierra.getAccion() == Ctte.btnCancela) {
        TramiteForm tram = new TramiteForm();
        tram.setDeposito((String)request.getSession().getAttribute("deposito"));
        request.setAttribute("TramiteForm", tram);
      return mapping.findForward("tramite");
    }

    try {
      ClaseSql sql = new ClaseSql();
      sql.pAccesoDatos(request, Ctte.dbGrabaCierreRutaPlazo);
      msg.add("error", new ActionMessage("bien", "Se grab&oacute; correctamente los datos. <br>El N&uacute;mero de Manifiesto es: <font color='#FF0000'><strong>" + bCierra.getHoras() + "</strong></font>"));
      cs.setBreporte(true);

      return mapping.findForward("tramite");
    } catch (Exception e) {
      msg.add("error", new ActionMessage("error", "No termino la operaci&oacute;n correctamente"));
      msg.add("error", new ActionMessage("error", e.getMessage()));

      return mapping.findForward("cierra");
    } finally {
      if (!msg.isEmpty()) {
        this.saveErrors(request, msg);
      }
    }
  }
}
