<%@ page contentType="text/html; charset=UTF-8" language="java" buffer="none" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<%@ page import="Main.*, Transito.*"%>
<%@ page import="oracle.jdbc.pool.OracleConnectionPoolDataSource"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="javax.sql.PooledConnection"%>
<%@ page import="oracle.jdbc.OracleTypes"%>
<%@ page import="java.sql.CallableStatement"%>
<%@ page import="java.text.SimpleDateFormat"%>

<style type="text/css">
<!--
.t14 {
  font-size: 12px;
	color: #000000;
	font-weight: bolder;
	text-align: left;
}
#a th {
  font-family: tahoma;
	text-align: right;
	font-size: 10px;
  font-weight: bolder;
}
#a td {
  font-size: 10px;
  color: #004e9b;
}
#a caption{
  font-family: tahoma;
  font-size: 14px;
	color: #000000;
	font-weight: bolder;
	text-align: center;
}
th {
  font-size: 10px;
	color: #000000;
	font-weight: bolder;
	text-align: center;
  font-family: tahoma;
}
td {
  font-size: 9px;
  color: #004e9b;
  font-family: tahoma;
	font-weight: normal;
}
-->
</style>

<html:html>
  <head>
    <meta name="Author" content="W. Roberto Albarracín Gutiérrez" lang="es">
    <meta name="copyright" content="&copy; 2007, Aduana Nacional de Bolivia" lang="es">
  </head>

<%
  ClaseSession cs = (ClaseSession) request.getSession().getAttribute( "ClaseSession" );
%>

<body bgcolor="#F5F9FD">
Aduana Nacional de Bolivia
  <table width="100%" border="1" cellpadding="3" cellspacing="0" class="marco" align="center" id="a">
    <caption>Reporte de Tránsito</caption>
    <tr><th>Aduana de Partida:</th><td><%=cs.getDscadu()%></td></tr>
    <tr><th>Nro. de Registro del Tránsito:</th><td><%=cs.getKey_year()%>/<%=cs.getKey_cuo()%>-<%=cs.getKey_nber()%></td></tr>
<%ClaseSql sql = new ClaseSql();
  int i = 1;
  String msg = "";
  String tr = "";

  SimpleDateFormat FecHoy = new SimpleDateFormat("dd/MM/yyyy HH:mm");

  try {
    sql.getConexion();

    CallableStatement call = null;
    call = sql.cn.prepareCall( "{call pkg_transito.consulta_transito( ?, ?, ?, ?, ?, ? ) }" );
    call.registerOutParameter( 5, OracleTypes.CURSOR );
    call.registerOutParameter( 6, OracleTypes.CURSOR );
    call.setString( 1, cs.getKey_cuo() );
    call.setString( 2, cs.getKey_year() );
    call.setString( 3, cs.getKey_nber() );
    call.setInt( 4, 10 );
    call.execute();

    String fecha = "", hora = "" , StrSql = "";
    ResultSet rs = ( ResultSet ) call.getObject( 5 );
    if( ! ( rs == null || !rs.next() ) ) {  %>
    <tr>
      <th>Empresa Transportista:</th><td><%= rs.getString( "car_car_cod" ) %> <%= rs.getString( "car_car_nam" ) %></td>
      <th>Placa del Medio de Transporte:</th><td><%= rs.getString( "car_id_trp" ) %></td>
    </tr>
    <tr><th>Precinto(s) SIDUNEA++:</th><td><%=rs.getString("precinto")%></td></tr>
    <tr>
      <th>Precintos:</th><td colspan="3"><%= rs.getString( "tra_pre" ) %></td>
    </tr>
<%    if( rs.getString( "boleta" ) != null )  {  %>
    <tr>
      <th>Garantia:</th><td colspan="3"><%= rs.getString( "boleta" ) %></td>
    </tr>
<%    }
    }
    rs = ( ResultSet ) call.getObject( 6 );
    if( ! ( rs == null || !rs.next() ) ) {
      if( rs.getInt( 1 ) == 0 ) { %>
    <tr>
      <th>
<%
//if (rs.getString( "tra_cuo_ini" ).equals("111") || rs.getString( "tra_cuo_ini" ).equals("611") || rs.getString( "tra_cuo_ini" ).equals("712") || rs.getString( "tra_cuo_ini" ).equals("911"))
if (rs.getString( "cuo_acc" ).equals("PTOCTL"))
{%>Punto de Control:
</th>
      <td><%= rs.getString( "tra_cuo_ini" ) %> <%= rs.getString( "tra_dsc_ini" ) %></td>
      <th>Fecha/Hora de Paso:</th>
      <td><%= rs.getString( "tra_fec_ini" ) %></td>
    </tr>
<%
String observ="";
int fin=0;
String placa1="";
String obser1="";
String nit1="";
int aux=0;
try
{
observ= rs.getString( "tra_obs" ).toString();
fin=observ.indexOf("*", 0);
placa1=observ.substring(0,fin);
aux=placa1.indexOf(":",0);
placa1=placa1.substring(aux+1);

//placa1=placa1.replace()
}
catch(Exception e)
{
placa1="";
}

try
{
aux=fin;
fin=observ.indexOf("*", aux+1);
nit1=observ.substring(aux,fin);
aux=nit1.indexOf(":",0);
nit1=nit1.substring(aux+1);

//placa1=placa1.replace()
}
catch(Exception e)
{
fin=aux;
nit1="";
}

try
{
aux=0;
obser1=observ.substring(fin+1);
aux=obser1.indexOf(":",0);
obser1=obser1.substring(aux+1);
}
catch(Exception e)
{
obser1="";
}
%>
    
   <tr><th>Placa:</th><td colspan="3"><%=placa1%>&nbsp;</td></tr>
    <tr><th>NIT:</th><td colspan="3"><%=nit1%>&nbsp;</td></tr>
    <tr><th>Observacion:</th><td colspan="3"><%=obser1%>&nbsp;</td></tr>
    
<%}
else
{%>Aduana de Paso:
</th>
      <td><%= rs.getString( "tra_cuo_ini" ) %> <%= rs.getString( "tra_dsc_ini" ) %></td>
      <th>Fecha/Hora de Paso:</th>
      <td><%= rs.getString( "tra_fec_ini" ) %></td>
    </tr>
<%}%>
      
<%
      }
%>
  </table>
  <table width="100%" border="1" cellpadding="3" cellspacing="0" class="marco">
    <tr>
      <th colspan="2">Partida</th>
      <th colspan="2">Llegada Estimada</th>
      <th colspan="2">Llegada</th>
      <th rowspan="2">Tipo de Cierre</th>
      <th rowspan="2">Estado</th>
    </tr>
    <tr>
      <th>Aduana</th>
      <th>Fecha y Hora</th>
      <th>Aduana</th>
      <th>Fecha y Hora</th>
      <th>Aduana</th>
      <th>Fecha y Hora</th>
    </tr>
<%
      do{
        if( rs.getInt( 1 ) != 0 ) {
          if ( rs.getInt( 16 ) == 1 )
            StrSql ="Concluido";
          else
          {
            fecha = rs.getString( 14 );
            hora = rs.getString( 15 );
            if( rs.getInt( 16 ) == 0 )
              StrSql ="Sin localizaci&oacute;n";
            else
            {
              if ( rs.getInt( 15 ) <= 0 )
                StrSql ="En tr&aacute;nsito";
              else
               /* if( rs.getString(19).equals("-")  ) 
                {  StrSql = rs.getString(19).toString();   }
                else*/
                StrSql ="Fuera de Plazo";
            }
          }
          if( (rs.getInt( "key_secuencia" ) % 2) == 0 ) {
%>
    
    <tr class="tr10">
<%        } else  {  %>
    <tr class="tr12">
<%        }  %>
      <td><%= rs.getString( "tra_cuo_ini" ) %>: <%= rs.getString( "tra_dsc_ini" ) %></td>
      <td><%= rs.getString( "tra_fec_ini" ) %></td>
      <td><%= rs.getString( "tra_cuo_est" ) %>: <%= rs.getString( "tra_dsc_est" ) %></td>
      <td><%= rs.getString( "tra_fec_est" ) %></td>
<%        if( rs.getString( "tra_cuo_des" ) == null )  { %>
      <td></td><td></td>
<%        }  else  {  %>
      <td><%= rs.getString( "tra_cuo_des" ) %>: <%= rs.getString( "tra_dsc_des" ) %></td>
      <td><%= rs.getString( "tra_fec_des" ) %></td>
<%        }
          if( rs.getString( "tra_cuo_des" ) == null )
          {
            if( rs.getInt( "tra_estado" ) != 0 )
              StrSql = "Pendiente";
            tr = "";
          }
          else
          {
            msg = "Concluido";
            tr = rs.getString( "tra_tipo" );
            if( tr.equals( " " ) )
            {
              if( rs.getInt(1) == 0 )
                tr = "Aduana de paso";
              else
                tr = "";
            }
          /*{
            case 24:
              tr = "24: Normal";
              break;
            case 23:
              tr = "23: Cierre Forzoso";
              break;
            case 28:
              tr = "28: Transbordo";
              break;
            default:
              if( rs.getInt(1) == 0 )
                if( rs.getInt(1) == 0 )
                tr = "Aduana de paso";
              else
                tr = "";
          }*/
          }
%>
      <td><%= tr %></td>
      <td><%= StrSql %></td>
    <tr>
<%        }
        }while( rs.next() );
      }
    } catch( Exception e ) {
      e.printStackTrace();
    }
    finally {
      sql.getClose();
    }
%>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="0">
    <tr>
      <td>
        <strong>Fecha y Hora de proceso:&nbsp;&nbsp;</strong> <%= FecHoy.format(new java.util.Date()) %>
      </td>
    </tr>
  </table>
</body>
</html:html>