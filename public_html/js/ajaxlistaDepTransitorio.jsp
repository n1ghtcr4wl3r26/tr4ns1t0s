<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="org.apache.struts.util.LabelValueBean" %>
<%@ page import="java.sql.*, oracle.jdbc.driver.*, java.util.*, Transito.*, java.text.*" %>
<%@ page import="oracle.jdbc.OracleTypes"%>
<META HTTP-EQUIV="Cache-Control" CONTENT ="no-cache">
  <head>
  <title>IBTEN</title>  
    
    <script type="text/javascript">
        window.onload= function(){        
            history.go(1);            
            //bloqueo();
        }
    </script>
  </head> 
<%
    out.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
    String var_car_reg_year=request.getParameter("vcar_reg_year");
    String var_vkey_cuo=request.getParameter("vkey_cuo");
    String var_pcar_reg_nber=request.getParameter("vcar_reg_nber");
         
    System.out.println(var_vkey_cuo);
        
%>    
    <div> 
        <select class="form-control" id="cod_depositoTransitorio" name="cod_depositoTransitorio">
                          <option value=""> Seleccione </option> 
                        <%    ClaseSql sql = new ClaseSql();
                            try {
                                sql.getConexion();
                                CallableStatement call = null;
                                call = sql.cn.prepareCall("{?=call pkg_deposito_trans.c_lista_depositos_manif_xnit(?,?,?)}");
                                call.registerOutParameter( 1, OracleTypes.CURSOR);     
                                call.setString(2,var_vkey_cuo );
                                call.setString(3, var_car_reg_year);
                                call.setString(4, var_pcar_reg_nber);
                                call.execute();
                                ResultSet fp = (ResultSet) call.getObject( 1);
                                if(! (fp==null || !fp.next()) ) {
                                    do{  
                                        %>
                                        <option value="<%= fp.getString( 1 ) %>"> <%= fp.getString( 1 ) %></option>
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
        </select>    
    </div>

