package VariableRiesgo;

import Main.ClaseSession;

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

import Transito.Util;


public class VariableRiesgoAction extends MappingDispatchAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
                                 HttpServletResponse response) throws IOException, ServletException {
        VariableRiesgoForm bean = (VariableRiesgoForm)request.getAttribute("VariableRiesgoForm");

        String usuario = (String)request.getSession().getAttribute("user.nick");
        String link = "registroVR";
        String res;
        if (usuario != null) {
            bean.setUsuario(usuario);
            if (bean.getBoton().equals("consultar")) {
                bean.setSw_consultar("1");
                link = "registroLR";
            }
            if (bean.getBoton().equals("cancelar")) {
                bean.setSw_consultar(null);
                link = "registroLR";
            }
            
            if (bean.getBoton().equals("adicionar")) {
                bean.setSw_consultar(null);
                link = "registroLR";
            }
            
            
            
            if (bean.getBoton().equals("guarda_riesgo")) {
                res = VariableRiesgoDao.grabaVariable(bean);

                if (res.substring(0, 5).equals("ERROR")) {
                    bean.setMensaje(Util.creamensaje("2", res.substring(5), "6"));
                    link = "registroLR";
                } else {
                    bean.setMensaje(Util.creamensaje("3",
                                                     "Se grab&oacute; correctamente la variable de riesgo " + bean.getTipo_variable() +
                                                     ":" + bean.getValor(), "6"));
                    bean.setVar_estado("VARIABLE");
                    link = "registroLR";
                }

            } 
            
            if (bean.getBoton().equals("consultar3")) {
                res = VariableRiesgoDao.grabaVariable(bean);

                if (res.substring(0, 5).equals("ERROR")) {
                    bean.setMensaje(Util.creamensaje("2", res.substring(5), "6"));
                    link = "registroVR";
                } else {
                    bean.setMensaje(Util.creamensaje("3",
                                                     "Se grab&oacute; correctamente la variable de riesgo " + bean.getTipo_variable() +
                                                     ":" + bean.getValor(), "6"));
                    link = "registroVR";
                }

            } 
            
            if (bean.getBoton().equals("deshabilitar")) {
                bean.setSw_consultar(null);
                link = "registroLR";
            }
            if (bean.getBoton().equals("guarda_deshabilita")) {
                res = VariableRiesgoDao.DeshabilitaVariable(bean);

                if (res.substring(0, 5).equals("ERROR")) {
                    bean.setMensaje(Util.creamensaje("2", res.substring(5), "6"));
                    link = "registroLR";
                } else {
                    if(bean.getPtipo_variable().equals("ORIGEN")){
                        bean.setMensaje(Util.creamensaje("3",
                                                     "Se deshabilit&oacute; correctamente la variable de riesgo " + bean.getPtipo_variable() +
                                                     ":" + VariableRiesgoDao.DevuelvePais(bean.getPvalor()), "6"));
                    } else {
                        bean.setMensaje(Util.creamensaje("3",
                                                     "Se deshabilit&oacute; correctamente la variable de riesgo " + bean.getPtipo_variable() +
                                                     ":" + bean.getPvalor(), "6"));                            
                    }
                    bean.setVar_estado("VARIABLE");
                    link = "registroLR";
                }

            } 
            if (bean.getBoton().equals("habilitar")) {
                bean.setSw_consultar(null);
                link = "registroLR";
            }
            if (bean.getBoton().equals("guarda_habilita")) {
                res = VariableRiesgoDao.habilitaVariable(bean);

                if (res.substring(0, 5).equals("ERROR")) {
                    bean.setMensaje(Util.creamensaje("2", res.substring(5), "6"));
                    link = "registroLR";
                } else {
                    
                    if(bean.getPtipo_variable().equals("ORIGEN")){
                        bean.setMensaje(Util.creamensaje("3",
                                                     "Se habilit&oacute; correctamente la variable de riesgo " + bean.getPtipo_variable() +
                                                     ":" + VariableRiesgoDao.DevuelvePais(bean.getPvalor()), "6"));
                    } else {
                        bean.setMensaje(Util.creamensaje("3",
                                                     "Se habilit&oacute; correctamente la variable de riesgo " + bean.getPtipo_variable() +
                                                     ":" + bean.getPvalor(), "6"));                            
                    }
                    bean.setVar_estado("VARIABLE");
                    link = "registroLR";
                }

            } 

           
        }
        else {
                        link = "inicio";
                    }
        return mapping.findForward(link);
    }


}
