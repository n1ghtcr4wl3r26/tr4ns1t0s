package JustificativosTNA;


import Main.ClaseSession;

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


public class JustificativosAction extends Action {
  public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession"); 
        JustificativosForm bean = (JustificativosForm)form;
        ActionMessages msg = new ActionMessages();
        bean.setCodusu(cs.getCodusu().toString());
        String direccion="";
        String valida="";
        bean.setFec_actual(Util.devuelve_fecha_actual());
        try{
            if(bean.getBoton() != null && bean.getBoton().equals("CONSULTAR")){
                valida = JustificativosDao.VerificaManJus(bean.getKey_cuo(),bean.getKey_year(), bean.getKey_nber());
                if(valida.equals("OK")){
                    direccion = "subirJustificativo";
                } else{
                    msg.add("error", new ActionMessage("error", valida));
                    direccion = "buscaJustificativo";
                }
                bean.setBoton("");
            }
            if(bean.getBoton() != null && bean.getBoton().equals("GRABAR")){
                try{
                    direccion = "subirJustificativo";
                    String res = JustificativosDao.subePDF(request); 
                    if(res.equals("OK")){
                        msg.add("error", new ActionMessage("bien", "Se registr&oacute; correctamente el justificativo."));
                        bean.setBoton("");     
                        bean.setAdu_pres("");
                        bean.setCausa("");
                        bean.setCite_just("");
                        bean.setDocumento("");
                        bean.setFecha_just("");
                        bean.setHoja_ruta("");
                        bean.setObservacion("");
                    }
                    else{
                        msg.add("error", new ActionMessage("error", res));
                    }
                } catch (Exception e) {
                    msg.add("error", new ActionMessage("error", "No se pudo realizar la operaci&oacute;n."));
                    msg.add("error", new ActionMessage("error", e.getMessage()));
                } finally {
                    if (!msg.isEmpty()) {
                        this.saveErrors(request, msg);
                    }
                }
            }
            
            return mapping.findForward(direccion);
        } catch (Exception e) {
            msg.add("error", new ActionMessage("error", e.getMessage()));
            return mapping.findForward("buscaJustificativo");
        } finally {
            if (!msg.isEmpty()) {
                this.saveErrors(request, msg);
            }
        }
        
    }  
}
