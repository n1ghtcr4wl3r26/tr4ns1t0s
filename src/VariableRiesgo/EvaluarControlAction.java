package VariableRiesgo;


import Transito.Util;

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


public class EvaluarControlAction extends MappingDispatchAction {

    private final EvaluarControlNeg neg = new EvaluarControlNeg();
    
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        
        EvaluarControlForm bean = (EvaluarControlForm)request.getAttribute("EvaluarControlForm");
        String link = "evaluarR"; 
        String res="";
        
        if (bean.getBoton().equals("observado")) {
            
            if(bean.getTipoobs().equals("OBSERVADO")){
                    res = EvaluarControlDao.evaluamic_obs(bean);

                    if (res.substring(0, 5).equals("ERROR")) {
                        bean.setMensaje(Util.creamensaje("2", res.substring(5), "6"));
                        link = "evaluarR";
                    } else {
                        bean.setMensaje(Util.creamensaje("3","Se registr&oacute; correctamente el manifiesto " + bean.getCar_reg_year() +"-" + bean.getKey_cuo()+"-" + bean.getCar_reg_nber() + " como OBSERVADO", "6"));
                        bean.setVar_estado("LISTA");
                        link = "evaluarR";
                    }
                }
            if(bean.getTipoobs().equals("SIN OBSERVACION")){
                    res = EvaluarControlDao.evaluamic_sinobs(bean);

                    if (res.substring(0, 5).equals("ERROR")) {
                        bean.setMensaje(Util.creamensaje("2", res.substring(5), "6"));
                        link = "evaluarR";
                    } else {
                        bean.setMensaje(Util.creamensaje("3","Se registr&oacute; correctamente el manifiesto " + bean.getCar_reg_year() +"-" + bean.getKey_cuo()+"-" + bean.getCar_reg_nber() + " SIN OBSERVACION", "6"));
                        bean.setVar_estado("LISTA");
                        link = "evaluarR";
                    }                
                }
        } 
        /*
        if (bean.getBoton().equals("sinobservacion")) {
            res = EvaluarControlDao.evaluamic_sinobs(bean);

            if (res.substring(0, 5).equals("ERROR")) {
                bean.setMensaje(Util.creamensaje("2", res.substring(5), "6"));
                link = "evaluarR";
            } else {
                bean.setMensaje(Util.creamensaje("3","Se registr&oacute; correctamente el manifiesto " + bean.getCar_reg_year() +"-" + bean.getKey_cuo()+"-" + bean.getCar_reg_nber() + " SIN OBSERVACION", "6"));
                bean.setVar_estado("LISTA");
                link = "evaluarR";
            }
        } 
        */
        if (bean.getBoton().equals("cancelar")) {
            bean.setVar_estado("LISTA");
            link = "evaluarR";
            
        } 
    
        return mapping.findForward(link);
    }
}
