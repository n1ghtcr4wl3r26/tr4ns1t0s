package Transito;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.jdbc.OracleTypes;


public class Util {

    public Util() {
    }

    public static String creamensaje(String tipo, String Mensaje, String tiempo) {

        String res = "";
        if (tipo.equals("1")) {
            res =
    "<div id='msgalert'>" + Mensaje + "</div><script type='text/javascript'>$(document).ready(function(){$('#msgalert').fadeIn(1000);setTimeout('hide()',450000);});function hide(){$('#msgalert').fadeOut(3000);}</script>";
        }
        if (tipo.equals("2")) {
            res =
    "<div id='msgerror'>" + Mensaje + "</div><script type='text/javascript'>$(document).ready(function(){$('#msgerror').fadeIn(1000);setTimeout('hide()',450000);});function hide(){$('#msgerror').fadeOut(3000);}</script>";
        }
        if (tipo.equals("3")) {
            res =
    "<div id='msginfo'>" + Mensaje + "</div><script type='text/javascript'>$(document).ready(function(){$('#msginfo').fadeIn(1000);setTimeout('hide()',450000);});function hide(){$('#msginfo').fadeOut(3000);}</script>";
        }
        return res;
    }

    public static String VerificaAduanaAutPrevia(String key_cuo, String dato, String numero, String tipo) {
        conexion dc = new conexion();
        Connection con = null;
        CallableStatement call = null;
        String rs = "OK";
        ResultSet rss = null;
        try {
            con = dc.abrirConexion();
            call = con.prepareCall("{ ? = call pkg_ds2295.verifica_aduana_autprevia(?,?,?,?) }");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.setString(2, key_cuo);
            call.setString(3, dato);
            call.setString(4, numero);
            call.setString(5, tipo);
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

    public static String devuelve_urlsistema(String sistema) {
        conexion dc = new conexion();
        Connection con = null;
        CallableStatement call = null;
        String rs = "OK";
        ResultSet rss = null;
        try {
            con = dc.abrirConexion();
            call = con.prepareCall("{ ? = call pkg_menu.devuelve_url(?) }");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.setString(2, sistema);
            call.execute();
            rs = (String)call.getObject(1);
        } catch (Exception er) {
            rs = "/";
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
    
    public static String devuelve_aduana_desc(String aduana) {
        conexion dc = new conexion();
        Connection con = null;
        CallableStatement call = null;
        String rs = "";
        try {
            con = dc.abrirConexion();
            call = con.prepareCall("{ ? = call pkg_justificativos.devuelve_aduana_desc(?) }");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.setString(2, aduana);
            call.execute();
            rs = (String)call.getObject(1);
        } catch (Exception er) {
            rs = "-";
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

    public static String devuelve_fecha_actual (){
        conexion dc = new conexion();
        Connection con = null;
        CallableStatement call = null;
        String rs = "";
        ResultSet rss = null;
        try {
            con = dc.abrirConexion();
            call = con.prepareCall("{ ? = call pkg_justificativos.devuelve_fecha_actual }");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.execute();
            rs = (String)call.getObject(1);
        } catch (Exception er) {
            rs = "-";
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

    public static String devuelve_codimg_next(String key_cuo, String key_year, String key_nber) {
        conexion dc = new conexion();
        Connection con = null;
        CallableStatement call = null;
        String rs = "OK";
        ResultSet rss = null;
        try {
            con = dc.abrirConexion();
            call = con.prepareCall("{ ? = call pkg_imagenes.devuelve_codimg_next(?,?,?) }");
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
/*
    public static String verifica_9031(String key_cuo, String key_voy_nber, String key_dep_date) {
        conexion dc = new conexion();
        Connection con = null;
        CallableStatement call = null;
        String rs = "OK";
        String res;

        try {
            con = dc.abrirConexion();
            call = con.prepareCall("{ ? = call pkg_reporte.reporte_operadorhab(?,?,?) }");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.setString(2, key_cuo);
            call.setString(3, key_voy_nber);
            call.setString(4, key_dep_date);
            call.execute();
            res = (String)call.getObject(1);

            if (res == null) {
                rs = "<table width='80%' border='0' cellpadding='3' class='marco' align='center' id='c'><tr><td>No se encontraron empresas registradas</td></tr></table>";
            } else {
                
                if (res.equals("ERROR")) {
                    rs = "<table width='80%' border='0' cellpadding='3' class='marco' align='center' id='c'><tr><td>Se produjo un error al realizar la consulta</td></tr></table>";
                } else {
                
                
                String delimiter = "-";
                String[] temp;
                temp = res.split(delimiter);
                if (temp.length > 0) {
                    rs = "<table width='80%' border='0' cellpadding='3' class='marco' align='center' id='c'>";
                    rs = rs + "<tr class='t14'><th colspan='2' align='center'>OPERADORES ASOCIADOS AL MANIFIESTO</th></tr>";
                    rs = rs + "<tr class='t14'><th  align='center'>ESTADO</th><th  align='center'>MANIFIESTO</th></tr>";
                    
                    for (int i = 0; i < temp.length; i++) {
                        if(temp[i].length() >13 )
                        rs = rs + "<tr class='tr1'><td>" + temp[i].substring(0, 13) + "</td><td>" + temp[i].substring(13, temp[i].length()) + "</td></tr>";
                    }
                    rs = rs + "</table>";
                } else {
                    rs = "<table width='80%' border='0' cellpadding='3' class='marco' align='center' id='c'><tr><td>NO EXISTEN OPERADORES ASOCIADOS AL MANIFIESTO</td></tr></table>";
                }
                }
            }


        } catch (Exception er) {
            
            rs = "<table width='80%' border='0' cellpadding='3' class='marco' align='center' id='c'><tr><td>Error al desplegar los datos</td></tr> <tr><td>"+er.toString()+"</td></tr> </table>";
            
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

    public static String verifica_9030(String key_cuo, String key_voy_nber, String key_dep_date) {
        conexion dc = new conexion();
        Connection con = null;
        CallableStatement call = null;
        String rs = "OK";
        String manpendientes;
        String res = "";
        ResultSet rss = null;

        try {
            con = dc.abrirConexion();
            call = con.prepareCall("{ ? = call pkg_reporte.reporte_manpendiente(?,?,?, ?,?) }");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.setString(2, key_cuo);
            call.setString(3, key_voy_nber);
            call.setString(4, key_dep_date);
            call.registerOutParameter(5, -10);
            call.registerOutParameter(6, OracleTypes.VARCHAR);
            call.execute();
            rs = (String)call.getObject(1);


            if (rs.equals("CORRECTO")) {
                res = "<table width='80%' border='0' cellpadding='3' class='marco' align='center' id='c'>";
                res = res + "<tr class='t14'><th align='center'>RESULTADO</th></tr>";
                
                res = res + "<tr class='tr1'><td >No se encontraron manifiestos pendientes</td></tr>";
                res = res + "</table>";
            } else {

                if (rs.substring(0, 5).equals("MANIF")) {
                    res = "<table width='80%' border='0' cellpadding='3' class='marco' align='center' id='c'>";
                    res = res + "<tr class='t14'><th align='center'>RESULTADO</th></tr>";
                    
                    res = res + "<tr class='tr1'><td>" + rs + "</td></tr>";
                    res = res + "</table>";
                } else {
                    if (rs.substring(0, 5).equals("PENDI")) {
                        manpendientes = (String)call.getObject(6);
                        rss = (ResultSet)call.getObject(5);


                        res = "<table width='80%' border='0' cellpadding='3' class='marco' align='center' id='c'>";

                        res = res + "<tr class='t14'><th align='center'>No.</th><th width='15%'  align='center'>Manifiesto</th><th align='center'>Estado</th></tr>";

                        int c = 1;
                        while (rss != null && rss.next()) {
                            
                            if(manpendientes ==null){
                                res =  res + "<tr class='tr1'><td>" + c + "</td><td>" + rss.getString(1) + "/" + rss.getString(2) + "/" + rss.getString(3) +
                                "</td><td>MANIFIESTO CON TRANSITO PENDIENTE O NO LOCALIZADO</td></tr>";
                                c = c + 1;
                            }
                            else
                            {
                            
                            if (manpendientes.indexOf(rss.getString(2) + rss.getString(3)) > -1) {
                                res =
 res + "<tr class='tr1'><td>" + c + "</td><td>" + rss.getString(1) + "/" + rss.getString(2) + "/" + rss.getString(3) +
   "</td><td>MANIFIESTO CON TRANSITO PENDIENTE O NO LOCALIZADO</td></tr>";
                                c = c + 1;
                            }
                                
                                }
                        }


                        res = res + "</table>";


                    }
                }
            }
        } catch (Exception er) {
            rs = "<table width='80%' border='0' cellpadding='3' class='marco' align='center' id='c'><tr><td>Error al desplegar los datos</td></tr> <tr><td>"+er.toString()+"</td></tr> </table>";
            
        } finally {
            try {
                if (con != null)
                    con.close();
                call.close();

            } catch (SQLException er) {
                ;
            }
        }
        return res;
    }
*/

}
