package VariableRiesgo;



import java.sql.SQLException;

import java.util.List;

import javax.naming.NamingException;


public class EvaluarControlNeg {
    private final EvaluarControlDao dao = new EvaluarControlDao();
    private final String CORRECTO_BD = "CORRECTO";
    private final String ERROR_BD = "ERROR";
    
    private boolean estaConectadoBd() {
        return dao != null;
    }
    /*
    public Respuesta<EvaluarControlForm> generarNumeros(EvaluarControlForm timbre) {
        Respuesta<EvaluarControlForm> respuesta = new Respuesta<EvaluarControlForm>();
        respuesta.setCodigo(-1);
        if (estaConectadoBd()) {
            try {
                EvaluarControlForm res = dao.generarNumeros(timbre);
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
    }
    
    public Respuesta<String> guardarDescarga(int timbre, long inicio, long fin, String usuario) {
        Respuesta<String> respuesta = new Respuesta<String>();
        respuesta.setCodigo(-1);
        if (estaConectadoBd()) {
            try {
                String res = dao.guardarDescarga(timbre, inicio, fin, usuario);
                if (res == null) {
                    respuesta.setCodigo(0);
                    respuesta.setMensaje("No se pudo guardar la descarga.");
                } else {
                    respuesta.setCodigo(1);
                    respuesta.setMensaje("OK");                
                    respuesta.setResultado(res);
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
    }
    */
}
