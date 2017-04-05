<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
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
<%@ page import="java.util.Calendar"%>

<%@ page import="java.text.SimpleDateFormat"%>

<script language="JavaScript" type="text/JavaScript" src="js/valida2.js"></script>

<%
  ClaseSession cs = ( ClaseSession ) request.getSession().getAttribute( "ClaseSession" );
 
  EvaluarControlForm bean = (EvaluarControlForm)request.getAttribute("EvaluarControlForm");   
 
 
  
  java.util.Date date = new Date();
  Calendar cal = Calendar.getInstance();
  cal.setTime(date);
  cal.add(Calendar.DATE, -30);  
  SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
  String fechasta = dateFormat.format(date)+""; 
  date = cal.getTime();
  String fecdesde = dateFormat.format(date)+""; 
  
  
  
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

<script language="JavaScript" type="text/javascript" >
  $(document).ready(function () {   
  });
    
   function consultar(valor) {
      if(valor == 1) {
          $('#boton').val('consultar');
      }
     $('#var_estado').val('LISTA');
      document.EvaluarControlForm.submit();
  };
  
  
   function evaluar(v_keycuo, v_keyyear, v_keynber) {
    var Mensaje = "";
    
    $('#key_cuo').val(v_keycuo);
    $('#car_reg_year').val(v_keyyear);
    $('#car_reg_nber').val(v_keynber);
    $('#var_estado').val('EVALUA');
      if( Mensaje == "" )
      {
        $('#boton').val('evaluar');
        document.EvaluarControlForm.submit();
      }
      else
      {
        alert( Mensaje );
        return false;
      }
  };
  
  
  function observado(valor) {
     $('#formobs').show();
     $('#formbotones').hide();
     $('#tipoobs').val("OBSERVADO");
     $('#titulo_obs').html("REGISTRO DE RESULTADOS CON OBSERVACION ");
  };
  function sinobservacion(valor) {
     $('#formobs').show();
     $('#formbotones').hide();
     $('#tipoobs').val("SIN OBSERVACION");
     $('#titulo_obs').html("REGISTRO DE RESULTADOS SIN OBSERVACION ");
  };
  
  function guarda_observado(valor) {
     var Mensaje = "";
     
     if( ! fTrim( $('#resultado').val() ) ){
        Mensaje = Mensaje + "'RESULTADO' es obligatorio\n";
     }
     if( Mensaje == "" )
     {      
        $('#formobs').hide();
        $('#formbotones').show();
        $('#boton').val('observado');
        $('#var_estado').val('LISTA');
        document.EvaluarControlForm.submit();
     }
     else
     {
        alert( Mensaje );
     }
         
     
  };
  
  function cancela_observado(valor) {
     $('#resultado').val('');
     $('#formobs').hide();
     $('#formbotones').show();
  };
  
  
  
  
  function cancelar(valor) {
     
          $('#boton').val('cancelar');
     
     $('#var_estado').val('LISTA');
      document.EvaluarControlForm.submit();
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
<html:form action="/EvaluarControl" >
<input type="hidden" name="sw_reporte" id="sw_reporte"/>
<input type="hidden" name="boton" id="boton"/>

    <html:hidden property="key_cuo" styleId="key_cuo"/>
    <html:hidden property="car_reg_year" styleId="car_reg_year"/>
    <html:hidden property="car_reg_nber" styleId="car_reg_nber"/>
    <html:hidden property="var_estado" styleId="var_estado"/>
    <html:hidden property="tipoobs" styleId="tipoobs"/>

 <% if(estado.equals("LISTA")) { %>   


  <table width="50%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
    <caption><label style="font-size:15px">Evaluar Riesgo Identificado</label></caption>
    <tr><th class="c1" colspan="4">
    <label style="font-size:15px">
      Par&aacute;metro de B&uacute;squeda
      </label>
    </th></tr>
    <tr><td colspan="4">
      &nbsp;
    </td></tr>
    
    <tr>
      <th>Fecha Desde:</th>
      <td>
      <%if(bean == null || bean.getFec_desde() == null)
  {
      %>
      
      <html:text property="fec_desde" maxlength="10" size="10" value="<%=fecdesde%>"/>
      <%}else
      {
      %>
      
      <html:text property="fec_desde" maxlength="10" size="10" />
      <%
      }
      %>
      
      </td>
      
      <th>Fecha Hasta:</th>
      <td>
      <%if(bean == null || bean.getFec_hasta() == null)
  {
      %>
      
      <html:text property="fec_hasta" maxlength="10" size="10" value="<%=fechasta%>"/>
      <%}else
      {
      %>
      
      <html:text property="fec_hasta" maxlength="10" size="10"/>
      <%
      }
      %>
      
      </td>
      
      
    </tr>
    
    
    <tr>
      <td colspan="4" class="C">
                 <input type="button" value="Consultar" name="boton" onclick="consultar(1)"></input>

      </td>
    </tr>
  </table>
  
  <% }%>
  
 <% if(estado.equals("LISTA")) { %>   
             <%
             if(bean.getFec_desde() != null&& bean.getFec_hasta() != null)
             {
             int i=0;
             ClaseSql sql = new ClaseSql(); 
             try
              { sql.getConexion();
                CallableStatement call = null;
                call = sql.cn.prepareCall( "{? = call PKG_VARIABLE_RIESGO.lista_mic( ?,? ) }" );
                call.registerOutParameter( 1, OracleTypes.CURSOR );
                call.setString( 2, bean.getFec_desde() );    
                call.setString( 3, bean.getFec_hasta() );  
                call.execute();    
                %>
                <table width="90%" border="0" cellpadding="3" cellspacing="0" align="center">
                    <tr>
                        <th><label style="font-size:15px">Listado de Variables de Riesgo</label></th>
                    </tr>
                </table>
                <table width="90%" border="1" cellpadding="3" cellspacing="0" class="marco" align="center" id="c">
                    <tr class="t14">
                        <th align="center" >MIC</th>
                        <th align="center" >Estado</th>
                        
                        <th align="center" >Opci&oacute;n</th>
                    </tr>         
                    <%
                  ResultSet rs = ( ResultSet ) call.getObject( 1 );
                  String var="";
                  String lnkd;
                  
                  
                  if( ! ( rs == null || !rs.next() ) ) {
                    do {
                    
                    lnkd="evaluar(\""+rs.getString(1)+"\",\""+rs.getString(2)+"\",\""+rs.getString(3)+"\");";
                  
                    if( (i++)%2 == 0 ) {
                    var="tr1";
                    }else
                    {
                    var="";
                    }        
            %> 
                    <tr class="<%=var%>">
                        <td>
                            <%=rs.getString( 2 ) %>-<%=rs.getString( 1) %>-<%=rs.getString( 3) %>
                        </td>
                       <td>
                            <%=rs.getString( 4 ) %>
                        </td>
                        <td>
                        <%if(rs.getString( 4 ).equals("PENDIENTE")) {%>
                        <input type="button" value="Evaluar" name="boton" onclick='<%=lnkd%>'></input>
                        <%} else {%>
                        <%=rs.getString( 5 ) %>
                        <%}%>
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
            
     <%}%>
            
  

  
  
  <% if(estado.equals("EVALUA")) { %>
                <table width="90%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
                <caption>
                   <label style="font-size:15px">Evaluaci&oacute;n de Riesgo Identificado</label>
                </caption>         
               
                <tr><td colspan="2"  class="C">
                
                
 <%
 
 String StrSql = "";
 int i=0;
 ClaseSql sql2 = new ClaseSql(); 

 try
  { sql2.getConexion();
    CallableStatement call = null;
   
    call = sql2.cn.prepareCall( "{? = call PKG_VARIABLE_RIESGO.devuelve_mic( ?,?,? ) }" );
    call.registerOutParameter( 1, OracleTypes.CURSOR );
    call.setString( 2, bean.getKey_cuo() );  
    call.setString( 3, bean.getCar_reg_year() );  
    call.setString( 4, bean.getCar_reg_nber() );  
    call.execute();   
    %>  
    
    
         
        <%
      ResultSet rs = ( ResultSet ) call.getObject( 1 );
      String var="";
      String lnkd;
      String lnkh;
      
      if( ! ( rs == null || !rs.next() ) ) {
        do {
        
        
    if(i==0){
    %>
    <table width="90%" border="0" cellpadding="3" cellspacing="0" align="center">
     <tr>
     <th>MIC:</th>
                    <td><%=bean.getCar_reg_year()%><%=bean.getKey_cuo()%><%=bean.getCar_reg_nber()%></td>
      </tr> 
       <tr>
         <th>Empresa:</th>
         <td><%=rs.getString(5)%></td>
       </tr> 
       <tr>
         <th>Placa:</th>
         <td><%=rs.getString(6)%></td>
       </tr> 
       <tr>
         <th>Fecha de Registro del Manifiesto:</th>
         <td><%=rs.getString(27)%></td>
       </tr> 
       <tr>
         <th>T&eacute;cnico Aduanero:</th>
         <td><%=rs.getString(16)%></td>
       </tr> 
       <tr>
         <th>Conductor:</th>
         <td><%=rs.getString(19)%></td>
       </tr> 
       <tr>
         <th>Precintos:</th>
         <td><%=rs.getString(21)%></td>
       </tr> 
       <tr>
         <th>Resultado:</th>
         <td><%=rs.getString(30)%></td>
       </tr> 
    </table>
  <br/> 
    <table width="90%" border="0" cellpadding="3" cellspacing="0" align="center">
        <tr>
            <th style="text-align:center"><label style="font-size:15px">Detalle de Documentos de Embarque</label></th>
        </tr>
    </table>
    <table width="90%" border="1" cellpadding="3" cellspacing="0" class="marco" align="center" id="c">
      <tr class="t14">
      <th style="text-align:center">Manifiesto</th>         
      <th style="text-align:center">Documento de Embarque</th>
           
      <th style="text-align:center">Fecha Partida</th>
      <th style="text-align:center">Aduana Partida</th>
      <th style="text-align:center">Fecha Destino</th>
      <th style="text-align:center">Aduana Destino</th> 
      <th style="text-align:center">Estado</th>
      
      
             
      <th style="text-align:center">Consignatario</th>
      <th style="text-align:center">Proveedor</th>
             
      <th style="text-align:center">Descripci&oacute;n de la mercanc&iacute;a</th>
            
      <th style="text-align:center">Informaci&oacute;n Adicional Manifiesto</th>
      <th style="text-align:center">Peso</th>
      <th style="text-align:center">Cantidad de bultos</th>
        </tr>
         <%}
        
        
        
        
       
        if( (i++)%2 == 0 ) {
        var="tr1";
        }else
        {
        var="";
        }        
%> 
        <tr class="<%=var%>">
            <td><%=rs.getString( 1 )%> / <%=rs.getString( 2 )%> - <%=rs.getString( 3 )%> - <%=rs.getString( 4 )%></td>
    
    <td><%=rs.getString(23)%></td>
        
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
    
                
    <td><%=rs.getString(17)%> <%=rs.getString(18)%></td>    
    <td><%=rs.getString(28)%></td>
               
    <td><%=rs.getString(20)%></td>
               
    <td><%=rs.getString(22)%>&nbsp;</td>
    <td style="text-align:right"><%=rs.getString(24)%></td>
    <td><%=rs.getString(25)%> <%=rs.getString(26)%></td>
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
    sql2.getClose();
  }
 
%>
                
                
                </td></tr>
                
              <tr>
                    <td colspan="2" class="C">
                        
                        
                       <% 
                        int i2=0;
             ClaseSql sql = new ClaseSql(); 
             try
              { sql.getConexion();
                CallableStatement call = null;
                call = sql.cn.prepareCall( "{? = call PKG_VARIABLE_RIESGO.lista_riesgo_mic( ?,? ,? ) }" );
                call.registerOutParameter( 1, OracleTypes.CURSOR );
                call.setString( 2, bean.getKey_cuo() );    
                call.setString( 3, bean.getCar_reg_year() );  
                call.setString( 4, bean.getCar_reg_nber() );
                call.execute();    
                %>
                <table width="90%" border="0" cellpadding="3" cellspacing="0" align="center">
                    <tr>
                        <th  style="font-size:15px;text-align:center">Variables de Riesgo</th>
                    </tr>
                </table>
                <table width="30%" border="1" cellpadding="3" cellspacing="0" class="marco" align="center" id="c">
                    <tr class="t14">
                        <th class="C" style="text-align:center">Variable</th>
                        <th class="C" style="text-align:center">Riesgo</th>
                    </tr>         
                    <%
                  ResultSet rs = ( ResultSet ) call.getObject( 1 );
                  String var="";
                  String lnkd;
                  String lnkh;
                  
                  if( ! ( rs == null || !rs.next() ) ) {
                    do {
                    
                   
                    if( (i2++)%2 == 0 ) {
                    var="tr1";
                    }else
                    {
                    var="";
                    }        
            %> 
                    <tr class="<%=var%>">
                        <td class="C">
                            <%=rs.getString( 1 ) %></td>
                            <td class="C"><%=rs.getString( 2) %>
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
                    %>    
                        
                        
                    </td>
                        
                </tr>
                <tr><td colspan="2">&nbsp;<br/> <br/></td></tr>
                
                <tr>
                    <td colspan="2" class="C">
                    <div id="formbotones">
                        <input type="button" value="Observado" name="boton" onclick="observado(1)"></input>&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button" value="Sin Observaci&oacute;n" name="boton" onclick="sinobservacion(1)"></input>&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button" value="Cancelar" name="boton" onclick="cancelar(1)"></input>
                    </div>
                    <br/> <br/> 
                    
                    </td>
                        
                </tr>
                
                <tr>
                    <td style="text-align:center">
                        <div id="formobs" style="display:none">
                            <div id="titulo_obs"></div>
                            <table width="50%" border="0" cellpadding="3" cellspacing="0" align="center">
                                <tr>
                                    <td>Resultado:</td>
                                </tr>
                                <tr>
                                    <td><html:text property="resultado" styleId="resultado" maxlength="300" size="60"/></td>
                                </tr> 
                                <tr> 
                                    <td style="text-align:center">
                                        <input type="button" value="Guardar" name="boton" onclick="guarda_observado(1)"></input>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="button" value="Cancelar" name="boton" onclick="cancela_observado(1)"></input>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                
                </table>
     <%}%>
  
</html:form>
