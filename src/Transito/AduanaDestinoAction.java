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


public class AduanaDestinoAction extends Action {
  public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
    AduanaDestinoForm bDestino = (AduanaDestinoForm)form;
    ActionMessages msg = new ActionMessages();

    if (cs == null)
      return mapping.findForward("usuario");

    try {
      if (bDestino.getOpcion() == 2) {
        return mapping.findForward("tramite");
      }

      switch (cs.getOpcion()) {
        case Ctte.eActa:
          ActaTnaForm acta = new ActaTnaForm(); 
          acta.setAduana(bDestino.getAduana());
          request.getSession().setAttribute("ActaTnaForm", acta);
          return mapping.findForward("acta");

        case Ctte.eHabilitaEmpresa:
          return mapping.findForward("habilita_empresa");

        case Ctte.eHabilitaMedio:
          return mapping.findForward("habilita_medio");
      }

      return mapping.findForward("pide_aduana");
    } catch (Exception e) {
      msg.add("error", new ActionMessage("error", e.getMessage()));

      return mapping.findForward("tramite");
    } finally {
      if (!msg.isEmpty()) {
        this.saveErrors(request, msg);
      }
    }
  }
}
