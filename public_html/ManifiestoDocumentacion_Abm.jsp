<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/sqltaglib.tld" prefix="database" %>
<%@ page import="java.io.*"%>
<%@ page import="Main.*"%>
<%@ page import="ManifiestoDocs.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

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

<% response.setHeader("Pragma", "No-cache");
   response.setHeader("Cache-Control", "no-cache");
   response.setDateHeader("Expires",-1); %>
<script language="JavaScript" type="text/JavaScript" src="js/ManifiestoDocumentacion_Abm.js?ran=17"></script>
<script language="JavaScript" type="text/JavaScript" src="js/valida.js?ran=17"></script>
<script language="JavaScript" type="text/JavaScript" src="js/consultamanifiesto.js?ran=17"></script>
<script language="JavaScript" type="text/JavaScript" src="js/ajaxListDoc.js?ran=15"></script>
<style type="text/css">
.nobord { border-style: solid; border-width: 0; padding: 0 }

#boxes .window {
  position:absolute;
  left:0;
  top:0;
  width:440px;
  height:360px;
  display:none;
  z-index:9999;
  padding:20px;
}
#boxes #dialog {
  position:absolute;
  left:0;
  top:0;
  width:710px; 
  height:330px;
  padding:10px;
  background-color:#ffffff;
}

#boxes_p .window {
  position:absolute;
  left:0;
  top:0;
  width:440px;
  height:150px;
  display:none;
  z-index:9999;
  padding:20px;
}
#boxes_p #dialog_p {
  position:absolute;
  left:0;
  top:0;
  width:710px; 
  height:150px;
  padding:10px;
  background-color:#ffffff;
}
.modal-top{
    top:100px !important;
}
#mask {
  position:absolute;
  left:0;
  top:0;
  z-index:9000;
  background-color:#000;
  display:none;
}
</style>
<script language="javascript">
var it = -1;
listaMostrar = new Array();
listaObligar = new Array();
listaCondicion = new Array();
listaFecha = new Array();
listaNumero = new Array();

var obl = 0;
</script>
<%ClaseSession cs = (ClaseSession) request.getSession().getAttribute( "ClaseSession" );
    ManifiestoForm man = (ManifiestoForm) request.getSession().getAttribute( "manifst" );
    ClaseSql sql = new ClaseSql();
    
    Statement statementdoc = null;
    Statement stdiv = null;
    Statement stlist = null;
 try
  {   
    
    
    sql.getConexion();
    //CallableStatement call = null;
    
    ResultSet rsdoc = null;      //listado de documento      
    ResultSet rs = null;//PARA LOS DOCUMENTOS DE EMBARQUE
    ResultSet rsdiv = null;//PARA DIVISAS
    
    String canveh="";
    canveh = man.getCant_veh();
    String arch_zip="";
    String manif="";
    
    String peso="";
    int peso_file=0;
    
    java.util.Date date = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy");
    String anio = dateFormat.format(date)+"";
%>
<html:form action="/AbmManifiestoDocsAction" styleId="formulariocarpeta" enctype="multipart/form-data">
<div class="box-header with-border">
    <h3 class="box-title">
CONFIRMACI&Oacute;N REGISTRO MANIFIESTO
    </h3>
</div> 
 <p><a name="sub"></a></p>
    <table width="100%" id="a" class="marco">
    <thead class="main">
        <tr>
          <th class="c1" colspan="4">Informaci&oacute;n del Manifiesto</th>
        </tr>
      </thead>
      <tbody class="main">
                <tr>    
                    <td style="color:#000066" >Nro. Manifiesto:</td>
                    <td ><%= man.getCar_reg_year() %> / <%= man.getKey_cuo() %> / <%= man.getCar_reg_nber() %></td>
                    <%manif = man.getCar_reg_year()+"-"+man.getCar_reg_nber();%>
                    <td></td><td></td>
                </tr>
                <tr>
                    <td style="color:#000066" >Fecha arribo:</td>
                    <td > <%= man.getFecha_arrribo() %></td>
                    <td style="color:#000066" >Hora arribo:</td>
                    <td > <%= man.getHora_arribo() %></td>
                </tr>
                <tr>    
                    <td style="color:#000066" >Transportador Internacional:</td>
                    <td> <%= man.getTranportador() %></td>
                    <td style="color:#000066">Modo de Transporte:</td>
                    <td> <%= man.getMedio() %></td>
                </tr>
                <tr>
                    <td style="color:#000066" >Nro. Carta Porte:</span></td>
                    <td colspan="3"> <%= man.getKey_bol_ref().replaceAll("[(]~[)]",";") %> </td>
                </tr>
                
            </tbody>
    </table>
    
    <br>
    
<div id="boxes" >
<div id="dialog" class="window modal-top" width="100%" >
<html:hidden property="key_cuo" styleId="key_cuo"/>
<html:hidden property="car_reg_year" styleId="car_reg_year"/>
<html:hidden property="car_reg_nber" styleId="car_reg_nber"/>
<html:hidden property="opcion" styleId="opcion"/>
<html:hidden property="carpeta" styleId="carpeta"/>
<html:hidden property="nreferencia" styleId="nreferencia"/>

<html:hidden property="car_dep_date" styleId="car_dep_date"/>
<html:hidden property="car_voy_nber" styleId="car_voy_nber"/>

<html:hidden property="r_aduana" styleId="r_aduana"/>
<table width="100%" id="a" class="marco">
      <thead>
  <tr><th colspan="6" class="c1">Registrar Documento Adicional</th></tr>
      </thead>
<tbody >
  <tr>
    <th width="20%">Documento de embarque:</th>
    <td colspan="4"><div class="form-group">
                    <select name="doc_embarque" id="doc_embarque" class="form-control" onchange="ListaDocAdic()">
                    <option value="">-- Elija Documento de Embarque --</option>
                    <% String[] docs = man.getKey_bol_ref().split("[(]~[)]");
                    for(int i = 0; i < docs.length ; i++){%>
                        <option value="<%= docs[i].trim() %>"><%= docs[i].trim() %></option>
                    <% }%>
                    </select>
                </div></td>
    <th>&nbsp;</th>
  </tr>  
  <tr id="tr0">
    <th width="20%">Tipo Documento:</th>
    <td colspan="4" ><div class="form-group">
    
                            <div class="form-group has-feedback">
                            <select name="tip_documento" id="tip_documento" class="form-control" onchange="most_index(this)">
                              <option value="">-- Elija Tipo de Documento Adicional --</option>                              
                            </select>
                </div>
    </div></td>
    <th>&nbsp;</th>
  </tr>
  <tr id="tr1" style="display:none">
    <th width="20%">Descripci&oacute;n Documento:</th>
    <td colspan="4"><div class="form-group"><html:text styleId="emisor" property="emisor" onblur="this.value=this.value.toUpperCase()" maxlength="50"/></div></td>
    <th>&nbsp;</th>
  </tr>
  <tr id="tr2">
    <th width="20%">Nro. Referencia:</th>
    <td colspan="4"><div class="form-group"><html:text  styleId="nro_referencia" property="nro_referencia" onblur="this.value=this.value.toUpperCase()" maxlength="50"/></div></td>
    <th>&nbsp;</th>
  </tr>
  <tr id="tr3" style="display:none">
    <th width="20%">Fecha de Embarque:</th>
    <td colspan="4">
        <html:text maxlength="10" styleId="fecha_emision" property="fecha_emision" styleClass="form-control" value="" />

    </td>
    <th>&nbsp;</th>
  </tr>
  <tr id="tr4" style="display:none">
    <th width="20%">Importe:</th>
    <td colspan="4"><div class="form-group"><html:text styleId="importe" property="importe" maxlength="11" /></div></td>
    <th>&nbsp;</th>
  </tr>
  <tr id="tr5" style="display:none">
    <th width="20%">Divisa:</th>
    <td colspan="4"><div class="form-group"><select name="tip_divisa" id="tip_divisa" class="form-control">
                        <%String jquerydiv="";
                            jquerydiv = jquerydiv + "SELECT a.cur_cod, a.cur_dsc FROM  ops$asy.uncurtab a WHERE a.lst_ope = 'U'  AND a.cur_cod <> 'TPR'";
                            
                            //Statement stdiv = null;
                            stdiv = sql.cn.createStatement();
                            rsdiv = stdiv.executeQuery(jquerydiv);
                            
                            if(! (rsdiv==null || !rsdiv.next()) ) {
                            do{
                        
                        %>
                                <option value="<%= rsdiv.getString(1)%>">
                                  <%= rsdiv.getString(1) + " : " + rsdiv.getString(2) %>
                                </option>
                                <%} while( rsdiv.next() ); }
                                
                                rsdiv = null;
                                 if( rsdiv != null )
                                    rsdiv.close();
                                %>

                              </select>
    </div></td>
    <th>&nbsp;</th>
  </tr>
  <tr id="tr6">
    <th>Documento (PDF):</th>
    
    <td colspan="5" width="85%"><span id="nombreArch" ></span><div id="lim_pdf"><html:file styleId="docPdf" property="docPdf" size="50" onchange="getStats(this.value)" /></div></td>
  </tr>
  <tr id="tr7" style="display:none">
    <th width="20%">DUI Memorizada:</th>
    <th>
        <div class="form-group"><input Id="dui_key_year" type="text" maxlength="4" placeholder="Gesti&oacute;n"/></div>
    </th>
    <th>
        <div class="form-group"><input Id="dui_key_cuo" type="text" maxlength="3" placeholder="Aduana"/></div>
    </th>
    <th> 
        <div class="form-group"><input Id="dui_key_dec" type="text" maxlength="17" placeholder="Declarante"/></div>
    </th>
    <th>
        <div class="form-group"><input Id="dui_key_nber" type="text" maxlength="13" placeholder="N&uacute;mero"/></div>
    </th>
    <th>&nbsp;</th>
  </tr>
  <tr><th colspan="6"><input class="btn btn-primary" type="button" id="Subir" name="Subir" value="Grabar" onclick="subirArchivo('1')"/>&nbsp;&nbsp;&nbsp;<input class="btn btn-primary" type="button" id="Cancelar" name="Cancelar" value="Cancelar" onclick="cancelarArchivo();"/></th></tr>
</tbody>
</table>
</div>
</div>

<div id="boxes_p" >
<div id="dialog_p" class="window modal-top" width="100%" >
<html:hidden property="key_cuo" styleId="key_cuo"/>
<html:hidden property="car_reg_year" styleId="car_reg_year"/>
<html:hidden property="car_reg_nber" styleId="car_reg_nber"/>
<html:hidden property="opcion" styleId="opcion"/>
<html:hidden property="carpeta" styleId="carpeta"/>
<html:hidden property="nreferencia" styleId="nreferencia"/>

<html:hidden property="car_dep_date" styleId="car_dep_date"/>
        <html:hidden property="car_voy_nber" styleId="car_voy_nber"/>

<html:hidden property="r_aduana" styleId="r_aduana"/>

<table width="100%" id="a" class="marco">
      <thead>
  <tr><th colspan="6" class="c1">Registrar Documento por Parcial</th></tr>
      </thead>
<tbody >
    <tr>
            <th>&nbsp;</th>
            <td colspan="3"><font size="2px" color="green">gesti&oacute;n / aduana / no. registro</font></td>
            <th>&nbsp;</th>
    </tr>
  <tr>
    <th width="20%">Manifiesto:</th>
    <td><html:hidden property="opcion"/>
    <html:text property="p_car_reg_year" styleId="p_car_reg_year" maxlength="4" size="10" value="<%= anio%>" onKeyPress="return soloNumeros(event)"  onblur="this.value=this.value.replace(/(^\s*)|(\s*$)/g,'')" /></td>
    <td> 
    <html:text property="p_key_cuo" styleId="p_key_cuo" maxlength="4" size="10" value="<%=man.getKey_cuo()%>" readonly="true" onKeyPress="return soloNumeros(event)"  onblur="this.value=this.value.replace(/(^\s*)|(\s*$)/g,'')" />
    </td>
    

    <td> <html:text maxlength="20" size="20" property="p_car_reg_nber" styleId="p_car_reg_nber" onKeyPress="return soloNumeros(event)"  onblur="this.value=this.value.replace(/(^\s*)|(\s*$)/g,'')"/></td>
    <th>&nbsp;</th>
  </tr>
  <tr>
    <th width="20%">Documento de embarque:</th>
    <td colspan="2"> 
    <select name="p_key_bol_ref" id="p_key_bol_ref" class="form-control">
            <option value="">-- Elija Tipo de Documento Adicional --</option>
            <% String[] docsp = man.getKey_bol_ref().split("[(]~[)]");
                    for(int i = 0; i < docsp.length ; i++){%>
            <option value="<%= docsp[i].trim() %>"><%= docsp[i].trim() %></option>
            <% }%>
            </select>
    </td>

    <th colspan="2">&nbsp;</th>  
  </tr>
  <tr><th colspan="6"><input class="btn btn-primary" type="button" id="Parcial" name="Parcial" value="Grabar" onclick="subirArchivo('4')"/>&nbsp;&nbsp;&nbsp;<input class="btn btn-primary" type="button" id="Cancelar" name="Cancelar" value="Cancelar" onclick="cancelarArchivo();"/></th></tr>
</tbody>
</table>
</div>
</div>

<div id="mask"></div>

<div id="portapdf"> 
    
</div> 

<center><input class="btn btn-primary" type="button" id="Adiciona" name="Adiciona" value="Adicionar Nuevo Documento" onclick="nuevo()"/><input class="btn btn-primary" type="button" id="Parcial" name="Parcial" value="Por Parcial" onclick="parcial()"/></center><br>
<table width="100%">
  <caption>DOCUMENTOS ADICIONALES</caption>
</table>
<table width="100%" id="a" class="marco">
  <thead class="main">
    <tr>
      <th style=" min-Width:130px" class="c1">Acciones</th>
      <th class="c1">C&oacute;digo</th>
      <th class="c1">Descripci&oacute;n</th>
      <th class="c1">Doc. Embarque</th>
      <th class="c1">No. Referencia</th>      
      <th class="c1">Fecha de Embarque</th>

    </tr>
  </thead>
  <tbody class="main">
  <%
    String querys2 = "";
    
    String cod = "";
    String parametros = "";
    String aux = "";  
    String eli = "";
    
    String ruta1 ="";
    
    String arch_ori ="";
    String arch_des="";
    String parcial ="";
    
    
    
    querys2 = " SELECT DISTINCT a.doc_reg_year, a.doc_key_cuo, a.doc_reg_nber, a.doc_codigo_doc, decode(a.doc_codigo_doc,'XXX','Otros',b.atd_dsc) doc_codigo_descrip, nvl(a.doc_emisor, ' ') doc_emisor, nvl(a.doc_referencia, ' ') doc_referencia, ";
    querys2 = querys2 + " NVL(to_char(a.doc_fecha,'dd/mm/yyyy'),'-') doc_fecha, nvl(a.doc_importe, 0) doc_importe, nvl(a.doc_divisa, ' ') doc_divisa, a.doc_otr_divisa, nvl(a.doc_doc_adicional,' ') doc_doc_adicional, a.doc_codigo_descrip cod2,";
    querys2 = querys2 + " a.doc_key_bol_ref doc_emb, a.doc_doc_adicional as ruta, a.doc_dep_date, a.doc_voy_nber, g.key_lin_nbr as lin_nbr, g.carbol_sline_nber as sline, a.doc_codigo_descrip as codes, a.doc_key_bol_ref, ";
    
    //querys2 = querys2 + " (SELECT  count(1) FROM mira.ai_doc_man_par p WHERE p.doc_reg_year =  a.doc_reg_year AND p.doc_key_cuo = a.doc_key_cuo AND p.doc_reg_nber = a.doc_reg_nber AND p.doc_key_bol_ref = a.doc_key_bol_ref AND p.doc_lst_ope= 'U' AND p.doc_num = 0 AND p.doc_parcial='P') as parcial, ";
    //querys2 = querys2 + " (SELECT  count(1) FROM mira.ai_doc_man_par p WHERE p.doc_reg_year =  a.doc_reg_year AND p.doc_key_cuo = a.doc_key_cuo AND p.doc_dep_date = a.doc_dep_date AND p.doc_key_bol_ref = a.doc_key_bol_ref AND p.doc_voy_nber = a.doc_voy_nber AND p.doc_lst_ope= 'U' AND p.doc_num = 0 AND p.doc_parcial='P') as parcial, ";//DESARROLLO
    //querys2 = querys2 + " (SELECT  count(1) FROM app_mira.ai_doc_man_par p WHERE p.doc_reg_year =  a.doc_reg_year AND p.doc_key_cuo = a.doc_key_cuo AND p.doc_dep_date = a.doc_dep_date AND p.doc_key_bol_ref = a.doc_key_bol_ref AND p.doc_voy_nber = a.doc_voy_nber AND p.doc_lst_ope= 'U' AND p.doc_num = 0 AND p.doc_parcial='P') as parcial, ";//PRODUCCION
    querys2 = querys2 + " (SELECT  count(1) FROM "+cs.getEsquema()+".ai_doc_man_par p WHERE p.doc_reg_year =  a.doc_reg_year AND p.doc_key_cuo = a.doc_key_cuo AND p.doc_dep_date = a.doc_dep_date AND p.doc_key_bol_ref = a.doc_key_bol_ref AND p.doc_voy_nber = a.doc_voy_nber AND p.doc_lst_ope= 'U' AND p.doc_num = 0 AND p.doc_parcial='P') as parcial, ";//CON VARIABLE DEL ESQUEMA
    
    //querys2 = querys2 + " (SELECT  f.file_tam as tamano FROM   mira.unfiletab f  WHERE   f.file_cod = 'MIC') AS peso_file  FROM mira.ai_doc_man a, ops$asy.unatdtab b, ops$asy.car_bol_gen g  ";   //DESARROLLO
    //querys2 = querys2 + " (SELECT  f.file_tam as tamano FROM   app_mira.unfiletab f  WHERE   f.file_cod = 'MIC') AS peso_file  FROM app_mira.ai_doc_man a, ops$asy.unatdtab b, ops$asy.car_bol_gen g  ";     //PRODUCCION
    querys2 = querys2 + " (SELECT  f.file_tam as tamano FROM   "+cs.getEsquema()+".unfiletab f  WHERE   f.file_cod = 'MIC') AS peso_file, ";
    
    querys2 = querys2 + " NVL(a.doc_doc_adicional,(SELECT u.uni_ruta  FROM "+cs.getEsquema()+".ununidadtab u WHERE TRUNC(SYSDATE) >= U.uni_ini AND NVL(u.uni_fin,TRUNC(SYSDATE))+1 > TRUNC(SYSDATE) AND u.uni_lst_ope = 'U')) as dir_car ";
    
    querys2 = querys2 + " FROM "+cs.getEsquema()+".ai_doc_man a, ops$asy.unatdtab b, ops$asy.car_bol_gen g  ";     //VARIABLE ESQUEMA
    querys2 = querys2 + " WHERE a.doc_num = 0 and a.doc_lst_ope = 'U' AND b.lst_ope (+) = 'U' and B.atd_cod (+) = a.doc_codigo_doc and trunc(a.doc_fecreg) between b.eea_dov(+) and nvl(b.eea_eov(+),sysdate)";
    querys2 = querys2 + " AND a.doc_reg_year = '"+ man.getCar_reg_year() + "' AND a.doc_key_cuo = '"+ man.getKey_cuo() + "' AND a.doc_reg_nber = "+ man.getCar_reg_nber();    
    querys2 = querys2 + " AND a.doc_voy_nber = g.key_voy_nber AND a.doc_key_cuo = g.key_cuo AND a.doc_dep_date = to_char(g.key_dep_date,'dd/mm/yyyy') AND a.doc_key_bol_ref = g.key_bol_ref ";
    querys2 = querys2 + " ORDER BY lin_nbr, sline";
    
    
    //Statement stlist = null;
    
    stlist = sql.cn.createStatement();
    rsdoc = stlist.executeQuery(querys2);

    if(! (rsdoc==null || !rsdoc.next()) ) {
      do{
        peso = rsdoc.getString("peso_file");
        peso_file = Integer.parseInt(peso);
        cs.setPeso_file(peso_file);
        
        cs.setUnidad(rsdoc.getString("dir_car").substring(0,rsdoc.getString("dir_car").lastIndexOf("/")+1));
        
        cod = rsdoc.getString("doc_codigo_doc");
          
         eli = "eliminar('"+rsdoc.getString("doc_dep_date")+"','"+rsdoc.getString("doc_key_cuo")+"','"+rsdoc.getString("doc_voy_nber")+"','"+rsdoc.getString("doc_codigo_doc")+"','"+rsdoc.getString("cod2")+"','"+rsdoc.getString("doc_emb")+"');";

      
      File folder = new File(rsdoc.getString("doc_doc_adicional"));
      if (folder.exists()){
        ruta1 = rsdoc.getString("ruta");
        arch_ori = arch_ori+ruta1+'|'; 
        //arch_des = arch_des + "/u03/oracle/user_projects/data/mira/comprimidos/"+rsdoc.getString("doc_key_cuo")+"/"+rsdoc.getString("doc_dep_date").split("/")[2]+"/"+rsdoc.getString("doc_dep_date").split("/")[1]+"/"+rsdoc.getString("doc_reg_year")+"-"+rsdoc.getString("doc_reg_nber")+"/"+rsdoc.getString("doc_reg_year")+"-"+rsdoc.getString("doc_reg_nber")+"-"+rsdoc.getString("doc_key_bol_ref")+"-"+rsdoc.getString("doc_codigo_doc")+"-"+rsdoc.getString("codes")+".pdf"+"|";
        arch_des = arch_des + rsdoc.getString("dir_car").substring(0,rsdoc.getString("dir_car").lastIndexOf("mira"))+"mira/comprimidos/"+rsdoc.getString("doc_key_cuo")+"/"+rsdoc.getString("doc_dep_date").split("/")[2]+"/"+rsdoc.getString("doc_dep_date").split("/")[1]+"/"+rsdoc.getString("doc_reg_year")+"-"+rsdoc.getString("doc_reg_nber")+"/"+rsdoc.getString("doc_reg_year")+"-"+rsdoc.getString("doc_reg_nber")+"-"+rsdoc.getString("doc_key_bol_ref")+"-"+rsdoc.getString("doc_codigo_doc")+"-"+rsdoc.getString("codes")+".pdf"+"|";
        //arch_zip = "/u03/oracle/user_projects/data/mira/comprimidos/"+rsdoc.getString("doc_key_cuo")+"/"+rsdoc.getString("doc_dep_date").split("/")[2]+"/"+rsdoc.getString("doc_dep_date").split("/")[1]+"/"+rsdoc.getString("doc_reg_year")+"-"+rsdoc.getString("doc_reg_nber")+"/"+rsdoc.getString("doc_reg_year")+"-"+rsdoc.getString("doc_reg_nber")+".zip";
        arch_zip = rsdoc.getString("dir_car").substring(0,rsdoc.getString("dir_car").lastIndexOf("mira"))+"mira/comprimidos/"+rsdoc.getString("doc_key_cuo")+"/"+rsdoc.getString("doc_dep_date").split("/")[2]+"/"+rsdoc.getString("doc_dep_date").split("/")[1]+"/"+rsdoc.getString("doc_reg_year")+"-"+rsdoc.getString("doc_reg_nber")+"/"+rsdoc.getString("doc_reg_year")+"-"+rsdoc.getString("doc_reg_nber")+".zip";
        //ruta = ruta.substring(ruta.indexOf("mira/"));
        //parametros = "javascript:ver_pdf('"+ruta+"')";
        parametros = "DescargaCarpetaMan.jsp?ruta="+ruta1;
        aux = "subirImagen('"+rsdoc.getString("doc_reg_year")+"','"+rsdoc.getString("doc_key_cuo")+"','"+rsdoc.getString("doc_reg_nber")+"','"+rsdoc.getString("doc_codigo_doc")+"','"+rsdoc.getString("doc_codigo_descrip")+
          "','"+rsdoc.getString("doc_emisor")+"','"+rsdoc.getString("doc_referencia")+"','"+rsdoc.getString("doc_fecha")+"','"+rsdoc.getString("doc_importe")+
          "','"+rsdoc.getString("doc_divisa")+"','"+rsdoc.getString("doc_otr_divisa")+"','"+rsdoc.getString("doc_doc_adicional")+"','"+"1"+"','"+rsdoc.getString("cod2")+"','"+rsdoc.getString("doc_emb")+"','"+ruta1+"');";
          
      }else{
        parametros = "javascript:alert('El archivo f&iacute;sico no existe o no se almacen&oacute; correctamente.')";
        /*aux = "subirImagen('"+rsdoc.getString("doc_dep_date")+"','"+rsdoc.getString("doc_key_cuo")+"','"+rsdoc.getString("doc_voy_nber")+"','"+rsdoc.getString("doc_codigo_doc")+"','"+rsdoc.getString("doc_codigo_descrip")+
          "','"+rsdoc.getString("doc_emisor")+"','"+rsdoc.getString("doc_referencia")+"','"+rsdoc.getString("doc_fecha")+"','"+rsdoc.getString("doc_importe")+
          "','"+rsdoc.getString("doc_divisa")+"','"+rsdoc.getString("doc_otr_divisa")+"','"+rsdoc.getString("doc_doc_adicional")+"','"+"0"+"','"+rsdoc.getString("cod2")+"','"+rsdoc.getString("doc_emb")+"','"+ruta+"');";*/
           aux = "subirImagen('"+rsdoc.getString("doc_reg_year")+"','"+rsdoc.getString("doc_key_cuo")+"','"+rsdoc.getString("doc_reg_nber")+"','"+rsdoc.getString("doc_codigo_doc")+"','"+rsdoc.getString("doc_codigo_descrip")+
          "','"+rsdoc.getString("doc_emisor")+"','"+rsdoc.getString("doc_referencia")+"','"+rsdoc.getString("doc_fecha")+"','"+rsdoc.getString("doc_importe")+
          "','"+rsdoc.getString("doc_divisa")+"','"+rsdoc.getString("doc_otr_divisa")+"','"+rsdoc.getString("doc_doc_adicional")+"','"+"1"+"','"+rsdoc.getString("cod2")+"','"+rsdoc.getString("doc_emb")+"','"+ruta1+"');";
          
      }
   %><tr>
   
      <td>
      <%
    if(rsdoc.getString("parcial").equals("0")){%>
      <a href="#sub"><span class="glyphicon glyphicon-pencil" style="font-size:10px"  onclick="<%= aux%>"/>Editar</a> &nbsp;
      <a href="#sub"><span class="glyphicon glyphicon-remove" style="font-size:10px" 
      onclick="if(confirm('\u00BFEst\u00e1 seguro de eliminar el registro?')){<%= eli%>}"/>Borrar</a> &nbsp;
      <%
      }else{%>
      <font color="#5d6d7e"> (Parcial)&nbsp;&nbsp;</font>
      
     <%} 
     if(!rsdoc.getString("doc_doc_adicional").equals(" ")){%>
      <a href="<%= parametros%>" id="idVer"><span class="glyphicon glyphicon-folder-open" style="font-size:10px" />Ver</a>
      <%}%>
      </td>
      <td><strong><%= rsdoc.getString("doc_codigo_doc")%></strong></td>
      <td><%= rsdoc.getString("doc_codigo_descrip")%></td>
      <td><%= rsdoc.getString("doc_emb")%></td>
      <td><%= rsdoc.getString("doc_referencia")%></td>
      <td style="text-align:center"><%= rsdoc.getString("doc_fecha")%></td>

    </tr>
    <%} while( rsdoc.next() ); }
    rsdoc = null;
     if( rsdoc != null )
        rsdoc.close();
    %>

  <%    if((arch_ori.length())-1> 0 || (arch_des.length())-1 > 0){
            arch_ori = arch_ori.substring(0, (arch_ori.length())-1);
            arch_des = arch_des.substring(0, (arch_des.length())-1);
        }
    
  %>
  <tr><th colspan="8">&nbsp;</th></tr>
  <tr>
    <td>
       <input class="btn btn-primary" type="button" id="Descargar" name="Descargar" value="Descargar Todos los Documentos" onclick="DescargaZip('3')"/>
        <html:hidden property="lista_origen" value="<%=arch_ori%>"/>
        <html:hidden property="lista_destino" value="<%=arch_des%>"/>
        <html:hidden property="arch_zip" value="<%=arch_zip%>"/>
    </td>
  </tr>
  
<%  if(parametros == ""){%>
    <tr><th colspan="8">No se encontraron resultados.</th></tr>
<%  }%>
  </tbody>

</table>
<% 
    if( cs.getDescarga_mic().equals("1"))
        { 
           String tramite = "DescargaCarpeta.jsp?zip=" + arch_zip+"&manif="+manif;
    %>
    <BR>
    <table width="100%">
    <tbody>
   <tr style="background:#90ee90">
      <td><center>
        <a href="<%= tramite%>" target="_blank" style="font-size:180%; color:#003366; text-decoration:none;"><b>Descargar Archivo ZIP: &nbsp; <%= manif  %></b></a>
      </center></td>
    </tr>
    </tbody>
    </table>
    <br>
        <%  cs.setDescarga_mic("0");
        }%>


<script language="JavaScript" type="text/javascript">
function finaliza(){
    if(confirm("Est\u00e1 seguro de terminar el registro?\nYa no podr\u00e1 digitalizar m\u00e1s documentos")){
        $("#frm_mani").submit();
    }

}
</script>
</html:form>
<%
          }
  catch( Exception e) {
    System.out.println( e.getMessage() );
  }
  finally{
    sql.getClose();

   if( statementdoc != null )
     statementdoc.close();
   if( stdiv != null )
     stdiv.close();
   if( stlist != null )
     stlist.close();
                
  } %>
<html:form action="grabCabMan" styleId="frm_mani" >
<html:hidden property="key_cuo" value="<%= man.getKey_cuo() %>"/>
<html:hidden property="car_reg_year" value="<%= man.getCar_reg_year() %>"/>
<html:hidden property="car_reg_nber" value="<%= man.getCar_reg_nber() %>"/>

<html:hidden property="car_voy_nber" value="<%= man.getCar_voy_nber() %>"/>
<html:hidden property="car_dep_date" value="<%= man.getCar_dep_date() %>"/>
<% String sta= cs.getRol().equals("SIDUNEA.TRANSPORTISTA")?"Finalizar Registro":"Confirmar Registro";%>
<center><input class="btn btn-primary" type="button" id="Fin" name="Fin" value="<%= sta%>" onclick="finaliza()"/></center><br>
</html:form>

