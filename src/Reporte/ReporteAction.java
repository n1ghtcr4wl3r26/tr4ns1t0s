package Reporte;


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


public class ReporteAction extends Action {
  public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    ReporteForm bReporte = (ReporteForm)form;
    ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");

    if (cs == null) {
      return mapping.findForward("transportista");
    }

    switch (cs.getOpcion()) {
      case Ctte.erFueraPlazo:
      case Ctte.eReportePeso:

        if (bReporte.getNit().equals("")) {
          return mapping.findForward("resumen");
        } else {
          //*******modificado edgar arteaga 06012014 para detalle de cierres por documentos de embarque  
          /*cs.setKey_cuo(bReporte.getNit());
          cs.setKey_year(bReporte.getCheck1());
          cs.setKey_nber(bReporte.getCheck2());
          return mapping.findForward("imprime");*/
          
          if(bReporte.getTipo()!=null)
          {
              if(bReporte.getTipo().equals("2"))
              {
                  cs.setKey_cuo(bReporte.getNit());
                  cs.setKey_year(bReporte.getCheck1());
                  cs.setKey_nber(bReporte.getCheck2());
                  cs.setKey_sec(bReporte.getCheck3());
                  return mapping.findForward("cierredocemb");
              }
              else
              {
                  if(bReporte.getTipo().equals("3"))
                  {
                      cs.setKey_cuo(bReporte.getNit());
                      cs.setKey_year(bReporte.getCheck1());
                      cs.setKey_nber(bReporte.getCheck2());
                      cs.setKey_sec(bReporte.getCheck3());
                      return mapping.findForward("docemb");
                  }
                  else
                  {
                      cs.setKey_cuo(bReporte.getNit());
                      cs.setKey_year(bReporte.getCheck1());
                      cs.setKey_nber(bReporte.getCheck2());
                      return mapping.findForward("imprime");
                  }
              }
          }
          else
          {
              cs.setKey_cuo(bReporte.getNit());
              cs.setKey_year(bReporte.getCheck1());
              cs.setKey_nber(bReporte.getCheck2());
              return mapping.findForward("imprime");
          }
            
            
          //*******  
        }

      case Ctte.erActa:
        return mapping.findForward("r_actas");

      case Ctte.erPlaca:
        return mapping.findForward("placa");

      case Ctte.erResxAP:
        return mapping.findForward("resxAP");
      //reporte de transitos de puerto
      
      case Ctte.erControldeRiesgo:
        if(bReporte.getBoton().equals("Exportar a Excel"))
            return mapping.findForward("riesgo_xls");
        else    
            return mapping.findForward("riesgo");

        
    
    
      case 31:
                
        if (bReporte.getNit().equals("")) {
            return mapping.findForward("transitospuerto");
        } else {
          //*******modificado edgar arteaga 06012014 para detalle de cierres por documentos de embarque  
          /*cs.setKey_cuo(bReporte.getNit());
          cs.setKey_year(bReporte.getCheck1());
          cs.setKey_nber(bReporte.getCheck2());
          return mapping.findForward("imprime");*/
          
          if(bReporte.getTipo()!=null)
          {
              if(bReporte.getTipo().equals("2"))
              {
                  cs.setKey_cuo(bReporte.getNit());
                  cs.setKey_year(bReporte.getCheck1());
                  cs.setKey_nber(bReporte.getCheck2());
                  cs.setKey_sec(bReporte.getCheck3());
                  return mapping.findForward("cierredocemb");
              }
              else
              {
                  cs.setKey_cuo(bReporte.getNit());
                  cs.setKey_year(bReporte.getCheck1());
                  cs.setKey_nber(bReporte.getCheck2());
                  return mapping.findForward("imprime");
              }
          }
          else
          {
              cs.setKey_cuo(bReporte.getNit());
              cs.setKey_year(bReporte.getCheck1());
              cs.setKey_nber(bReporte.getCheck2());
              return mapping.findForward("imprime");
          }
            
            
          //*******  
        }
   
    }

    return mapping.findForward("reportes");
  }
}
