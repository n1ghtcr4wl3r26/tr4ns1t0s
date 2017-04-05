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
      <th><strong>Resolución  Ministerial N° 207 de 22/04/2016</strong></th></tr>
  </table>

  <table width="100%" border="0" cellpadding="3" cellspacing="1" align="center" id="c" class="marco">
    <tr>
      <th class="cafe" width="60" rowspan="2"><p align="center"><strong>CODIGO</strong></p></th>
      <th class="cafe" width="22" rowspan="2"><p align="center"><strong>SIDU-<br>
        NEA<br>
        11º Dígito</strong></p></th>
      <th class="cafe" width="250" rowspan="2"><p align="center"><strong>DESCRIPCIÓN <br>
        DE LA MERCANCÍA</strong></p></th>
    </tr>
    <tr> <strong> </strong></tr>
    <tr>
      <td class="azul" width="60" valign="top"><p><strong>95.04</strong></p></td>
      <td class="azul" width="22" valign="top"><p align="center"><strong>&nbsp;</strong></p></td>
      <td class="azul" width="250" valign="top"><p><strong>Videoconsolas y máquinas de    videojuego, artículos para juegos de sociedad, incluidos los juegos con motor    o mecanismo, billares, mesas especiales para juegos de casino y juegos de    bolos automáticos («bowlings»).</strong></p></td>
    </tr>
    <tr>
      <td class="celeste" width="60" valign="top"><p>9504.30</p></td>
      <td class="celeste" width="22" valign="top"><p align="center">&nbsp;</p></td>
      <td class="celeste" width="250" valign="top"><p>-      Los demás juegos activados con monedas,    billetes de banco, tarjetas bancarias, fichas o cualquier otro medio de pago,    excepto los juegos de bolos automáticos («bowlings»):</p></td>
    </tr>
    <tr>
      <td width="60" valign="top"><p>9504.30.10</p></td>
      <td width="22" valign="top"><p align="center">&nbsp;</p></td>
      <td width="250" valign="top"><p>-      -         De suerte, envite y azar:</p></td>
    </tr>
    <tr>
      <td width="60" valign="top"><p>9504.30.10.10</p></td>
      <td width="22" valign="top"><p align="center">0</p></td>
      <td width="250" valign="top"><p>-      -         Maquinas de juegos activados con monedas, billetes de banco, tarjetas    bancarias, fichas o cualquier otro medio de pago de suerte, envite y azar</p></td>
    </tr>
    <tr>
      <td width="60" valign="top"><p>9504.30.10.90</p></td>
      <td width="22" valign="top"><p align="center">0</p></td>
      <td width="250" valign="top"><p> -         -     Partes y piezas de las    máquinas de juegos comprendidos en la Subpartida Arancelaria 9504.30.10.10</p></td>
    </tr>
    <tr>
      <td width="60" valign="top"><p>&nbsp;</p></td>
      <td width="22" valign="top"><p align="center">&nbsp;</p></td>
      <td width="250" valign="top"><p>-      -         Los demás:</p></td>
    </tr>
    <tr>
      <td width="60" valign="top"><p>9504.90.91.00</p></td>
      <td width="22" valign="top"><p align="center">0</p></td>
      <td width="250" valign="top"><p>-      -         -      De suerte, envite y azar</p></td>
    </tr>
  </table>
</body>
</html:html>