<%@ page contentType="text/html; charset=UTF-8" language="java" buffer="none" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<%@ page import="oracle.jdbc.pool.OracleConnectionPoolDataSource"%>
<%@ page import="oracle.jdbc.pool.OraclePooledConnection"%>
<%@ page import="java.sql.CallableStatement"%>
<%@ page import="Reporte.*, Transito.*, Main.*"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="javax.sql.PooledConnection"%>
<%@ page import="oracle.jdbc.OracleTypes"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.text.SimpleDateFormat"%>

<html:html>
  <head>
    <link href="../css/Estilos2.css" rel="stylesheet" type="text/css" media="screen"/>
    <title>Tr@nsitos</title>
  </head>
<body bgcolor="#F5F9FD">
  <table width="100%" border="0" cellpadding="3" cellspacing="0" align="center">
    <tr>
      <th>Decreto Supremo N°2751  de 01/05/2016</th></tr>
  </table>

  <table width="100%" border="0" cellpadding="3" cellspacing="1" align="center" id="c" class="marco">
    <tr >
      <th class="cafe" width="95" nowrap><p align="center"><strong>CÓDIGO</strong><strong> </strong></p></th>
      <th class="cafe" width="63" nowrap><p align="center">SIDUNEA<br>
        11º Dígito </p></th>
      <th class="cafe" width="447"><p align="center"><strong>DESCRIPCIÓN DE LA MERCANCÍA</strong><strong> </strong></p></th>
    </tr>
    <tr>
      <td class="azul" width="95" nowrap valign="top"><p><strong>15.07</strong></p></td>
      <td class="azul" width="63" nowrap valign="top"><p align="center">&nbsp;</p></td>
      <td class="azul" width="447" valign="top"><p><strong>Aceite de soja (soya) y sus fracciones, incluso refinado, pero    sin modificar químicamente.</strong></p></td>
    </tr>
    <tr>
      <td class="celeste" width="95" valign="top"><p>1507.10.00.00</p></td>
      <td class="celeste" width="63" valign="top"><p align="center">0</p></td>
      <td class="celeste" width="447" valign="top"><p>-      Aceite en bruto,    incluso desgomado</p></td>
    </tr>
    <tr>
      <td class="celeste" width="95" valign="top"><p>1507.90</p></td>
      <td class="celeste" width="63" valign="top"><p align="center">&nbsp;</p></td>
      <td class="celeste" width="447" valign="top"><p>-      Los demás:</p></td>
    </tr>
    <tr>
      <td width="95" valign="top"><p>1507.90.10.00</p></td>
      <td width="63" valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      Con adición de sustancias    desnaturalizantes en una proporción inferior o igual al 1%</p></td>
    </tr>
    <tr>
      <td width="95" valign="top"><p>1507.90.90.00</p></td>
      <td width="63" valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      Los demás</p></td>
    </tr>
    <tr>
      <td class="azul" width="95" nowrap valign="top"><p><strong>15.12</strong></p></td>
      <td class="azul" width="63" nowrap valign="top"><p align="center">&nbsp;</p></td>
      <td class="azul" width="447" valign="top"><p><strong>Aceites de girasol, cártamo o algodón, y sus fracciones, incluso    refinados, pero sin modificar químicamente.</strong></p></td>
    </tr>
    <tr>
      <td class="celeste" width="95" valign="top"><p>&nbsp;</p></td>
      <td class="celeste" width="63" valign="top"><p align="center">&nbsp;</p></td>
      <td class="celeste" width="447" valign="top"><p>-      Aceites de    girasol o cártamo, y sus fracciones:</p></td>
    </tr>
    <tr>
      <td width="95" valign="top"><p>1512.11</p></td>
      <td width="63" valign="top"><p align="center">&nbsp;</p></td>
      <td width="447" valign="top"><p>-      -      Aceites en bruto:</p></td>
    </tr>
    <tr>
      <td width="95" valign="top"><p>1512.11.10.00</p></td>
      <td width="63" valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      -         De girasol</p></td>
    </tr>
    <tr>
      <td width="95" valign="top"><p>1512.19</p></td>
      <td width="63" valign="top"><p align="center">&nbsp;</p></td>
      <td width="447" valign="top"><p>-      -      Los demás:</p></td>
    </tr>
    <tr>
      <td width="95" valign="top"><p>1512.19.10.00</p></td>
      <td width="63" valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      -         De girasol</p></td>
    </tr>
    <tr>
      <td class="azul" width="95" nowrap valign="top"><p><strong>17.01</strong></p></td>
      <td class="azul" width="63" nowrap valign="top"><p align="center">&nbsp;</p></td>
      <td class="azul" width="447" valign="top"><p><strong>Azúcar de caña o de remolacha y sacarosa químicamente pura, en    estado sólido.</strong></p></td>
    </tr>
    <tr>
      <td class="celeste" width="95" nowrap valign="top"><p>&nbsp;</p></td>
      <td class="celeste" width="63" nowrap valign="top"><p align="center">&nbsp;</p></td>
      <td class="celeste" width="447" valign="top"><p>-      Azúcar en bruto    sin adición de aromatizante ni colorante:</p></td>
    </tr>
    <tr>
      <td width="95" nowrap valign="top"><p>1701.12.00.00</p></td>
      <td width="63" nowrap valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      De remolacha</p></td>
    </tr>
    <tr>
      <td width="95" nowrap valign="top"><p>1701.13.00.00</p></td>
      <td width="63" nowrap valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      Azúcar de caña mencionado en la Nota 2    de subpartida de este Capítulo</p></td>
    </tr>
    <tr>
      <td width="95" nowrap valign="top"><p>1701.14.00.00</p></td>
      <td width="63" nowrap valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      Los demás azúcares de caña</p></td>
    </tr>
    <tr>
      <td class="celeste" width="95" nowrap valign="top"><p>&nbsp;</p></td>
      <td class="celeste" width="63" nowrap valign="top"><p align="center">&nbsp;</p></td>
      <td class="celeste" width="447" valign="top"><p>-      Los demás:</p></td>
    </tr>
    <tr>
      <td width="95" nowrap valign="top"><p>1701.91.00.00</p></td>
      <td width="63" nowrap valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      Con adición de aromatizante o colorante</p></td>
    </tr>
    <tr>
      <td class="azul" width="95" nowrap valign="top"><p><strong>20.09</strong></p></td>
      <td class="azul" width="63" nowrap valign="top"><p align="center">&nbsp;</p></td>
      <td class="azul" width="447" valign="top"><p><strong>Jugos de frutas u otros frutos (incluido el mosto de uva) o de    hortalizas sin fermentar y sin adición de alcohol, incluso con adición de    azúcar u otro edulcorante.</strong></p></td>
    </tr>
    <tr>
      <td class="celeste" width="95" valign="top"><p>&nbsp;</p></td>
      <td class="celeste" width="63" valign="top"><p align="center">&nbsp;</p></td>
      <td class="celeste" width="447" valign="top"><p>-      Jugo de naranja:</p></td>
    </tr>
    <tr>
      <td width="95" valign="top"><p>2009.11.00.00</p></td>
      <td width="63" valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      Congelado</p></td>
    </tr>
    <tr>
      <td width="95" valign="top"><p>2009.12.00.00</p></td>
      <td width="63" valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      Sin congelar, de valor Brix inferior o    igual a 20</p></td>
    </tr>
    <tr>
      <td width="95" valign="top"><p>2009.19.00.00</p></td>
      <td width="63" valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      Los demás</p></td>
    </tr>
    <tr>
      <td class="celeste" width="95" valign="top"><p>&nbsp;</p></td>
      <td class="celeste" width="63" valign="top"><p align="center">&nbsp;</p></td>
      <td class="celeste" width="447" valign="top"><p>-      Jugo de toronja o    pomelo:</p></td>
    </tr>
    <tr>
      <td width="95" valign="top"><p>2009.21.00.00</p></td>
      <td width="63" valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      De valor Brix inferior o igual a 20</p></td>
    </tr>
    <tr>
      <td width="95" valign="top"><p>2009.29.00.00</p></td>
      <td width="63" valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      Los demás</p></td>
    </tr>
    <tr>
      <td class="celeste" width="95" valign="top"><p>&nbsp;</p></td>
      <td class="celeste" width="63" valign="top"><p align="center">&nbsp;</p></td>
      <td class="celeste" width="447" valign="top"><p>-      Jugo de cualquier    otro agrio (cítrico):</p></td>
    </tr>
    <tr>
      <td width="95" valign="top"><p>2009.31.00.00</p></td>
      <td width="63" valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      De valor Brix inferior o igual a 20</p></td>
    </tr>
    <tr>
      <td width="95" valign="top"><p>2009.39</p></td>
      <td width="63" valign="top"><p align="center">&nbsp;</p></td>
      <td width="447" valign="top"><p>-      -      Los demás:</p></td>
    </tr>
    <tr>
      <td width="95" valign="top"><p>2009.39.10.00</p></td>
      <td width="63" valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      -        De limón de la subpartida 0805.50.21</p></td>
    </tr>
    <tr>
      <td width="95" valign="top"><p>2009.39.90.00</p></td>
      <td width="63" valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      -         Los demás</p></td>
    </tr>
    <tr>
      <td class="celeste" width="95" valign="top"><p>&nbsp;</p></td>
      <td class="celeste" width="63" valign="top"><p align="center">&nbsp;</p></td>
      <td class="celeste" width="447" valign="top"><p>-      Jugo de piña    (ananá):</p></td>
    </tr>
    <tr>
      <td width="95" valign="top"><p>2009.41.00.00</p></td>
      <td width="63" valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      De valor Brix inferior o igual a 20</p></td>
    </tr>
    <tr>
      <td width="95" valign="top"><p>2009.49.00.00</p></td>
      <td width="63" valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      Los demás</p></td>
    </tr>
    <tr>
      <td class="celeste" width="95" valign="top"><p>2009.50.00.00</p></td>
      <td class="celeste" width="63" valign="top"><p align="center">0</p></td>
      <td class="celeste" width="447" valign="top"><p>-      Jugo de tomate</p></td>
    </tr>
    <tr>
      <td class="celeste" width="95" valign="top"><p>&nbsp;</p></td>
      <td class="celeste" width="63" valign="top"><p align="center">&nbsp;</p></td>
      <td class="celeste" width="447" valign="top"><p>-      Jugo de uva    (incluido el mosto):</p></td>
    </tr>
    <tr>
      <td width="95" valign="top"><p>2009.61.00.00</p></td>
      <td width="63" valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      De valor Brix inferior o igual a 30</p></td>
    </tr>
    <tr>
      <td width="95" valign="top"><p>2009.69.00.00</p></td>
      <td width="63" valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      Los demás</p></td>
    </tr>
    <tr>
      <td class="celeste" width="95" valign="top"><p>&nbsp;</p></td>
      <td class="celeste" width="63" valign="top"><p align="center">&nbsp;</p></td>
      <td class="celeste" width="447" valign="top"><p>-      Jugo de manzana:</p></td>
    </tr>
    <tr>
      <td width="95" valign="top"><p>2009.71.00.00</p></td>
      <td width="63" valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      De valor Brix inferior o igual a 20</p></td>
    </tr>
    <tr>
      <td width="95" valign="top"><p>2009.79.00.00</p></td>
      <td width="63" valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      Los demás</p></td>
    </tr>
    <tr>
      <td class="celeste" width="95" nowrap valign="top"><p>&nbsp;</p></td>
      <td class="celeste" width="63" nowrap valign="top"><p align="center">&nbsp;</p></td>
      <td class="celeste" width="447" valign="top"><p>-      Jugo de cualquier    otra fruta o fruto u hortaliza:</p></td>
    </tr>
    <tr>
      <td width="95" nowrap valign="top"><p>2009.81.00.00</p></td>
      <td width="63" nowrap valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      De arándanos rojos (<em>Vaccinium    macrocarpon, Vaccinium oxycoccos, Vaccinium vitis-idaea</em>)</p></td>
    </tr>
    <tr>
      <td width="95" nowrap valign="top"><p>2009.89</p></td>
      <td width="63" nowrap valign="top"><p align="center">&nbsp;</p></td>
      <td width="447" valign="top"><p>-      -      Los demás:</p></td>
    </tr>
    <tr>
      <td width="95" nowrap valign="top"><p>2009.89.10.00</p></td>
      <td width="63" nowrap valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      -         De papaya</p></td>
    </tr>
    <tr>
      <td width="95" nowrap valign="top"><p>2009.89.20.00</p></td>
      <td width="63" nowrap valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      -         De maracuyá (parchita) (<em>Passiflora edulis</em>)</p></td>
    </tr>
    <tr>
      <td width="95" nowrap valign="top"><p>2009.89.30.00</p></td>
      <td width="63" nowrap valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      -         De guanábana (<em>Annona muricata</em>)</p></td>
    </tr>
    <tr>
      <td width="95" nowrap valign="top"><p>2009.89.40.00</p></td>
      <td width="63" nowrap valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      -         De mango</p></td>
    </tr>
    <tr>
      <td width="95" nowrap valign="top"><p>2009.89.50.00</p></td>
      <td width="63" nowrap valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      -         De camu camu (<em>Myrciaria dubia</em>)</p></td>
    </tr>
    <tr>
      <td width="95" nowrap valign="top"><p>2009.89.60.00</p></td>
      <td width="63" nowrap valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      -         De hortaliza</p></td>
    </tr>
    <tr>
      <td width="95" nowrap valign="top"><p>2009.89.90.00</p></td>
      <td width="63" nowrap valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      -         Los demás</p></td>
    </tr>
    <tr>
      <td class="celeste" width="95" nowrap valign="top"><p>2009.90.00.00</p></td>
      <td class="celeste" width="63" nowrap valign="top"><p align="center">0</p></td>
      <td class="celeste" width="447" valign="top"><p>-      Mezclas de jugos</p></td>
    </tr>
    <tr>
      <td class="azul" width="95" nowrap valign="top"><p><strong>22.01</strong></p></td>
      <td class="azul" width="63" nowrap valign="top"><p align="center">&nbsp;</p></td>
      <td class="azul" width="447" valign="top"><p><strong>Agua, incluidas el agua mineral natural o artificial y la    gaseada, sin adición de azúcar u otro edulcorante ni aromatizada; hielo y    nieve.</strong></p></td>
    </tr>
    <tr>
      <td class="celeste" width="95" valign="top"><p>2201.10.00.00</p></td>
      <td class="celeste" width="63" valign="top"><p align="center">0</p></td>
      <td class="celeste" width="447" valign="top"><p>-      Agua mineral y    agua gaseada</p></td>
    </tr>
    <tr>
      <td class="celeste" width="95" valign="top"><p>2201.90.00.00</p></td>
      <td class="celeste" width="63" valign="top"><p align="center">0</p></td>
      <td class="celeste" width="447" valign="top"><p>-      Los demás</p></td>
    </tr>
    <tr>
      <td class="azul" width="95" nowrap valign="top"><p><strong>22.02</strong></p></td>
      <td class="azul" width="63" nowrap valign="top"><p align="center">&nbsp;</p></td>
      <td class="azul" width="447" valign="top"><p><strong>Agua, incluidas el agua mineral y la gaseada, con adición de    azúcar u otro edulcorante o aromatizada, y demás bebidas no alcohólicas,    excepto los jugos de frutas u otros frutos o de hortalizas de la partida    20.09.</strong></p></td>
    </tr>
    <tr>
      <td class="celeste" width="95" valign="top"><p>2202.10.00.00</p></td>
      <td class="celeste" width="63" valign="top"><p align="center">0</p></td>
      <td class="celeste" width="447" valign="top"><p>-      Agua, incluidas    el agua mineral y la gaseada, con adición de azúcar u otro edulcorante o    aromatizada</p></td>
    </tr>
    <tr>
      <td class="celeste" width="95" valign="top"><p>2202.90</p></td>
      <td class="celeste" width="63" valign="top"><p align="center">&nbsp;</p></td>
      <td class="celeste" width="447" valign="top"><p>-      Las demás:</p></td>
    </tr>
    <tr>
      <td width="95" valign="top"><p>2202.90.00.10</p></td>
      <td width="63" valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      Bebidas energizantes, incluso gaseadas</p></td>
    </tr>
    <tr>
      <td width="95" valign="top"><p>2202.90.00.20</p></td>
      <td width="63" valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      Elaboradas a base de pulpa, o jugo    (zumo) de frutas y otros frutos esterilizantes</p></td>
    </tr>
    <tr>
      <td width="95" valign="top"><p>2202.90.00.90</p></td>
      <td width="63" valign="top"><p align="center">0</p></td>
      <td width="447" valign="top"><p>-      -      Las demás</p></td>
    </tr>
  </table>
</body>
</html:html>