package ManifiestoDocs;


import Main.ClaseSession;
import Main.Ctte;

import Transito.ClaseSql;
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
import org.apache.struts.upload.FormFile;


public class BuscaAction extends Action{
    
    
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
                                 HttpServletResponse response) throws IOException, ServletException {
    
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
        short op = (Short) request.getSession().getAttribute("opcion");
        ManifiestoForm bbusq = (ManifiestoForm) form;
        ClaseSql sql = new ClaseSql();
        ActionMessages msg = new ActionMessages();

        Connection cn = null;
        conexion dc = new conexion();
        CallableStatement call = null;
        ResultSet rs = null;
        
        String direccion = "nook";
        try {
            //cn = dc.abrirConexionMira();
                cn = dc.abrirConexion();
                if (op == Ctte.opAbmDocumentosAdicionales || op ==Ctte.opRepDocumentosAdicionales) {
                    if (op == Ctte.opAbmDocumentosAdicionales) {
                        //call = cn.prepareCall("{ ? = call MIRA.PKG_MANIFIESTODOCS_MEM.busca_manifiesto(?,?,?,?,?,?, ?,?,?) }");//DESARROLLO
                        //call = cn.prepareCall("{ ? = call APP_MIRA.PKG_MANIFIESTODOCS_MEM.busca_manifiesto(?,?,?,?,?,?, ?,?,?) }");//PRODUCCION
                        call = cn.prepareCall("{ ? = call "+cs.getEsquema()+".PKG_MANIFIESTODOCS_MEM.busca_manifiesto(?,?,?,?,?,?, ?,?,?) }");//VARIABLE ESQUEMA
                    }
                    if (op == Ctte.opRepDocumentosAdicionales) {
                        //call = cn.prepareCall("{ ? = call MIRA.PKG_MANIFIESTODOCS_MEM.busca_manifiesto_rep(?,?,?,?,?,?) }");//DESARROLLO
                        //call = cn.prepareCall("{ ? = call APP_MIRA.PKG_MANIFIESTODOCS_MEM.busca_manifiesto_rep(?,?,?,?,?,?) }");//PRODUCCION
                        call = cn.prepareCall("{ ? = call "+cs.getEsquema()+".PKG_MANIFIESTODOCS_MEM.busca_manifiesto_rep(?,?,?,?,?,?) }");//VARIABLE ESQUEMA
                    }
                    call.registerOutParameter(1, OracleTypes.CURSOR);
                    call.registerOutParameter(2, OracleTypes.CURSOR);
                    call.registerOutParameter(3, OracleTypes.VARCHAR);
                    call.setString(4, bbusq.getCar_reg_year());
                    call.setString(5, bbusq.getKey_cuo());
                    call.setString(6, bbusq.getCar_reg_nber());
                    call.setString(7, cs.getRol());
                    
                    if (op == Ctte.opAbmDocumentosAdicionales) {
                        call.setString(8, bbusq.getCar_dep_date());//memorizada
                        call.setString(9, bbusq.getCar_voy_nber());//memorizada
                        call.setString(10, "reg");//si es referencia o registro (manifiesto)
                    }
                    call.execute();

                    String res = call.getString(3);

                    if (res.equals("Correcto")) {
                        //ResultSet rs = (ResultSet )call.getObject(1);
                        rs = (ResultSet )call.getObject(1);
                        int i = 0;
                        while(rs.next()){
                                
                                bbusq.setFecha_arrribo(rs.getString(2));
                                bbusq.setHora_arribo(rs.getString(3));
                                bbusq.setTranportador(rs.getString(4));
                                bbusq.setMedio(rs.getString(1));
                                bbusq.setKey_bol_ref(rs.getString(5));
                                bbusq.setCant_veh(rs.getString(6));
                                if (op == Ctte.opAbmDocumentosAdicionales) {
                                    bbusq.setCar_dep_date(rs.getString("key_dep_date"));
                                    bbusq.setCar_voy_nber(rs.getString("key_voy_nber"));
                                }
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
                        request.getSession().setAttribute("manifst",bbusq);
                        if (op == Ctte.opAbmDocumentosAdicionales) {
                            direccion = "okAbm";
                        }
                        if (op == Ctte.opRepDocumentosAdicionales) {
                            direccion = "okRep";
                        }
                    } else {
                        msg.add("error", new ActionMessage("error", res));
                        saveErrors(request, msg);
                        
                        direccion = "nook";
                    }
            }
            if(bbusq.getOpcion().equals("1"))
            {
                FormFile file = bbusq.getDocPdf();
                bbusq.setRuta((new StringBuilder()).append(bbusq.getCarpeta()).append(bbusq.getNarchivo()).toString());
                String ans = sql.pReadDataBase(request, Ctte.dbCargaImagen);
                bbusq.setNarchivo("");
                if(ans.equals(""))
                    msg.add("bien", new ActionMessage("bien", "Se grab&oacute; correctamente la imagen del documento."));
                else
                    msg.add("error", new ActionMessage("error", (new StringBuilder()).append("Error, ").append(ans).toString()));
                saveErrors(request, msg);
                return mapping.findForward("carpeta");
            }
            String ans;
            /*if(bbusq.getOpcion().equals("2"))
            {
                bbusq.setRuta((new StringBuilder()).append(bbusq.getCparcial()).append(bbusq.getParcial()).toString());
                sql = new ClaseSql();
                ans = sql.pReadDataBase(request, Ctte.dbCargaImagenP);
                bbusq.setNarchivo("");
                if(ans.equals(""))
                    msg.add("bien", new ActionMessage("bien", "Se referenci&oacute; correctamente la imagen del documento."));
                else
                    msg.add("error", new ActionMessage("error", (new StringBuilder()).append("Error, ").append(ans).toString()));
                saveErrors(request, msg);
                return mapping.findForward("carpeta");
            }*/
                      
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
                if (!msg.isEmpty()) {
                    saveErrors(request, msg);
                }
                if (cn != null) {
                    dc.Cierra(cn,rs);
                    cn.close();
                   // rs.close();
                }
                
            } catch (SQLException e) {
                ;
            }
        }

        return mapping.findForward(direccion);
    }
}