<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="Main.*, Transito.*"%>
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
<html>
    <head>
        <title>TRANSITOS</title>  
        <script language="JavaScript" type="text/javascript"> 
            function PopWindow1() {
                var rnd = Math.floor((Math.random() * 100) + 1);
                window.open('ds2295/ListaDS2295-1.jsp', 'Transitos', 'width=560,height=600,menubar=no,scrollbars=yes,toolbar=no,location=no,directories=no,resizable=no,top=0,left=0');
            }
            function PopWindow2() {
                var rnd = Math.floor((Math.random() * 100) + 1);
                window.open('ds2295/ListaDS2295-2.jsp', 'Transitos', 'width=560,height=600,menubar=no,scrollbars=yes,toolbar=no,location=no,directories=no,resizable=no,top=0,left=0');
            }
            function PopWindow3() {
                var rnd = Math.floor((Math.random() * 100) + 1);
                window.open('ds2295/ListaDS2295-3.jsp', 'Transitos', 'width=560,height=600,menubar=no,scrollbars=yes,toolbar=no,location=no,directories=no,resizable=no,top=0,left=0');
            }
            function PopWindow2600() {
                var rnd = Math.floor((Math.random() * 100) + 1);
                window.open('ds2295/ListaDS2600.jsp', 'Transitos', 'width=560,height=600,menubar=no,scrollbars=yes,toolbar=no,location=no,directories=no,resizable=no,top=0,left=0');
            }
            function PopWindow2752() {
                var rnd = Math.floor((Math.random() * 100) + 1);
                window.open('ds2295/ListaDS2752.jsp', 'Transitos', 'width=560,height=600,menubar=no,scrollbars=yes,toolbar=no,location=no,directories=no,resizable=no,top=0,left=0');
            }
            function PopWindow2751() {
                var rnd = Math.floor((Math.random() * 100) + 1);
                window.open('ds2295/ListaDS2751.jsp', 'Transitos', 'width=560,height=600,menubar=no,scrollbars=yes,toolbar=no,location=no,directories=no,resizable=no,top=0,left=0');
            }
            function PopWindow2657() {
                var rnd = Math.floor((Math.random() * 100) + 1);
                window.open('ds2295/ListaDS2657.jsp', 'Transitos', 'width=560,height=600,menubar=no,scrollbars=yes,toolbar=no,location=no,directories=no,resizable=no,top=0,left=0');
            }
            function PopWindow2865() {
                var rnd = Math.floor((Math.random() * 100) + 1);
                window.open('ds2295/ListaDS2865.jsp', 'Transitos', 'width=560,height=600,menubar=no,scrollbars=yes,toolbar=no,location=no,directories=no,resizable=no,top=0,left=0');
            }
            
        </script>
    </head>
    <body>
        <div class="s40" >
            <html:form action="/eregManifiestoAction" styleId="form1" styleClass="form" >   
                <br> 
                <br>
                <div style="display:none" id="panelautorizacion">
                    <div id="documentoview">
                    </div>
                    <input type="hidden" name="vkey_cuo" id="vkey_cuo"/>
                    <input type="hidden" name="vkey_voy_nber" id="vkey_voy_nber"/>
                    <input type="hidden" name="vkey_dep_date" id="vkey_dep_date"/>
                    <input type="hidden" name="vkey_bol_ref" id="vkey_bol_ref"/>
                    <input type="hidden" name="vfec_embarque" id="vfec_embarque"/>
                    <input type="hidden" name="vfec_d2657" id="vfec_d2657"/>
                    <input type="hidden" name="vfec_d2600" id="vfec_d2600"/>
                    <input type="hidden" name="vfec_d2751" id="vfec_d2751"/>
                    <input type="hidden" name="vfec_d2752" id="vfec_d2752"/>
                    <input type="hidden" name="vfec_d2865" id="vfec_d2865"/>
                  
                    <table  border="1" cellpadding="4" cellspacing="0" class="marco" id="e">
                        <thead>
                            <tr>     
                                <th width="10%">Aduana</th>       
                                <th width="10%">N&uacute;mero de Viaje</th> 
                                <th width="10%">Fecha de Salida</th>                          
                                <th width="10%">Documento de Embarque</th>
                            </tr>
                        </thead>
                        <tbody align="left">   
                            <tr>
                                <td>
                                    <input type="text" name="vdkey_cuo" readonly="true" id="vdkey_cuo" style="width:100%;border:none;background-color:white"/>
                                </td>
                                <td>
                                    <input type="text" name="vdkey_voy_nber" readonly="true" id="vdkey_voy_nber" style="width:100%;border:none;background-color:white"/>
                                </td>
                                <td>
                                    <input type="text" name="vdkey_dep_date" readonly="true"  id="vdkey_dep_date" style="width:100%;border:none;background-color:white"/>
                                </td>
                                <td>
                                    <input type="text" name="vdkey_bol_ref" readonly="true"  id="vdkey_bol_ref" style="width:100%;border:none;background-color:white"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <br>
                    <table  border="1" cellpadding="4" cellspacing="0" class="marco" id="e" width="100%">
                        <thead>
                            <tr>
                                <th width="10%">Decreto</th>        
                                <th width="40%">Descripci&oacute;n</th>       
                                <th width="40%">N&uacute;mero de Documento</th>
                            </tr>
                        </thead>
                        <tbody align="left">            
                            <tr>
                                <td>
                                    <input type="checkbox" onclick="cds2600()" name="chkDS2600"><a href="JavaScript:PopWindow2600()" >DS 2600</a></input>
                                </td>
                                <td>
                                    M&aacute;quinas de juego de azar, partes y piezas comprendidas en la Resoluci&oacute;n Ministerial N 207.
                                </td>
                                <td>
                                    <input type="text" name="valds2600" style="width:100%;display:none" maxlength="190"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" onclick="cds2657()" name="chkDS2657"><a href="JavaScript:PopWindow2657()" >DS 2657</a></input>
                                </td>
                                <td>
                                    Bebidas alcoh&oacute;licas comprendidas en el Anexo del DS 2657.
                                </td>
                                <td>
                                    <input type="text" name="valds2657" style="width:100%;display:none" maxlength="190"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" onclick="cds2751()" name="chkDS2751"><a href="JavaScript:PopWindow2751()" >DS 2751</a></input>
                                </td>
                                <td>
                                    Alimentos y bebidas (Aceites, az&uacute;cares, jugos de frutas u hortalizas, agua, bebidas no alcoh&oacute;licas, etc) comprendidas en el Anexo del DS 2751.
                                </td>
                                <td>
                                    <input type="text" name="valds2751" style="width:100%;display:none" maxlength="190"/>
                                </td>
                            </tr>
                            <% 
                            if(1>0){
                            %>
                                <tr>
                                    <td>
                                        <input type="checkbox"  onclick="cds2752()" name="chkDS2752"><a href="JavaScript:PopWindow2752()" >DS 2752</a></input>
                                    </td>
                                    <td>
                                        Prendas de vestir, complementos de vestir, art&iacute;culos textiles, zapatos, etc., comprendidos en el Anexo del DS 2752, con origen diferente a pa&iacute;ses de la CAN.
                                    </td>
                                    <td>
                                        <input type="text" name="valds2752" style="width:100%;display:none" maxlength="190"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox"  onclick="cds2752can()" name="chkDS2752CAN">DS 2752 CAN</input>
                                    </td>
                                    <td>
                                        Prendas de vestir, complementos de vestir, art&iacute;culos textiles, zapatos, etc., comprendidos en el Anexo del DS 2752 originarios de Per&uacute;, Colombia, Ecuador o Bolivia.
                                    </td>
                                    <td>
                                        <input type="text" name="valds2752CAN" style="width:100%;display:none" maxlength="190"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" onclick="cds2865()" name="chkDS2865"><a href="JavaScript:PopWindow2865()" >DS 2865</a></input>
                                    </td>
                                    <td>
                                        M&aacute;quinas para lavar ropa y m&aacute;quinas para limpieza en seco comprendidas en el Anexo II del DS 2865.
                                    </td>
                                    <td>
                                        <input type="text" name="valds2865" style="width:100%;display:none" maxlength="190"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" onclick="cninguno()" name="chkninguno">NINGUNO</input>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            <%
                            }
                            else
                            {
                            %>
                                <tr>
                                    <td>
                                        <input type="checkbox" onclick="cninguno()" name="chkninguno">NINGUNO</input>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                        <div name="oculto" style="display:none">
                                            <input type="checkbox"   onclick="cds2752()" name="chkDS2752">DS 2752</input>
                                            <input type="text" name="valds2752" style="width:100%;display:none" maxlength="0"/>
                                            <input type="checkbox"  onclick="cds2752can()" name="chkDS2752CAN">DS 2752 CAN</input>
                                            <input type="text" name="valds2752CAN" style="width:100%;display:none" maxlength="0"/>
                                        </div>
                                    </td>
                                </tr>
                            <%
                            }
                            %>
                            <tr>
                                <td align="center" colspan="3">  
                                    </br>
                                    Observaci&oacute;n Enmienda Autorizaciones Previas:</br>
                                    <input type="text" style="width:100%;margin:10px" name="vobservacion" maxlength="100"/>        
                                    </br>                                    
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="3">  
                                    <table>
                                        <tr>
                                            <td>
                                                <input type="button" value="&nbsp;Registrar Autorizaciones Previas&nbsp;" onclick="registrarautprev()"/>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>    
                                            <td>
                                                <input type="button" value="&nbsp;Cancelar&nbsp;" onclick="cancelarautorizacion()"/>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div style="display:block" id="panel2295">
                <%    
                    String refaduana= (String)request.getSession().getAttribute("refaduana");
                    String reffecha= (String)request.getSession().getAttribute("reffecha");
                    String refnber= (String)request.getSession().getAttribute("refnber");
                    String regaduana= (String)request.getSession().getAttribute("regaduana");
                    String reggestion= (String)request.getSession().getAttribute("reggestion");
                    String regnumero= (String)request.getSession().getAttribute("regnumero");
                    String tipo= (String)request.getSession().getAttribute("tipo");
                    String vrefnber= (String)request.getSession().getAttribute("varrefnber");
                    String vaduana= (String)request.getSession().getAttribute("varaduana");
                    String vdepdate= (String)request.getSession().getAttribute("vardepdate");
                    String vFila = request.getAttribute("pFila").toString()+""; 
                    String aduanaAutPrevia="";
                    if(tipo.equals("ref")){
                        aduanaAutPrevia = Util.VerificaAduanaAutPrevia(refaduana,reffecha,refnber,tipo);
                    }
                    if(tipo.equals("reg")){
                        aduanaAutPrevia = Util.VerificaAduanaAutPrevia(regaduana,reggestion,regnumero,tipo);
                    }                   
                    int cont=0;         
                    DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
                    Date date = new Date();
                    String key_cuo = " ";
                    String key_voy_nber = " ";
                    String key_dep_date = " ";
                    String key_bol_ref = " ";
                    String docemb_adm_destino = " ";
                    String docemb_fecha_embarque = " ";
                    String docemb_silista_rs1392015 = " ";
                    String docemb_si_pri_rs1692016 = " ";
                    String docemb_si_seg_rs1692016 = " ";
                    String docemb_otras_mercancias = " ";
                    String docemb_est_autorizado = " ";
                    String docemb_cantidad_partidas = " ";
                    String vdocemb_cantidad ="";
                    String fd2657="";
                    String fd2600="";
                    String fd2751="";
                    String fd2752="";
                    String decretos="";
                    
                    String ads2600="";
                    String adn2600="";
                    String ads2657="";
                    String adn2657="";
                    String ads2751="";
                    String adn2751="";
                    String ads2752="";
                    String adn2752="";
                    String ads2865="";
                    String adn2865="";
                    String ads2752can="";
                    String adsninguno="";
                    String obs_enmautprev="";
                    String fd2865="";
                    String obs2295="";
                    int i = 0;                    
                    Connection cn2 = null;
                    Statement st = null;
                    DataSource ds = null;
                    CallableStatement call = null;   
                    ResultSet rs = null;
                    try{    
                        InitialContext ic = new InitialContext();    
                        ds = (DataSource)ic.lookup("jdbc/asy_transito");
                        cn2 = (Connection)ds.getConnection();
                        call = cn2.prepareCall("{ ? = call pkg_ds2295.c_list_docembq (?,?,?,?,?,?,?)}");
                        call.registerOutParameter(1, OracleTypes.CURSOR); 
                        call.setString(2, refnber);
                        call.setString(3, refaduana);
                        call.setString(4, reffecha);
                        call.setString(5, reggestion);
                        call.setString(6, regaduana);
                        call.setString(7, regnumero);
                        call.setString(8, tipo);
                        call.execute();
                        rs = (ResultSet) call.getObject(1);
                        %>
                        </br> 
                        </br>
                        <table>
                        <input type="hidden" name="aduautpreviaext" id="aduautpreviaext" value="<%=aduanaAutPrevia%>"/>
                        <% 
                        if(tipo.equals("ref")){ 
                        %>
                            <tr>
                                <td>
                                    <font style="color: #003366;"><%="<strong>N&uacute;mero de Manifiesto(Referencia):</strong> "+ reffecha+" "+refaduana+" "+refnber%></font>
                                </td>
                            </tr>
                        <%
                        }
                        %>  
                        <% 
                        if(tipo.equals("reg")){ 
                        %>
                            <tr>
                                <td>
                                    <font style="color: #003366;"><%="<strong>N&uacute;mero de Manifiesto: </strong> "+reggestion+" "+regaduana+" "+regnumero%></font>
                                </td>
                            </tr>
                        <%
                        }
                        %>    
                        </table>  
                        </br>
                        
                        <table border="1" cellpadding="4" cellspacing="0" class="marco" id="e">
                            <thead>
                                <tr>     
                                    <th width="10%" rowspan="2">Aduana destino</th>
                                    <th width="10%" rowspan="2">Documento Embarque</th>
                                    <th width="10%" rowspan="2">Fecha Embarque<p/>[dd/mm/aaaa]</th>
                                    <%
                                    if(aduanaAutPrevia.equals("0")){
                                    %>
                                    <th width="15%" colspan="5">Mercanc&iacute;as transportadas corresponden a:</th>
                                    <%
                                    }
                                    %>
                                    <th width="10%" rowspan="2">Observaci&oacute;n Enmienda D.S. 2295</th>
                                    <th width="10%" rowspan="2">Opci&oacute;n</th>
                                    <th width="10%" rowspan="2">Autorizaciones Previas</th> 
                                    <th width="10%" rowspan="2">Observaci&oacute;n Enmienda Autorizacines Previas</th>
                                </tr>
                                <%
                                if(aduanaAutPrevia.equals("0")){
                                %>
                                <tr>
                                    <th width="15%"><a style="color:white" href="JavaScript:PopWindow1()" >Lista de la RM Nro. 139/2015</a></th>
                                    <th width="15%"><a style="color:white" href="JavaScript:PopWindow2()" >Resuelve Primero de la RM Nro. 16/2016</a></th>
                                    <th width="10%"><a style="color:white" href="JavaScript:PopWindow3()" >Resuelve Segundo de la RM Nro. 16/2016</a></th>
                                    <th width="10%">Otras Mercanc&iacute;as </th>
                                    <th width="10%">Cantidad de subpartidas arancelarias del Documento de Embarque es mayor a 3</th>
                                </tr>
                                <%
                                }
                                %>
                            </thead>
                            <tbody align="left">            
                            <%
                            if( !(rs == null || !rs.next() )){
                                do{
                                    i++;                                   
                                    key_cuo = rs.getString(1).toString();
                                    key_voy_nber = rs.getString(2).toString();
                                    key_dep_date = rs.getString(3).toString();
                                    key_bol_ref = rs.getString(4).toString();
                                    try{
                                        docemb_adm_destino = rs.getString(5).toString();
                                    }catch(Exception exi){
                                        docemb_adm_destino = "";
                                    }          
                                    try{
                                        docemb_fecha_embarque = rs.getString(6).toString();
                                        if(aduanaAutPrevia.equals("0")){
                                            docemb_silista_rs1392015 = rs.getString(7).toString();
                                            docemb_si_pri_rs1692016 = rs.getString(8).toString();
                                            docemb_si_seg_rs1692016 = rs.getString(9).toString();
                                            docemb_otras_mercancias = rs.getString(10).toString();
                                            docemb_cantidad_partidas = rs.getString(12).toString();
                                        }
                                        fd2751 = rs.getString(15).toString();
                                        fd2752 = rs.getString(17).toString();
                                        fd2657 = rs.getString(19).toString();
                                        fd2600 = rs.getString(21).toString();
                                        decretos = rs.getString(22).toString();
                                        ads2600= rs.getString(23).toString();
                                        adn2600= rs.getString(24).toString();
                                        ads2657= rs.getString(25).toString();
                                        adn2657= rs.getString(26).toString();
                                        ads2751= rs.getString(27).toString();
                                        adn2751= rs.getString(28).toString();
                                        ads2752= rs.getString(29).toString();
                                        adn2752= rs.getString(30).toString();
                                        ads2752can= rs.getString(31).toString();
                                        adsninguno= rs.getString(32).toString();
                                        obs_enmautprev = rs.getString(33).toString();
                                        fd2865 = rs.getString(35).toString(); 
                                        ads2865= rs.getString(36).toString();
                                        adn2865= rs.getString(37).toString();
                                        //docemb_est_autorizado = rs.getString(11).toString();
                                        //vdocemb_cantidad = rs.getString(12).toString();
                                        obs2295 = rs.getString(38).toString();
                                    }
                                    catch(Exception exi){
                                        //docemb_adm_destino = "";
                                        docemb_fecha_embarque = "";
                                        docemb_silista_rs1392015 = "";
                                        docemb_si_pri_rs1692016 = "";
                                        docemb_si_seg_rs1692016 = "";
                                        docemb_otras_mercancias = "";
                                        vdocemb_cantidad = "";
                                        docemb_cantidad_partidas = "";
                                    }
                                    cont++;
                                    String edita="return edita(3,"+cont+")";   
                                    String acepta="return acepta(4,'"+docemb_fecha_embarque+"', '"+key_cuo+"', '"+key_voy_nber+"','"+key_dep_date+"', '"+key_bol_ref+"'  )";
                                    String registraaut="return registraaut(5,'"+docemb_fecha_embarque+"', '"+key_cuo+"', '"+key_voy_nber+"','"+key_dep_date+"', '"+key_bol_ref+"', '"+docemb_fecha_embarque+"', '"+fd2751+"' , '"+fd2752+"', '"+fd2657+"' , '"+fd2600+"',    '"+ads2600+"', '"+adn2600+"'  , '"+ads2657+"', '"+adn2657+"', '"+ads2751+"', '"+adn2751+"', '"+ads2752+"', '"+adn2752+"', '"+ads2752can+"', '"+adsninguno+"', '"+ads2865+"', '"+adn2865+"' , '"+fd2865+"' )";
                                    %>
                                    <tr>
                                    <%
                                    if(Integer.parseInt(vFila)==cont){
                                    %>
                                        <td><%=docemb_adm_destino%></td>
                                        <td><%=key_bol_ref%></td>
                                        <td width="10%" align="center">
                                            <html:text property="docemb_fecha_embarque" disabled="true" styleId="docemb_fecha_embarque" size="11" maxlength="10" value="<%=docemb_fecha_embarque%>" title="Fecha Documento de Embarque"   />  
                                        </td> 
                                        <%
                                        if(aduanaAutPrevia.equals("0")){
                                        %>
                                        <td width="10%" align="center">
                                            <html:select property="docemb_silista_rs1392015" styleId="docemb_silista_rs1392015" value="<%=docemb_silista_rs1392015%>" > <html:option value="">Seleccione</html:option><html:option value="SI">SI</html:option> <html:option value="NO">NO</html:option></html:select>  
                                        </td>            
                                        <td width="10%" align="center">
                                            <html:select property="docemb_si_pri_rs1692016" styleId="docemb_si_pri_rs1692016" value="<%=docemb_si_pri_rs1692016%>"> <html:option value="">Seleccione</html:option><html:option value="SI">SI</html:option> <html:option value="NO">NO</html:option></html:select>  
                                        </td>            
                                        <td width="10%" align="center">
                                            <html:select property="docemb_si_seg_rs1692016" styleId="docemb_si_seg_rs1692016" value="<%=docemb_si_seg_rs1692016%>"> <html:option value="">Seleccione</html:option><html:option value="SI">SI</html:option> <html:option value="NO">NO</html:option></html:select>  
                                        </td>            
                                        <td width="10%" align="center">
                                            <html:select property="docemb_otras_mercancias" styleId="docemb_otras_mercancias" value="<%=docemb_otras_mercancias%>"> <html:option value="">Seleccione</html:option><html:option value="SI">SI</html:option> <html:option value="NO">NO</html:option></html:select>  
                                        </td>     
                                        <td width="10%" align="center">
                                            <html:select property="docemb_cantidad_partidas" styleId="docemb_cantidad_partidas" value="<%=docemb_cantidad_partidas%>"> <html:option value="">Seleccione</html:option><html:option value="SI">SI</html:option> <html:option value="NO">NO</html:option></html:select>  
                                        </td>   
                                        <td width="10%" align="center">
                                            <html:text property="vobs2295" styleId="vobs2295" maxlength="100" value="" title="Observaci&oacute;n Enmienda D.S. 2295"   />  
                                        </td> 
                                        <%
                                        }
                                        %>
                                        <td>    
                                            <html:submit property="boton" styleClass="btnStyleOut" onmouseout="this.className='btnStyleOut'" onmouseover="this.className='btnStyleOver'" value="&nbsp;Aceptar&nbsp;" onclick="<%=acepta%>"/>
                                            <html:submit property="boton" styleClass="btnStyleOut" onmouseout="this.className='btnStyleOut'" onmouseover="this.className='btnStyleOver'" value="Cancelar" onclick="opcion.value=1;"/>                                        
                                        </td>
                                        <td width="10%" align="center">
                                            &nbsp;
                                        </td>
                                    <%
                                    }
                                    else{
                                    %>    
                                        <td>
                                            <%=docemb_adm_destino%>
                                        </td>
                                        <td>
                                            <%=key_bol_ref%>
                                        </td>  
                                        <td align="center">
                                            <%=docemb_fecha_embarque%>
                                        </td>  
                                        <%
                                        if(aduanaAutPrevia.equals("0")){
                                        %>
                                        <td align="center">
                                            <%=docemb_silista_rs1392015%>
                                        </td>  
                                        <td align="center">
                                            <%=docemb_si_pri_rs1692016%>
                                        </td>  
                                        <td align="center">
                                            <%=docemb_si_seg_rs1692016%>
                                        </td>  
                                        <td align="center">
                                            <%=docemb_otras_mercancias%>
                                        </td>
                                        <td align="center">
                                            <%=docemb_cantidad_partidas%>
                                        </td>
                                        <td align="left">
                                            <%=obs2295%>    
                                        </td>
                                        <%
                                        }
                                        %>
                                        <td align="center">
                                        <%
                                        /*if(!docemb_est_autorizado.equals("SA")){*/
                                        %>
                                            <html:submit property="boton" styleClass="btnStyleOut" onmouseout="this.className='btnStyleOut'" onmouseover="this.className='btnStyleOver'" value="Enmendar D.S. 2295" onclick="<%=edita%>"/>
                                        <%
                                        /*}*/
                                        %>  
                                        </td>
                                        <td align="center">
                                            <%
                                            if(rs.getString(13).toString().equals("SIN 2295")){
                                            %>
                                                Debe registrar el DS 2295
                                            <%
                                            }
                                            else{            
                                                if(rs.getString(13).toString().equals("SIN DATOS")){
                                            %>
                                                <input type="button" value="&nbsp;Autorizaci&oacute;n Previa&nbsp;" onclick="<%=registraaut%>"/> 
                                               
                                            <%
                                                    }
                                                    else {
                                                    %>
                                                        <input type="button" value="Enmendar Aut. Previa" onclick="<%=registraaut%>"/>
                                                        <br>
                                                        Autorizaciones Previas Registradas:&nbsp; 
                                                        <br>
                                                        <%=decretos%>
                                                    <%
                                                    }
                                                }
                                                %>
                                            </td>
                                            <td align="center">
                                                <%=obs_enmautprev%>
                                            </td>
                                            <%
                                            }
                                            %>            
                                        </tr>
                                        <%   
                                }while(rs.next());
                            }
                            %>
                            <% 
                            if (i == 0){
                            %>
                                <tr>
                                    <td align="center" colspan="7" style="text-align:center">No hay registros.</td>
                                </tr>
                            <%
                            }
                            %>       
                            </tbody>
                        </table>  
                        <%
                        String enviaaut= "recibe('"+vdepdate+"','"+vaduana+"','"+vrefnber+"',8)";
                        %>
                        <table>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <%  
                            /*
                            <tr>
                                <td width="10%">Cantidad de subpartidas arancelarias en el manifiesto mayor a 3: <html:select property="docemb_cantidad" styleId="docemb_cantidad"> <html:option value="">Seleccione</html:option><html:option value="SI">SI</html:option> <html:option value="NO">NO</html:option></html:select>  </td>
                            </tr>
                            */
                            %>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                           
                        </table>
                        <html:hidden property="fila" styleId="fila"/>
                        <html:hidden property="opcion" styleId="opcion"/>
                        <html:hidden property="key_cuo" styleId="key_cuo"/>
                        <html:hidden property="key_voy_nber" styleId="key_voy_nber"/>
                        <html:hidden property="key_dep_date" styleId="key_dep_date"/>
                        <html:hidden property="key_bol_ref" styleId="key_bol_ref"/>
                        <html:hidden property="refaduanasel" styleId="refaduanasel"/> 
                        <html:hidden property="reffechaSalida" styleId="reffechaSalida"/>
                        <html:hidden property="refnroViaje" styleId="refnroViaje"/>
                        <html:hidden property="regaduanasel" styleId="regaduanasel"/>
                        <html:hidden property="reggestion" styleId="reggestion"/>
                        <html:hidden property="regnroRegistro" styleId="regnroRegistro"/>
                        <html:hidden property="tipo" styleId="tipo"/>
                        <%
                    }
                    catch(SQLException ee){
                        System.out.println("Error: "+ee);        
                    }
                    catch( Exception e ) {
                        e.printStackTrace();
                    }    
                    finally {
                        if (! (call == null))
                            call.close();
                        if (! (rs == null))
                            rs.close();
                        if (cn2 != null) {
                            cn2.close();
                        }
                        call = null;
                        rs = null;
                        ds = null;
                        cn2 = null;
                    }
                    %>
                </div>
            </html:form>
        </div>    
    </body>
</html>
<script language="JavaScript" type="text/javascript" >
    function registrarautprev() {
        f = document.forms["eBusqManifiestoForm"];
        var Mensaje = "";
        var marca = "0";
        if (f.chkDS2600.checked) {
            marca = "1";
            if (f.valds2600.style.display == "block")
                if (f.valds2600.value == "")
                    Mensaje = Mensaje + "'N\372mero de Documento de Autorizaci\363n del DS 2600' es obligatorio\n";
        }
        if (f.chkDS2657.checked) {
            marca = "1";
            if (f.valds2657.style.display == "block")
                if (f.valds2657.value == "")
                    Mensaje = Mensaje + "'N\372mero de Documento de Autorizaci\363n del DS 2657' es obligatorio\n";
        }
        if (f.chkDS2751.checked) {
            marca = "1";
            if (f.valds2751.style.display == "block")
                if (f.valds2751.value == "")
                    Mensaje = Mensaje + "'N\372mero de Documento de Autorizaci\363n del DS 2751' es obligatorio\n";
        }
        if (f.chkDS2752.checked) {
            marca = "1";
            if (f.valds2752.style.display == "block")
                if (f.valds2752.value == "")
                    Mensaje = Mensaje + "'N\372mero de Documento de Autorizaci\363n del DS 2752' es obligatorio\n";
        }
        if (f.chkDS2752CAN.checked) {
            marca = "1";
            if (f.valds2752CAN.style.display == "block")
                if (f.valds2752CAN.value == "")
                    Mensaje = Mensaje + "'N\372mero de Documento de Autorizaci\363n del DS 2752 CAN' es obligatorio\n";
        }
        if (f.chkDS2865.checked) {
            marca = "1";
            if (f.valds2865.style.display == "block")
                if (f.valds2865.value == "")
                    Mensaje = Mensaje + "'N\372mero de Documento de Autorizaci\363n del DS 2865' es obligatorio\n";
        }
        if (f.chkninguno.checked == false) {
            if (marca == "0")
                Mensaje = Mensaje + "Debe el Seleccionar por lo menos una opci\363n del listado\n";
        }
        if (f.vobservacion.value == "") {
                    Mensaje = Mensaje + "'Observaci\u00f3n Enmienda D.S. 2295' es obligatorio\n";
        }
        
        if (Mensaje == "") {
            if (confirm('Est\u00e1 seguro de continuar, no podr\u00e1 ingresar nuevamente a esta opci\u00f3n?')) {
                f.opcion.value = "25";
                f.submit();
            }
            else 
                return false;
        }
        else {
            alert(Mensaje);
            return false;
        }
    };
    function edita(opcion, fila) {
        f = document.forms["eBusqManifiestoForm"];
        if (opcion == 3) {
            f.opcion.value = opcion;
            f.fila.value = fila;
            return true;
        }
        else if (opcion == 6) {
            f.opcion.value = opcion;
            f.fila.value = fila;
            return true;
        }
        else {
            return false;
        }
    }
    function acepta(opcion, fila, key_cuo, key_voy_nber, key_dep_date, key_bol_ref) {
        f = document.forms[1];
        var Mensaje = "";
        var fecha2 = new Date();
        var ano = fecha2.getFullYear();
        var mes = (fecha2.getMonth() < 9) ? ("0" + (fecha2.getMonth() + 1)) : (fecha2.getMonth() + 1);
        var dia = (fecha2.getDate() <= 9) ? ("0" + fecha2.getDate()) : (fecha2.getDate());
        var fActual2 = dia + "/" + mes + "/" + ano;
        var fActual = ano + "" + mes + "" + dia;
        if (opcion == 4) {
            if (!foFecha(f.docemb_fecha_embarque.value)) {
                Mensaje = Mensaje + "'Fecha embarque' es obligatorio formato dd/mm/yyyy \n";
            }
            else {
                var ffin = f.docemb_fecha_embarque.value.substring(6, 10) + f.docemb_fecha_embarque.value.substring(3, 5) + f.docemb_fecha_embarque.value.substring(0, 2);
                if (fActual < ffin) {
                    Mensaje = Mensaje + "'Fecha y Hora de Llegada' no puede ser superior a la fecha de Hoy: " + fActual2 + "\n";
                }
            }
            
            if (f.aduautpreviaext.value == 0){            
                if (!fTrim(f.docemb_silista_rs1392015.value))
                    Mensaje = Mensaje + "'Lista de la RM Nro. 139/2015' es obligatorio\n";
                if (!fTrim(f.docemb_si_pri_rs1692016.value))
                    Mensaje = Mensaje + "'Resuelve Primero de la RM Nro. 16/2016' es obligatorio\n";
                if (!fTrim(f.docemb_si_seg_rs1692016.value))
                    Mensaje = Mensaje + "'Resuelve Segundo de la RM Nro. 16/2016' es obligatorio\n";
                if (!fTrim(f.docemb_otras_mercancias.value))
                    Mensaje = Mensaje + "'Otras Mercanc\u00edas ' es obligatorio\n";
                /*if(!fTrim(f.docemb_cantidad.value))
                Mensaje = Mensaje+"'Cantidad de subpartidas arancelarias mayor a 3' es obligatorio\n";*/
                if (!fTrim(f.docemb_cantidad_partidas.value))
                    Mensaje = Mensaje + "'Cantidad de subpartidas arancelarias mayor a 3' es obligatorio\n";
                if (f.docemb_silista_rs1392015.value == 'NO' && f.docemb_si_pri_rs1692016.value == 'NO' && f.docemb_si_seg_rs1692016.value == 'NO' && f.docemb_otras_mercancias.value == 'NO')
                    Mensaje = Mensaje + "Al menos una lista debe seleccionarse con la opci\u00f3n 'SI' obligatoriamente\n";
                if (!fTrim(f.vobs2295.value))
                    Mensaje = Mensaje + "'Observaci\u00f3n Enmienda D.S. 2295' es obligatorio\n";
            }
            if (Mensaje == "") {
                Mensaje = '';
            }
            else {
                alert(Mensaje);
                return false;
            }
            f.opcion.value = opcion;
            f.key_cuo.value = key_cuo;
            f.key_voy_nber.value = key_voy_nber;
            f.key_dep_date.value = key_dep_date;
            f.key_bol_ref.value = key_bol_ref;
            f.fila.value = fila;
            return true;
        }
        else if (opcion == 6) {
            f.opcion.value = opcion;
            f.fila.value = fila;
            return true;
        }
        else {
            return false;
        }
    }
    function registraaut(opcion, fila, key_cuo, key_voy_nber, key_dep_date, key_bol_ref, fec_embarque, fd2751, fd2752, fd2657, fd2600, ads2600, adn2600 ,ads2657,adn2657,ads2751,adn2751,ads2752,adn2752,ads2752can,adsninguno,ads2865,adn2865,fd2865) {
        f = document.forms[1];
        document.getElementById('panelautorizacion').style.display = 'block';
        document.getElementById('panel2295').style.display = 'none';
        f.opcion.value = opcion;
        f.vkey_cuo.value = key_cuo;
        f.vkey_voy_nber.value = key_voy_nber;
        f.vkey_dep_date.value = key_dep_date;
        f.vkey_bol_ref.value = key_bol_ref;
        f.vfec_embarque.value = fec_embarque;
        f.vfec_d2751.value = fd2751;
        f.vfec_d2752.value = fd2752;
        f.vfec_d2657.value = fd2657;
        f.vfec_d2600.value = fd2600;
        f.vfec_d2865.value = fd2865;
        f.vdkey_cuo.value = key_cuo;
        f.vdkey_voy_nber.value = key_voy_nber;
        f.vdkey_dep_date.value = key_dep_date;
        f.vdkey_bol_ref.value = key_bol_ref;
        var fembarque = f.vfec_embarque.value.substring(6, 10) + f.vfec_embarque.value.substring(3, 5) + f.vfec_embarque.value.substring(0, 2);
        var fec2600 = f.vfec_d2600.value.substring(6, 10) + f.vfec_d2600.value.substring(3, 5) + f.vfec_d2600.value.substring(0, 2);
        var fec2657 = f.vfec_d2657.value.substring(6, 10) + f.vfec_d2657.value.substring(3, 5) + f.vfec_d2657.value.substring(0, 2);
        var fec2751 = f.vfec_d2751.value.substring(6, 10) + f.vfec_d2751.value.substring(3, 5) + f.vfec_d2751.value.substring(0, 2);
        var fec2752 = f.vfec_d2752.value.substring(6, 10) + f.vfec_d2752.value.substring(3, 5) + f.vfec_d2752.value.substring(0, 2);
        var fec2865 = f.vfec_d2865.value.substring(6, 10) + f.vfec_d2865.value.substring(3, 5) + f.vfec_d2865.value.substring(0, 2);
        
        if(ads2600 == '-'){
            f.chkDS2600.checked = false;
            f.valds2600.value = "";
            f.valds2600.style.display = "none";
        }
        else
        {
            f.chkDS2600.checked = true;
            if (fembarque >= fec2600) {
                f.valds2600.style.display = "block";
                f.valds2600.value = adn2600;
            }else{
                f.valds2600.style.display = "none";
            }
        }
        
        if(ads2657 == '-'){
            f.chkDS2657.checked = false;
            f.valds2657.value = "";
            f.valds2657.style.display = "none";
        }
        else
        {
            f.chkDS2657.checked = true;
            if (fembarque >= fec2657) {
                f.valds2657.style.display = "block";
                f.valds2657.value = adn2657;
            }else{
                f.valds2657.style.display = "none";
            }
        }
        
        if(ads2751 == '-'){
            f.chkDS2751.checked = false;
            f.valds2751.value = "";
            f.valds2751.style.display = "none";
        }
        else
        {
            f.chkDS2751.checked = true;
            if (fembarque >= fec2751) {
                f.valds2751.style.display = "block";
                f.valds2751.value = adn2751;
            }else{
                f.valds2751.style.display = "none";
            }
        }
        
        if(ads2752 == '-'){
            f.chkDS2752.checked = false;
            f.valds2752.value = "";
            f.valds2752.style.display = "none";
        }
        else
        {
            f.chkDS2752.checked = true;
            if (fembarque >= fec2752) {
                f.valds2752.style.display = "block";
                f.valds2752.value = adn2752;
            }else{
                f.valds2752.style.display = "none";
            }
        }
        
        if(ads2865 == '-'){
            f.chkDS2865.checked = false;
            f.valds2865.value = "";
            f.valds2865.style.display = "none";
        }
        else
        {
            f.chkDS2865.checked = true;
            if (fembarque >= fec2865) {
                f.valds2865.style.display = "block";
                f.valds2865.value = adn2865;
            }else{
                f.valds2865.style.display = "none";
            }
        }
        
        if(ads2752can == '-'){
            f.chkDS2752CAN.checked = false;            
        }
        else
        {
            f.chkDS2752CAN.checked = true;
        }
        
        if(adsninguno == '-'){
            f.chkninguno.checked = false;
        }
        else
        {
            f.chkninguno.checked = true;
            f.chkDS2600.checked = false;
            f.valds2600.value = "";
            f.valds2600.style.display = "none";
            f.chkDS2657.checked = false;
            f.valds2657.value = "";
            f.valds2657.style.display = "none";
            f.chkDS2751.checked = false;
            f.valds2751.value = "";
            f.valds2751.style.display = "none";
            f.chkDS2752.checked = false;
            f.valds2752.value = "";
            f.valds2752.style.display = "none";
            f.chkDS2865.checked = false;
            f.valds2865.value = "";
            f.valds2865.style.display = "none";
            f.chkDS2752CAN.checked = false;
            f.valds2752CAN.value = "";
            f.valds2752CAN.style.display = "none";
        }
        
        
    }
    function cancelarautorizacion() {
        f = document.forms[1];
        document.getElementById('panelautorizacion').style.display = 'none';
        document.getElementById('panel2295').style.display = 'block';
        f.opcion.value = "";
        f.vkey_cuo.value = "";
        f.vkey_voy_nber.value = "";
        f.vkey_dep_date.value = "";
        f.vkey_bol_ref.value = "";
        f.vdkey_cuo.value = "";
        f.vdkey_voy_nber.value = "";
        f.vdkey_dep_date.value = "";
        f.vdkey_bol_ref.value = "";
        f.chkDS2600.checked = false;
        f.valds2600.value = "";
        f.valds2600.style.display = "none";
        f.chkDS2657.checked = false;
        f.valds2657.value = "";
        f.valds2657.style.display = "none";
        f.chkDS2751.checked = false;
        f.valds2751.value = "";
        f.valds2751.style.display = "none";
        f.chkDS2752.checked = false;
        f.valds2752.value = "";
        f.valds2752.style.display = "none";
        f.chkDS2752CAN.checked = false;
        f.valds2752CAN.value = "";
        f.valds2752CAN.style.display = "none";
        f.chkDS2865.checked = false;
        f.valds2865.value = "";
        f.valds2865.style.display = "none";
        f.chkninguno.checked = false;
    };
    function cds2600() {
        var fecha2 = new Date();
        var ano = fecha2.getFullYear();
        var mes = (fecha2.getMonth() < 9) ? ("0" + (fecha2.getMonth() + 1)) : (fecha2.getMonth() + 1);
        var dia = (fecha2.getDate() <= 9) ? ("0" + fecha2.getDate()) : (fecha2.getDate());
        var fActual = ano + mes + dia;
        var fcontrol = '20160728';
        f = document.forms[1];
        var fembarque = f.vfec_embarque.value.substring(6, 10) + f.vfec_embarque.value.substring(3, 5) + f.vfec_embarque.value.substring(0, 2);
        var fd2 = f.vfec_d2600.value.substring(6, 10) + f.vfec_d2600.value.substring(3, 5) + f.vfec_d2600.value.substring(0, 2);
        if (f.chkDS2600.checked) {
            if (fembarque >= fd2) {
                f.valds2600.style.display = "block";
            }
            f.chkninguno.checked = false;
        }
        else {
            f.valds2600.value = "";
            f.valds2600.style.display = "none";
        }
    };
    function cds2657() {
        var fecha2 = new Date();
        var ano = fecha2.getFullYear();
        var mes = (fecha2.getMonth() < 9) ? ("0" + (fecha2.getMonth() + 1)) : (fecha2.getMonth() + 1);
        var dia = (fecha2.getDate() <= 9) ? ("0" + fecha2.getDate()) : (fecha2.getDate());
        var fActual = ano + mes + dia;
        var fcontrol = '20160728';
        f = document.forms[1];
        var fembarque = f.vfec_embarque.value.substring(6, 10) + f.vfec_embarque.value.substring(3, 5) + f.vfec_embarque.value.substring(0, 2);
        var fd2 = f.vfec_d2657.value.substring(6, 10) + f.vfec_d2657.value.substring(3, 5) + f.vfec_d2657.value.substring(0, 2);
        if (f.chkDS2657.checked) {
            if (fembarque >= fd2) {
                f.valds2657.style.display = "block";
            }
            f.chkninguno.checked = false;
        }
        else {
            f.valds2657.value = "";
            f.valds2657.style.display = "none";
        }
    };
    function cds2751() {
        var fecha2 = new Date();
        var ano = fecha2.getFullYear();
        var mes = (fecha2.getMonth() < 9) ? ("0" + (fecha2.getMonth() + 1)) : (fecha2.getMonth() + 1);
        var dia = (fecha2.getDate() <= 9) ? ("0" + fecha2.getDate()) : (fecha2.getDate());
        var fActual = ano + mes + dia;
        var fcontrol = '20160615';
        f = document.forms[1];
        var fembarque = f.vfec_embarque.value.substring(6, 10) + f.vfec_embarque.value.substring(3, 5) + f.vfec_embarque.value.substring(0, 2);
        var fd1 = f.vfec_d2751.value.substring(6, 10) + f.vfec_d2751.value.substring(3, 5) + f.vfec_d2751.value.substring(0, 2);
        if (f.chkDS2751.checked) {
            if (fembarque >= fd1) {
                f.valds2751.style.display = "block";
            }
            f.chkninguno.checked = false;
        }
        else {
            f.valds2751.value = "";
            f.valds2751.style.display = "none";
        }
    };
    function cds2752() {
        var fecha2 = new Date();
        var ano = fecha2.getFullYear();
        var mes = (fecha2.getMonth() < 9) ? ("0" + (fecha2.getMonth() + 1)) : (fecha2.getMonth() + 1);
        var dia = (fecha2.getDate() <= 9) ? ("0" + fecha2.getDate()) : (fecha2.getDate());
        var fActual = ano + mes + dia;
        var fcontrol = '20160728';
        f = document.forms[1];
        var fembarque = f.vfec_embarque.value.substring(6, 10) + f.vfec_embarque.value.substring(3, 5) + f.vfec_embarque.value.substring(0, 2);
        var fd2 = f.vfec_d2752.value.substring(6, 10) + f.vfec_d2752.value.substring(3, 5) + f.vfec_d2752.value.substring(0, 2);
        if (f.chkDS2752.checked) {
            if (fembarque >= fd2) {
                f.valds2752.style.display = "block";
            }
            f.chkninguno.checked = false;
        }
        else {
            f.valds2752.value = "";
            f.valds2752.style.display = "none";
        }
    };
    function cds2752can() {
        var fecha2 = new Date();
        var ano = fecha2.getFullYear();
        var mes = (fecha2.getMonth() < 9) ? ("0" + (fecha2.getMonth() + 1)) : (fecha2.getMonth() + 1);
        var dia = (fecha2.getDate() <= 9) ? ("0" + fecha2.getDate()) : (fecha2.getDate());
        var fActual = ano + mes + dia;
        var fcontrol = '20160728';
        if (f.chkDS2752CAN.checked) {
            //    if( fActual >= fcontrol ){    
            //        f.valds2752CAN.style.display = "block";
            //    }
            f.chkninguno.checked = false;
        }
        else {
            f.valds2752CAN.value = "";
            //    f.valds2752CAN.style.display = "none";
        }
    };
    function cds2865() {
        var fecha2 = new Date();
        var ano = fecha2.getFullYear();
        var mes = (fecha2.getMonth() < 9) ? ("0" + (fecha2.getMonth() + 1)) : (fecha2.getMonth() + 1);
        var dia = (fecha2.getDate() <= 9) ? ("0" + fecha2.getDate()) : (fecha2.getDate());
        f = document.forms[1];
        var fembarque = f.vfec_embarque.value.substring(6, 10) + f.vfec_embarque.value.substring(3, 5) + f.vfec_embarque.value.substring(0, 2);
        var fd2 = f.vfec_d2865.value.substring(6, 10) + f.vfec_d2865.value.substring(3, 5) + f.vfec_d2865.value.substring(0, 2);
        if (f.chkDS2865.checked) {
            if (fembarque >= fd2) {
                f.valds2865.style.display = "block";
            }
            f.chkninguno.checked = false;
        }
        else {
            f.valds2865.value = "";
            f.valds2865.style.display = "none";
        }
    };
    function cninguno() {
        f = document.forms[1];
        f.chkDS2600.checked = false;
        f.valds2600.value = "";
        f.valds2600.style.display = "none";
        f.chkDS2657.checked = false;
        f.valds2657.value = "";
        f.valds2657.style.display = "none";
        f.chkDS2751.checked = false;
        f.valds2751.value = "";
        f.valds2751.style.display = "none";
        f.chkDS2752.checked = false;
        f.valds2752.value = "";
        f.valds2752.style.display = "none";
        f.chkDS2865.checked = false;
        f.valds2865.value = "";
        f.valds2865.style.display = "none";
        f.chkDS2752CAN.checked = false;
        f.valds2752CAN.value = "";
        f.valds2752CAN.style.display = "none";
    };
    function recibe(vdocemb_fecha_embarque, vkey_cuo, vkey_voy_nber, vopcion) {
        var Mensaje = "";
        var f = document.forms["eBusqManifiestoForm"];
        if (vopcion == 8 || vopcion == 9) {
            //if(!fTrim(f.docemb_cantidad.value))
            // Mensaje = Mensaje+"'Cantidad de subpartidas arancelarias por manifiesto mayor a 3' es obligatorio\n";
            if (Mensaje == "") {
                f.opcion.value = vopcion;
                f.key_cuo.value = vkey_cuo;
                f.key_voy_nber.value = vkey_voy_nber;
                f.key_dep_date.value = vdocemb_fecha_embarque;
                if (confirm('Est\u00e1 seguro de continuar, no podr\u00e1 ingresar nuevamente a esta opci\u00f3n?'))
                    f.submit();
                    //return true;
                else 
                    return false;
            }
            else {
                alert(Mensaje);
                return false;
            }
        }
    }
    function fFecha(texto) {
        var today = new Date();
        var yearNow = today.getFullYear();
        var mascara = new RegExp("^[0-3]{1}[0-9]{1}/(01|02|03|04|05|06|07|08|09|10|11|12)/[1-2][0-9]{3}$", "g");
        if (texto.length) {
            if (mascara.test(texto)) {
                var dd = texto.substring(0, 2);
                var mm = texto.substring(3, 5);
                var aa = texto.substring(6, 10);
                if (aa < 1960 || aa > yearNow)
                    return false;//verficar con la fecha actual
                if (dd == 0)
                    return false;
                if (mm == 4 || mm == 6 || mm == 9 || mm == 11)
                    if (dd > 30)
                        return false;
                if (mm == 2) {
                    var dias = aa % 4 ? 28 : 29;
                    if (dd > dias)
                        return false;
                }
                else if (dd > 31)
                    return false;
                return true;
            }
            else 
                return false;
        }
        else 
            return true;
    }

    function Trim(texto) {
        if (texto.length) {
            while ('' + texto.charAt(0) == " ") {
                texto = texto.substring(1, texto.length);
            }
        }
        return texto;
    }

    function fTrim(texto) {
        aux = Trim(texto);
        if (aux == "")
            return false;
        else 
            return true;
    }

    function foFecha(texto) {
        return (fTrim(texto) && fFecha(texto));
    }

    function fcFechas2(fecini, fecfin) {
        var fini = fecini.substring(6, 10) + fecini.substring(3, 5) + fecini.substring(0, 2);
        var ffin = fecfin.substring(6, 10) + fecfin.substring(3, 5) + fecfin.substring(0, 2);
        if (fini > ffin)
            return true;
        else 
            return false;

    }
</script>
