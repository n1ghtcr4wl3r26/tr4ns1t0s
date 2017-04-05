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


public class AsignaRutaPlazoAction extends Action {
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
                                 HttpServletResponse response) throws IOException, ServletException {
        AsignaRutaPlazoForm bRuta = (AsignaRutaPlazoForm)form;
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
    
        
        if (cs == null)
            return mapping.findForward("usuario");
        ActionMessages msg = new ActionMessages();
        //contro de la subida de imagenes
        if (bRuta != null && (bRuta.getAccion() == Ctte.btnSubirImagen || bRuta.getAccion() == Ctte.btnEliminarImagen)) {
            if (!(bRuta.getVerificacion().equals(cs.getKey_year() + cs.getKey_cuo() + cs.getKey_nber()))) {
                return mapping.findForward("errorsession");
            }

            try {
                ClaseSql sql = new ClaseSql();

                if (bRuta.getAccion() == Ctte.btnEliminarImagen) {
                    sql.pAccesoDatos(request, Ctte.dbEliminaImagen);
                    msg.add("error", new ActionMessage("bien", "Se Elimin&oacute; correctamente la imagen."));
                } else {
                    sql.pAccesoDatos(request, Ctte.dbGrabaImagen);
                    msg.add("error", new ActionMessage("bien", "Se grab&oacute; correctamente la imagen."));
                }

                return mapping.findForward("ruta");
            } catch (Exception e) {
                msg.add("error", new ActionMessage("error", "No se pudo realizar la operaci&oacute;n."));
                msg.add("error", new ActionMessage("error", e.getMessage()));

                return mapping.findForward("ruta");
            } finally {
                if (!msg.isEmpty()) {
                    this.saveErrors(request, msg);
                }
            }
        }
        else {

            if (!(bRuta.getVerificacion().equals(cs.getKey_year() + cs.getKey_cuo() + cs.getKey_nber()))) {
                return mapping.findForward("errorsession");
            }

            if (bRuta.getAccion() == Ctte.btnCancela) {
                request.getSession().removeAttribute("AsignaRutaPlazoForm");
                return mapping.findForward("tramite");
            }

            try {
                ClaseSql sql = new ClaseSql();

                sql.pAccesoDatos(request, Ctte.dbGrabaAsignaRutaPlazo);
                msg.add("error", new ActionMessage("bien", "Se grab&oacute; correctamente los datos."));

                if (cs.getOpcion() == Ctte.ePasoPtoCtl) {
                    cs.setResumen(false);
                    cs.setResumen2(true);
                } else {
                    cs.setResumen(true);
                    cs.setResumen2(false);
                }

                request.getSession().removeAttribute("AsignaRutaForm");

                if (cs.getOpcion() == Ctte.eInicio) {
                    //modificado edgar arteaga 12012015 para que todos los que esten en la unetitab puedan imprimir etiquetas
                    /*if (cs.getKey_cuo().equals("072") || cs.getKey_cuo().equals("422") || cs.getKey_cuo().equals("421") || cs.getKey_cuo().equals("722")) {
            cs.setEtiqueta(1);
          }*/
                    if (Util.VerificaUnetitab(cs.getKey_cuo()).equals("1")) {
                        cs.setEtiqueta(1);
                    }
                }

                return mapping.findForward("tramite");
            } catch (Exception e) {
                msg.add("error", new ActionMessage("error", "No se grab&oacute; los datos ingresados."));
                msg.add("error", new ActionMessage("error", e.getMessage()));

                return mapping.findForward("ruta");
            } finally {
                if (!msg.isEmpty()) {
                    this.saveErrors(request, msg);
                }
            }
        }
    }
}
