package VariableRiesgo;


import java.io.IOException;

import java.text.SimpleDateFormat;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.MappingDispatchAction;


public class ReporteRiesgoAction extends MappingDispatchAction {

    private final ReporteRiesgoNeg neg = new ReporteRiesgoNeg();
   
   
   
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    
        ReporteRiesgoForm bean = (ReporteRiesgoForm)request.getAttribute("ReporteRiesgoForm");
        
         String usuario = (String)request.getSession().getAttribute("user.nick");
            String link = "registroVR";
            String res;
            if (usuario != null) {
                bean.setUsuario(usuario);
                bean.setSw_reporte("mostrar");
                if (bean.getBoton().equals("reporte1")) {                  
                    link = "reporteA";
                }
                if (bean.getBoton().equals("reporte2")) {                  
                    link = "reporteR";
                }
                if (bean.getBoton().equals("reporte3")) {                  
                    link = "reporteV";
                }
                if (bean.getBoton().equals("reporte4")) {                  
                    link = "reporteCR";
                }
                if (bean.getBoton().equals("reporte5")) {                  
                    link = "reporteCAR";
                }
                if (bean.getBoton().equals("reporte6")) {                  
                    link = "reporteCAV";
                }                
            }
       
        else {
                        link = "inicio";
                    }
        return mapping.findForward(link);
    }
    
}
