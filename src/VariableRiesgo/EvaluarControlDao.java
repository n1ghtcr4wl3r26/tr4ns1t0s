package VariableRiesgo;

import Transito.conexion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import oracle.jdbc.OracleTypes;


public class EvaluarControlDao extends Conexion {
    public EvaluarControlDao() {
        super();
    }
    
    public static String evaluamic_obs(EvaluarControlForm bean) {
        conexion dc = new conexion();
        Connection con = null;
        CallableStatement call = null;
        String rs = "OK";
        try {
            con = dc.abrirConexion();
            call = con.prepareCall("{ ? = call pkg_variable_riesgo.mic_observado (?,?,?,?,?) }");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.setString(2, bean.getKey_cuo());
            call.setString(3, bean.getCar_reg_year());
            call.setString(4, bean.getCar_reg_nber());
            call.setString(5, bean.getUsuario());
            call.setString(6, bean.getResultado());
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
    
    
    public static String evaluamic_sinobs(EvaluarControlForm bean) {
        conexion dc = new conexion();
        Connection con = null;
        CallableStatement call = null;
        String rs = "OK";
        try {
            con = dc.abrirConexion();
            call = con.prepareCall("{ ? = call pkg_variable_riesgo.mic_sinobservacion (?,?,?,?,?) }");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.setString(2, bean.getKey_cuo());
            call.setString(3, bean.getCar_reg_year());
            call.setString(4, bean.getCar_reg_nber());
            call.setString(5, bean.getUsuario());
            call.setString(6, bean.getResultado());
            
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
    
    
  
  
    
  
}
