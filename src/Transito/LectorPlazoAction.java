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


public class LectorPlazoAction extends Action {
  public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    LectorForm bForm = (LectorForm)form;
    ActionMessages msg = new ActionMessages();
    ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
    request.getSession().setAttribute("LectorForm", bForm);

    if (cs == null) {
      return mapping.findForward("usuario");
    }

    ClaseSql sql = new ClaseSql();

    try {
        
      if (bForm.getOpcion() == 0) {
          if(!bForm.getEtiqueta().equals("")){
            TransitoTag tag = new TransitoTag(bForm.getEtiqueta());
            sql.pAccesoDatos(request, Ctte.dbVerificaPlazoEtiqueta);
            cs.setPlazoEtiqueta(1);
            return mapping.findForward("plazo.etiqueta");
          }else{
              TramiteForm bTramite = new TramiteForm();
              request.setAttribute("TramiteForm", bTramite);
              bTramite.setAduana(bForm.getAduana());
              bTramite.setGestion(bForm.getGestion());
              bTramite.setRegistro(bForm.getRegistro());
              sql.getConexion();
              sql.fEstadoTramite(request);
              cs.setPlazoEtiqueta(1);
              return mapping.findForward("plazo.etiqueta");
          }
      }
      if (bForm.getOpcion() == 1) {
          sql.pAccesoDatos(request, Ctte.dbGrabaPlazoEtiqueta);
          cs.setPlazoEtiqueta(0);
          msg.add("error", new ActionMessage("bien", "Se grab&oacute; correctamente la fecha de inicio."));
          //request.getSession().removeAttribute("AsignaRutaForm");
      }
      
    } catch (Exception e) {
      msg.add("error", new ActionMessage("error", "No se grab&oacute; los datos ingresados."));
      msg.add("error", new ActionMessage("error", e.getMessage()));

      return mapping.findForward("plazo.etiqueta");
    } finally {
      if (!msg.isEmpty()) {
        this.saveErrors(request, msg);
      }
        sql.getClose();
    }

    return mapping.findForward("plazo.etiqueta");
  }
}
