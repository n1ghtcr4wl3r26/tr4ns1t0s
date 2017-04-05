package Transito;


import Main.ClaseSession;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


public class DespachoAction extends Action {
  public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
    DespachoForm bDespacho = (DespachoForm)form;

    ClaseSql sql = new ClaseSql();

    String xml = "";
    int opcion = -1;

    if (cs == null) {
      opcion = 0;
    } else {
      opcion = bDespacho.getOpcion();
    }

    try {

      switch (opcion) {
        case 0:
          xml = "<ans>P&aacute;gina caducada, presione en el Men&uacute; la opci&oacute;n Salir y para volver a conectarse a la aplicaci&oacute;n.</ans>";
          break;
        case 1: //cargamos los datos por declaracion
          xml = sql.AccesoDespacho(request, 1001);
          break;
        case 2: //cargamos los datos por manifiesto
          xml = sql.AccesoDespacho(request, 1002);
          break;
        case 11: //efectuamos el cierre del o los manifiestos y tenemos que generar el parte de recepcion
          xml = sql.AccesoDespacho(request, 1011);
          break;
        case 21:
          xml = sql.AccesoDespacho(request, 1021);
          break;

      }

    } catch (Exception e) {
      xml = "<ans>" + e.getMessage() + "</ans>";
    } finally {

      sql.getClose();

      response.setContentType("text/xml");
      response.setHeader("Cache-Control", "no-cache");
      PrintWriter writer = response.getWriter();
      writer.print("<?xml version='1.0' encoding='ISO-8859-1'?><xml>" + xml + "</xml>");
      writer.flush();
      writer.close();

      return null;

    }
  }
}
