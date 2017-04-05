package Main;


import Transito.TramiteForm;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


public class MenuAction extends Action {
  public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    MenuForm bMenu = (MenuForm)form;

    ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
    request.getSession().removeAttribute("ReporteForm");

    /*String url = Util.devuelve_urlsistema("MIRA");
    url = url;
    */

    if (cs == null) {
      return mapping.findForward("usuario");
    }
    cs.setOpcion(bMenu.getEtapa());
    cs.setBreporte(false);

    switch (cs.getOpcion()) {
      case Ctte.eInicio:
      case Ctte.eFinalizacion:
      case Ctte.eModificacion:
      case Ctte.eCierre:
            TramiteForm tra = new TramiteForm();
            tra.setDeposito("NO");
            request.setAttribute("TramiteForm", tra);
      case Ctte.ePaso:
      case Ctte.ePasoPtoCtl:

      case Ctte.eTransbordo:
        return mapping.findForward("tramite");

      case Ctte.erTransito:
      case Ctte.erBitacora:
      case Ctte.eEtiqueta:
        cs.setBreporte(true);

        return mapping.findForward("tramite");

      case Ctte.eRuta:
        return mapping.findForward("lista");

      case Ctte.eActa:
      case Ctte.eHabilitaEmpresa:
      case Ctte.eHabilitaMedio:
        return mapping.findForward("pide_aduana");

      case Ctte.erActa:
        return mapping.findForward("reportes_acta");

      case Ctte.eGenerica:
          return mapping.findForward("generica_tag");

      case Ctte.erFueraPlazo:
        return mapping.findForward("reportes_resumen");

      case Ctte.erPlaca:
        return mapping.findForward("reportes_placa");

      case Ctte.erResxAP:
        return mapping.findForward("reportes_resxAP");

      //reporte de transitos de puerto
      case 31:
        return mapping.findForward("reportes_transitospuerto");

      case Ctte.eLogin:
        request.getSession().removeAttribute("ClaseSession");

        return mapping.findForward("usuario");

      case Ctte.eCambiaClave:
        return mapping.findForward("cambio");

      case Ctte.ePasoEtiqueta:
        return mapping.findForward("paso.etiqueta");

      case Ctte.eRegistroGarantia:
        return mapping.findForward("registro.garantia");

      case Ctte.eReportePeso:
        cs.setBreporte(true);

        return mapping.findForward("formulario.peso");

      case Ctte.eDespacho:
        return mapping.findForward("pagina.despacho");

      case Ctte.eSalidaPuerto:
        case Ctte.eListaSalidaPuerto:
        cs.setPlazoEtiqueta(0);
        return mapping.findForward("plazo.etiqueta");

/*
      case Ctte.opAbmDocumentosAdicionales: {
        request.getSession().setAttribute("opcion", Ctte.opAbmDocumentosAdicionales);
        return mapping.findForward("DocsAdicionalesBusca");
        }

      case Ctte.erManPendiente:
        return mapping.findForward("reportes_manpendiente");
        */
     case Ctte.erControldeRiesgo:
        return mapping.findForward("reportes_riesgo");

     //para la aplicacion del decreto supremo 2295
     case Ctte.eAplicacionDS2295:
       return mapping.findForward("busq_manifiesto");    
        
		case Ctte.enmiendaControlDE:
          return mapping.findForward("ebusq_manifiesto");    
		  
    case Ctte.erDigitalizarPrecinto:
       return mapping.findForward("busq_digitalizacion");
    
    case Ctte.erVerificarManifiesto:
        return mapping.findForward("busq_digitalizacion2");


    case Ctte.eListaVariableAdmin:
        return mapping.findForward("registroLRA");
    case Ctte.eListaVariable:
        return mapping.findForward("registroLR");
    case Ctte.eEvaluarControl:
        return mapping.findForward("evaluarR");
            
    case Ctte.eGestionCorreo:
        return mapping.findForward("gestionC");

    case Ctte.erReporteAlerta:
        return mapping.findForward("reporteA");
    case Ctte.erReporteRiesgo:
        return mapping.findForward("reporteR");
    case Ctte.erReporteVariable:
        return mapping.findForward("reporteV");
    case Ctte.erReporteCantidadRiesgoEstado:
        return mapping.findForward("reporteCAR");
    case Ctte.erReporteCantidadAlertaRiesgo:
        return mapping.findForward("reporteCAV");
    case Ctte.erReporteCantidadAlertaVariable:
        return mapping.findForward("reporteCR");

	case Ctte.eRegLlegadaDepTransitorio:
        return mapping.findForward("irRegLlegadaDepTransitorio");
    case Ctte.eRegistroDeposito:
        return mapping.findForward("registroDeposito");
    case Ctte.eConsultaDeposito:
        return mapping.findForward("consultaDeposito");

    //ops marcelo    
    case Ctte.opAbmDocumentosAdicionales: {
        request.getSession().setAttribute("opcion", Ctte.opAbmDocumentosAdicionales);
        return mapping.findForward("DocsAdicionalesBusca");
    }
    //ops justificativos TNA
    case Ctte.opJustificacionesTNA: {
        return mapping.findForward("buscaJustificativo");
    }


      default:
        return mapping.findForward("usuario");
    }
  }
}
