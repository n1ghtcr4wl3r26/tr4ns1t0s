<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="Main.*, Transito.*"%><%@ page import="oracle.jdbc.pool.OracleConnectionPoolDataSource"%>
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
<%@ page import="javax.sql.DataSource"%>

  <head>
    <link href="../css/Estilos.css" rel="stylesheet" type="text/css" media="screen"/>
    <script language="JavaScript" type="text/JavaScript" src="js/valida2.js"></script>

    <title>Tr@nsitos</title>
  </head>


<html:form action="/digitalizacion"  >
    <%
        ClaseSession cs = (ClaseSession) request.getSession().getAttribute( "ClaseSession" );
    %>
    <html:hidden property="boton" styleId="boton"/>
    </br>
    </br>
    <table width="50%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
        <caption>.: Digitalizaci&oacute;n de Precinto</caption>
        <tr>
            <td>
                <label>Gesti&oacute;n:</label>
            </td>
            <td>
                <html:text property="key_year" styleId="key_year" styleClass="form-control" size="15" onkeypress="return validarTecla(event, 'NUMERICO_1');" maxlength="4"/>
            </td>
        </tr>
        <tr>
            <td>
                <label>Aduana:</label>
            </td>
            <td>
                <html:select property="key_cuo" styleId="key_cuo"  > 
                        <html:option value="">&lt;-- Seleccione Aduana --&gt;</html:option>
                        <%    ClaseSql sql = new ClaseSql();
                            try {
                                sql.getConexion();
                                CallableStatement call = null;
                                call = sql.cn.prepareCall("{?=call pkg_transito.lista_aduanas(?)}");
                                call.registerOutParameter( 1, OracleTypes.CURSOR);
                                call.setString( 2, cs.getAduanas());
                                call.execute();
                                ResultSet fp = (ResultSet) call.getObject( 1);
                                if(! (fp==null || !fp.next()) ) {
                                    do{  
                                        %>
                                        <option value="<%= fp.getString( 1 ) %>"> <%= fp.getString( 1 ) %>: <%= fp.getString( 2 ) %></option>
                                        <%  
                                    } while( fp.next() );  
                                }  
                            }
                            catch( Exception e ) {
                              System.out.println( e.getMessage() );
                            }
                            finally {
                              sql.getClose();
                            }                          
                        %>                   
                </html:select>
            </td>
            </tr>
            <tr>
                <td>
                    <label>N&uacute;mero Registro:</label>
                </td>
                <td>
                    <html:text property="key_nber" styleId="key_nber" styleClass="form-control" size="15" onkeypress="return validarTecla(event, 'NUMERICO_1');" maxlength="6"/>
                </td>
            </tr>
            <tr>
                <td colspan="4" align="center">   
                    <center>
                    <input class="btn btn-primary" type="button" style="cursor:pointer;"   value="Consultar" onclick="envia();" />
                    </center>
               </td>                    
            </tr>   
        </table>
        <script type="text/javascript">
            function envia() {
                var Mensaje = "";
                var f = document.forms["DigitalizacionImagenesForm"];
                
                if(f.key_year.value == ""){
                    Mensaje += "'Gesti\u00f3n' es obligatorio.\n";
                }
                else
                    if (!fNumero(f.key_year.value)) {
                        Mensaje += "'Gesti\u00f3n' debe ser un n\372mero.\n";
                    }
                if (f.key_cuo.value == "") {
                    Mensaje += "'Aduana' es obligatorio.\n";
                }
                if(f.key_nber.value == "") {
                    Mensaje += "'N\u00famero de Registro' es obligatorio.\n";
                }
                else
                    if (!fNumero(f.key_nber.value)) {
                        Mensaje += "'N\u00famero de Registro' debe ser un n\372mero.\n";
                    }
                if (Mensaje != "") {
                    
                    alert(Mensaje);
                    return false;
                }
                else {
                    f.boton.value = "CONSULTAR";
                    f.submit();
                }
            }
        </script>
</html:form>
