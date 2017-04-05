<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="Main.*,Transito.*"%>
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
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>

<script language="JavaScript" type="text/JavaScript" src="js/valida2.js"></script>
<script language="JavaScript" type="text/JavaScript" src="js/generica.js"></script>
<script language="JavaScript" type="text/JavaScript" src="js/datetimepicker_css.js"></script>

<script type="text/javascript">
function Adu_Imp(f)
        {
            var imp2 = f.aduana.value;
            if (imp2.substring(4,5)=="1") {
                f.impresora.readOnly=true;
                f.impresora.value = "1 - Zebra S4M";
            }
            if (imp2.substring(4,5)=="2") {
                f.impresora.readOnly=true;
                f.impresora.value = "2 - Zebra GX430t";
            }
        }
</script>
<%ClaseSession cs = (ClaseSession) request.getSession().getAttribute( "ClaseSession" );
    DateFormat dateFormat = new SimpleDateFormat("yyyy");  
    Date date = new Date();
    String gestion2 = dateFormat.format(date);
    String impre="0";
    ClaseSql sql = new ClaseSql();
    try {
                
%>
<html:form action="/EtiquetaLoteAction" onsubmit="return fEvalua()">
  <table cellspacing="2" cellpadding="3" border="0" width="90%" id="tabla-a">
  <thead>
      <tr><th colspan="4" class="t14">GENERACI&Oacute;N DE ETIQUETAS GEN&Eacute;RICAS :</th></tr>
  </thead>
  <tbody>
    <tr>
      <th><label>*</label>Aduana:</th>
      <td>
        <select name="aduana" Id="aduana" onchange="Adu_Imp(form)"><option value="">&lt;-- Seleccione Aduana --&gt;</option>
        <%   
                sql.getConexion();
                CallableStatement call = null;
                CallableStatement calh = null;
                String aduas[]= cs.getAduanas().split("-");
                int tam = aduas.length;
                int sw=0,i=0;
                if((cs.getAduanas().trim()).equals("ALL")){
                    calh = sql.cn.prepareCall("{?=call PKG_ETIQUETA.lista_aduanas3(?)}");
                    calh.registerOutParameter( 1, OracleTypes.CURSOR);
                    calh.setString( 2, cs.getAduanas());
                    calh.execute();
                    sw=1;
                }else{
                   sw=0;
                    call = sql.cn.prepareCall("{?=call PKG_ETIQUETA.lista_aduanas2(?)}");
                    call.registerOutParameter( 1, OracleTypes.CURSOR);
                    call.setString( 2, cs.getAduanas());
                    call.execute();
                }
                
                
                if(sw==1){
                    ResultSet fp = (ResultSet) calh.getObject( 1);
                    if(! (fp==null || !fp.next()) ) {
                      do{  
                            %>
                          <option value="<%= fp.getString( 1 ) %>-<%= fp.getString( 3 ) %>"> <%= fp.getString( 1 ) %>: <%= fp.getString( 2 ) %></option>
                    <% } while( fp.next() );  }  
                }else{
                    ResultSet fp = (ResultSet) call.getObject( 1);
                    if(! (fp==null || !fp.next()) ) {
                      do{ 
                        for(i = 0; i < tam; i++){
                            String ad2 = fp.getString(1);
                            String ad3 = aduas[i];
                            if(aduas[i].equals(fp.getString( 1 ) )){
                                if(fp.getString( 3 ).equals("2") || fp.getString( 3 ).equals("1")){
                                    String ad = fp.getString(1);
                                    %>
                                        <option value="<%= fp.getString( 1 ) %>-<%= fp.getString( 3 ) %>"> <%= fp.getString( 1 ) %>: <%= fp.getString( 2 ) %></option>
                        <%      }    
                            }
                        
                        } 
                } while( fp.next() );    }
                }%>
                </select>
              </td>
        
      <th><label>*</label>Gesti&oacute;n::</th>
      <td><html:text maxlength="10" size="20" styleId="gestion" property="gestion" readonly="true" value="<%=gestion2%>"/></td>
    </tr>
    <tr>
      <th><label>*</label>Vigencia Desde:</th>
      <td><html:text maxlength="10" size="20" styleId="fdesde" property="fdesde" readonly="true" /><img src="images/cal.gif" id="imcal" style="cursor:pointer;" onclick="javascript:NewCssCal('fdesde','ddMMyyyy')" /></td>
      <th><label>*</label>Hasta:</th>
      <td><html:text maxlength="10" size="20" styleId="fhasta" property="fhasta" readonly="true" /><img src="images/cal.gif" id="imcal" style="cursor:pointer;" onclick="javascript:NewCssCal('fhasta','ddMMyyyy')" /></td>
    </tr>
    <tr>
      <th><label>*</label>Cantidad:</th>
      <td>
            <select name="cantidad" Id="cantidad">
                <option value="">&lt;-- SELECCIONE CANTIDAD --&gt;</option>
                <option value="10">->10 ETIQUETAS GENERICAS</option>
                <option value="20">->20 ETIQUETAS GENERICAS</option>
                <option value="50">->50 ETIQUETAS GENERICAS</option>
                <option value="100">->100 ETIQUETAS GENERICAS</option>
            </select>
      </td>
      <th><label>*</label>Tipo de Impresora:</th>
      <td><html:text maxlength="10" size="20" styleId="impresora" property="impresora" readonly="true"/></td>
    </tr>
    <tr>
      <th><label>*</label>Motivo:</th>
      <td colspan="3"><html:text maxlength="200" size="100" styleId="solicitud" property="solicitud"/>
      </td>
      
    </tr>
    <tr>
      <th colspan="4">
      
      <input type="button" name="Generar" value="Generar" onclick="imprimire(form);"/></th>
    </tr>
    <tr>
      <td colspan="4">(<label>*</label>) Campos Obligatorios</td>
    </tr>
    </tbody>
  </table>
<script language="JavaScript" type="text/JavaScript">
<!--
var f = document.forms["EtiquetaLoteForm"];
f.aduana.focus();
-->
</script>

</html:form>
<%  }
            catch( Exception e ) {
              System.out.println( e.getMessage() );
            }
              finally  {
                sql.getClose();
              }
        %>