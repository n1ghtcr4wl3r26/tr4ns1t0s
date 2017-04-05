package ManifiestoDocs;


import Main.ClaseSession;
import Main.Ctte;

import Transito.ClaseSql;
import Transito.conexion;

import java.io.IOException;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import java.text.SimpleDateFormat;

import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;


public class ManifiestoCabAction extends Action{
    
    
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
                                 HttpServletResponse response) throws IOException, ServletException {
    
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
        //short op = (Short) request.getSession().getAttribute("opcion");
        ManifiestoForm bbusq = (ManifiestoForm) form;
        ClaseSql sql = new ClaseSql();
        ActionMessages msg = new ActionMessages();
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmm");
        Date date = new Date();

        Connection cn = null;
        conexion dc = new conexion();
        CallableStatement call = null;
        
        String direccion = "fail";
        try {
            //cn = dc.abrirConexionMira();
               // cn = dc.abrirConexion();
                request.setAttribute("ManifiestoForm", bbusq);
                String ans = sql.pReadDataBase(request, Ctte.dbGrabaCab);
                
                if(ans.equals("")){
                    if(bbusq.getTipo().equals("reg"))
                        msg.add("bien", new ActionMessage("bien", "Se termin&oacute; correctamente la digitalizaci&oacute;n de documentos soporte del manifiesto "+bbusq.getCar_reg_year() +
                                                        " / "+ bbusq.getKey_cuo()+" / "+ bbusq.getCar_reg_nber()));
                    else
                        msg.add("bien", new ActionMessage("bien", "Se termin&oacute; correctamente la digitalizaci&oacute;n de documentos soporte del manifiesto "+bbusq.getCar_dep_date() +
                                                    " / "+ bbusq.getKey_cuo()+" / "+ bbusq.getCar_voy_nber()));
                    saveErrors(request, msg);
                    return mapping.findForward("ok");
                }
                else{
                    msg.add("error", new ActionMessage("error", (new StringBuilder()).append("Error, ").append(ans).toString()));
                    saveErrors(request, msg);
                    return mapping.findForward("fail");
                }
          
        } catch (Exception e) {            
            msg.add("error", new ActionMessage("error", e.getMessage()));            
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
                if (!msg.isEmpty()) {
                    saveErrors(request, msg);
                }
            } catch (SQLException e) {
                ;
            }
        }

        return mapping.findForward(direccion);
    }
}



