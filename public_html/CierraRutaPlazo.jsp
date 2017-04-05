<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
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
<%@ page import="java.io.*"%>
<%
  ClaseSession cs = (ClaseSession) request.getSession().getAttribute( "ClaseSession" );

  String CodTran = "";
  String DscTran = "";
  String Placa = "";
  String fEstimada = "";
  String fActual = "";
  String fPartida = "";
  String sAduEst = "";
  String obs = "";

  String sAduana = "";
  String sFecha = "";
  String sEtapa = "";
  String PesoAduana = "";
%>

<style type="text/css">
		

		.item {
			text-align:center;
			float:left;
			margin:5px 5px 30px 5px;
			position:relative;			
		}
                
                 .linea {
                        height:1px;
			width:100%;
			background-color:#000;                
                }
		
			.item,
			.item-hover,
			.item-hover .mask,
			.item-img,
			.item-info {
				width: 150px;
				height: 150px;	
				
			}

			.item-hover,
			.item-hover .mask,
			.item-img { 
				position:absolute;
				top:0;
				left:0;			
			}			
		
			.item-type-line .item-hover {
	z-index:100;
	-webkit-transition: all 300ms ease-out;
	-moz-transition: all 300ms ease-out;
	-o-transition: all 300ms ease-out;
	transition: all 300ms ease-out;
	opacity:0;
	cursor:pointer;
	display:block;
	text-decoration:none;
	text-align:right;
			}
			
				.item-type-line .item-info {
					z-index:10;
					color:#ffffff;
					display:table-cell;
					vertical-align:top;
					position:relative;
					z-index:5;				 					
				}
			
				.item-type-line .item-info .headline {
					font-size:20px;	
							padding: 10px;	
							top: 0;	
				}
				
				.item-type-line .item-info .line {
					 height:1px;
					 width:0%;
					 margin:15px auto;
					 background-color:#ffffff;
					-webkit-transition: all 500ms ease-out;
					-moz-transition: all 500ms ease-out;
					-o-transition: all 500ms ease-out;
					transition: all 500ms ease-out;					 

				}
				
				.item-type-line .item-info .date {
					font-size:12px;
				}
				
				.item-type-line .item-hover .mask {
					background-color:#000;
					-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";
					filter: alpha(opacity=50);										
					opacity:0.5;
					z-index:0;
				}
				
				.item-type-line .item-hover:hover .line {
					width:40%;
				}
				
				.item-type-line .item-hover:hover {
					opacity:1;
				}				
			
			.item-img {			
				background-color:#7a548f;
				z-index:0;			
			}
					
		
	</style>
	
	<!--[if lte IE 8]>
	<style type="text/css">
		.item-hover .item-info {
			display:none;
			top:30%;
		}
		
		.item-hover .mask {
			display:none;
		}
		
		.item-hover:hover .item-info,
		.item-hover:hover .mask {
			display:block;
		}		
	</style>
	<![endif]-->	


<script language="JavaScript" type="text/JavaScript" src="js/valida2.js"></script>
<script language="JavaScript" type="text/JavaScript" src="js/CierraRutaPlazo.js"></script>

<html:form action="/CierraRutaPlazoAction" onsubmit="return fEvalua ( );" focus="aduana">
<%  ClaseSql sql = new ClaseSql();
  try {
    sql.getConexion();
    CallableStatement call = null;
    call = sql.cn.prepareCall("{ call pkg_transito.consulta_transito(?,?,?,?,?,?) }");
    call.registerOutParameter( 5, OracleTypes.CURSOR );
    call.registerOutParameter( 6, OracleTypes.CURSOR );
    call.setString( 1, cs.getKey_cuo() );
    call.setString( 2, cs.getKey_year() );
    call.setString( 3, cs.getKey_nber() );
    call.setInt( 4, cs.getOpcion() );
    call.execute();

    ResultSet rs = ( ResultSet ) call.getObject( 5 );
    if( ! ( rs == null || !rs.next() ) ) {
      CodTran = rs.getString( "car_car_cod" );
      DscTran = rs.getString( "car_car_nam" );
      Placa = rs.getString( "car_id_trp" );
      obs = rs.getString( "obs" )==null ? "" : rs.getString( "obs" );
      fEstimada = rs.getString( "estimada" );
      fActual = rs.getString( "actual" );
      fPartida = rs.getString( "partida" );  %>
  <table width="100%" border="0" cellpadding="3" cellspacing="1">
    <tr><td class="t14">Cierre de Tr&aacute;nsito</td></tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="0" class="marco" id="a">
    <tr><th>Aduana de Partida:</th><td><%=cs.getDscadu()%></td></tr>
    <tr><th>Nro. de Registro del Tr&aacute;nsito:</th><td><%=cs.getKey_year()%>/<%=cs.getKey_cuo()%>-<%=cs.getKey_nber()%></td></tr>
    <tr>
      <th>Empresa Transportista:</th>
      <td><html:text property="codtrans" size="15" maxlength="15" disabled="true"/><html:text property="dsctrans" size="70" disabled="true"/></td>
      <th>Placa del Medio de Transporte:</th>
      <td><html:text property="placa" size="10" maxlength="10" disabled="true"/></td>
    </tr>
    <tr><th>Precinto(s) SIDUNEA++:</th><td><%=rs.getString("precinto")%></td></tr>
    <tr>
      <th>Precintos:</th>
      <td colspan="3"><%= rs.getString( "tra_pre" ) %></td>
    </tr>
<%  if( rs.getString( "boleta" ) != null )  {  %>
    <tr>
      <th>Garantia:</th><td colspan="3"><%= rs.getString( "boleta" ) %></td>
    </tr>
<%  }  if( rs.getInt("key_secuencia")==1 && rs.getInt("key_paso")==1) { %>
    <tr>
      <th>Peso en frontera:</th><td colspan="3"><%=rs.getString("peso")%></td>
    </tr>
<%  } %>
<%  if(!rs.getString("peso_salida").equals("       0.00")) { %>
    <tr>
      <th>Peso de Salida de Puerto (Kg.):</th><td colspan="3"><%=rs.getString("peso_salida")%></td>
    </tr>
    <%}%>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="marco" id="c">
    <tr>
      <th colspan="2">Partida</th><th colspan="2">Llegada</th><th rowspan="2">Tipo de Cierre</th>
    </tr>
    <tr>
      <th>Aduana</th><th>Fecha y Hora</th><th>Aduana</th><th>Fecha y Hora</th>
    </tr>
<%  rs = ( ResultSet ) call.getObject( 6 );
    if( ! ( rs == null || !rs.next() ) ) {
      do{  %>
    <tr class="tr10">
      <td><%= rs.getString( "tra_cuo_ini" ) %>: <%= rs.getString( "tra_dsc_ini" ) %></td>
      <td><%= rs.getString( "tra_fec_ini" ) %></td>
<%      if( rs.getInt( "tra_estado" ) == 1 ) {
          if( rs.getString( "tra_fec_des" ) == null ) {
            sAduana = rs.getString( "tra_cuo_est" ) + ": " + rs.getString( "tra_dsc_est" ) ;
            sFecha = rs.getString( "tra_fec_est" );
            sEtapa = "Pendiente";
          } else {
            sAduana = rs.getString( "tra_cuo_des" ) + ": " + rs.getString( "tra_dsc_des" ) ;;
            sFecha = rs.getString( "tra_fec_des" );
            sEtapa = "Concluido";
          }   %>
      <td><%= sAduana %></td>
      <td><%= sFecha %></td>
      <td><%= sEtapa %></td>
<%     } else {
        sAduEst = rs.getString( "tra_cuo_est" ); %>
      <td>
        <select name="aduana">
        <option value="">&lt;-- Seleccione Aduana --&gt;</option>
<%      call = sql.cn.prepareCall("{? = call pkg_transito.lista_aduanas( ? ) }");
        call.registerOutParameter( 1, OracleTypes.CURSOR );
        call.setString( 2, cs.getAduanas() );
        call.execute();
        ResultSet fp = ( ResultSet ) call.getObject( 1 );
        if( ! ( fp == null || !fp.next() ) ) { do{  %>
        <option value="<%= fp.getString( 1 ) %>"> <%= fp.getString( 1 ) %>: <%= fp.getString( 2 ) %></option>
<%         } while( fp.next() );  }  %>
        </select>
      </td>
      <td>
        <html:hidden property="secuencia" value="<%= rs.getString( 1 ) %>"/>
        <html:text property="fecha" maxlength="10" size="11" value="<%= rs.getString( 12 ) %>" onblur="fdHora( fecha.value, hora.value )"/>
        <html:text property="hora"  maxlength="5" size="6" value="<%= rs.getString( 13 ) %>" onblur="fdHora( fecha.value, hora.value )"/>
        <input type="retraso" readonly="yes" size="6" id="retraso" class="rojo"/>
      </td>
      <td>
        <select name="tipo" onchange="habilita()">
          <option value="24">Normal</option>
          <option value="28">Transbordo</option>
          <option value="23">Cierre forzoso</option>
        </select>
      </td>
    </tr>
<%    }  }while( rs.next() ); }  %>
    <tr>
      <td>Observaci&oacute;n</td><td colspan="4"><html:text property="obs" maxlength="100" size="100" value="<%=obs%>"/></td>
    </tr>
  </table>
  <html:hidden property="accion"/>
  <br>
  <html:submit value="Aceptar" onclick="accion.value=1"/>
  <html:submit value="Cancelar" onclick="accion.value=2;bCancel=true"/>
<br><br>
<%  call = sql.cn.prepareCall("{?=call pkg_transito.consulta_peso(?,?,?,?)}");
    call.registerOutParameter( 1, OracleTypes.CURSOR );
    call.setString( 2, cs.getKey_cuo() );
    call.setString( 3, cs.getKey_year() );
    call.setString( 4, cs.getKey_nber() );
    call.setString( 5, sAduEst );
    call.execute();
    rs = ( ResultSet ) call.getObject( 1 );
    if( ! ( rs == null || !rs.next() ) ) { %>
  <table width="50%" border="0" cellpadding="3" cellspacing="1" class="marco" id="c">
    <tr>
      <th>Documento de Embarque</th><th>Cantidad Bultos</th><th>Peso (Kg.)</th>
    </tr>
<%  do{  %>
    <tr>
      <td><%= rs.getString( 1 ) %></td><td><%= rs.getString( 2 ) %></td><td><%= rs.getString( 3 ) %></td>
    </tr>
<%  }while( rs.next() );  %>
  </table>
<%  } } } catch( Exception e ) {
    System.out.println( e.getMessage() );
  }
  finally {
    sql.getClose();
  } %>
  
  <%
 
  String dep = (String)request.getSession().getAttribute("deposito");  
  if(dep.equals("SI")){
  try {
    sql.getConexion();
    CallableStatement call = null;
    call = sql.cn.prepareCall("{ ?=call pkg_deposito_trans.deposito_cierre(?,?,?) }");
 
  call.registerOutParameter( 1, OracleTypes.CURSOR );
    call.setString( 2, cs.getKey_cuo() );
    call.setString( 3, cs.getKey_year() );
    call.setString( 4, cs.getKey_nber() );
    call.execute();

    ResultSet rs = ( ResultSet ) call.getObject( 1 );
    if( ! ( rs == null || !rs.next() ) ) {
     
      String url = request.getContextPath()+"/"+ rs.getString( 11 );
      %>
      <br>
      <table width="60%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
                    <caption>.: Adici&oacute;n de Dep&oacute;sito Transitorio</caption>
                    <tr>
                        <td colspan="4">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td style="font-size:10px;text-align:left">NIT Operador:</td><td style="font-size:10px;text-align:left"> <%= rs.getString( 1 ) %></td>
                        <td>&nbsp;</td>
                    </tr>
                     <tr>
                        <td>&nbsp;</td>
                        <td style="font-size:10px;text-align:left">Raz&oacute;n Social:</td><td style="font-size:10px;text-align:left"> <%= rs.getString( 2 ) %></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td style="font-size:10px;text-align:left">Codigo dep&oacute;sito:</td><td style="font-size:10px;text-align:left"> <%= rs.getString( 3 ) %></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td style="font-size:10px;text-align:left">Resoluci&oacute;n Administrativa:</td><td style="font-size:10px;text-align:left"> <%= rs.getString( 4 ) %></td>
                        <td>&nbsp;</td>
                    </tr>
                   <tr>
                        <td>&nbsp;</td>
                        <td style="font-size:10px;text-align:left">Fecha Inicio:</td><td style="font-size:10px;text-align:left"> <%= rs.getString( 5 ) %></td>
                        <td>&nbsp;</td>
                    </tr>
                       <tr>
                        <td>&nbsp;</td>
                        <td style="font-size:10px;text-align:left">Fecha Vencimiento:</td><td style="font-size:10px;text-align:left"> <%= rs.getString( 6 ) %></td>
                        <td>&nbsp;</td>
                    </tr>
                 
                       <tr>
                        <td>&nbsp;</td>
                        <td style="font-size:10px;text-align:left">Aduana:</td><td style="font-size:10px;text-align:left"> <%= rs.getString( 7 ) %></td>
                        <td>&nbsp;</td>
                    </tr>
                    
                      </tr>
                       <tr>
                        <td>&nbsp;</td>
                        <td style="font-size:10px;text-align:left">Distancia:</td><td style="font-size:10px;text-align:left"> <%= rs.getString( 8 ) %></td>
                        <td>&nbsp;</td>
                    </tr>
                   
                       <tr>
                        <td>&nbsp;</td>
                        <td style="font-size:10px;text-align:left">Tiempo:</td><td style="font-size:10px;text-align:left"> <%= rs.getString( 9 ) %></td>
                        <td>&nbsp;</td>
                    </tr>
                          <tr>
                        <td>&nbsp;</td>
                        <td style="font-size:10px;text-align:left">Documento Digitalizado:</td><td><a href="<%=url%>" target='_blank'><%=rs.getString( 10 )%></a></td>
                        
                        <td>&nbsp;</td>
                    </tr>
                    
                          <tr>
                        <td>&nbsp;</td>
                        <td style="font-size:10px;text-align:left">Fecha llegada a Dep&oacute;sito:</td><td style="font-size:10px;text-align:left"> <%= rs.getString( 12 ) %></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="4">&nbsp;</td>
                    </tr>
        </table>
      
      
      
      <%
      
      
      }
   } catch( Exception e ) {
    System.out.println( e.getMessage() );
  }
  finally {
    sql.getClose();
  }
  }
  %>
</html:form>


   


<script language="JavaScript" type="text/JavaScript">
<!--
f=document.forms[0];
function habilita() {
  if(f.tipo.value==28) {
    f.codtrans.value = "";
    f.dsctrans.value = "";
    f.placa.value = "";
    f.codtrans.disabled = false;
    f.dsctrans.disabled = true;
    f.placa.disabled = false;
  } else {
    f.codtrans.value = "<%=CodTran%>";
    f.dsctrans.value = "<%=DscTran%>";
    f.placa.value = "<%=Placa%>";
    f.codtrans.disabled = true;
    f.dsctrans.disabled = true;
    f.placa.disabled = true;
  }
}
  f.aduana.value = "<%=sAduEst%>";
  fEstimada = "<%=fEstimada%>";
  fActual = "<%=fActual%>";
  fPartida = "<%=fPartida%>";
  adudes = "<%=sAduEst%>";

  habilita();
  fdHora( f.fecha.value, f.hora.value )
-->
</script>