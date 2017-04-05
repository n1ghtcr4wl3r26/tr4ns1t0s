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
<%@ page import="java.text.SimpleDateFormat"%>

<script language="JavaScript" type="text/JavaScript" src="js/valida2.js"></script>
<script language="JavaScript" type="text/JavaScript" src="js/tramite2.js"></script>

<%
  ClaseSession cs = ( ClaseSession ) request.getSession().getAttribute( "ClaseSession" );
  GestionCorreoForm bean = (GestionCorreoForm)request.getAttribute("GestionCorreoForm");
  java.util.Date date = new Date();
  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy");
  String anio = dateFormat.format(date)+"";
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
<script language="JavaScript" type="text/javascript" >
  $(document).ready(function () {
  });

function deshabilitar(v_valor) {
  var Mensaje = "";
  $('#usuariocorreo').val(v_valor);
  $('#estado').val('DESHABILITADO');
  $('#boton').val('deshabilitar');
  document.GestionCorreoForm.submit();
};

function habilitar(v_valor) {
  var Mensaje = "";
  $('#usuariocorreo').val(v_valor);
  $('#estado').val('HABILITADO');
  $('#boton').val('habilitar');
  document.GestionCorreoForm.submit();
};


</script>


<html:form action="/GestionCorreo" onsubmit="return false;">
<input type="hidden" name="boton" id="boton"/>
<input type="hidden" name="estado" id="estado"/>
<input type="hidden" name="usuariocorreo" id="usuariocorreo"/>
 <table width="90%" border="0" cellpadding="3" cellspacing="0" align="center">
                 <tr>
                     <th>Listado de usuarios para remisi&oacute;n de correos</th>
                 </tr>
             </table>
          <%
          int i=0;




          ClaseSql sql = new ClaseSql();
          try
           { sql.getConexion();
             CallableStatement call = null;
             call = sql.cn.prepareCall( "{? = call PKG_VARIABLE_RIESGO.lista_usuarios_correo }" );
             call.registerOutParameter( 1, OracleTypes.CURSOR );
             call.execute();
             %>

             <table width="90%" border="1" cellpadding="3" cellspacing="0" class="marco" align="center" id="c">
                 <tr class="t14">
                     <th align="center" >Codigo Funcionario</th>
                     <th align="center" >Nombre Funcionario</th>
                     <th align="center" >Correo</th>
                     <th align="center" >Estado</th>
                     <th align="center" >Usuario Ultima Modificaci&oacute;n</th>
                     <th align="center" >Fecha Ultima Modificaci&oacute;n</th>
                     <th align="center" >Opci&oacute;n</th>
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
                       <%=rs.getString( 1 ) %>
                     </td>
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
                         <%=rs.getString( 5) %>
                     </td>
                     <td>
                         <%=rs.getString( 6) %>
                     </td>
                     <td>
                       <%
                          if(rs.getString(4).equals("HABILITADO") )
                          {
                            %>
                              <input type="button" value="DESHABILITAR" name="boton" onclick="deshabilitar('<%=rs.getString( 1 ) %>')"></input>
                            <%
                          }
                          else
                          {
                            %><input type="button" value="HABILITAR" name="boton" onclick="habilitar('<%=rs.getString( 1 ) %>')"></input> <%
                          }
                       %>
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
</html:form>
