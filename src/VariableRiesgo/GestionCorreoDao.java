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


public class GestionCorreoDao extends Conexion {
    public GestionCorreoDao() {
        super();
    }

    public static String modificar_envio_correo(GestionCorreoForm bean) {
        conexion dc = new conexion();
        Connection con = null;
        CallableStatement call = null;
        String rs = "OK";
        try {
            con = dc.abrirConexion();
            call = con.prepareCall("{ ? = call pkg_variable_riesgo.modifica_enviocorreo (?,?,?) }");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.setString(2, bean.getUsuariocorreo());
            call.setString(3, bean.getEstado());
            call.setString(4, bean.getUsuario());
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
