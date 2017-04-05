package Transito;


import Main.ClaseSession;

import anb.seguridad.util.Vigenere;

import java.io.IOException;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.InitialContext;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.sql.DataSource;

import oracle.jdbc.OracleTypes;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


public class EtiquetaLoteAction extends Action {
  //private final int PERIODO_NUMERO_DIAS = 90;
  private final int PERIODO_NUMERO_DIAS = 180;  
  private final int TOTAL_CAMPOS_INFO = 6;
  private final int TOTAL_CAMPOS = 32;
  private final String TIPO_ETIQUETA = "ETIQUETA DE CONTROL GENERICA";
  private final String ETIQUETA_ADUANA = "ANB";
  private final String ETIQUETA_GENERICA = "GENERICA";
  private final char DELIMITADOR_COLUMNA = '|';
  public Connection cn = null;
  public Statement st = null;
  public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            DataSource ds = null;
            Connection cn = null;
            Statement st = null;
            ResultSet rs = null;
            ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
            String aduana = request.getParameter("aduana"); // Codigo de aduana
            aduana = aduana.substring(0,3);
            //cs.setAduanas(aduana);
            String gestion = request.getParameter("gestion"); // Anio
            String ruta="";
            try{
                InitialContext ic = new InitialContext();
                ds = (DataSource)ic.lookup("jdbc/asy_transito");
                cn = (Connection)ds.getConnection();
                st = cn.createStatement(); 
            
                CallableStatement call = null;
                call = cn.prepareCall( "{ ? = call PKG_ETIQUETA.maximo_num( ? ) }" );
                call.registerOutParameter( 1, OracleTypes.VARCHAR );
                call.setString( 2, gestion );        
                call.execute();
                int desde=0;
            
                String oj = (String)call.getString(1);
                desde = Integer.parseInt(oj);
                desde = desde + 1;
 
            //int desde = Integer.parseInt(request.getParameter("desde")); //Rango inicial
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            int hasta = desde + cantidad;
                hasta = hasta - 1;
            String fdesde = request.getParameter("fdesde"); //Vigencia etiqueta desde
            String fhasta = request.getParameter("fhasta"); //Vigencia etiqueta hasta
            String impresora = (request.getParameter("impresora")).substring(0,1);
            String solicitud = request.getParameter("solicitud");
            String usuario = cs.getCodusu();

            String nombrearchivo = aduana + gestion + desde + hasta + ".tag";
            String fecha = fdesde + " (1)";
                StringBuilder antes = new StringBuilder();
                antes.append(TIPO_ETIQUETA);
                antes.append(DELIMITADOR_COLUMNA);
                antes.append(aduana);
                antes.append(DELIMITADOR_COLUMNA);
                antes.append(fdesde);
                antes.append(DELIMITADOR_COLUMNA);
                antes.append(fhasta);

                StringBuilder trash = new StringBuilder();
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
                
                    if(impresora.equals("1")){//(aduana.equals("421") || aduana.equals("072"))
                        response.getWriter().write("^XA ");
                        response.getWriter().write("^DFR:TAG.GRF^FS ");
                        response.getWriter().write("^FO0,15 ^ADN,15,10 ^FN1^FS(transito) ");
                        response.getWriter().write("^FO140,15 ^ADN,15,10 ^FN2^FS(fecha) ");
                        response.getWriter().write("^FO0,35 ^BY2,3 ^B7N,3,4,8,,N ^FN3^FS(barcode) ");
                        response.getWriter().write("^XZ ");
                        /*response.getWriter().write("^XA ");
                        response.getWriter().write("^DFR:TAG.GRF^FS ");
                        response.getWriter().write("^FO0,15 ^ADN,18,10 ^FN1^FS(transito) ");
                        response.getWriter().write("^FO200,15 ^ADN,18,10 ^FN2^FS(fecha) ");
                        response.getWriter().write("^FO0,35 ^BY3,3 ^B7N,3,7,8,,N ^FN3^FS(barcode) ");
                        response.getWriter().write("^XZ ");*/
                    }
                    if(impresora.equals("2")){
                      //case 2: //} else {
                        /*response.getWriter().write("^XA~SD20^LH325,20^DFR:TAG.GRF^FS");
                        response.getWriter().write("^FO0,15 ^ADN,18,10 ^FN1^FS(transito)");
                        response.getWriter().write("^FO300,15 ^ADN,18,10 ^FN2^FS(fecha)");
                        response.getWriter().write("^FO0,35 ^BY3,3 ^B7N,4,5,8,,N ^FN3^FS(barcode)");
                        response.getWriter().write("^XZ");*/
                        response.getWriter().write("^XA~SD20^LH325,20^DFR:TAG.GRF^FS");
                        response.getWriter().write("^FO0,15 ^ADN,18,10 ^FN1^FS(transito)");
                        response.getWriter().write("^FO300,15 ^ADN,18,10 ^FN2^FS(fecha)");
                        response.getWriter().write("^FO0,35 ^BY3,3 ^B7N,4,5,8,,N ^FN3^FS(barcode)");
                        response.getWriter().write("^XZ");
                    }
                
                /*response.getWriter().write("^XA ");
                response.getWriter().write("^DFR:TAG.GRF^FS ");
                response.getWriter().write("^FO0,15 ^ADN,18,10 ^FN1^FS(transito) ");
                response.getWriter().write("^FO200,15 ^ADN,18,10 ^FN2^FS(fecha) ");
                response.getWriter().write("^FO0,35 ^BY3,3 ^B7N,3,7,8,,N ^FN3^FS(barcode) ");
                response.getWriter().write("^XZ ");*/

                for (int i = desde; i <= hasta; i++) {
                    String referencia = gestion + "/" + i;
                    String cadena =
                        antes.toString() + DELIMITADOR_COLUMNA + referencia + DELIMITADOR_COLUMNA + trash.toString();
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
                CallableStatement calg = null;
                calg = cn.prepareCall( "{ ? = call PKG_ETIQUETA.ins_genericas( ?, ?, ?, ?, ?, ? ,?, ?, ?, ? ) }" );
                calg.registerOutParameter( 1, OracleTypes.VARCHAR );
                calg.setString( 2, aduana );  
                calg.setString( 3, gestion ); 
                calg.setString( 4, Integer.toString(desde) ); 
                calg.setString( 5, Integer.toString(hasta )); 
                calg.setString( 6, Integer.toString(cantidad )); 
                calg.setString( 7, fdesde );
                calg.setString( 8, fhasta );
                calg.setString( 9, impresora );
                calg.setString( 10, solicitud );
                calg.setString( 11, usuario );
                calg.execute();
                String sAns = (String)call.getObject(1);

                if (!sAns.equals("Correcto")) {
                    //ruta="etiqueta";
                    throw new Exception(sAns);
                } else {
                   // ruta="generica_tag";
                    throw new Exception(sAns);
                }
            }catch (Exception e) {
                //errors.add("errors.login",new ActionMessage("errors.detail","Error en la consulta..."));
                //ruta="generica_tag";
                //e.printStackTrace();
              //return mapping.findForward("nook");
            } finally { 
                try { rs.close(); 
                } catch (Exception e) { /* ignored */ 
                } try { st.close(); 
                } catch (Exception e) { /* ignored */ 
                } try { //cn.close(); 
                } catch (Exception e) { /* ignored */ 
                } 
            } 
            //return mapping.findForward("etiqueta");
            return null;

    }        

}
