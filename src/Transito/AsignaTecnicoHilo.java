package Transito;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.Random;

import oracle.jdbc.OracleTypes;


public class AsignaTecnicoHilo extends Thread {
    private String sad_reg_year;
    private String key_cuo;
    private String sad_reg_nber;
    private String usuario;

    @Override
    public void run() {
        conexion dc = new conexion();
        Connection con = null;
        CallableStatement call = null;
        String res = "OK";
        ResultSet rss = null;
        Random rand = new Random();     
        int r = rand.nextInt(15)+5;
        try {
            con = dc.abrirConexion();
            /*call = con.prepareCall("{ ? = call pkg_util.test_sleep(?) }");
            call.registerOutParameter(1, OracleTypes.INTEGER);
            call.setInt(2, 9);
            call.execute();
            res = (Integer)call.getObject(1);*/
            call = con.prepareCall("{ ? = call pkg_util.asigna_tecnico(?,?,?,?) }");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.setString(2, sad_reg_year);
            call.setString(3, key_cuo);
            call.setString(4, sad_reg_nber);  
            call.setString(5, usuario);
            call.execute();
            res = (String)call.getObject(1);
        } catch (Exception er) {
            res = "ERROR";
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
        System.out.println("FINALIZO EL PROCESO DEL HILO " + sad_reg_year +"/"+key_cuo+"/C-"+sad_reg_nber + " - "+String.valueOf(r));
    }

    public static void main(String[] args) {
        AsignaTecnicoHilo miHilo = new AsignaTecnicoHilo();
        miHilo.run();
    }

    private void esperarXsegundos(int segundos) {
        try {
            Thread.sleep(segundos * 1000);
        } catch (InterruptedException ex) {
            Thread.currentThread().interrupt();
        }
    }

    public AsignaTecnicoHilo() {
        super();
    }

    public void setSad_reg_year(String sad_reg_year) {
        this.sad_reg_year = sad_reg_year;
    }

    public String getSad_reg_year() {
        return sad_reg_year;
    }

    public void setKey_cuo(String key_cuo) {
        this.key_cuo = key_cuo;
    }

    public String getKey_cuo() {
        return key_cuo;
    }

    public void setSad_reg_nber(String sad_reg_nber) {
        this.sad_reg_nber = sad_reg_nber;
    }

    public String getSad_reg_nber() {
        return sad_reg_nber;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getUsuario() {
        return usuario;
    }
}
