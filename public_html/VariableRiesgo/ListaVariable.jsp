<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="Main.*,Transito.*,VariableRiesgo.*"%>
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
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<script language="JavaScript" type="text/JavaScript" src="js/valida2.js"></script>

<%
  ClaseSession cs = ( ClaseSession ) request.getSession().getAttribute( "ClaseSession" ); 
  VariableRiesgoForm bean = (VariableRiesgoForm)request.getAttribute("VariableRiesgoForm");   
%>
<style type="text">
#msgalert{
	width:90%; 
	border:1px solid #FF0; 
	background-color:#FFC; 
	padding:10px; 
	color:#6A4800; 
	margin-top:10px; 
	margin-bottom:10px;
	}
#msgerror{
	width:90%; 
	border:1px solid #900; 
	background-color:#FF9797; 
	padding:10px; 
	color:#300039; 
	margin-top:10px; 
	margin-bottom:10px;	
	}
#msginfo{
	width:90%; 
	border:1px solid #069; 
	background-color:#7DD5FF; 
	padding:10px; 
	color:#002435; 
	margin-top:10px; 
	margin-bottom:10px;
	}
</style>
<script language="JavaScript" type="text/javascript" >
  $(document).ready(function () {   
  });
    
  function consultar(valor) {
  
   $('#boton').val('consultar');
   $('#var_estado').val('VARIABLE');
   if(valor == 1) {
      $('#tipo_variable').val('NIT');
   }
   if(valor == 2) {
      $('#tipo_variable').val('PLACA');
   }
   if(valor == 3) {
      $('#tipo_variable').val('REMITENTE');
   }
   if(valor == 4) {
      $('#tipo_variable').val('ORIGEN');
   }
   if(valor == 5) {
      $('#tipo_variable').val('CONSIGNATARIO');
   }
   if(valor == 6) {
      $('#tipo_variable').val('CARTA_PORTE');
   }
   document.VariableRiesgoForm.submit();
   
  };
  
  function guarda_deshabilita(valor) {
   var Mensaje = "";
    
  
   $('#boton').val('guarda_deshabilita');
   
   if(valor == 1) {
   
      if( ! fTrim( $('#pobservacion').val() ) ){
        Mensaje = Mensaje + "'OBSERVACION' es obligatorio\n";
      }
   } 
   if( Mensaje == "" )
   {      
      document.VariableRiesgoForm.submit();
   }
   else
   {
      alert( Mensaje );
   }
  };
  
  function guarda_habilita(valor) {
   var Mensaje = "";
    
  
   $('#boton').val('guarda_habilita');
   
   if(valor == 1) {
   
      if( ! fTrim( $('#pobservacion').val() ) ){
        Mensaje = Mensaje + "'OBSERVACION' es obligatorio\n";
      }
   } 
   if( Mensaje == "" )
   {      
      document.VariableRiesgoForm.submit();
   }
   else
   {
      alert( Mensaje );
   }
  };
  
  
  function guarda_riesgo(valor) {
   var Mensaje = "";
   var r=confirm("Est\u00e1 seguro del riesgo a registrar.")
   
   if(r==true)
   {

  
   $('#boton').val('guarda_riesgo');
   $('#var_estado').val('ADICIONA');
   if(valor == 1) {
      $('#tipo_variable').val('NIT');
      if( ! fTrim( $('#valor').val() ) ){
        Mensaje = Mensaje + "'NIT' es obligatorio\n";
      }
      else{
          if( ! foNumero( $('#valor').val() ) ){
            Mensaje = Mensaje + "'NIT' debe ser un n\372mero\n";
          } 
      }
      
      
   }
   if(valor == 2) {
      $('#tipo_variable').val('PLACA');
      if( ! fTrim( $('#valor').val() ) ){
        Mensaje = Mensaje + "'PLACA' es obligatorio\n";
      }      
   }
   if(valor == 3) {
      $('#tipo_variable').val('REMITENTE');
      if( ! fTrim( $('#valor').val() ) ){
        Mensaje = Mensaje + "'REMITENTE' es obligatorio\n";
      }
   }
   if(valor == 4) {
      $('#tipo_variable').val('ORIGEN');
      if( ! fTrim( $('#valor').val() ) ){
        Mensaje = Mensaje + "'ORIGEN' es obligatorio\n";
      }
   }
   if(valor == 5) {
      $('#tipo_variable').val('CONSIGNATARIO');
      if( ! fTrim( $('#valor').val() ) ){
        Mensaje = Mensaje + "'CONSIGNATARIO' es obligatorio\n";
      }
      else{
          if( ! foNumero( $('#valor').val() ) ){
            Mensaje = Mensaje + "'CONSIGNATARIO' debe ser un n\372mero\n";
          } 
      }
   }
   if(valor == 6) {
      $('#tipo_variable').val('CARTA_PORTE');
      if( ! fTrim( $('#valor').val() ) ){
        Mensaje = Mensaje + "'CARTA PORTE' es obligatorio\n";
      }
   }
   
       if( Mensaje == "" )
      {      
        document.VariableRiesgoForm.submit();
      }
      else
      {
        alert( Mensaje );
      }
  
  }
 
   
  };
  
  
  function adicionar(valor) {
  
   $('#boton').val('adicionar');
   $('#var_estado').val('ADICIONA');
   if(valor == 1) {
      $('#tipo_variable').val('NIT');
   }
   if(valor == 2) {
      $('#tipo_variable').val('PLACA');
   }
   if(valor == 3) {
      $('#tipo_variable').val('REMITENTE');
   }
   if(valor == 4) {
      $('#tipo_variable').val('ORIGEN');
   }
   if(valor == 5) {
      $('#tipo_variable').val('CONSIGNATARIO');
   }
   if(valor == 6) {
      $('#tipo_variable').val('CARTA_PORTE');
   }
   document.VariableRiesgoForm.submit();
   
  };
  
  function cancelar(valor) {
  
   $('#boton').val('cancelar');
   if(valor == 1) {
      $('#var_estado').val('LISTA');
      $('#tipo_variable').val('');
   }
   if(valor == 2) {
      $('#var_estado').val('VARIABLE');
   } 
   if(valor == 3) {
      $('#var_estado').val('VARIABLE');
   } 
   document.VariableRiesgoForm.submit();
   
  };
  
  function deshabilitar(v_tipo, v_valor) {
    var Mensaje = "";
    
    $('#ptipo_variable').val(v_tipo);
    $('#pvalor').val(v_valor);
    $('#var_estado').val('DESHABILITA');
      if( Mensaje == "" )
      {
        $('#boton').val('deshabilitar');
        document.VariableRiesgoForm.submit();
      }
      else
      {
        alert( Mensaje );
        return false;
      }
  };
  
  function habilitar(v_tipo, v_valor) {
    var Mensaje = "";
    
    $('#ptipo_variable').val(v_tipo);
    $('#pvalor').val(v_valor);
    $('#var_estado').val('HABILITA');
      if( Mensaje == "" )
      {
        $('#boton').val('habilitar');
        document.VariableRiesgoForm.submit();
      }
      else
      {
        alert( Mensaje );
        return false;
      }
      
       
  };
  
  
</script>
<%
try
{
    if(!(bean.getMensaje()== null))
    {
        if(!(bean.getMensaje()==""))
        {
        %><center>
            <%=bean.getMensaje()%>
        </center><%
        }
    }
}
catch(Exception ex)
{
}
%>

<%
String estado = "";
try
{
    if(!(bean.getVar_estado()== null))
    {
        if(!(bean.getVar_estado()==""))
        {
            estado = bean.getVar_estado();
        }
        else
        {
            estado = "LISTA";
        }        
    }
    else
    {
        estado = "LISTA";
    }
}
catch(Exception ex)
{
    estado = "LISTA";
}
%>

<html:form action="/VariableRiesgo" focus="gestion" onsubmit="return false;">
    <input type="hidden" name="boton" id="boton"/>
 
    <html:hidden property="ptipo_variable" styleId="ptipo_variable"/>
    <html:hidden property="pvalor" styleId="pvalor"/>
    
    <html:hidden property="tipo_variable" styleId="tipo_variable"/>
    <html:hidden property="var_estado" styleId="var_estado"/>
    
     <% if(estado.equals("LISTA")) { %>
  
     <table width="50%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
        <caption>
           <label style="font-size:15px">
                Lista de Variables de Riesgo
           </label>
        </caption>         
        <tr>
            <th class="c1" >Variable de Riesgo</th><th class="c1">Opci&oacute;n</th>
        </tr>         
        <tr>
            <td>NIT EMPRESA DE TRANSPORTE</td>
            <td class="C"><input type="button" value="Registrar" name="boton" onclick="consultar(1)"></input></td>
        </tr>
        <tr>
            <td>PLACA</td>
            <td class="C"><input type="button" value="Registrar" name="boton" onclick="consultar(2)"></input></td>
        </tr>
        <tr>
            <td>REMITENTE (PROVEEDOR)</td>
            <td class="C"><input type="button" value="Registrar" name="boton" onclick="consultar(3)"></input></td>
        </tr>
        <tr>
            <td>ORIGEN</td>
            <td class="C"><input type="button" value="Registrar" name="boton" onclick="consultar(4)"></input></td>
        </tr>
        <tr>
            <td>CONSIGNATARIO</td>
            <td class="C"><input type="button" value="Registrar" name="boton" onclick="consultar(5)"></input></td>
        </tr>
        <tr>
            <td>NRO CARTA PORTE</td>
            <td class="C"><input type="button" value="Registrar" name="boton" onclick="consultar(6)"></input></td>
        </tr>
     </table>
     <%}%>
     
     
     <% if(estado.equals("VARIABLE")) { %>
            
            <% if(bean.getTipo_variable().equals("NIT")) { %>
                <table width="90%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
                <caption>
                   <label style="font-size:15px">Lista de Riesgo</label>
                </caption>         
                <tr>
                    <th>C&oacute;digo</th><td>NIT EMPRESA DE TRANSPORTE</td>
                </tr>         
                <tr>
                    <th>Descripci&oacute;n</th><td>NIT de la Empresa de Transporte</td>
                </tr>
                <tr>
                    <td><input type="button" value="Adicionar" name="boton" onclick="adicionar(1)"></input></td>
                    <td>&nbsp;</td>                    
                </tr>
                </table>
            <%}%>
            <% if(bean.getTipo_variable().equals("PLACA")) { %>
                <table width="90%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
                <caption>
                   <label style="font-size:15px">Lista de Riesgo</label>
                </caption>         
                <tr>
                    <th>C&oacute;digo</th><td>PLACA</td>
                </tr>         
                <tr>
                    <th>Descripci&oacute;n</th><td>Placa del Medio de Transporte</td>
                </tr>
                <tr>
                    <td><input type="button" value="Adicionar" name="boton" onclick="adicionar(2)"></input></td>
                    <td>&nbsp;</td>                    
                </tr>
                </table>
            <%}%>
            <% if(bean.getTipo_variable().equals("REMITENTE")) { %>
                <table width="90%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
                <caption>
                   <label style="font-size:15px">Lista de Riesgo</label>
                </caption>         
                <tr>
                    <th>C&oacute;digo</th><td>REMITENTE (PROVEEDOR)</td>
                </tr>         
                <tr>
                    <th>Descripci&oacute;n</th><td>Remitente de la Mercanc&iacute;a</td>
                </tr>
                <tr>
                    <td><input type="button" value="Adicionar" name="boton" onclick="adicionar(3)"></input></td>
                    <td>&nbsp;</td>                    
                </tr>
                </table>
            <%}%>
            <% if(bean.getTipo_variable().equals("ORIGEN")) { %>
                <table width="90%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
                <caption>
                   <label style="font-size:15px">Lista de Riesgo</label>
                </caption>         
                <tr>
                    <th>C&oacute;digo</th><td>ORIGEN</td>
                </tr>         
                <tr>
                    <th>Descripci&oacute;n</th><td>Origen de la Mercanc&iacute;a</td>
                </tr>
                <tr>
                    <td><input type="button" value="Adicionar" name="boton" onclick="adicionar(4)"></input></td>
                    <td>&nbsp;</td>                    
                </tr>
                </table>
            <%}%>
            <% if(bean.getTipo_variable().equals("CONSIGNATARIO")) { %>
                <table width="90%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
                <caption>
                   <label style="font-size:15px">Lista de Riesgo</label>
                </caption>         
                <tr>
                    <th>C&oacute;digo</th><td>CONSIGNATARIO</td>
                </tr>         
                <tr>
                    <th>Descripci&oacute;n</th><td>Consignatario de la Mercanc&iacute;a</td>
                </tr>
                <tr>
                    <td><input type="button" value="Adicionar" name="boton" onclick="adicionar(5)"></input></td>
                    <td>&nbsp;</td>                    
                </tr>
                </table>
            <%}%>
            <% if(bean.getTipo_variable().equals("CARTA_PORTE")) { %>
                <table width="90%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
                <caption>
                   <label style="font-size:15px">Lista de Riesgo</label>
                </caption>         
                <tr>
                    <th>C&oacute;digo</th><td>NUMERO CARTA PORTE</td>
                </tr>         
                <tr>
                    <th>Descripci&oacute;n</th><td>N&uacute; Carta Porte de la Mercanc&iacute;a</td>
                </tr>
                <tr>
                    <td><input type="button" value="Adicionar" name="boton" onclick="adicionar(6)"></input></td>
                    <td>&nbsp;</td>                    
                </tr>
                </table>
            <%}%>
            
     <%}%>
        
     <% if(estado.equals("VARIABLE")) { %>   
             <%
             if(bean.getTipo_variable() != null )
             {
             int i=0;
             ClaseSql sql = new ClaseSql(); 
             try
              { sql.getConexion();
                CallableStatement call = null;
                call = sql.cn.prepareCall( "{? = call PKG_VARIABLE_RIESGO.lista_variables_riesgo( ? ) }" );
                call.registerOutParameter( 1, OracleTypes.CURSOR );
                call.setString( 2, bean.getTipo_variable() );    
                call.execute();    
                %>
                <table width="90%" border="0" cellpadding="3" cellspacing="0" align="center">
                    <tr>
                        <th>Listado de Riesgos</th>
                    </tr>
                </table>
                <table width="90%" border="1" cellpadding="3" cellspacing="0" class="marco" align="center" id="c">
                    <tr class="t14">
                        <th align="center" >Riesgo</th>
                        <th align="center" >Estado</th>
                        <th align="center" >Fecha de Inicio</th>
                        <th align="center" >Observaci&oacute;n</th>
                    </tr>         
                    <%
                  ResultSet rs = ( ResultSet ) call.getObject( 1 );
                  String var="";
                  String lnkd;
                  String lnkh;
                  
                  if( ! ( rs == null || !rs.next() ) ) {
                    do {
                     
                    
                    if( (i++)%2 == 0 ) {
                    var="tr1";
                    }else
                    {
                    var="";
                    }        
            %> 
                    <tr class="<%=var%>">
                        <td>
                            <%=rs.getString( 2 ) %>
                        </td>
                        <td>
                            <%=rs.getString( 3) %>
                        </td>
                        <td>
                            <%=rs.getString( 4) %>
                        </td>
                        
                        <td>
                            <%=rs.getString( 6) %>&nbsp;
                        </td>
                       
                    </tr>
                     
                    <%
                }while( rs.next() );
              }
            %>
                </table>
                <%} catch (Exception er)  {
                er.printStackTrace();
              } 
              finally  {
                sql.getClose();
              }
             }
            %>
            <input type="button" value="Cancelar" name="boton" onclick="cancelar(1)"></input>
     <%}%>
           
     <% if(estado.equals("ADICIONA")) { %>
            
            <% if(bean.getTipo_variable().equals("NIT")) { %>
                <table width="90%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
                <caption>
                   <label style="font-size:15px">Registro de Riesgo</label>
                </caption>         
                <tr>
                    <th>Variable</th><td>NIT EMPRESA DE TRANSPORTE</td>
                </tr>         
                <tr>
                    <th>Riesgo</th>
                    <td>
                        <html:text property="valor" styleId="valor" maxlength="30" size="20"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="C">
                        <input type="button" value="Guardar" name="boton" onclick="guarda_riesgo(1)"></input>
                        <input type="button" value="Cancelar" name="boton" onclick="cancelar(2)"></input>
                    </td>
                        
                </tr>
                </table>
            <%}%>
            <% if(bean.getTipo_variable().equals("PLACA")) { %> 
                <table width="90%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
                <caption>
                   <label style="font-size:15px">Registro de Riesgo</label>
                </caption>         
                <tr>
                    <th>Variable</th><td>PLACA</td>
                </tr>         
                <tr>
                    <th>Riesgo</th>
                    <td>
                        <html:text property="valor" styleId="valor" maxlength="30" size="20"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="C">
                        <input type="button" value="Guardar" name="boton" onclick="guarda_riesgo(2)"></input>
                        <input type="button" value="Cancelar" name="boton" onclick="cancelar(2)"></input>
                    </td>                        
                </tr>
                </table>
            <%}%>
            <% if(bean.getTipo_variable().equals("REMITENTE")) { %> 
                <table width="90%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
                <caption>
                   <label style="font-size:15px">Registro de Riesgo</label>
                </caption>         
                <tr>
                    <th>Variable</th><td>REMITENTE (PROVEEDOR)</td>
                </tr>         
                <tr>
                    <th>Riesgo</th>
                    <td>
                        <html:text property="valor" styleId="valor" maxlength="30" size="20"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="C">
                        <input type="button" value="Guardar" name="boton" onclick="guarda_riesgo(3)"></input>
                        <input type="button" value="Cancelar" name="boton" onclick="cancelar(2)"></input>
                    </td>
                </tr>
                </table>
            <%}%>
            <% if(bean.getTipo_variable().equals("ORIGEN")) { %> 
                <table width="90%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
                <caption>
                   <label style="font-size:15px">Registro de Riesgo</label>
                </caption>         
                <tr>
                    <th>Variable</th><td>ORIGEN</td>
                </tr>         
                <tr>
                    <th>Riesgo</th>
                    <td>
                    <%
                    if(1==1) {
                    int i=0;
             ClaseSql sql = new ClaseSql(); 
             try
              { sql.getConexion();
                CallableStatement call = null;
                call = sql.cn.prepareCall( "{? = call PKG_VARIABLE_RIESGO.lista_paises }" );
                call.registerOutParameter( 1, OracleTypes.CURSOR );
                call.execute();    
                %>
                 <html:select property="valor" styleId="valor">                
                    <%
                  ResultSet rs = ( ResultSet ) call.getObject( 1 );             
                  
                  if( ! ( rs == null || !rs.next() ) ) {
                  %>
                   <html:option value="">&lt;-- Seleccione Tipo de Variable --&gt;</html:option>
                  <%
                    do {
                     %> 
                     <html:option value="<%=rs.getString( 1 ) %>"><%=rs.getString( 2 ) %></html:option>
                     <%
                }while( rs.next() );
              }
            %>
                       
                        </html:select>
                <%} catch (Exception er)  {
                er.printStackTrace();
              } 
              finally  {
                sql.getClose();
              }
                    }
                    %>
                    
                    
                       
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="C">
                        <input type="button" value="Guardar" name="boton" onclick="guarda_riesgo(4)"></input>
                        <input type="button" value="Cancelar" name="boton" onclick="cancelar(2)"></input>
                    </td>                        
                </tr>
                </table>
            <%}%>
            <% if(bean.getTipo_variable().equals("CONSIGNATARIO")) { %> 
                <table width="90%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
                <caption>
                   <label style="font-size:15px">Registro de Riesgo</label>
                </caption>         
                <tr>
                    <th>Variable</th><td>CONSIGNATARIO</td>
                </tr>         
                <tr>
                    <th>Riesgo</th>
                    <td>
                        <html:text property="valor" styleId="valor" maxlength="30" size="20"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="C">
                        <input type="button" value="Guardar" name="boton" onclick="guarda_riesgo(5)"></input>
                        <input type="button" value="Cancelar" name="boton" onclick="cancelar(2)"></input>
                    </td>                        
                </tr>
                </table>
            <%}%>
            <% if(bean.getTipo_variable().equals("CARTA_PORTE")) { %> 
                <table width="90%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
                <caption>
                   <label style="font-size:15px">Registro de Riesgo</label>
                </caption>         
                <tr>
                    <th>Variable</th><td>NUMERO CARTA PORTE</td>
                </tr>         
                <tr>
                    <th>Riesgo</th>
                    <td>
                        <html:text property="valor" styleId="valor" maxlength="30" size="20"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="C">
                        <input type="button" value="Guardar" name="boton" onclick="guarda_riesgo(6)"></input>
                        <input type="button" value="Cancelar" name="boton" onclick="cancelar(2)"></input>
                    </td>                        
                </tr>
                </table>
            <%}%>
     <%}%>
     
     <% if(estado.equals("DESHABILITA")) { %>
                <table width="90%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
                <caption>
                   <label style="font-size:15px">Habilitaci&oacute;n/Desahabilitaci&oacute;n</label>
                </caption>         
                <tr>
                    <th>Variable</th>
                    <td><%=bean.getPtipo_variable()%></td>
                </tr>         
                <tr>
                    <th>Riesgo</th>
                    <td>
                     <% if(bean.getPtipo_variable().equals("ORIGEN")) { %>
                        <%=VariableRiesgoDao.DevuelvePais(bean.getPvalor())%>
                    <%} else {%> 
                        <%=bean.getPvalor()%>
                    <%}%>    
                    </td>
                </tr>
                <tr>
                    <th>Observaci&oacute;n</th>
                   
                    <td>
                        <html:text property="pobservacion" styleId="pobservacion" maxlength="50" size="50"/>
                    </td>
                </tr>
                
                <tr>
                    <td colspan="2" class="C">
                        <input type="button" value="Guardar" name="boton" onclick="guarda_deshabilita(1)"></input>
                        <input type="button" value="Cancelar" name="boton" onclick="cancelar(3)"></input>
                    </td>
                        
                </tr>
                </table>
     <%}%>
     <% if(estado.equals("HABILITA")) { %>
                <table width="90%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
                <caption>
                   <label style="font-size:15px">Habilitaci&oacute;n/Desahabilitaci&oacute;n</label>
                </caption>         
                <tr>
                    <th>Variable</th>
                    <td><%=bean.getPtipo_variable()%></td>
                </tr>
                <tr>
                    <th>Riesgo</th>
                    <td>
                    <% if(bean.getPtipo_variable().equals("ORIGEN")) { %>
                        <%=VariableRiesgoDao.DevuelvePais(bean.getPvalor())%>
                    <%} else {%> 
                        <%=bean.getPvalor()%>
                    <%}%>  
                    </td>
                </tr>
                <tr>
                    <th>Observaci&oacute;n</th>
                   
                    <td>
                        <html:text property="pobservacion" styleId="pobservacion" maxlength="50" size="50"/>
                    </td>
                </tr>
                
                <tr>
                    <td colspan="2" class="C">
                        <input type="button" value="Guardar" name="boton" onclick="guarda_habilita(1)"></input>
                        <input type="button" value="Cancelar" name="boton" onclick="cancelar(3)"></input>
                    </td>
                        
                </tr>
                </table>
     <%}%>



</html:form>