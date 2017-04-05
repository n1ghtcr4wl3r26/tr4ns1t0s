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
<%@ page import="DepositoTrans.*"%>
  <head>
    <link href="../css/Estilos.css" rel="stylesheet" type="text/css" media="screen"/>
    <script language="JavaScript" type="text/JavaScript" src="js/valida2.js"></script>

    <title>Tr@nsitos</title>
  </head>
<script type="text/javascript">
            function envia() {
                var Mensaje = "";
                var f = document.forms["RegistroDepositoForm"];
                
                if(f.nit.value == ""){
                    Mensaje += "'NIT' es obligatorio.\n";
                }
                else{
                    if (!fNumero(f.nit.value)) {
                        Mensaje += "'NIT' debe ser un n\372mero.\n";
                    }
                }
                if (Mensaje != "") {
                    
                    alert(Mensaje);
                    return false;
                }
                else {
                    f.boton.value = "CONSULTAR2";
                    f.submit();
                }
            }
        </script>
        
<%
RegistroDepositoForm bean = (RegistroDepositoForm)request.getAttribute("RegistroDepositoForm");
String v_resultado = "ERROR";
%>
<html:form action="/ConsultaDeposito"  >
    <%
        ClaseSession cs = (ClaseSession) request.getSession().getAttribute( "ClaseSession" );
    %>
    <html:hidden property="boton" styleId="boton"/>
    <br>
    <br>
        <table width="50%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
        <caption>.: Dep&oacute;sitos Transitorios Registrados</caption>
        <tr>
            <td>
                <label>N&uacute;mero de NIT:</label>
            </td>
            <td>
                <html:text property="nit" styleId="nit" styleClass="form-control" size="17" onkeypress="return validarTecla(event, 'NUMERICO_1');" maxlength="17"/>
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
       <br><br>
        
<%   
if (!(bean.getNit() == null)) { 

ClaseSql sql3 = new ClaseSql();
      try {
        sql3.getConexion();
        CallableStatement call = null;
        call = sql3.cn.prepareCall("{?=call pkg_deposito_trans.c_lista_depositos(?,?,?)}");
        call.registerOutParameter( 1, OracleTypes.CURSOR);
        call.setString( 2, bean.getNit());
        call.registerOutParameter( 3, OracleTypes.VARCHAR);
        call.registerOutParameter( 4, OracleTypes.VARCHAR);
        call.execute();
        ResultSet fp = (ResultSet) call.getObject( 1);
        String v_razon = (String) call.getObject(3);
        v_resultado = (String) call.getObject(4);
            
        int cont= 0;
        if(v_resultado.equals("ERROR")){
             %> <br>
               
                <table width="95%" border="0" cellpadding="3" cellspacing="0" id="a">
                    <tr>
                        <td style="font-size:11px;text-align:center">
                            <label><%="NO EXISTE EL IMPORTADOR"%></label>
                        </td>
                    </tr>
                </table>
                <br>
                <br>
              <%
        }
        else
        {
        %>
         
         <table width="95%" border="0" cellpadding="3" cellspacing="0" id="a">
                   
                     
                    <tr>
                        <td width="150px" style="font-size:11px;text-align:left"><strong>NIT Operador:</strong>
                        </td>
                        <td width="400px" style="font-size:11px;text-align:left"><%=bean.getNit()%>
                        </td>
                        <td >&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td width="150px" style="font-size:11px;text-align:left"><strong>Raz&oacute;n Social:</strong>
                        </td>
                        <td width="400px" style="font-size:11px;text-align:left"><%=v_razon%>
                        </td>
                        <td >&nbsp;
                        </td>
                    </tr>
                </table><%
        
        
        if(v_resultado.equals("SINDEP")){
             %>
                <br>
                
                <table width="95%" border="0" cellpadding="3" cellspacing="0" id="a">
                    <tr>
                        <td style="font-size:11px;text-align:center">
                            <label><%="NO TIENE DEPOSITOS TRANSITORIOS ASIGNADOS"%></label>
                        </td>
                    </tr>
                </table>
                <br>
                <br>
              <%
        }
        else
        {
                
        if(! (fp==null || !fp.next()) ) {
      
        
      
      
        %>
      
                <br>
        <br>
                <table width="95%" border="0" cellpadding="3" cellspacing="0" id="a">
                    <caption>Lista de Dep&oacute;sitos Transitorios Registrados</caption>
                    <tr>
                        <td>
                            <div class="linea" style="margin:0 0 5px 0"></div>
                        </td>
                    </tr>
                </table>
                <table width="95%" class="marco" id="c">
                    <tr>
                        <th>Nro.</th>
                        <th>Deposito</th>
                        <th>Aduana</th>
                        <th>Fecha Inicio Habilitaci&oacute;n</th>
                        <th>Fecha Vencimiento Habilitaci&oacute;n</th>
                        <th>N&uacute;mero de Resoluci&oacute;n Administrativa</th>
                        <th>Distancia (Km)</th>
                        <th>Tiempo (Hrs)</th>
                    </tr>
                     
                    <%
          do{ 
        cont = cont+1;
   %><tr class="tr10">
                        <td style="font-size:10px;text-align:center">
                        <%=cont%>
                        </td>
                        <td style="font-size:10px">
                                <%= fp.getString(1)%>
                        </td>
                        <td style="font-size:10px">
                            <%= fp.getString(2)%>:<%= fp.getString(3)%>
                        </td>
                        <td style="font-size:10px;text-align:center">
                             <%= fp.getString(4)%>
                        </td>
                       
                        <td style="font-size:10px;text-align:center">
                            <%= fp.getString(5)%>
                        </td>
                        <td style="font-size:10px;text-align:center">
                            <%= fp.getString(6)%>
                        </td>
                        <td style="font-size:10px;text-align:right">
                            <%= fp.getString(7)%>
                        </td>
                         <td style="font-size:10px;text-align:right">
                            <%= fp.getString(8)%>
                        </td>
                    </tr>
                     
                    <%        
  } while( fp.next() );  }  %>
                </table>
                <br></br>
                <%  
                
                }
                }
                
                }
    catch( Exception e ) {
      System.out.println( e.getMessage() );
    }
    finally {
      sql3.getClose();
    }
 }
%>
</html:form>