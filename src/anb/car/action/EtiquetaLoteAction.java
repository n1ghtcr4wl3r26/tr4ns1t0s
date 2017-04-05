package anb.car.action;


import Main.ClaseSession;

import anb.seguridad.util.Vigenere;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


public class EtiquetaLoteAction extends Action {
  private final int PERIODO_NUMERO_DIAS = 90;
  private final int TOTAL_CAMPOS_INFO = 6;
  private final int TOTAL_CAMPOS = 32;
  private final String TIPO_ETIQUETA = "ETIQUETA DE CONTROL GENERICA";
  private final String ETIQUETA_ADUANA = "ANB";
  private final String ETIQUETA_GENERICA = "GENERICA";
  private final char DELIMITADOR_COLUMNA = '|';

  public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
    if (cs == null) {
      return mapping.findForward("usuario");
    }

    String aduana = request.getParameter("aduana"); // Codigo de aduana
    String anio = request.getParameter("anio"); // Anio
    int desde = Integer.parseInt(request.getParameter("desde")); //Rango inicial
    int hasta = Integer.parseInt(request.getParameter("hasta")); //Rango final	

    String fdesde = request.getParameter("fdesde"); //Vigencia etiqueta desde
    String fhasta = request.getParameter("fhasta"); //Vigencia etiqueta hasta

    String nombrearchivo = aduana + anio + desde + hasta + ".tag";
    String fecha = fdesde + " (1)";
    StringBuffer antes = new StringBuffer();
    antes.append(TIPO_ETIQUETA);
    antes.append(DELIMITADOR_COLUMNA);
    antes.append(aduana);
    antes.append(DELIMITADOR_COLUMNA);
    antes.append(fdesde);
    antes.append(DELIMITADOR_COLUMNA);
    antes.append(fhasta);

    StringBuffer trash = new StringBuffer();
    boolean flag = true;

    for (int i = TOTAL_CAMPOS_INFO; i < TOTAL_CAMPOS; i++) {
      trash.append(DELIMITADOR_COLUMNA);
      trash.append(flag ? ETIQUETA_ADUANA : ETIQUETA_GENERICA);
      flag = !flag;
    }

    response.setHeader("Cache-control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    response.setHeader("Content-Disposition", "attachment; filename=\"" + nombrearchivo + "\"");
    response.setContentType("text/plain");
    response.getWriter().write("^XA~SD20^LH325,20");
    response.getWriter().write("^DFR:TAG.GRF^FS ");
    response.getWriter().write("^FO0,15 ^ADN,18,10 ^FN1^FS(transito) ");
    response.getWriter().write("^FO300,15 ^ADN,18,10 ^FN2^FS(fecha) ");
    response.getWriter().write("^FO0,35 ^BY3,3 ^B7N,4,5,8,,N ^FN3^FS(barcode) ");
    response.getWriter().write("^XZ ");

    for (int i = desde; i <= hasta; i++) {
      String referencia = anio + "/" + i;
      String cadena = antes.toString() + DELIMITADOR_COLUMNA + referencia + DELIMITADOR_COLUMNA + trash.toString();
      Vigenere cipher = new Vigenere();
      String textocifrado = cipher.cifrar(cadena);
      response.getWriter().write("^XA ");
      response.getWriter().write("^XFR:TAG.GRF ");
      response.getWriter().write("^FN1^FD ");
      response.getWriter().write(referencia);
      response.getWriter().write("^FS ");
      response.getWriter().write("^FN2^FD ");
      response.getWriter().write(fecha);
      response.getWriter().write("^FS ");
      response.getWriter().write("^FN3^FD ");
      response.getWriter().write(textocifrado);
      response.getWriter().write("^FS ");
      response.getWriter().write("^FS ");
      response.getWriter().write("^XZ ");
      cipher = null;
    }

    return null;
  }
}
