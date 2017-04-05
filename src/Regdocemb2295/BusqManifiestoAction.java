package Regdocemb2295;

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


public class BusqManifiestoAction extends Action {
    
  public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
    
    
    BusqManifiestoForm bman = (BusqManifiestoForm)form;
    ActionMessages msg = new ActionMessages();

    if (cs == null) {
      return mapping.findForward("usuario");
    }
    if( bman.getFila()==0){
     request.setAttribute("pFila",0);
    }else{
            request.setAttribute("pFila",bman.getFila());
        }
    try {
      ClaseSqlmanif sql = new ClaseSqlmanif();

        String ans = "";
        String direccion = "busq_manifiesto";
        
        if (bman.getAopcion() == Ctte.eAplicacionDS2295) {
            ans = sql.pReadDataBase(request, Ctte.btbuscarManif);
            if (!ans.equals("")) {
                msg.add("error", new ActionMessage("error", ans));
                
                saveErrors(request, msg);
                direccion = "busq_manifiesto";
            } else {
                request.getSession().setAttribute("refaduana", bman.getRefaduanasel());
                request.getSession().setAttribute("reffecha", bman.getReffechaSalida());
                request.getSession().setAttribute("refnber", bman.getRefnroViaje());
                
                request.getSession().setAttribute("regaduana", bman.getRegaduanasel());
                request.getSession().setAttribute("reggestion", bman.getReggestion());
                request.getSession().setAttribute("regnumero", bman.getRegnroRegistro());
                
                request.getSession().setAttribute("tipo", bman.getTipo());
                
                direccion = "reg_inf_docemq";
            }
        }

        //request.setAttribute("pFila",bman.getFila());
        
        //para volver al formulario de registro de doc emb 
        if (bman.getOpcion() == 3 )
        {
            request.setAttribute("pFila",bman.getFila());   
                direccion = "reg_inf_docemq";
        }
        
        //para volver al formulario de registro de doc emb 
        if ( bman.getOpcion() == 1)
        {
            request.setAttribute("pFila",0);   
                direccion = "reg_inf_docemq";
        }
        
        
        //graba docemb        
        if (bman.getOpcion() == 4)
        {
                ans = sql.pReadDataBase(request, Ctte.btgrabaDocemb);
                if (!ans.equals("")) {
                    msg.add("error", new ActionMessage("error", ans));
                    
                    saveErrors(request, msg);
                    direccion = "reg_inf_docemq";
                } else {
                    request.getSession().setAttribute("refaduana", bman.getRefaduanasel());
                    request.getSession().setAttribute("reffecha", bman.getReffechaSalida());
                    request.getSession().setAttribute("refnber", bman.getRefnroViaje());
                    
                    request.getSession().setAttribute("regaduana", bman.getRegaduanasel());
                    request.getSession().setAttribute("reggestion", bman.getReggestion());
                    request.getSession().setAttribute("regnumero", bman.getRegnroRegistro());
                    
                    request.getSession().setAttribute("tipo", bman.getTipo());
                    
                    direccion = "reg_inf_docemq";
                }
            
            
            
            }
        
        //graba autorizacion del manifiesto        
        if (bman.getOpcion() == 8)
        {
                ans = sql.pReadDataBase(request, Ctte.btgrabamanif);
                if (!ans.equals("")) {
                    msg.add("error", new ActionMessage("error", ans));
                    
                    saveErrors(request, msg);
                    direccion = "reg_inf_docemq";
                } else {
                    msg.add("error", new ActionMessage("bien", "Se grab&oacute; correctamente la aplicaci&oacute;n Control de Documento de Embarque del manifiesto."));                   
                    direccion = "busq_manifiesto";
                }
            
            
            }     
        
        //graba la no autorizacion del ds2295        
        if (bman.getOpcion() == 9)
        {
                ans = sql.pReadDataBase(request, Ctte.btgrabamanofnoaut);
                if (!ans.equals("")) {
                    msg.add("error", new ActionMessage("error", ans));
                    
                    saveErrors(request, msg);
                    direccion = "reg_inf_docemq";
                } else {
                    msg.add("error", new ActionMessage("bien", "Se grab&oacute; correctamente la no aplicaci&oacute;n Control de Documento de Embarque del manifiesto."));                   
                    direccion = "busq_manifiesto";
                }
            
            
         }
        
        //graba la autorizacion previa del documento de embarque        
        if (bman.getOpcion() == 25){
            ans = sql.pReadDataBase(request, 25);      
            if (!ans.equals("")) {
                msg.add("error", new ActionMessage("error", ans));
                
                saveErrors(request, msg);
                direccion = "reg_inf_docemq";
            } else {
                msg.add("error", new ActionMessage("bien", "Se grab&oacute; correctamente la Autorizaci&oacute;n Previa del Documento de Embarque."));                   
                direccion = "reg_inf_docemq";
            }
        }
        
        
      return mapping.findForward(direccion);
    } catch (Exception e) {
      msg.add("error", new ActionMessage("error", e.getMessage()));

      return mapping.findForward("acta");
    } finally {
      if (!msg.isEmpty()) {
        this.saveErrors(request, msg);
      }
    }
  }
  
}



