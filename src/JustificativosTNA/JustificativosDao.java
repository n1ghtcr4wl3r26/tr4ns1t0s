package JustificativosTNA;


import Main.ClaseSession;

import Transito.conexion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import oracle.jdbc.OracleTypes;


public class JustificativosDao {
   
    public JustificativosDao() {
        super();
    }


    public static String VerificaManJus(String key_cuo, String key_year, String key_nber) {
        conexion dc = new conexion();
        Connection con = null;
        CallableStatement call = null;
        String rs = "OK";
        ResultSet rss = null;
        try {
            con = dc.abrirConexion();
            call = con.prepareCall("{ ? = call pkg_justificativos.verifica_man_jus(?,?,?) }");
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

    public static String subePDF(HttpServletRequest request) {
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
        try {
            JustificativosForm bDoc = (JustificativosForm)request.getAttribute("JustificativosForm");
            /*int tam = 0;
            FormFile file = bDoc.getFile_jus();
            if (!file.getFileName().equals("")) {
                tam = file.getFileSize();
                if (file.getFileSize() <= 0)
                    return "El archivo que envio no tiene el formato PDF";

                if (cs.getPeso_file() == 0) {
                    cs.setPeso_file(300);
                }
                if (file.getFileSize() > cs.getPeso_file() * 1024) //300 kb
                    return "<font size='4px' color='red'>El archivo supera los <b>" + cs.getPeso_file() + " Kb </b> permitidos </font>";
                String str = file.getFileName();

                boolean resultado = str.toLowerCase().endsWith(".pdf");
                if (!resultado)
                    return "El archivo que envio no tiene el formato PDF";

                File subdir = new File("/u03/oracle/user_projects/data/transitos_just/" + bDoc.getKey_cuo() + "/");
                if (!subdir.exists())
                    subdir.mkdir();

                File subdir1 = new File("/u03/oracle/user_projects/data/transitos_just/" + bDoc.getKey_cuo() + "/" + bDoc.getKey_year() + "/");

                if (!subdir1.exists())
                    subdir1.mkdir();

                InputStream stream = file.getInputStream();
                String fil = subdir1 + "/"+bDoc.getKey_cuo()+bDoc.getKey_year()+bDoc.getKey_nber()+"-"+bDoc.getAdu_pres()+"-"+bDoc.getFecha_just().replaceAll("/", "")+".pdf";
                OutputStream bos = new FileOutputStream(fil);
                int bytesRead = 0;
                byte buffer[] = new byte[8192];
                while ((bytesRead = stream.read(buffer, 0, 8192)) != -1)
                    bos.write(buffer, 0, bytesRead);
                bos.close();
                
                bDoc.setDocumento(fil);        
                String res = graba_justificativo(bDoc);
                return res;     
                
            } else {
                return "Error al cargar el archivo";
            }
            */
            String res = graba_justificativo(bDoc);
            return res;     
           
        } catch (Exception e) {
            return "ERROR "+e.getMessage();
        }
    }
    
    
    
    public static String graba_justificativo(JustificativosForm bean) {
        conexion dc = new conexion();
        Connection con = null;
        CallableStatement call = null;
        String rs = "OK";
        ResultSet rss = null;
        try {
            con = dc.abrirConexion();
            call = con.prepareCall("{ ? = call pkg_justificativos.graba_justificativo(?,?,?,?,?, ?,?,?,?,?,?) }");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.setString(2, bean.getKey_cuo());
            call.setString(3, bean.getKey_year());
            call.setString(4, bean.getKey_nber());
            call.setString(5, bean.getAdu_pres());
            call.setString(6, bean.getCite_just());
            
            call.setString(7, bean.getFecha_just());
            call.setString(8, bean.getHoja_ruta());
            call.setString(9, bean.getCausa());
            call.setString(10, bean.getObservacion());
            call.setString(11, bean.getDocumento());
            call.setString(12, bean.getCodusu());
            call.execute();
            rs = (String)call.getObject(1);
        } catch (Exception er) {
            rs = "ERROR "+ er.toString();
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
