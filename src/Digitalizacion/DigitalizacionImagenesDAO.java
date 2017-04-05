package Digitalizacion;

import Transito.conexion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.jdbc.OracleTypes;


public class DigitalizacionImagenesDAO {

    public DigitalizacionImagenesDAO() {
    }

    public static String VerificaUnetitab(String key_cuo) {
        conexion dc = new conexion();
        Connection con = null;
        CallableStatement call = null;
        String rs = "OK";
        ResultSet rss = null;
        try {
            con = dc.abrirConexion();
            call = con.prepareCall("{ ? = call pkg_verifica_transito.verifica_unetitab(?) }");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.setString(2, key_cuo);
            call.execute();
            rs = (String)call.getObject(1);
        } catch (Exception er) {
            rs = "0";
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
    public static String VerificaManDig(String key_cuo, String key_year, String key_nber) {
        conexion dc = new conexion();
        Connection con = null;
        CallableStatement call = null;
        String rs = "OK";
        ResultSet rss = null;
        try {
            con = dc.abrirConexion();
            call = con.prepareCall("{ ? = call pkg_imagenes.verifica_man_dig(?,?,?) }");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.setString(2, key_cuo);
            call.setString(3, key_year);
            call.setString(4, key_nber);
            call.execute();
            rs = (String)call.getObject(1);
        } catch (Exception er) {
            rs = "0";
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
    
    public static String VerificaManDigVer(String key_cuo, String key_year, String key_nber) {
        conexion dc = new conexion();
        Connection con = null;
        CallableStatement call = null;
        String rs = "OK";
        ResultSet rss = null;
        try {
            con = dc.abrirConexion();
            call = con.prepareCall("{ ? = call pkg_imagenes.verifica_man_dig_ver(?,?,?) }");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.setString(2, key_cuo);
            call.setString(3, key_year);
            call.setString(4, key_nber);
            call.execute();
            rs = (String)call.getObject(1);
        } catch (Exception er) {
            rs = "0";
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
