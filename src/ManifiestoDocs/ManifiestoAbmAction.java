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
import org.apache.struts.upload.FormFile;


public class ManifiestoAbmAction extends Action{
    
    
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
                                 HttpServletResponse response) throws IOException, ServletException {
    
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
        //short op = (Short) request.getSession().getAttribute("opcion");
        ManifiestoForm bbusq = (ManifiestoForm) form;
        ClaseSql sql = new ClaseSql();
        ActionMessages msg = new ActionMessages();
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
        Date date = new Date();

        Connection cn = null;
        conexion dc = new conexion();
        CallableStatement call = null;
        
        String direccion = "nook";
        try {
            //cn = dc.abrirConexionMira();
            //cn = dc.abrirConexion();
                
            if(bbusq.getR_aduana().equals("1"))
            {
                FormFile file = bbusq.getDocPdf();
                String fil = df.format(date)+"-"+bbusq.getTip_documento()+".pdf";
                bbusq.setRuta((new StringBuilder()).append(bbusq.getCarpeta()).append(fil).toString());
                request.setAttribute("ManifiestoForm", bbusq);
                String ans = sql.pReadDataBase(request, Ctte.dbCargaPDF);
                bbusq.setNarchivo("");
                if(ans.equals("")){
                    msg.add("bien", new ActionMessage("bien", "Se grab&oacute; correctamente los datos."));
                    
                }else{
                    msg.add("error", new ActionMessage("error", (new StringBuilder()).append("Error, ").append(ans).toString()));
                    
                }
                saveErrors(request, msg);
                return mapping.findForward("okAbm");
            }
            String ans;
            
            if(bbusq.getR_aduana().equals("2"))
            {
                sql = new ClaseSql();
                request.setAttribute("ManifiestoForm", bbusq);
                ans = sql.pReadDataBase(request, Ctte.dbEliPDF);
                bbusq.setNarchivo("");
                if(ans.equals("")){
                    msg.add("bien", new ActionMessage("bien", "Se elimin&oacute; el registro."));
                    
                }else{
                    msg.add("error", new ActionMessage("error", (new StringBuilder()).append("Error, ").append(ans).toString()));                    
                }
                saveErrors(request, msg);
                
                return mapping.findForward("okAbm");
            }
            
            if(bbusq.getR_aduana().equals("3"))
            {
                
                
                sql = new ClaseSql();
                request.setAttribute("ManifiestoForm", bbusq);
                ans = sql.pReadDataBase(request, Ctte.dbDescargaZip);
                bbusq.setNarchivo("");
                if(ans.equals("")){
                    msg.add("bien", new ActionMessage("bien", "Se gener&oacute; correctamente el archivo Zip ."));
                    
                }else{
                    msg.add("error", new ActionMessage("error", (new StringBuilder()).append("Error, ").append(ans).toString()));                    
                }
                saveErrors(request, msg);
                return mapping.findForward("okAbm");
            }
            //PARCIALES
            if(bbusq.getR_aduana().equals("4"))
            {
                /*FormFile file = bbusq.getDocPdf();
                String fil = df.format(date)+"-"+bbusq.getTip_documento()+".pdf";
                bbusq.setRuta((new StringBuilder()).append(bbusq.getCarpeta()).append(fil).toString());*/
                request.setAttribute("ManifiestoForm", bbusq);
                String ans1 = sql.pReadDataBase(request, Ctte.dbCargaParcial);
                bbusq.setNarchivo("");
                if(ans1.equals("")){
                    msg.add("bien", new ActionMessage("bien", "Se grab&oacute; correctamente los datos."));
                    
                }else{
                    msg.add("error", new ActionMessage("error", (new StringBuilder()).append("Error, ").append(ans1).toString()));
                    
                }
                saveErrors(request, msg);
                return mapping.findForward("okAbm");
            }
                      
                /* if (op == Ctte.opRepDocumentosAdicionales) {
                    cn = dc.abrirConexion();
                    call = cn.prepareCall("{ ? = call pkg_manifiestodocs.busca_manifiesto(?,?,?,?,?) }");
                    call.registerOutParameter(1, OracleTypes.CURSOR);
                    call.registerOutParameter(2, OracleTypes.CURSOR);
                    call.registerOutParameter(3, OracleTypes.VARCHAR);
                    call.setString(4, bbusq.getCar_reg_year());
                    call.setString(5, bbusq.getKey_cuo());
                    call.setString(6, bbusq.getCar_reg_nber());

                    call.execute();

                    String res = call.getString(3);

                    if (res.equals("Correcto")) {
                        ResultSet rs = (ResultSet )call.getObject(1);
                        int i = 0;
                        while(rs.next()){
                                
                                bbusq.setFecha_arrribo(rs.getString(2));
                                bbusq.setHora_arribo(rs.getString(3));
                                bbusq.setTranportador(rs.getString(4));
                                bbusq.setMedio(rs.getString(1));
                                bbusq.setKey_bol_ref(rs.getString(5));
                                i++;    
                            }
                        rs = (ResultSet ) call.getObject(2);
                        i = 0;
                        while(rs.next()){
                                bbusq.setTip_documento(rs.getString(4));
                                bbusq.setDesc_documento(rs.getString(5));
                                bbusq.setEmisor(rs.getString(6));
                                bbusq.setNro_referencia(rs.getString(7));
                                bbusq.setFecha_emision(rs.getString(8));
                                bbusq.setImporte(rs.getString(9));
                                bbusq.setTip_divisa(rs.getString(10));
                                bbusq.setOtr_divisa(rs.getString(11));
                                bbusq.setDoc_adicional(rs.getString(12)); 
                                i++;    
                            }            
                        direccion = "okRep";
                    } else {
                        msg.add("error", new ActionMessage("error", "No se encontr&oacute; el manifiesto"));
                        saveErrors(request, msg);
                        
                        direccion = "nook";
                    }
                        
                } */
          
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



