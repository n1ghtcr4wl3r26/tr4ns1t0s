package Transito;


import Etiqueta.TransitoTag;

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


public class LectorAction extends Action {
  public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    LectorForm bForm = (LectorForm)form;
    ActionMessages msg = new ActionMessages();
    ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");

    if (cs == null) {
      return mapping.findForward("usuario");
    }

    ClaseSql sql = new ClaseSql();

    try {
      TransitoTag tag = new TransitoTag(bForm.getEtiqueta());

      sql.pAccesoDatos(request, Ctte.dbVerificaEtiqueta);

      if (bForm.getOpcion() == 0) {
        return mapping.findForward("ruta");
      }

      msg.add("error", new ActionMessage("bien", "Se grab&oacute; correctamente los datos."));

      if (cs.getOpcion() == Ctte.ePasoPtoCtl) {
        cs.setResumen(false);
        cs.setResumen2(true);
      } else {
        cs.setResumen(true);
        cs.setResumen2(false);
      }

      request.getSession().removeAttribute("AsignaRutaForm");
    } catch (Exception e) {
      msg.add("error", new ActionMessage("error", "No se grab&oacute; los datos ingresados."));
      msg.add("error", new ActionMessage("error", e.getMessage()));

      return mapping.findForward("paso.etiqueta");
    } finally {
      if (!msg.isEmpty()) {
        this.saveErrors(request, msg);
      }
    }

    return mapping.findForward("paso.etiqueta");
  }
}
