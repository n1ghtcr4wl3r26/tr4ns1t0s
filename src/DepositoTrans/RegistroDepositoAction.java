package DepositoTrans;


import Main.ClaseSession;

import Transito.conexion;

import java.io.IOException;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oracle.jdbc.OracleTypes;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;


public class RegistroDepositoAction extends Action {
    
      public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");  
            RegistroDepositoForm bean = (RegistroDepositoForm)form;
            ActionMessages msg = new ActionMessages();
            bean.setCodusu(cs.getCodusu().toString());
            String direccion="";
            String valida="";
            try{
                if(bean.getBoton() != null && bean.getBoton().equals("CONSULTAR")){
                    direccion = "registroDeposito";
                    bean.setBoton("");
                }                
                if(bean.getBoton() != null && bean.getBoton().equals("CONSULTAR2")){
                    direccion = "consultaDeposito";
                    bean.setBoton("");
                }
                if(bean.getBoton() != null && bean.getBoton().equals("GRABAR")){
                    String res;
                    direccion = "registroDeposito";
                    res = GrabaDeposito(bean.getNit(), bean.getCoddeposito(), bean.getNro_res(), bean.getDistancia(), bean.getTiempo(), bean.getCodusu());
                    if(res.equals("CORRECTO")){
                        msg.add("error", new ActionMessage("bien", "Se grab&oacute; correctamente el dep&oacute;sito."));
                    } else {
                        msg.add("error", new ActionMessage("error", res));
                    }
                    bean.setBoton("");
                }
                /*if(bean.getBoton() != null && bean.getBoton().equals("ELIMINAR")){
                    try{
                        direccion = "pagina.digitalizacion";
                        ClaseSql sql = new ClaseSql();
                        sql.pAccesoDatos(request, Ctte.dbEliminaImagen);
                        msg.add("error", new ActionMessage("bien", "Se Elimin&oacute; correctamente la imagen."));
                        bean.setBoton("");
                    } catch (Exception e) {
                        msg.add("error", new ActionMessage("error", "No se pudo realizar la operaci&oacute;n."));
                        msg.add("error", new ActionMessage("error", e.getMessage()));
                    } finally {
                        if (!msg.isEmpty()) {
                            this.saveErrors(request, msg);
                        }
                    }
                }*/
                
                return mapping.findForward(direccion);
            } catch (Exception e) {
                msg.add("error", new ActionMessage("error", e.getMessage()));
                return mapping.findForward("pagina.busq_digitalizacion");
            } finally {
                if (!msg.isEmpty()) {
                    this.saveErrors(request, msg);
                }
            }
      }  
      
    public static String GrabaDeposito(String prm_nit, String prm_deposito,String prm_resolucion, String prm_distancia, String prm_tiempo, String prm_usuario) {
        conexion dc = new conexion();
        Connection con = null;
        CallableStatement call = null;
        String rs = "OK";
        ResultSet rss = null;
        try {
            con = dc.abrirConexion();
            call = con.prepareCall("{ ? = call pkg_deposito_trans.f_graba_deposito_transitorio(?,?,?,?,?,?) }");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.setString(2, prm_nit);
            call.setString(3, prm_deposito);
            call.setString(4, prm_resolucion);
            call.setString(5, prm_distancia);
            call.setString(6, prm_tiempo);
            call.setString(7, prm_usuario);
            call.execute();
            rs = (String)call.getObject(1);
        } catch (Exception er) {
            rs = "ERROR";
        } finally {
            try {
                if (con != null)
                    con.close();
                call.close();
                if (rss != null)
                    rss.close();
            } catch (SQLException er) {
                ;
            }
        }
        return rs;
    }
}



