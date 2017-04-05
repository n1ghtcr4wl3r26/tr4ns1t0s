package Digitalizacion;


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


public class DigitalizacionImagenesAction extends Action {
    
      public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");  
            DigitalizacionImagenesForm bean = (DigitalizacionImagenesForm)form;
            ActionMessages msg = new ActionMessages();
            bean.setCodusu(cs.getCodusu().toString());
            String direccion="";
            String valida="";
            try{
                if(bean.getBoton() != null && bean.getBoton().equals("CONSULTAR")){
                    valida = DigitalizacionImagenesDAO.VerificaManDig(bean.getKey_cuo(),bean.getKey_year(), bean.getKey_nber());
                    if(valida.equals("OK")){
                        direccion = "pagina.digitalizacion";
                    } else{
                        msg.add("error", new ActionMessage("error", valida));
                        direccion = "pagina.busq_digitalizacion";
                    }
                    bean.setBoton("");
                }
                if(bean.getBoton() != null && bean.getBoton().equals("GRABAR")){
                    try{
                        String cod_img =  Util.devuelve_codimg_next(bean.getKey_cuo(), bean.getKey_year(), bean.getKey_nber());
                        bean.setCod_img(cod_img);
                        direccion = "pagina.digitalizacion";
                        ClaseSql sql = new ClaseSql();
                        sql.pAccesoDatos(request, Ctte.dbGrabaImagen);
                        msg.add("error", new ActionMessage("bien", "Se grab&oacute; correctamente la imagen."));
                        bean.setBoton("");                        
                    } catch (Exception e) {
                        msg.add("error", new ActionMessage("error", "No se pudo realizar la operaci&oacute;n."));
                        msg.add("error", new ActionMessage("error", e.getMessage()));
                    } finally {
                        if (!msg.isEmpty()) {
                            this.saveErrors(request, msg);
                        }
                    }
                }
                if(bean.getBoton() != null && bean.getBoton().equals("ELIMINAR")){
                    try{
                        direccion = "pagina.digitalizacion";
                        ClaseSql sql = new ClaseSql();
                        sql.pAccesoDatos(request, Ctte.dbEliminaImagen);
                        msg.add("error", new ActionMessage("bien", "Se Elimin&oacute; correctamente la imagen."));
                        bean.setBoton("");
                    } catch (Exception e) {
                        msg.add("error", new ActionMessage("error", "No se pudo realizar la operaci&oacute;n."));
                        msg.add("error", new ActionMessage("error", e.getMessage()));
                    } finally {
                        if (!msg.isEmpty()) {
                            this.saveErrors(request, msg);
                        }
                    }
                }
                if(bean.getBoton() != null && bean.getBoton().equals("REPORTE")){
                    valida = DigitalizacionImagenesDAO.VerificaManDigVer(bean.getKey_cuo(),bean.getKey_year(), bean.getKey_nber());
                    if(valida.equals("OK")){
                        direccion = "pagina.digitalizacion2";
                    } else{
                        msg.add("error", new ActionMessage("error", valida));
                        direccion = "pagina.busq_digitalizacion2";
                    }
                    bean.setBoton("");
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



