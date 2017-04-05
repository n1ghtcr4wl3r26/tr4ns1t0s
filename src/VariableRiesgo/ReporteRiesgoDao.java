package VariableRiesgo;



import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import oracle.jdbc.OracleTypes;


public class ReporteRiesgoDao extends Conexion {
    public ReporteRiesgoDao() {
        super();
    }
    
    public ReporteRiesgoForm generarNumeros(ReporteRiesgoForm timbre) throws SQLException, ClassNotFoundException, NamingException {
        try{
            open();
            call = cn.prepareCall("{ call PKG_TIMBRES.GENERAR_NUMEROS( ?,?,?, ?,?,?, ?,?,?, ?,? ) }");
            call.setInt("I_GESTION", timbre.getGestion());
            call.setInt("I_TIPO", timbre.getTipo());
            call.setInt("I_CANTIDAD", timbre.getCantidad());
            call.setString("I_FECSOL", timbre.getFec_solicitud());
            call.setString("I_EMAIL", timbre.getEmail());
            call.setString("I_USUARIO", timbre.getUsuario());
            call.setString("I_HASH", timbre.getToken());
            call.registerOutParameter("O_RESPUESTA", OracleTypes.VARCHAR);
            call.registerOutParameter("O_TIMBRE", OracleTypes.NUMBER);
            call.registerOutParameter("O_INICIO", OracleTypes.NUMBER);
            call.registerOutParameter("O_FIN", OracleTypes.NUMBER);
            call.execute();
    
            timbre.setRespuesta(call.getString("O_RESPUESTA"));
            timbre.setId(call.getInt("O_TIMBRE"));
            timbre.setInicio(call.getInt("O_INICIO"));
            timbre.setFin(call.getInt("O_FIN"));
            
        } finally{
            if(!esTransaccional()){
                close();
            }
        }
        return timbre;
    }
    /*
    public List<ReporteRiesgoForm> obtenerNumeros () throws SQLException, ClassNotFoundException, NamingException {
        List<ReporteRiesgoForm> timbres = null;
        try{
            open();
            call = cn.prepareCall("{ call PKG_TIMBRES.OBTENER_NUMEROS (?) }");
            call.registerOutParameter("C_NUMEROS", OracleTypes.CURSOR);
            call.execute();
            
            rs = (ResultSet)call.getObject("C_NUMEROS");
            if (rs != null){
                timbres = new ArrayList<ReporteRiesgoForm>();
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
    }*/
    
}
