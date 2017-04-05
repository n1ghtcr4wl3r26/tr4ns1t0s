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


public class ActaTnaAction extends Action {
  public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
    ActaTnaForm bActa = (ActaTnaForm)form;
    ActionMessages msg = new ActionMessages();

    if (cs == null) {
      return mapping.findForward("usuario");
    }

    try {
      ClaseSql sql = new ClaseSql();

      switch (bActa.getOpcion()) {
        case Ctte.btnCancela:
          request.getSession().removeAttribute("ActaForm");

          break;

        case Ctte.btnAcepta:
          sql.pAccesoDatos(request, Ctte.dbGrabaActaTna);
          msg.add("error", new ActionMessage("bien", "Se grab&oacute; correctamente los datos."));

          break;
      }

      cs.setOpcion(Ctte.eInicio);

      return mapping.findForward("tramite");
    } catch (Exception e) {
      msg.add("error", new ActionMessage("bien", e.getMessage()));

      return mapping.findForward("acta");
    } finally {
      if (!msg.isEmpty()) {
        this.saveErrors(request, msg);
      }
    }
  }
}
