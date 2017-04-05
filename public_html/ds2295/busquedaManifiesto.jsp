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
    <script language="JavaScript" type="text/JavaScript" src="js/busquedaManifiesto.js"></script>

    <title>Tr@nsitos</title>
  </head>

<%
    Connection cn2 = null;
    Statement st = null;
    DataSource ds = null;
    CallableStatement call = null;   
    ResultSet rs = null;
    
try{    
    
    InitialContext ic = new InitialContext();    
    ds = (DataSource)ic.lookup("jdbc/asy_transito");
    cn2 = (Connection)ds.getConnection();
       
%>

<html:form action="/busqManifiestoAction"  >

<html:hidden property="aopcion"/>
</br>
</br>
    <table width="50%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
    <caption>.: Control Documento de Embarque</caption>
    <tr><th class="c1" colspan="2">
    <div  id="pnlRadioTipoNro" >
        <label >
            <input type="radio" name="tipo" id="ref" value="ref" onclick="mostrarRef();" checked="checked"> Nro. Referencia
        </label>    
        <label class="radio-inline">
            <input type="radio" name="tipo" id="reg" value="reg" onclick="mostrarReg();"> Nro. Registro
        </label>    
    </div>
    </th></tr>
    <tr><td class="c1" colspan="2">
               
    <div id="pnlRef">
            <table>
            <tr>
            <td>
            <label>Fecha de salida (dd/mm/aaaa):</label>
            </td>
            <td>
            <html:text property="reffechaSalida" styleClass="form-control datepicker" size="15" maxlength="10"/>
            </td>
            </tr>
            <tr>
            <td><label>Aduana:</label></td>
            <td>
                
                  <html:select property="refaduanasel" styleId="refaduanasel"  > 
                        <html:option value="">&lt;-- Seleccione Aduana --&gt;</html:option>
                      <%
                            call=cn2.prepareCall("{ ? = call pkg_ds2295.c_list_aduanas  }");
                            call.registerOutParameter(1,OracleTypes.CURSOR);                                        
                            call.execute();    
                            rs=(ResultSet) call.getObject(1);
                            if ( ! (rs == null || !rs.next()) )
                            {
                            do{
                       %>     
                            <html:option value="<%= rs.getString(1)%>"><%= rs.getString(1) + " - " + rs.getString(2)%></html:option>   
                       <%     
                            }while( rs.next() );
                            }                        
                       %>                   
                   </html:select> 
              </td>  
            </tr>
            <tr>
            <td>
           
            <label>N&uacute;mero Viaje:</label>
            </td>
            <td>
            <html:text property="refnroViaje" styleClass="form-control" maxlength="17" size="15" style="text-transform:uppercase;" onchange="this.value=this.value.toUpperCase();"/>
            </td>
            </tr>
            </table>
        </div>

    <div id="pnlReg"  style="display:none">
        <table>
            <tr>
            <td>
            <label>Gesti&oacute;n:</label>
            </td>
            <td>
            <html:text property="reggestion" styleClass="form-control" size="15" onkeypress="return validarTecla(event, 'NUMERICO_1');" maxlength="4"/>
            </td>
            </tr>
            <tr>
            <td>
            <label>Aduana:</label>
            </td>
            <td>
              <html:select property="regaduanasel" styleId="regaduanasel"  > 
                    <html:option value="">&lt;-- Seleccione Aduana --&gt;</html:option>
                  <%
                        call=cn2.prepareCall("{ ? = call pkg_ds2295.c_list_aduanas  }");
                        call.registerOutParameter(1,OracleTypes.CURSOR);                                        
                        call.execute();    
                        rs=(ResultSet) call.getObject(1);
                        if ( ! (rs == null || !rs.next()) )
                        {
                        do{
                   %>     
                        <html:option value="<%= rs.getString(1)%>"><%= rs.getString(1) + " - " + rs.getString(2)%></html:option>   
                   <%     
                        }while( rs.next() );
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
            <html:text property="regnroRegistro" styleClass="form-control" size="15" onkeypress="return validarTecla(event, 'NUMERICO_1');" maxlength="6"/>
            </td>
            </tr>
            </table>
    </div>
    </td></tr>
    </table>
    <table>
            <tr>
            <td colspan="4" align="center">   
                <center>
                <input class="btn btn-primary" type="button" style="cursor:pointer;"   value="Buscar" onclick="envia('<%= Ctte.eAplicacionDS2295 %>');" />
                </center>
            </td>                    
        </tr>   
    </table>
    <script type="text/javascript">
        var $pnlRef = $("#pnlRef");
        var $pnlReg = $("#pnlReg");
        
        
        function mostrarRef() {
            $pnlRef.show();
            $pnlReg.hide();
            var f = document.forms["BusqManifiestoForm"];
            f.reggestion.value = '';
            f.regaduanasel.value = '';
            f.regnroRegistro.value = '';
          
        }
        function mostrarReg() {
            $pnlRef.hide();
            $pnlReg.show();
            var f = document.forms["BusqManifiestoForm"];
            f.reffechaSalida.value = '';
            f.refaduanasel.value = '';
            f.refnroViaje.value = '';
            
        }
        $("#ref").prop("checked", true);
        mostrarRef();
    </script>

</html:form>
<% 
    } catch(SQLException ee)
    {
      System.out.println("Error: "+ee);        
    }
    catch( Exception e ) {
      e.printStackTrace();
    }    
    finally {
      if (! (call == null))
        call.close();
      if (! (rs == null))
        rs.close();      
      if (cn2 != null) {
          cn2.close();
        }
                         
      call = null;
      rs = null;    
      ds = null;
      cn2 = null;
      
    }

%>