package Rutas;


import Main.ClaseSession;
import Main.Ctte;

import Transito.ClaseSql;

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


public class RutaAction extends Action {
  public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    RutaForm bRuta = (RutaForm)form;
    ActionMessages msg = new ActionMessages();

    ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
    if (cs == null) {
      return mapping.findForward("usuario");
    }

    if (bRuta.getOpcion() == Ctte.btnCancela) {
      return mapping.findForward("lista");
    }

    try {
      ClaseSql sql = new ClaseSql();
      if(bRuta.getP_rou_ter().equals("0"))
      {
              msg.add("error", new ActionMessage("error", "El Tiempo de Recorrido no puede ser igual a 0"));
              request.getSession().setAttribute("eireport", "El Tiempo de Recorrido no puede ser igual a 0");

              return mapping.findForward("ruta");
          }
        else
      {
      sql.pAccesoDatos(request, Ctte.dbAnadeRutaPlazo);
      msg.add("error", new ActionMessage("bien", "Se grab&oacute; correctamente los datos."));

      return mapping.findForward("lista");
      }
    } catch (Exception e) {
      msg.add("error", new ActionMessage("error", e.getMessage()));
      request.getSession().setAttribute("eireport", e.getMessage());

      return mapping.findForward("ruta");
    } finally {
      if (!msg.isEmpty()) {
        this.saveErrors(request, msg);
      }
    }
  }
}
