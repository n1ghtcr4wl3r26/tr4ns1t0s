<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="Main.*, Transito.*, Digitalizacion.*"%>
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
<html>
    <head>
        <title>TRANSITOS</title>
        <style type="text/css">
                .item {
                    text-align: center;
                    float: left;
                    margin: 5px 5px 30px 5px;
                    position: relative;
                }

                .item, .item-hover, .item-hover .mask, .item-img, .item-info {
                    width: 150px;
                    height: 150px;
                }

                .item-hover, .item-hover .mask, .item-img {
                    position: absolute;
                    top: 0;
                    left: 0;
                }

                .item-type-line .item-hover {
                    z-index: 100;
                    -webkit-transition: all 300ms ease-out;
                    -moz-transition: all 300ms ease-out;
                    -o-transition: all 300ms ease-out;
                    transition: all 300ms ease-out;
                    opacity: 0;
                    cursor: pointer;
                    display: block;
                    text-decoration: none;
                    text-align: right;
                }

                .item-type-line .item-info {
                    z-index: 10;
                    color: #ffffff;
                    display: table-cell;
                    vertical-align: top;
                    position: relative;
                    z-index: 5;
                }

                .item-type-line .item-info .headline {
                    font-size: 20px;
                    padding: 4px;
                    top: 0;
                }

                .item-type-line .item-info .line {
                    height: 1px;
                    width: 0%;
                    margin: 15px auto;
                    background-color: #ffffff;
                    -webkit-transition: all 500ms ease-out;
                    -moz-transition: all 500ms ease-out;
                    -o-transition: all 500ms ease-out;
                    transition: all 500ms ease-out;
                }

                .item-type-line .item-info .date {
                    font-size: 12px;
                }

                .item-type-line .item-hover .mask {
                    background-color: #000;
                    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";
                    filter: alpha(opacity=50);
                    opacity: 0.5;
                    z-index: 0;
                }

                .item-type-line .item-hover:hover .line {
                    width: 40%;
                }

                .item-type-line .item-hover:hover {
                    opacity: 1;
                }

                .item-img {
                    background-color: #7a548f;
                    z-index: 0;
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
        <script src="upload/html5.js"></script>
        <script src="upload/jquery.min.js"></script>
        <script>
          function handleFiles() {

              var filesToUpload = document.getElementById('file_img2').files;
              var file = filesToUpload[0];
              //alert("inicio");
              // Create an image
              var img = document.createElement("img");
              // Create a file reader
              //alert("img");
              var reader = new FileReader();
              // Set the image once loaded into file reader
              //alert("reader");
              reader.onload = function (e) {

                  //alert("on load");
                  img.src = e.target.result;

                  var canvas = document.createElement("canvas");
                  //alert("canvas");
                  //    alert("archivo de imagen generado");
                  //var canvas = $("<canvas>", {"id":"testing"})[0];
                  setTimeout(function () {

                      var ctx = canvas.getContext("2d");
                      ctx.drawImage(img, 0, 0);

                      var MAX_WIDTH = 600;
                      var MAX_HEIGHT = 600;
                      var width = img.width;
                      var height = img.height;

                      if (width > height) {
                          if (width > MAX_WIDTH) {
                              height *= MAX_WIDTH / width;
                              width = MAX_WIDTH;
                          }
                      }
                      else {
                          if (height > MAX_HEIGHT) {
                              width *= MAX_HEIGHT / height;
                              height = MAX_HEIGHT;
                          }
                      }
                      canvas.width = width;
                      canvas.height = height;

                      var ctx = canvas.getContext("2d");
                      //alert("context2d");
                      ctx.drawImage(img, 0, 0, width, height);
                      // alert("darwimage");
                      // setTimeout(function(){
                      var dataurl = canvas.toDataURL("image/jpeg");
                      document.getElementById('imageprev').src = dataurl;
                      document.getElementById('imagen_prev').value = dataurl;
                  },1000)
              }
              reader.readAsDataURL(file);
              // Post the data
              /*
           var fd = new FormData();
           fd.append("name", "some_filename.jpg");
           fd.append("image", dataurl);
           fd.append("info", "lah_de_dah");
           */
          }
          function ver_pdf(fi){
            //var fil = "manifiestos/201520143340.pdf";
            window.open(fi,"pdf","width=500,left=300");
          }
          
        </script>
    </head>
    <body>
    </br>
    
        <div class="s40">
            <html:form action="/digitalizacion" styleId="form1" styleClass="form">
            <html:hidden property="key_cuo"/>
            <html:hidden property="key_year"/>
            <html:hidden property="key_nber"/>
            <html:hidden property="boton"/>
            <%    
                ClaseSql sql = new ClaseSql();
                DigitalizacionImagenesForm bean = (DigitalizacionImagenesForm)request.getAttribute("DigitalizacionImagenesForm");
                SimpleDateFormat FecHoy = new SimpleDateFormat("dd/MM/yyyy HH:mm");
            %>
            <br>
             <table width="100%" border="0" cellpadding="3" cellspacing="0" id="a">
                    <caption>N&uacute;mero de Registro de Manifiesto: <strong><%=bean.getKey_year()%>/<%=bean.getKey_cuo()%>-<%=bean.getKey_nber()%></strong></caption>
                     
                    <tr>
                        <td>
                            <div class="linea" style="margin:0 0 5px 0"></div>
                        </td>
                    </tr>
                </table>
           
            <html:hidden property="cod_img"/>
            <%    
        //ClaseSql sql = new ClaseSql();
        //DigitalizacionImagenesForm bean = (DigitalizacionImagenesForm)request.getAttribute("DigitalizacionImagenesForm");
        try {
        sql.getConexion();
        CallableStatement call = null;
        call = sql.cn.prepareCall("{?=call pkg_imagenes.devuelve_imagen(?, ?, ?)}");
        call.registerOutParameter( 1, OracleTypes.CURSOR);
        call.setString( 2, bean.getKey_cuo());
        call.setString( 3, bean.getKey_year());
        call.setString( 4, bean.getKey_nber());
                
        call.execute();
        ResultSet fp = (ResultSet) call.getObject( 1);
        String imagen;
        String imagen2;
        String accionbtn;
         %><br><br>
            <table width="100%" border="0" cellpadding="3" cellspacing="0" id="a">
                    <caption>DIGITALIZACION DE IMAGENES DE PRECINTOS</caption>
               </table>     
            <%
        if(! (fp==null || !fp.next()) ) {
           
          do{ 
          imagen = request.getContextPath() + "/transitos_img/"+bean.getKey_cuo()+"/"+bean.getKey_year()+"/"+ fp.getString( 9 );
          
          //imagen = "imagenes/"+ fp.getString( 9 );
          imagen2 = request.getContextPath() + "/transitos_img/"+bean.getKey_cuo()+"/"+bean.getKey_year()+"/"+ fp.getString( 8 );
          accionbtn = "boton.value='ELIMINAR';cod_img.value="+ fp.getString( 4 );
          %>    
                <div class="item item-type-line">
                    <a class="item-hover" href="<%=imagen2%>" target="_blank">
                        <div class="mask"></div></a>
                    <div class="item-img">
                        <img src="<%=imagen%>" width="150" height="150" alt=""/>
                        <%=fp.getString( 5 )%>
                    </div>
                </div>
                <% } while( fp.next() );  }  else { 
                 %>
                <table width="100%" border="0" cellpadding="3" cellspacing="0" id="a">
                    <tr>
                        <td style="text-align:left">No se tiene registro de los precintos digitalizados</td></tr>
               </table>      
                <%
                } %>
                <%  }
    catch( Exception e ) {
      System.out.println( e.getMessage() );
    }
    finally {
      sql.getClose();
    }
 
%>
                <br></br>
            <table width="100%" border="0" cellpadding="3" cellspacing="0" id="a">
                    <caption>DIGITALIZACION DE DOCUMENTOS SOPORTE</caption>
               </table>     
            <%
                    ClaseSql sql3 = new ClaseSql();
      try {
        sql3.getConexion();
        CallableStatement call = null;
        call = sql3.cn.prepareCall("{?=call pkg_imagenes.devuelve_documentos(?, ?, ?)}");
        call.registerOutParameter( 1, OracleTypes.CURSOR);
        call.setString( 2, bean.getKey_cuo());
        call.setString( 3, bean.getKey_year());
        call.setString( 4, bean.getKey_nber());
                
        call.execute();
        ResultSet fp = (ResultSet) call.getObject( 1);
        String imagen;
        String imagen2;
        String accionbtn;
        String cod;
        String aux = ""; 
        String parametros;
        if(! (fp==null || !fp.next()) ) {
        %>
                <table width="100%" border="0" cellpadding="3" cellspacing="0" id="a">
                    <caption>Lista Documentaci&oacute;n</caption>
                     
                    <tr>
                        <td>
                            <div class="linea" style="margin:0 0 5px 0"></div>
                        </td>
                    </tr>
                </table>
                <table width="100%" class="marco" id="c">
                    <tr>
                        <th>Acciones</th>
                        <th>C&oacute;digo</th>
                        <th>Descripci&oacute;n</th>
                        <th>No. Referencia</th>
                        <th>Fecha de Embarque</th>
                    </tr>
                     
                    <%
          do{ 
         
         if(true)   
        cod = "0";
      else
        cod = fp.getString("doc_codigo_doc");
    
         String ruta1 ="";
         
         File folder = new File(fp.getString("doc_doc_adicional"));
     
     /* if (folder.exists())
      parametros = "DescargaCarpeta.jsp?arch="+fp.getString("doc_reg_year")+"-"+fp.getString("doc_key_cuo")+"-"+cs.getKey_year()+cs.getKey_cuo()+cs.getKey_nber()+"-"+cod+".pdf&ruta="+fp.getString("doc_doc_adicional");
      else
      parametros = "-1";
      */
      
      // parametros = "DescargaCarpeta.jsp?arch="+fp.getString("doc_reg_year")+"-"+fp.getString("doc_key_cuo")+"-"+cs.getKey_year()+cs.getKey_cuo()+cs.getKey_nber()+"-"+cod+".pdf&ruta="+fp.getString("doc_doc_adicional");
     
      
       /* if (folder.exists())
        parametros = "javascript:ver_pdf('manifiestos"+ fp.getString("doc_doc_adicional").substring (fp.getString("doc_doc_adicional").lastIndexOf("/")) +"')";
      //parametros = "DescargaCarpeta.jsp?arch="+rsdoc.getString("doc_reg_year")+"-"+rsdoc.getString("doc_key_cuo")+"-"+man.getCar_reg_year()+cs.getAduana()+man.getCar_reg_nber()+"-"+cod+".pdf&ruta="+rsdoc.getString("doc_doc_adicional");
      else
        parametros = "javascript:alert('El archivo físico no existe o no se almacenó correctamente.')";
      
      */
      
       
       
       if (folder.exists()){
      //System.out.println(rsdoc.getString("doc_doc_adicional").split("/").length-1);
      //System.out.println(rsdoc.getString("doc_doc_adicional").split("/")[rsdoc.getString("doc_doc_adicional").split("/").length-1]);
       // parametros = "javascript:ver_pdf('mira/manifiestos/"+fp.getString("doc_key_cuo")+"/"+fp.getString("doc_reg_year")+"/"+ fp.getString("doc_doc_adicional").split("/")[fp.getString("doc_doc_adicional").split("/").length-2] + "/"+ fp.getString("doc_doc_adicional").split("/")[fp.getString("doc_doc_adicional").split("/").length-1] +"')";
       ruta1 = fp.getString("ruta");
            
       //ruta1 = ruta1.substring(ruta1.indexOf("mira/"));
       //parametros = "javascript:ver_pdf('"+ruta+"')";
        parametros = "DescargaCarpetaMan.jsp?ruta="+ruta1;
      //parametros = "DescargaCarpeta.jsp?arch="+rsdoc.getString("doc_reg_year")+"-"+rsdoc.getString("doc_key_cuo")+"-"+man.getCar_reg_year()+cs.getAduana()+man.getCar_reg_nber()+"-"+cod+".pdf&ruta="+rsdoc.getString("doc_doc_adicional");
        aux = "subirImagen('"+fp.getString("doc_reg_year")+"','"+fp.getString("doc_key_cuo")+"','"+fp.getString("doc_reg_nber")+"','"+fp.getString("doc_codigo_doc")+"','"+fp.getString("doc_codigo_descrip")+
          "','"+fp.getString("doc_emisor")+"','"+fp.getString("doc_referencia")+"','"+fp.getString("doc_fecha")+"','"+fp.getString("doc_importe")+
          "','"+fp.getString("doc_divisa")+"','"+fp.getString("doc_otr_divisa")+"','"+fp.getString("doc_doc_adicional")+"','"+"1"+"','"+fp.getString("cod2")+"','"+fp.getString("doc_emb")+"');";
          
      }else{
        parametros = "javascript:alert('El archivo f&iacute;sico no existe o no se almacen&oacute; correctamente.')";
        aux = "subirImagen('"+fp.getString("doc_reg_year")+"','"+fp.getString("doc_key_cuo")+"','"+fp.getString("doc_reg_nber")+"','"+fp.getString("doc_codigo_doc")+"','"+fp.getString("doc_codigo_descrip")+
          "','"+fp.getString("doc_emisor")+"','"+fp.getString("doc_referencia")+"','"+fp.getString("doc_fecha")+"','"+fp.getString("doc_importe")+
          "','"+fp.getString("doc_divisa")+"','"+fp.getString("doc_otr_divisa")+"','"+fp.getString("doc_doc_adicional")+"','"+"0"+"','"+fp.getString("cod2")+"','"+fp.getString("doc_emb")+"');";
          
      }
      
      
   %><tr class="tr10">
                        <td height="30px" style="font-size:10px;text-align:center">
                            <a href="<%= parametros%>" id="idVer">
                                <img src="images/folder.jpg"/></a>
                        </td>
                        <td style="font-size:10px;text-align:center">
                            <strong>
                                <%= fp.getString("doc_codigo_doc")%></strong>
                        </td>
                        <td style="font-size:10px">
                            <%= fp.getString("doc_codigo_descrip")%>
                        </td>
                        <td style="font-size:10px;text-align:center">
                            <%= fp.getString("doc_referencia")%>
                        </td>
                        <td style="font-size:10px;text-align:center">
                            <%= fp.getString("doc_fecha")%>
                        </td>
                    </tr>
                     
                    <%        
  } while( fp.next() ); %></table><% } else { 
                 %>
                <table width="100%" border="0" cellpadding="3" cellspacing="0" id="a">
                    <tr>
                        <td style="text-align:left">No se tiene registro de los documentos soporte</td></tr>
               </table>      
                <%
                } %>
                
                <br></br>
                <%  }
    catch( Exception e ) {
      System.out.println( e.getMessage() );
    }
    finally {
      sql3.getClose();
    }
 
%>
                <br></br>
                <br></br>
                <table width="100%" border="0" cellpadding="3" cellspacing="0" id="a">
                    <tr>
                        <td style="width:200px">&nbsp;</td>
                    </tr>
                </table>
            </html:form>
        </div>
    </body>
</html>