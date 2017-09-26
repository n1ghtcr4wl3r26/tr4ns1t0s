package Transito;


import Etiqueta.GeneraEtiqueta;

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


public class TramiteAction extends Action {
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
                                 HttpServletResponse response) throws IOException, ServletException {
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
        TramiteForm bTramite = (TramiteForm)form;
        ActionMessages msg = new ActionMessages();
        short opcion = 0;
        
        if (bTramite.getDeposito() != null) {
            request.getSession().setAttribute("deposito", bTramite.getDeposito());
        } else {
            request.getSession().setAttribute("deposito", "NO");
        }

        if (cs == null)
            return mapping.findForward("usuario");

        try {
            ClaseSql sql = new ClaseSql();

            if (bTramite.getSaduana().equals("12")) {
                opcion = cs.getOpcion();
                cs.setOpcion(Ctte.eEtiqueta);
            }

            if (cs.getOpcion() != Ctte.eReportePeso) {
                sql.pAccesoDatos(request, Ctte.dbEstado);
            }

            if (cs.getOpcion() != Ctte.eEtiqueta)
                cs.setBreporte(false);

            switch (cs.getOpcion()) {
            case Ctte.eInicio:
            case Ctte.eModificacion:
            case Ctte.ePaso:

                if (bTramite.isTna() == true) {
                    msg.add("error",
                            new ActionMessage("mensaje", "El medio de tr&aacute;nsporte esta registrado como <font color='#FF0000'><strong>Tr&aacute;nsito No Arribado</strong></font>."));
                }

                return mapping.findForward("ruta");

            case Ctte.ePasoPtoCtl:

                if (bTramite.isTna() == true) {
                    msg.add("error",
                            new ActionMessage("mensaje", "El medio de tr&aacute;nsporte esta registrado como <font color='#FF0000'><strong>Tr&aacute;nsito No Arribado</strong></font>."));
                }

                return mapping.findForward("rutapctl");

            case Ctte.eFinalizacion:
                return mapping.findForward("cierra");

            case Ctte.eTransbordo:
                return mapping.findForward("transbordo");

            case Ctte.eCierre:
                msg.add("error", new ActionMessage("bien", "Termin&oacute; el proceso."));
                msg.add("error",
                        new ActionMessage("bien", "El N&uacute;mero de Tr&aacute;nsito <font color='#FF0000'><strong>" +
                                          cs.getKey_cuo() + " / " + cs.getKey_year() + " - " + cs.getKey_nber() +
                                          "</strong></font> se Cancel&oacute;"));
                cs.setKey_cuo("");

                break;

            case Ctte.erTransito:
                return mapping.findForward("imprime");

            case Ctte.erBitacora:
                return mapping.findForward("bitacora");

            case Ctte.eEtiqueta:

                GeneraEtiqueta etiqueta = new GeneraEtiqueta();
                String anio = bTramite.getGestion();
                int numero = Integer.parseInt(bTramite.getRegistro());
                String aduana = bTramite.getAduana();

                String referencia = anio + "/" + numero;
                String nombrearchivo = anio + "_" + numero + ".tag";

                response.setHeader("Cache-control", "no-cache");
                response.setHeader("Pragma", "no-cache");
                response.setDateHeader("Expires", 0);
                response.setHeader("Content-Disposition", "attachment; filename=\"" + nombrearchivo + "\"");
                response.setContentType("text/plain");
                response.getWriter().write(etiqueta.genera(bTramite.getGestion(), bTramite.getAduana(),
                                                           Integer.parseInt(bTramite.getRegistro()),
                                                           cs.getCodusu()).toString());
                //cs.setOpcion(opcion);
                return null;

            case Ctte.eReportePeso:
                return mapping.findForward("reporte.peso");
            }

            return mapping.findForward("tramite");
        } catch (Exception e) {
            msg.add("error", new ActionMessage("error", e.getMessage()));
            if (cs.getOpcion() == Ctte.eEtiqueta) {
                cs.setError("<strong>Error al generar la etiqueta de control:</strong> " + e.getMessage());
                return mapping.findForward("error");
            } else

                return mapping.findForward("tramite");
        } finally {
            if (!msg.isEmpty()) {
                this.saveErrors(request, msg);
            }
        }
    }
}
