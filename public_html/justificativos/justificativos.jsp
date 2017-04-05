<%@ page contentType="text/html; charset=UTF-8" language="java" buffer="none" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
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
<%@ page import="java.text.SimpleDateFormat"%><%@ page import="java.io.*"%>
<html:html>
  <head>
    <meta name="Author" content="Edgar Joaquin Arteaga Gutierrez" lang="es"></meta>
    <meta name="copyright" content="&copy; 2016, Aduana Nacional de Bolivia" lang="es"></meta>
  </head>
  
  
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
  
  
  
 <link href="../css/Estilos.css" rel="stylesheet" type="text/css" media="screen"/>  
<style type="text/css">
<!--
.t14 {font-size: 12px;color: #fff;font-weight: bolder;text-align: left;}
#a th {font-family: tahoma;color: #fff;text-align: right;font-size: 10px;font-weight: bolder;}
#a td {font-size: 10px;color: #004e9b;}
#a caption{font-family: tahoma;font-size: 14px;color: #000000;font-weight: bolder;text-align: center;}
th {font-size: 10px;color: #000000;font-weight: bolder;text-align: center;font-family: tahoma;}
td {font-size: 9px;color: #004e9b;font-family: tahoma;font-weight: normal;}
-->
</style>
<%
  ClaseSession cs = (ClaseSession) request.getSession().getAttribute( "ClaseSession" );
  ClaseSql sql = new ClaseSql();
  
%>
<body bgcolor="#F5F9FD">
Aduana Nacional de Bolivia
<%


%>

 <%   
        try {
            String url;
            sql.getConexion();
            CallableStatement call = null;
            call = sql.cn.prepareCall("{?=call pkg_justificativos.devuelve_justificativos(?,?,?,?)}");
            call.registerOutParameter( 1, OracleTypes.CURSOR);
            call.setString( 2, request.getParameter("aduana"));
            call.setString( 3, request.getParameter("gestion"));
            call.setString( 4, request.getParameter("numero"));
            call.setString( 5, request.getParameter("adupres"));
            call.execute();
            int con = 0;
            ResultSet fp = (ResultSet) call.getObject( 1);
            if(! (fp==null || !fp.next()) ) {
                do{ 
                    if(con == 0){
                        %>
                        <br></br>
                        <br></br>                        
                        <center>  
                        <table width="800px" border="0" cellpadding="3" cellspacing="0" class="marco" id="a">
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
                %></table></center><%
            }
        }
        catch( Exception e ) {
            System.out.println( e.getMessage() );
        }
        finally {
            sql.getClose();
        }                          
        %>

</body>
</html:html>
