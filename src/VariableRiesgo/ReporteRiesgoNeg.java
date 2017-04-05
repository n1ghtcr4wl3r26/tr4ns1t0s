package VariableRiesgo;



import java.sql.SQLException;

import java.util.List;

import javax.naming.NamingException;


public class ReporteRiesgoNeg {
    private final ReporteRiesgoDao dao = new ReporteRiesgoDao();
    private final String CORRECTO_BD = "CORRECTO";
    private final String ERROR_BD = "ERROR";
    
    private boolean estaConectadoBd() {
        return dao != null;
    }
    /*
    public Respuesta<ReporteRiesgoForm> generarNumeros(ReporteRiesgoForm timbre) {
        Respuesta<ReporteRiesgoForm> respuesta = new Respuesta<ReporteRiesgoForm>();
        respuesta.setCodigo(-1);
        if (estaConectadoBd()) {
            try {
                TimbreForm res = dao.generarNumeros(timbre);
                if (res != null && res.getRespuesta().equals("OK")) {
                    respuesta.setCodigo(1);
                    respuesta.setMensaje("OK");                
                    respuesta.setResultado(res);
                } else {
                    respuesta.setCodigo(0);
                    respuesta.setMensaje(res.getRespuesta());
                }
            } catch (SQLException e) {
                respuesta.setMensaje("Error no identificado -  " + e.getMessage());    
                Log.error("Error no identificado", "BASE DE DATOS", e);
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                respuesta.setMensaje("Error no identificado -  " + e.getMessage());
                Log.error("Error no identificado", "BASE DE DATOS", e);
            } catch (NamingException e) {
                respuesta.setMensaje("Error no identificado -  " + e.getMessage());
                Log.error("Error no identificado", "BASE DE DATOS", e);
            }
        } else {
            respuesta.setMensaje("Error. No se puede conectar a la base de datos.");
        }

        return respuesta;
    }*/
    
    
}
