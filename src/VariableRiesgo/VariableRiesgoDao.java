package VariableRiesgo;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import oracle.jdbc.OracleTypes;

import Transito.conexion;


public class VariableRiesgoDao extends Conexion {
    public VariableRiesgoDao() {
        super();
    }
    
    public static String DevuelvePais(String pais) {
        conexion dc = new conexion();
        Connection con = null;
        CallableStatement call = null;
        String rs = "OK";
        try {
            con = dc.abrirConexion();
            call = con.prepareCall("{ ? = call pkg_variable_riesgo.devuelve_pais (?) }");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.setString(2, pais);
            
            call.execute();
            rs = call.getString(1);
            
        } catch (Exception er) {
            rs = "ERROR"+er.toString();
        } finally {
            try {
                if (con != null)
                    con.close();
                call.close();
            } catch (SQLException er) {
                ;
            }
        }
        return rs;
    }
    
    public static String DeshabilitaVariable(VariableRiesgoForm bean) {
        conexion dc = new conexion();
        Connection con = null;
        CallableStatement call = null;
        String rs = "OK";
        try {
            con = dc.abrirConexion();
            call = con.prepareCall("{ ? = call pkg_variable_riesgo.deshabilita_variable (?,?,?,?,?) }");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.setString(2, bean.getPtipo_variable());
            call.setString(3, bean.getPvalor());
            call.setString(4, null);
            call.setString(5, bean.getPobservacion());
            call.setString(6, bean.getUsuario());
            
            call.execute();
            rs = (String)call.getObject(1);
            
        } catch (Exception er) {
            rs = "ERROR"+er.toString();
        } finally {
            try {
                if (con != null)
                    con.close();
                call.close();
            } catch (SQLException er) {
                ;
            }
        }
        return rs;
    }
    
   
    
    
    public static String habilitaVariable(VariableRiesgoForm bean) {
        conexion dc = new conexion();
        Connection con = null;
        CallableStatement call = null;
        String rs = "OK";
        try {
            con = dc.abrirConexion();
            call = con.prepareCall("{ ? = call pkg_variable_riesgo.habilita_variable (?,?,?,?,?) }");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.setString(2, bean.getPtipo_variable());
            call.setString(3, bean.getPvalor());
            call.setString(4, null);
            call.setString(5, bean.getPobservacion());
            call.setString(6, bean.getUsuario());
            
            call.execute();
            rs = (String)call.getObject(1);
            
        } catch (Exception er) {
            rs = "ERROR"+er.toString();
        } finally {
            try {
                if (con != null)
                    con.close();
                call.close();
            } catch (SQLException er) {
                ;
            }
        }
        return rs;
    }
    
    
    public static String grabaVariable(VariableRiesgoForm bean) {
        conexion dc = new conexion();
        Connection con = null;
        CallableStatement call = null;
        String rs = "OK";
        try {
            con = dc.abrirConexion();
            call = con.prepareCall("{ ? = call pkg_variable_riesgo.graba_variable (?,?,?,? ,?,?) }");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.setString(2, bean.getTipo_variable());
            call.setString(3, bean.getValor());
            call.setString(4, null);
            call.setString(5, bean.getUsuario());
            call.setString(6, bean.getCriterio());
            call.setString(7,bean.getCriterio_otro());
            call.execute();
            rs = (String)call.getObject(1);
            
        } catch (Exception er) {
            rs = "ERROR"+er.toString();
        } finally {
            try {
                if (con != null)
                    con.close();
                call.close();
            } catch (SQLException er) {
                ;
            }
        }
        return rs;
    }
    
    
    /*
    public List<VariableRiesgoForm> obtenerNumeros () throws SQLException, ClassNotFoundException, NamingException {
        List<VariableRiesgoForm> timbres = null;
        try{
            open();
            call = cn.prepareCall("{ call PKG_TIMBRES.OBTENER_NUMEROS (?) }");
            call.registerOutParameter("C_NUMEROS", OracleTypes.CURSOR);
            call.execute();
            
            rs = (ResultSet)call.getObject("C_NUMEROS");
            if (rs != null){
                timbres = new ArrayList<VariableRiesgoForm>();
                while (rs.next()){
                    ReporteRiesgoForm timbre = new ReporteRiesgoForm();
                    timbre.setId(rs.getInt("TIM_ID"));
                    timbre.setGestion(rs.getInt("TIM_GESTION"));
                    timbre.setTipo(rs.getInt("TIM_TIPO"));
                    timbre.setTipo_desc(rs.getString("TIP_DESCRIPCION"));
                    timbre.setCantidad(rs.getInt("TIM_CANTIDAD"));
                    timbre.setInicio(rs.getInt("TIM_INICIO"));
                    timbre.setFin(rs.getInt("TIM_FIN"));
                    timbre.setFec_solicitud(rs.getString("TIM_FECSOL"));
                    timbre.setEmail(rs.getString("TIM_EMAIL"));
                    timbre.setFec_registro(rs.getString("FECREG"));
                    timbre.setUsuario(rs.getString("USUARIO"));
                    timbre.setToken(rs.getString("TIM_HASH"));
                    timbres.add(timbre);
                }
            }
        } finally{
            if (!esTransaccional()){
                close();
            }
        }
        return timbres;
    }
    */
}
