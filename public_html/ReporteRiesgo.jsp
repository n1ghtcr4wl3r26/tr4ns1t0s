<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="Reporte.*, Transito.*"%>
<%@ page import="oracle.jdbc.pool.OracleConnectionPoolDataSource"%>
<%@ page import="oracle.jdbc.pool.OraclePooledConnection"%>
<%@ page import="java.sql.CallableStatement"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="javax.sql.PooledConnection"%>
<%@ page import="oracle.jdbc.OracleTypes"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.text.SimpleDateFormat"%>

<script language="JavaScript" type="text/JavaScript">
<!--
function Boton( aduana, gestion, serial ) {
  f = document.forms[1];
  f.tipo.value = "1";
  f.nit.value = aduana;
  f.check1.value = gestion;
  f.check2.value = serial;
  f.submit();
}
//*******modificado edgar arteaga 06012014 para detalle de cierres por documentos de embarque  
function Boton2( aduana, gestion, serial, secuencia ) {
  f = document.forms[1];
  f.tipo.value = "2";
  f.nit.value = aduana;
  f.check1.value = gestion;
  f.check2.value = serial;
  f.check3.value = secuencia;
  f.submit();
//*******  
}
-->
</script>

<html:form action="/ReporteAction" target="_blank">
  <html:hidden property="tipo"/>
  <html:hidden property="nit"/>
  <html:hidden property="check1"/>
  <html:hidden property="check2"/>
  <html:hidden property="check3"/>
</html:form>
<%
 ReporteForm bReporte = (ReporteForm) request.getAttribute("ReporteForm");

ClaseSql sql = new ClaseSql();
  String StrSql = "";
  String cadena = "";
  int i = 0;

  SimpleDateFormat FecHoy = new SimpleDateFormat("dd/MM/yyyy HH:mm");

  try {
    sql.getConexion();
%>
  <table width="100%" border="0" cellpadding="3" cellspacing="0" align="center">
    <tr><th>Reporte de Manifiestos para el Control de Riesgos</th></tr>
  </table>
  <table width="100%" border="1" cellpadding="3" cellspacing="0" class="marco" align="center" id="c">
    <tr class="t14">
      <th align="center">Manifiesto</th>         
      <th align="center">Documento de Embarque</th>
      <th align="center">Empresa</th>
      <th align="center">Placa</th>
      <th align="center">Fecha de Registro del Manifiesto</th>
      <th align="center">Fecha Partida</th>
      <th align="center">Aduana Partida</th>
      <th align="center">Fecha Destino</th>
      <th align="center">Aduana Destino</th> 
      <th align="center">Estado</th>
      
      
      <th align="center">T&eacute;cnico Aduanero</th>
      <th align="center">Consignatario</th>
      <th align="center">Proveedor</th>
      <th align="center">Conductor</th>
      <th align="center">Descripci&oacute;n de la mercanc&iacute;a</th>
      <th align="center">Precintos</th>
      <th align="center">Informaci&oacute;n Adicional Manifiesto</th>
      <th align="center">Peso</th>
      <th align="center">Cantidad de bultos</th>
    </tr> 
<% 
StrSql = "SELECT   cg.key_cuo, cg.car_reg_year, cg.car_reg_nber,  0 key_secuencia, "+
         "cg.car_car_cod || ': ' || cg.car_car_nam, cg.car_id_trp, '-' AS tra_fec_ini, '-' AS tra_cuo_ini, '-' AS tra_fec_des, "+
         "'-' AS tra_cuo_des, ' ' AS tra_tipo, 0 AS loc, 0 AS dias, '-' lst_ope, "+
         "'-' acta, "+
         "'-', "+
         "nvl(cbg.carbol_cons_cod,' '), cbg.carbol_cons_nam, NVL (cg.car_mast_nam, '-') || ' ' "+
         "|| NVL (car_mast_inf1, ' ') || ' '|| NVL (car_mast_inf2, ' ') conductor,  "+
         "NVL (cbg.carbol_good1, ' ') || NVL (cbg.carbol_good2, ' ') || NVL (cbg.carbol_good3, ' ') || NVL (cbg.carbol_good4, ' ') || NVL (cbg.carbol_good5, ' '), "+
         "'-', NVL (cbg.carbol_infos1, ' ') || ' ' || NVL (cbg.carbol_infos2, ' ') numero_factura, cbg.key_bol_ref,  "+
         "carbol_gros_mas peso, carbol_pack_nber cantidad_bultos, upt.pkg_dsc,  TO_CHAR (cg.car_reg_date , 'dd/mm/yyyy') ||' '||cg.car_reg_time, cbg.carbol_exp_nam "+
  "FROM   ops$asy.car_gen cg, ops$asy.car_bol_gen cbg, ops$asy.unpkgtab upt "+
"WHERE       upt.pkg_cod = cbg.carbol_pack_cod AND cg.key_cuo = cbg.key_cuo AND cg.key_voy_nber = cbg.key_voy_nber "+
"AND cg.key_cuo LIKE '"+ bReporte.getI_aduana() + "' "+
"AND TRUNC (cg.car_reg_date) BETWEEN TO_DATE ('"+bReporte.getI_fecha() + "', 'dd/mm/yyyy') AND  TO_DATE ('" + bReporte.getD_fecha() + "', 'dd/mm/yyyy') ";

if(bReporte.getEmpresa().length()>0)
StrSql = StrSql + "and cbg.carbol_cons_cod = '"+bReporte.getEmpresa()+"' ";
if(bReporte.getTransporte().length()>0)
StrSql = StrSql + "and cg.car_car_cod = '"+bReporte.getTransporte()+"' ";
if(bReporte.getPlaca().length()>0)
StrSql = StrSql + "and cg.car_id_trp = '"+bReporte.getPlaca()+"' ";
if(bReporte.getChofer().length()>0)
StrSql = StrSql + "and upper(cg.car_mast_nam) like '%"+bReporte.getChofer().toUpperCase() +"%' ";
if(bReporte.getProveedor().length()>0)
StrSql = StrSql + "and upper(cbg.carbol_exp_nam) like '%"+bReporte.getProveedor().toUpperCase() +"%' ";
if(bReporte.getRemitente().length()>0)
StrSql = StrSql + "and upper(cbg.key_bol_ref) like '%"+bReporte.getRemitente().toUpperCase() +"%' ";

        StrSql = StrSql + " AND cg.key_dep_date = cbg.key_dep_date  "+
        " AND cg.car_reg_nber IS NOT NULL AND CBG.carbol_nat_cod = '24' and cbg.carbol_typ_cod <> 'LTR' AND (SELECT   COUNT (1) FROM   transitos.tra_pla_rut a "+
        "       WHERE       a.key_cuo = cg.key_cuo AND a.car_reg_year = cg.car_reg_year AND a.car_reg_nber = cg.car_reg_nber AND a.tra_num = 0 AND a.key_secuencia = 1) = 0 "+
"UNION SELECT   cg.key_cuo, cg.car_reg_year, cg.car_reg_nber, a.key_secuencia,   cg.car_car_cod || ': ' || cg.car_car_nam, cg.car_id_trp, "+
         "TO_CHAR (a.tra_fec_ini, 'dd/mm/yyyy HH24:mi') AS tra_fec_ini, a.tra_cuo_ini || ': ' || b.cuo_nam AS tra_cuo_ini, NVL (TO_CHAR (a.tra_fec_des, 'dd/mm/yyyy HH24:mi'), "+
         "     TO_CHAR (a.tra_fec_est, 'dd/mm/yyyy HH24:mi')) AS tra_fec_des, DECODE (a.tra_cuo_des, NULL, a.tra_cuo_est || ': ' || c.cuo_nam, a.tra_cuo_des || ': ' || d.cuo_nam) "+
         "    AS tra_cuo_des, DECODE (a.tra_tipo,23, 'Forzoso',24, 'Normal',28, 'Transbordo',31, 'Despacho Anticipado',' ') "+
         "    AS tra_tipo,DECODE (a.tra_fec_des, NULL, 2, a.tra_loc) AS loc, TRUNC (SYSDATE - a.tra_fec_est) AS dias,a.lst_ope, "+
          "tiene_acta (a.key_cuo, a.car_reg_year, a.car_reg_nber, a.key_secuencia) acta, "+
         "devuelve_tecnicos_operaciones(a.key_cuo, a.car_reg_year, a.car_reg_nber , a.key_secuencia), "+
         "nvl(cbg.carbol_cons_cod,' '), cbg.carbol_cons_nam, "+
         "   NVL (cg.car_mast_nam, '-')||' '|| NVL (car_mast_inf1, ' ')||' '|| NVL (car_mast_inf2, ' ')conductor,NVL (cbg.carbol_good1, ' ')|| NVL (cbg.carbol_good2, ' ') "+
         "|| NVL (cbg.carbol_good3, ' ')|| NVL (cbg.carbol_good4, ' ')|| NVL (cbg.carbol_good5, ' '),a.tra_pre precintos,NVL (cbg.carbol_infos1, ' ') || ' ' || NVL (cbg.carbol_infos2, ' ') "+
         "    numero_factura, cbg.key_bol_ref, carbol_gros_mas peso,carbol_pack_nber cantidad_bultos,upt.pkg_dsc , TO_CHAR (cg.car_reg_date , 'dd/mm/yyyy') ||' '||cg.car_reg_time, cbg.carbol_exp_nam  "+
  "FROM   transitos.tra_pla_rut a, ops$asy.uncuotab b, ops$asy.uncuotab c, ops$asy.uncuotab d, ops$asy.car_gen cg, ops$asy.car_bol_gen cbg, ops$asy.unpkgtab upt "+
"WHERE       upt.pkg_cod = cbg.carbol_pack_cod AND a.key_cuo = cg.key_cuo AND a.car_reg_year = cg.car_reg_year AND a.car_reg_nber = cg.car_reg_nber AND cg.key_cuo = cbg.key_cuo "+
         "AND cg.key_voy_nber = cbg.key_voy_nber AND cg.key_dep_date = cbg.key_dep_date "+
"AND cg.key_cuo LIKE '"+ bReporte.getI_aduana() + "' "+
"AND TRUNC (cg.car_reg_date) BETWEEN TO_DATE ('"+bReporte.getI_fecha() + "', 'dd/mm/yyyy') AND  TO_DATE ('" + bReporte.getD_fecha() + "', 'dd/mm/yyyy') ";

if(bReporte.getEmpresa().length()>0)
StrSql = StrSql + "and cbg.carbol_cons_cod = '"+bReporte.getEmpresa()+"' ";
if(bReporte.getTransporte().length()>0)
StrSql = StrSql + "and cg.car_car_cod = '"+bReporte.getTransporte()+"' ";
if(bReporte.getPlaca().length()>0)
StrSql = StrSql + "and cg.car_id_trp = '"+bReporte.getPlaca()+"' ";
if(bReporte.getChofer().length()>0)
StrSql = StrSql + "and upper(cg.car_mast_nam) like '%"+bReporte.getChofer().toUpperCase() +"%' ";
if(bReporte.getProveedor().length()>0)
StrSql = StrSql + "and upper(cbg.carbol_exp_nam) like '%"+bReporte.getProveedor().toUpperCase() +"%' ";
if(bReporte.getRemitente().length()>0)
StrSql = StrSql + "and upper(cbg.key_bol_ref) like '%"+bReporte.getRemitente().toUpperCase() +"%' ";
         
     StrSql = StrSql + "  AND CBG.carbol_nat_cod = '24' and cbg.carbol_typ_cod <> 'LTR' AND a.tra_cuo_ini = b.cuo_cod "+
         "AND b.lst_ope = 'U' AND NVL (a.tra_cuo_des, a.tra_cuo_est) = c.cuo_cod AND c.lst_ope = 'U' AND a.tra_cuo_des = d.cuo_cod(+) "+
         "AND d.lst_ope(+) = 'U' AND a.tra_num = 0 AND a.lst_ope <> 'D' AND a.key_secuencia <> 0 "+
         "AND (SELECT COUNT(1) FROM transitos.tra_pla_rut trs where trs.key_cuo = cg.key_cuo and trs.car_reg_year = cg.car_reg_year and  trs.car_reg_nber = cg.car_reg_nber "+
         "        and tra_num = 0 and key_secuencia <> 0 and tra_fec_des is null)>0 "+
"ORDER BY   key_cuo,car_reg_year,car_reg_nber,key_bol_ref ";




    
    ResultSet rs = ( ResultSet ) sql.st.executeQuery( StrSql );
    
    if( ! ( rs == null || !rs.next() ) ) {
      do{
        StrSql = "'" + rs.getString( 1 ) + "', '" + rs.getString( 2 ) + "', " + rs.getString( 3 );
        if( (i++)%2 == 0 ) {
%>
    <tr class="tr1">
<%      } else  {   %>
    <tr>
<%      }  %>
    <td><%=rs.getString( 1 )%> / <%=rs.getString( 2 )%> - <%=rs.getString( 3 )%> - <%=rs.getString( 4 )%></td>
    
    <td><%=rs.getString(23)%></td>
    <td><%=rs.getString(5)%></td>
    <td><%=rs.getString(6)%></td>
    <td><%=rs.getString(27)%></td>
    <td><%=rs.getString(7)%></td>
    <td><%=rs.getString(8)%></td>
    <td><%=rs.getString(9)%></td>
    <td><%=rs.getString(10)%></td>
<%  
    if( rs.getString( "lst_ope" ).equals("-") ) {
        StrSql ="Sin inicio de tr&aacute;nsito";
    }
    else
      if( rs.getString( "lst_ope" ).equals("D") ) {
        StrSql ="Cancelado";
      } else {
        if ( rs.getInt( 12 ) == 1 ) {
          StrSql ="Concluido";
        } else {
          if( rs.getInt( 12 ) == 0 ) {
            StrSql ="Sin localizaci&oacute;n";
          } else {
            if ( rs.getInt( 13 ) <= 0 )
              StrSql ="En tr&aacute;nsito";
            else
              if(rs.getString(15).equals("-"))
              StrSql ="Fuera de Plazo";
              else
              StrSql =rs.getString(15).toString();
            
              //StrSql ="Fuera de Plazo";
          }
        }
      }
%>
    <td><%=StrSql%></td>
    
    <td><%=rs.getString(16)%></td>
    <td><%=rs.getString(17)%> <%=rs.getString(18)%></td>
    
    <td><%=rs.getString(28)%></td>
    <td><%=rs.getString(19)%></td>
    <td><%=rs.getString(20)%></td>
    <td><%=rs.getString(21)%>&nbsp;</td>
    <td><%=rs.getString(22)%>&nbsp;</td>
    <td style="text-align:right"><%=rs.getString(24)%></td>
    <td><%=rs.getString(25)%> <%=rs.getString(26)%></td>
       
   
   
   
  </tr> 
<%  } while (rs.next());   }
%>
  <tr>
    <td colspan="16"><strong>Fecha y Hora de proceso:&nbsp;&nbsp;</strong> <%= FecHoy.format(new java.util.Date()) %></td>
    <td colspan="3" style="text-align:right"><strong>TOTAL: <%=i%></strong></td>
  </tr>
</table>
<%   
  } catch (Exception er)  {
    er.printStackTrace();
  } 
  finally {
    sql.getClose();
  }
%>
</body>