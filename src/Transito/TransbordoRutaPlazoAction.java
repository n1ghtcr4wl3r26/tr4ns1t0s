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

public class TransbordoRutaPlazoAction extends Action {
  public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    TransbordoRutaPlazoForm bCierra = (TransbordoRutaPlazoForm)form;
    ActionMessages msg = new ActionMessages();

    ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");

    if (cs == null)
      return mapping.findForward("usuario");

    if (bCierra.getAccion() == Ctte.btnCancela) {
      return mapping.findForward("tramite");
    }

    try {
      ClaseSql sql = new ClaseSql();
        
        
      sql.pAccesoDatos(request, Ctte.dbGrabaTransbordoRutaPlazo);
      
      
      
      msg.add("error", new ActionMessage("bien", "Se grab&oacute; correctamente los datos. <br>El N&uacute;mero de Manifiesto es: <font color='#FF0000'><strong>" + bCierra.getHoras() + "</strong></font>"));
      cs.setBreporte(true);

      /* prueba de envio a iniico de transito*/
      cs.setKey_year(bCierra.getManyear());  
      cs.setKey_cuo(bCierra.getMancuo());  
      cs.setKey_nber(bCierra.getMannber());  
      cs.setOpcion(Short.parseShort("1"));  
      TramiteForm tram = new TramiteForm();
      tram.setGestion(bCierra.getManyear());  
      tram.setAduana(bCierra.getMancuo());   
      tram.setSaduana(bCierra.getMancuo());  
      tram.setRegistro(bCierra.getMannber());
        
      tram.setTna(false);  
      
      request.setAttribute("TramiteForm", tram); 
      request.getSession().setAttribute("TramiteForm", tram);

      /*
        AsignaRutaPlazoForm asig = new AsignaRutaPlazoForm();
        asig.setPre1("hola");
        asig.setObs("mundo");
        request.setAttribute("AsignaRutaPlazoForm", asig);
      */
      return mapping.findForward("tramitedo");
    } catch (Exception e) {
      msg.add("error", new ActionMessage("error", "No termino la operaci&oacute;n correctamente"));
      msg.add("error", new ActionMessage("error", e.getMessage()));

      return mapping.findForward("transbordo");
    } finally {
      if (!msg.isEmpty()) {
        this.saveErrors(request, msg);
      }
    }
  }
}
