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


public class GestionCorreoAction extends MappingDispatchAction {

    private final GestionCorreoNeg neg = new GestionCorreoNeg();

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        GestionCorreoForm bean = (GestionCorreoForm)request.getAttribute("GestionCorreoForm");
        String link = "gestionC";
        String res="";

        String usuario = (String)request.getSession().getAttribute("user.nick");
        bean.setUsuario(usuario);

        if (bean.getBoton().equals("habilitar")) {
            res = GestionCorreoDao.modificar_envio_correo(bean);

            if (res.substring(0, 5).equals("ERROR")) {
                bean.setMensaje(Util.creamensaje("2", res.substring(5), "6"));
            } else {
                bean.setMensaje(Util.creamensaje("3","Se modific&oacute; correctamente el estado de envio de correo del funcionario: " + bean.getUsuariocorreo() , "6"));
            }
        }

        if (bean.getBoton().equals("deshabilitar")) {
            res = GestionCorreoDao.modificar_envio_correo(bean);

            if (res.substring(0, 5).equals("ERROR")) {
                bean.setMensaje(Util.creamensaje("2", res.substring(5), "6"));
                link = "evaluarR";
            } else {
                bean.setMensaje(Util.creamensaje("3","Se modific&oacute; correctamente el estado de envio de correo del funcionario: " + bean.getUsuariocorreo() , "6"));
          }
        }

        return mapping.findForward(link);
    }
}
