<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="Main.*, Transito.*, JustificativosTNA.*"%>
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
<%@ page import="javax.sql.DataSource"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.sql.DataSource"%>
<html>
  <head>
    <title>TRANSITOS</title>
    <script src="upload/jquery.min.js"></script>
    <script src="js/valida2.js"></script>
    <script>
      function grabar() {
          var Mensaje = "";
          var f = document.forms["JustificativosForm"];
          if (f.adu_pres.value == "") {
              Mensaje += "Debe Selecionar una 'Aduana de Presentaci\363n'\n";
          }
          if (f.cite_just.value == "") {
              Mensaje += "'Cite Justificativo' es obligatorio\n";
          }
          if (!foFecha(f.fecha_just.value)) {
              Mensaje = Mensaje + "'Fecha Justificativo' es obligatorio o tiene valores que no son correctos (DD/MM/AAAA)\n";
          }
          else {
              var fjust = f.fecha_just.value.substring(6, 10) + f.fecha_just.value.substring(3, 5) + f.fecha_just.value.substring(0, 2);
              var factual = f.fec_actual.value.substring(6, 10) + f.fec_actual.value.substring(3, 5) + f.fec_actual.value.substring(0, 2);
              if (factual < fjust) {
                  Mensaje = Mensaje + "'Fecha Justificativo' no puede ser superior a la fecha de Hoy: " + f.fec_actual.value + "\n";
              }
          }
          if (f.hoja_ruta.value == "") {
              Mensaje += "'Hoja de Ruta' es obligatorio\n";
          }
          if (f.causa.value == "") {
              Mensaje += "Debe seleccionar una 'Causa'\n"
          }
          if (f.observacion.value == "") {
              Mensaje += "'Observaci\363n' es obligatorio\n";
          }
          /*
          if (f.file_jus.value == "") {
              Mensaje += "'Documento Escaneado' es obligatorio\n";
          }*/
          if (Mensaje != "") {
              alert(Mensaje);
              return false;
          }
          else {
              document.getElementById('hboton').value = 'GRABAR';
              document.getElementById('btnregistrar').style.display = 'none';
              f.submit();
          }
      }
    </script>
  </head>
  <body>
        <%    
        ClaseSql sql = new ClaseSql();
        JustificativosForm bean = (JustificativosForm)request.getAttribute("JustificativosForm");
        
        %>
        <div class="s40">
      <html:form action="/justificativo" styleId="form1" styleClass="form" enctype="multipart/form-data">
        <%
                ClaseSession cs = (ClaseSession) request.getSession().getAttribute( "ClaseSession" );
                %>
        <html:hidden property="key_cuo"/>
        <html:hidden property="key_year"/>
        <html:hidden property="key_nber"/>
        <html:hidden property="fec_actual"/>
        <html:hidden property="boton" styleId="hboton"/>
        <br></br>
        <table width="95%" border="0" cellpadding="3" cellspacing="0" id="a">
          <caption>
            N&uacute;mero de Registro de Manifiesto:
            <strong>
              <%=bean.getKey_year()%>/<%=bean.getKey_cuo()%>-<%=bean.getKey_nber()%></strong>
          </caption>
           
          <tr>
            <td>
              <div class="linea" style="margin:0 0 5px 0"></div>
            </td>
          </tr>
        </table>
        <br></br>
        
        <table width="95%" border="0" cellpadding="3" cellspacing="0" class="marco" id="a">
          <caption>Registro Justificativos TNA</caption>
           
          <tr>
            <td style="text-align:right">
              <label>Aduana de Presentaci&oacute;n:</label>
            </td>
            <td style="text-align:left">
              <html:select property="adu_pres" styleId="adu_pres">
                <html:option value="">&lt;-- Seleccione Aduana --&gt;</html:option>
                <%   
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
                <option value="<%= fp.getString( 1 ) %>">
                  <%= fp.getString( 1 ) %>
                  :
                  <%= fp.getString( 2 ) %>
                </option>
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
            <td style="text-align:right">N&uacute;mero CITE Justificativo:</td>
            <td style="text-align:left">
              <html:text property="cite_just" styleId="cite_just" maxlength="100" size="50"/>
            </td>
          </tr>
           
          <tr>
            <td style="text-align:right">Fecha Justificativo:</td>
            <td style="text-align:left">
              <html:text property="fecha_just" styleId="fecha_just" maxlength="10" size="20"/>
            </td>
          </tr>
           
          <tr>
            <td style="text-align:right">Hoja de Ruta:</td>
            <td style="text-align:left">
              <html:text property="hoja_ruta" styleId="hoja_ruta" maxlength="100" size="50"/>
            </td>
          </tr>
           
          <tr>
            <td style="text-align:right">Causa:</td>
            <td style="text-align:left">
              <html:select property="causa">
                <html:option value="">&lt;-- Seleccione Tipo --&gt;</html:option>
                <html:option value="DESASTRE NATURAL">DESASTRE NATURAL</html:option>
                <html:option value="FALLA MECANICA">FALLA MECANICA</html:option>
                <html:option value="ACCIDENTE">ACCIDENTE</html:option>
                <html:option value="OTROS">OTROS</html:option>
              </html:select>
            </td>
          </tr>
           
          <tr>
            <td style="text-align:right">Observaciones:</td>
            <td style="text-align:left">
              <html:text property="observacion" styleId="observacion" maxlength="100" size="50"/>
            </td>
          </tr>
          <%-- 
          <tr>
            <td style="text-align:right">Documento Escaneado:</td>
            <td style="text-align:left">
              <html:file property="file_jus" styleId="file_jus" styleClass="form-control " size="30" maxlength="50"/>
            </td>
          </tr>
          --%> 
          <tr>
            <td colspan="4" class="C">&nbsp;</td>
          </tr>
           
          <tr>
            <td colspan="4" class="C">
              <center>
                <input class="btn btn-primary" type="button" id="btnregistrar" value="Registrar" onclick="grabar();"/>
              </center>
            </td>
          </tr>
        </table>
        <br></br>
        
        <%   
        try {
            String url;
            sql.getConexion();
            CallableStatement call = null;
            call = sql.cn.prepareCall("{?=call pkg_justificativos.devuelve_justificativos(?,?,?,?)}");
            call.registerOutParameter( 1, OracleTypes.CURSOR);
            call.setString( 2, bean.getKey_cuo());
            call.setString( 3, bean.getKey_year());
            call.setString( 4, bean.getKey_nber());
            call.setString( 5, "ALL");
            call.execute();
            int con = 0;
            ResultSet fp = (ResultSet) call.getObject( 1);
            if(! (fp==null || !fp.next()) ) {
                do{ 
                    if(con == 0){
                        %>  
                        <table width="95%" border="0" cellpadding="3" cellspacing="0" class="marco" id="a">
                        <caption>Justificativos Registrados</caption>
                        <tr class="t14">
                            <th style="text-align:center">Aduana Presentaci&oacute;n</th>
                            <th style="text-align:center">N&uacute;mero CITE Justificativo</th>
                            <th style="text-align:center">Fecha Justificativo</th>
                            <th style="text-align:center">Hoja de Ruta</th>
                            <th style="text-align:center">Causa</th>
                            <th style="text-align:center">Observaciones</th>
                            <%--<th style="text-align:center">Documento Escaneado</th>--%>
                        </tr>
                        <%
                        con = 1;
                    }
                    url = request.getContextPath()+ fp.getString( 12 );
                    %>
                    <tr>
                        <td style="text-align:left">
                            <%= fp.getString( 5 ) %>
                        </td>
                        <td style="text-align:center">
                            <%= fp.getString( 6 ) %>
                        </td>
                        <td style="text-align:center">
                            <%= fp.getString( 7 ) %>
                        </td>
                        <td style="text-align:left">
                            <%= fp.getString( 8 ) %>
                        </td>
                        <td style="text-align:left">
                            <%= fp.getString( 9 ) %>
                        </td>
                        <td style="text-align:left">
                            <%= fp.getString( 10 ) %>
                        </td>
                        <%--
                        <td style="text-align:left">
                            <a href="<%=url%>" target='_blank'>
                                <%= fp.getString( 11 ) %>
                            </a>
                        </td>
                        --%>
                    </tr>
                    <%  
                } while( fp.next() );  
            }  
            if(con == 1) {
                %></table><%
            }
        }
        catch( Exception e ) {
            System.out.println( e.getMessage() );
        }
        finally {
            sql.getClose();
        }                          
        %>
    </html:form>
</div>
</body>
</html>