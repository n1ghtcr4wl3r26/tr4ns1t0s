<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="Main.*, Transito.*, DepositoTrans.*"%><%@ page import="oracle.jdbc.pool.OracleConnectionPoolDataSource"%>
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
<%@ page import="java.text.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar" %>

  <head>
    <link href="../css/Estilos.css" rel="stylesheet" type="text/css" media="screen"/>
    <script language="JavaScript" type="text/JavaScript" src="js/RegLlegadaDepositoTransitorio.js"></script>
    <script language="JavaScript" type="text/JavaScript" src="js/ajaxRegLlegDepositoTransitorio.js"></script>
    <script language="JavaScript" type="text/JavaScript" src="js/valida2.js"></script>

    <title>Tr@nsitos</title>
  </head>

<%
    //SimpleDateFormat fFechah = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    SimpleDateFormat fFechah = new SimpleDateFormat("dd/MM/yyyy");
    Calendar fechah = Calendar.getInstance();
    fechah.setTime( fechah.getTime() );
    String fhoyh = fFechah.format( fechah.getTime() ); 
    ClaseSession cs = (ClaseSession) request.getSession().getAttribute( "ClaseSession" );

RegLlegDepositoTransitorioForm bean = (RegLlegDepositoTransitorioForm)request.getAttribute("RegLlegDepositoTransitorioForm");

%>
<html:form action="/RegLlegDepositoTransitorio" enctype="multipart/form-data" styleId="frm" >

    <html:hidden property="boton" styleId="boton"/>
    <br/>
    <br/>
    <table width="80%" border="0" cellpadding="4" cellspacing="0" class="marco" id="a">
        <caption>.: Registro LLegada a Dep&oacute;sito Transitorio</caption>
        <tr>
            <th class="c1" colspan="4">
                Ingrese los datos del Manifiesto 
            </th>
        </tr> 
        <tr>
            <td colspan="4">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="text-align:left">
                <label>&nbsp;&nbsp;&nbsp;&nbsp;Fecha:</label>
            </td>
            <td colspan="3" style="text-align:left">
                <%=fhoyh%>
            </td>
        </tr>
        <tr>
            <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;</td>
            <td>
                <label>Gesti&oacute;n:</label>
            </td>
            <td>
                <label>Aduana:</label>
            </td>
            <td>
                <label>N&uacute;mero:</label>
            </td>
        </tr>
        <tr>
            <td style="text-align:left" >
                <label>&nbsp;&nbsp;&nbsp;&nbsp;N&uacute;mero de Manifiesto:</label>
            </td>
            <td>
                <html:text property="car_reg_year" styleId="car_reg_year" styleClass="form-control" size="4"  maxlength="4" onchange="irajaxdeposito(frm)"/>
            </td>
            <td> 
                <html:select property="key_cuo" styleId="key_cuo" onchange="irajaxdeposito(frm)" > 
                      
                        <% 
                        
                        if( bean == null || bean.getKey_cuo() == null){
                           
                        
                        %>
                        <html:option value="">&lt;-- Seleccione Aduana --&gt;</html:option>
                        <%    ClaseSql sql = new ClaseSql();
                            try {
                                sql.getConexion();
                                CallableStatement call = null;
                                call = sql.cn.prepareCall("{?=call pkg_deposito_trans.c_list_aduanas}");
                                call.registerOutParameter( 1, OracleTypes.CURSOR);                                
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
                        } 
                        else{
                        
                         ClaseSql sql = new ClaseSql();
                            try {
                                sql.getConexion();
                                CallableStatement call = null;
                                call = sql.cn.prepareCall("{?=call pkg_deposito_trans.c_list_aduanas}");
                                call.registerOutParameter( 1, OracleTypes.CURSOR);                                
                                call.execute();
                                ResultSet fp = (ResultSet) call.getObject( 1);
                                if(! (fp==null || !fp.next()) ) {
                                    do{  
                                        if(bean.getKey_cuo().equals(fp.getString( 1 ))){
                                            %>
                                            <option selected value="<%= fp.getString( 1 ) %>"> <%= fp.getString( 1 ) %>: <%= fp.getString( 2 ) %></option>
                                            <%  
                                        }else{
                                            %>
                                            <option value="<%= fp.getString( 1 ) %>"> <%= fp.getString( 1 ) %>: <%= fp.getString( 2 ) %></option>
                                            <%  
                                        }
                                    } while( fp.next() );  
                                }  
                            }
                            catch( Exception e ) {
                              System.out.println( e.getMessage() );
                            }
                            finally {
                              sql.getClose();
                            }
                        
                        }    
                        %>                           
                </html:select>
            </td>
            <td>
                <html:text property="car_reg_nber" styleId="car_reg_nber" styleClass="form-control" size="15"  maxlength="6" onchange="irajaxdeposito(frm)"/>
            </td>
        </tr>
        <tr>
            <td style="text-align:left">
                <label>&nbsp;&nbsp;&nbsp;&nbsp;Manifiesto Digitalizado:</label>
            </td>
            <td colspan="3"  style="text-align:left">
                <html:file property="file_manifiesto" styleId="docPdfmanif" size="50" />
            </td>             
        </tr>
        <tr>
            <td style="text-align:left">
                &nbsp;&nbsp;&nbsp;&nbsp;Dep&oacute;sito Transitorio:
            </td>
            <td colspan="3"  style="text-align:left">
                <div id="id_deptransitorio"> 
                    <html:select property="cod_depositoTransitorio" styleId="cod_depositoTransitorio"  > 
                            <html:option value="">&lt;-- Seleccione --&gt;</html:option>                        
                    </html:select>
                </div>
            </td>
        </tr>
        
            <tr>
                <td colspan="4" align="center">  
                <br>
                    <center>
                    <input class="btn btn-primary" type="button" style="cursor:pointer;"   value="Registro Llegada" onclick="envia();" />
                    </center>
                     <br>
               </td>                    
            </tr>   
        </table>
        

</html:form>
