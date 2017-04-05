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
      <th>Decreto Supremo N°<strong>2657 de 27/01/2016</strong></th></tr>
  </table>


  <table width="100%" border="0" cellpadding="3" cellspacing="1" align="center" id="c" class="marco">
    <tr>
      <th class="cafe" width="97" rowspan="3"><p align="center">CODIGO</p></th>
      <th class="cafe" width="44" rowspan="3"><p align="center">SIDUNEA 11º Dígito</p></th>
      <th class="cafe" width="400" rowspan="3"><p align="center">DESCRIPCIÓN <br>
        DE LA MERCANCÍA</p></th>
    </tr>
    <tr> <strong> </strong></tr>
    <tr> <strong> </strong></tr>
    <tr>
      <td width="97" valign="top"><p>&nbsp;</p></td>
      <td width="44" valign="top"><p align="center">&nbsp;</p></td>
      <td width="400"><p>&nbsp;</td>
    </tr>
    <tr>
      <td class="azul" width="97" valign="top"><p>2203.00.00.00</p></td>
      <td class="azul" width="44" valign="top"><p align="center">0</p></td>
      <td class="azul" width="400" valign="top"><p>Cerveza de malta.</p></td>
    </tr>
    <tr>
      <td width="97" valign="top"><p>&nbsp;</p></td>
      <td width="44" valign="top"><p align="center">&nbsp;</p></td>
      <td width="400"><p>&nbsp;</td>
    </tr>
    <tr>
      <td class="azul" width="97" nowrap valign="top"><p>22.04</p></td>
      <td class="azul" width="44" nowrap valign="top"><p align="center">&nbsp;</p></td>
      <td class="azul" width="400" valign="top"><p>Vino de uvas frescas, incluso encabezado;    mosto de uva, excepto el de la partida 20.09.</p></td>
    </tr>
    <tr>
      <td class="celeste" width="97" valign="top"><p>2204.10.00.00</p></td>
      <td class="celeste" width="44" valign="top"><p align="center">0</p></td>
      <td class="celeste" width="400" valign="top"><p>-      Vino    espumoso</p></td>
    </tr>
    <tr>
      <td class="celeste" width="97" valign="top"><p>&nbsp;</p></td>
      <td class="celeste" width="44" valign="top"><p align="center">&nbsp;</p></td>
      <td class="celeste" width="400" valign="top"><p>-      Los    demás vinos; mosto de uva en el que la fermentación se ha impedido o cortado    añadiendo alcohol:</p></td>
    </tr>
    <tr>
      <td width="97" valign="top"><p>2204.21.00.00</p></td>
      <td width="44" valign="top"><p align="center">0</p></td>
      <td width="400" valign="top"><p>-      -      En recipientes con capacidad inferior o    igual a 2 l</p></td>
    </tr>
    <tr>
      <td width="97" valign="top"><p>2204.29</p></td>
      <td width="44" valign="top"><p align="center">&nbsp;</p></td>
      <td width="400" valign="top"><p>-      -      Los demás:</p></td>
    </tr>
    <tr>
      <td width="97" valign="top"><p>2204.29.10.00</p></td>
      <td width="44" valign="top"><p align="center">0</p></td>
      <td width="400" valign="top"><p>-      -      -         Mosto de uva en el que la fermentación se ha impedido o cortado    añadiendo alcohol (mosto apagado)</p></td>
    </tr>
    <tr>
      <td width="97" valign="top"><p>2204.29.90.00</p></td>
      <td width="44" valign="top"><p align="center">0</p></td>
      <td width="400" valign="top"><p>-      -      -         Los demás vinos</p></td>
    </tr>
    <tr>
      <td class="celeste" width="97" valign="top"><p>2204.30.00.00</p></td>
      <td class="celeste" width="44" valign="top"><p align="center">0</p></td>
      <td class="celeste" width="400" valign="top"><p>-      Los    demás mostos de uva</p></td>
    </tr>
    <tr>
      <td width="97" valign="top"><p>&nbsp;</p></td>
      <td width="44" valign="top"><p align="center">&nbsp;</p></td>
      <td width="400" valign="top"><p>&nbsp;</p></td>
    </tr>
    <tr>
      <td class="azul" width="97" nowrap valign="top"><p>22.05</p></td>
      <td class="azul" width="44" nowrap valign="top"><p align="center">&nbsp;</p></td>
      <td class="azul" width="400" valign="top"><p>Vermut y demás vinos de uvas frescas    preparados con plantas o sustancias aromáticas.</p></td>
    </tr>
    <tr>
      <td class="celeste" width="97" valign="top"><p>2205.10.00.00</p></td>
      <td class="celeste" width="44" valign="top"><p align="center">0</p></td>
      <td class="celeste" width="400" valign="top"><p>-      En    recipientes con capacidad inferior o igual a 2 l</p></td>
    </tr>
    <tr>
      <td class="celeste" width="97" valign="top"><p>2205.90.00.00</p></td>
      <td class="celeste" width="44" valign="top"><p align="center">0</p></td>
      <td class="celeste" width="400" valign="top"><p>-      Los    demás</p></td>
    </tr>
    <tr>
      <td width="97" valign="top"><p>&nbsp;</p></td>
      <td width="44" valign="top"><p align="center">&nbsp;</p></td>
      <td width="400"><p>&nbsp;</td>
    </tr>
    <tr>
      <td class="azul" width="97" nowrap valign="top"><p>2206.00</p></td>
      <td class="azul" width="44" nowrap valign="top"><p align="center">&nbsp;</p></td>
      <td class="azul" width="400" valign="top"><p>Las demás bebidas fermentadas (por ejemplo:    sidra, perada, aguamiel); mezclas de bebidas fermentadas y mezclas de bebidas    fermentadas y bebidas no alcohólicas, no expresadas ni comprendidas en otra    parte.</p></td>
    </tr>
    <tr>
      <td class="celeste" width="97" valign="top"><p>2206.00.00.10</p></td>
      <td class="celeste" width="44" valign="top"><p align="center">0</p></td>
      <td class="celeste" width="400" valign="top"><p>-      Chicha    de maíz</p></td>
    </tr>
    <tr>
      <td class="celeste" width="97" valign="top"><p>2206.00.00.20</p></td>
      <td class="celeste" width="44" valign="top"><p align="center">0</p></td>
      <td class="celeste" width="400" valign="top"><p>-      Sidra, perada y aguamiel (hidromiel)</p></td>
    </tr>
    <tr>
      <td class="celeste" width="97" valign="top"><p>2206.00.00.90</p></td>
      <td class="celeste" width="44" valign="top"><p align="center">0</p></td>
      <td class="celeste" width="400" valign="top"><p>-      Las    demás</p></td>
    </tr>
    <tr>
      <td width="97" valign="top"><p>&nbsp;</p></td>
      <td width="44" valign="top"><p align="center">&nbsp;</p></td>
      <td width="400" valign="top"><p>&nbsp;</p></td>
    </tr>
    <tr>
      <td class="azul" width="97" nowrap valign="top"><p>22.08</p></td>
      <td class="azul" width="44" nowrap valign="top"><p align="center">&nbsp;</p></td>
      <td class="azul" width="400" valign="top"><p>Alcohol etílico sin desnaturalizar con grado    alcohólico volumétrico inferior al 80% vol; aguardientes, licores y demás    bebidas espirituosas.</p></td>
    </tr>
    <tr>
      <td class="celeste" width="97" valign="top"><p>2208.20</p></td>
      <td class="celeste" width="44" valign="top"><p align="center">&nbsp;</p></td>
      <td class="celeste" width="400" valign="top"><p>-         Aguardiente de vino o de orujo de uvas:</p></td>
    </tr>
    <tr>
      <td width="97" valign="top"><p>&nbsp;</p></td>
      <td width="44" valign="top"><p align="center">&nbsp;</p></td>
      <td width="400" valign="top"><p>-      -      De vino (Por ejemplo: «coñac»,    «brandys», «pisco», «singani»):</p></td>
    </tr>
    <tr>
      <td width="97" valign="top"><p>2208.20.21.00</p></td>
      <td width="44" valign="top"><p align="center">0</p></td>
      <td width="400" valign="top"><p>-      -      -         Pisco</p></td>
    </tr>
    <tr>
      <td width="97" valign="top"><p>2208.20.22.00</p></td>
      <td width="44" valign="top"><p align="center">0</p></td>
      <td width="400" valign="top"><p>-      -      -         Singani</p></td>
    </tr>
    <tr>
      <td width="97" valign="top"><p>2208.20.29.00</p></td>
      <td width="44" valign="top"><p align="center">0</p></td>
      <td width="400" valign="top"><p>-      -      -         Los demás</p></td>
    </tr>
    <tr>
      <td width="97" valign="top"><p>2208.20.30.00</p></td>
      <td width="44" valign="top"><p align="center">0</p></td>
      <td width="400" valign="top"><p>-      -         De orujo de uvas («grappa» y similares)</p></td>
    </tr>
    <tr>
      <td class="celeste" width="97" valign="top"><p>2208.30.00.00</p></td>
      <td class="celeste" width="44" valign="top"><p align="center">0</p></td>
      <td class="celeste" width="400" valign="top"><p>-      Whisky</p></td>
    </tr>
    <tr>
      <td class="celeste" width="97" valign="top"><p>2208.40.00.00</p></td>
      <td class="celeste" width="44" valign="top"><p align="center">0</p></td>
      <td class="celeste" width="400" valign="top"><p>-      Ron y    demás aguardientes procedentes de la destilación, previa fermentación, de    productos de la caña de azúcar</p></td>
    </tr>
    <tr>
      <td class="celeste" width="97" valign="top"><p>2208.50.00.00</p></td>
      <td class="celeste" width="44" valign="top"><p align="center">0</p></td>
      <td class="celeste" width="400" valign="top"><p>-      «Gin»    y ginebra</p></td>
    </tr>
    <tr>
      <td class="celeste" width="97" valign="top"><p>2208.60.00.00</p></td>
      <td class="celeste" width="44" valign="top"><p align="center">0</p></td>
      <td class="celeste" width="400" valign="top"><p>-      Vodka</p></td>
    </tr>
    <tr>
      <td class="celeste" width="97" valign="top"><p>2208.70</p></td>
      <td class="celeste" width="44" valign="top"><p align="center">&nbsp;</p></td>
      <td class="celeste" width="400" valign="top"><p>-         Licores:</p></td>
    </tr>
    <tr>
      <td width="97" valign="top"><p>2208.70.10.00</p></td>
      <td width="44" valign="top"><p align="center">0</p></td>
      <td width="400" valign="top"><p>-      -      De anís</p></td>
    </tr>
    <tr>
      <td width="97" valign="top"><p>2208.70.20.00</p></td>
      <td width="44" valign="top"><p align="center">0</p></td>
      <td width="400" valign="top"><p>-      -      Cremas</p></td>
    </tr>
    <tr>
      <td width="97" valign="top"><p>2208.70.90.00</p></td>
      <td width="44" valign="top"><p align="center">0</p></td>
      <td width="400" valign="top"><p>-      -      Los demás</p></td>
    </tr>
    <tr>
      <td class="celeste" width="97" valign="top"><p>2208.90</p></td>
      <td class="celeste" width="44" valign="top"><p align="center">&nbsp;</p></td>
      <td class="celeste" width="400" valign="top"><p>-      Los    demás:</p></td>
    </tr>
    <tr>
      <td width="97" valign="top"><p>2208.90.20.00</p></td>
      <td width="44" valign="top"><p align="center">0</p></td>
      <td width="400" valign="top"><p>-      -      Aguardiente de agaves (tequila y    similares)</p></td>
    </tr>
    <tr>
      <td width="97" valign="top"><p>&nbsp;</p></td>
      <td width="44" valign="top"><p align="center">&nbsp;</p></td>
      <td width="400" valign="top"><p>-      -      Los demás aguardientes:</p></td>
    </tr>
    <tr>
      <td width="97" valign="top"><p>2208.90.42.00</p></td>
      <td width="44" valign="top"><p align="center">0</p></td>
      <td width="400" valign="top"><p>-      -      -         De anís</p></td>
    </tr>
    <tr>
      <td width="97" valign="top"><p>2208.90.49.00</p></td>
      <td width="44" valign="top"><p align="center">0</p></td>
      <td width="400" valign="top"><p>-      -      -         Los demás</p></td>
    </tr>
    <tr>
      <td width="97" valign="top"><p>2208.90.90.00</p></td>
      <td width="44" valign="top"><p align="center">0</p></td>
      <td width="400" valign="top"><p>-      -      Los demás</p></td>
    </tr>
  </table>
</body>
</html:html>