package Rutas;


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


public class ListaAction extends Action {
  public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    ListaForm bLista = (ListaForm)form;
    ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
    if (cs == null) {
      return mapping.findForward("usuario");
    }

    switch (bLista.getOpcion()) {
      case Ctte.lAdiciona:
      case Ctte.lEdita:
        return mapping.findForward("ruta");

      case Ctte.lBusca:

        String sSql = "where 1=1 ";

        if (!bLista.getCodigo().equals("")) {
          sSql = sSql + " and upper(rou_cod) like '" + bLista.getCodigo().toUpperCase() + "%'";
        }

        if (!bLista.getAduana().equals("")) {
          sSql = sSql + " and (upper(adu_uno) like '" + bLista.getAduana().toUpperCase() + "%'";
          sSql = sSql + " or upper(adu_dos) like '" + bLista.getAduana().toUpperCase() + "%')";
        }

        if (!bLista.getHrs().equals("")) {
          sSql = sSql + " and upper(rou_ter) like '" + bLista.getHrs() + "%'";
        }

        if (!bLista.getTiptra().equals("")) {
          sSql = sSql + " and upper(tip_tra) like '" + bLista.getTiptra().toUpperCase() + "%'";
        }

        bLista.setScript(sSql);

      case Ctte.lBorra:
        return mapping.findForward("lista");

      default:

        cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
        cs.setOpcion(Ctte.eInicio);

        return mapping.findForward("tramite");
    }
  }
}
