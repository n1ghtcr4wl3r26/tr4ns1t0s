package DepositoTrans;

import Digitalizacion.DigitalizacionImagenesDAO;
import Digitalizacion.DigitalizacionImagenesForm;

import Main.ClaseSession;
import Main.Ctte;

import Transito.ClaseSql;
import Transito.Util;

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

public class RegLlegDepositoTransitorioAction extends Action {
    
      public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            
            ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");  
            RegLlegDepositoTransitorioForm bean = (RegLlegDepositoTransitorioForm)form;
            ActionMessages msg = new ActionMessages();            
            String direccion="";
            String ans = "";
        
            try{

                if(bean.getBoton() != null && bean.getBoton().equals("GRABAR")){
                    try{                                                
                        ClaseSql sql = new ClaseSql();
                         
                        sql.pAccesoDatos(request, Ctte.dbGrabarLlegadaDepTransitorio);
                        ans = request.getAttribute("pans")+"";
                        if (ans.equals("CORRECTO")) { 
                            msg.add("error", new ActionMessage("bien", "Se grab&oacute; correctamente la llegada a dep&oacute;sito transitorio del manifiesto:"+ bean.getCar_reg_year()+" "+bean.getKey_cuo()+" "+bean.getCar_reg_nber()));
                            bean.setBoton(""); 
                            request.setAttribute("gestion", bean.getCar_reg_year());
                            request.setAttribute("aduana", bean.getKey_cuo());
                            request.setAttribute("numeroreg", bean.getCar_reg_nber());
                            request.setAttribute("coddeposito", bean.getCod_depositoTransitorio());                            
                            direccion = "pagina.registro.llegada.bien";
                        }else{
                            msg.add("error", new ActionMessage("error", ans));
                                direccion = "irRegLlegadaDepTransitorio";
                            }
                    } catch (Exception e) {
                        msg.add("error", new ActionMessage("error", "No se pudo realizar la operaci&oacute;n."));
                        msg.add("error", new ActionMessage("error", e.getMessage()));
                        //direccion = "pagina.inicio";
                        direccion = "irRegLlegadaDepTransitorio";
                    } finally {
                        if (!msg.isEmpty()) {
                            this.saveErrors(request, msg);
                        }
                    }
                }

                return mapping.findForward(direccion);
            } catch (Exception e) {
                msg.add("error", new ActionMessage("error", e.getMessage()));
                return mapping.findForward("pagina.busq_digitalizacion");
            } finally {
                if (!msg.isEmpty()) {
                    this.saveErrors(request, msg);
                }
            }
      }  
}
