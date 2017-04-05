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
      <th><strong>ANEXO II</strong></th></tr>
  </table>

  <table width="100%" border="0" cellpadding="3" cellspacing="1" align="center" id="c" class="marco">
    <tr>
      <th class="cafe" width="60" rowspan="2"><p align="center"><strong>CODIGO</strong></p></th>
      <th class="cafe" width="250" rowspan="2"><p align="center"><strong>DESCRIPCIÓN DE LA MERCANCÍA
      </strong></p></th>
      <th class="cafe" width="22" rowspan="2"><p align="center"><strong>TIPO DE DOCUMENTO</strong></p></th>
      
    </tr>
    <tr> <strong> </strong></tr>
    <tr>
      <td class="azul" width="60" valign="top"><p><strong>84.50</strong></p></td>     
      <td class="azul" width="250" valign="top"><p><strong>Máquinas para lavar ropa, incluso con dispositivo de secado.</strong></p></td>
      <td class="azul" width="22" valign="top"><p align="center"><strong>&nbsp;</strong></p></td>
    </tr>
    <tr>
      <td class="celeste" width="60" valign="top"><p>8450.20.00</p></td>      
      <td class="celeste" width="250" valign="top"><p>-      Máquinas de capacidad unitaria, expresada en peso de ropa seca, superior a 10 kg:</p></td>
      <td class="celeste" width="22" valign="top"><p align="center">&nbsp;</p></td>
    </tr>
    <tr>
      <td class="celeste" width="60" valign="top"><p>8450.20.00.90</p></td>      
      <td class="celeste" width="250" valign="top"><p>-      -     Las demás</p></td>
      <td class="celeste" width="22" valign="top"><p align="center">AP</p></td>
    </tr>
    <tr>
      <td width="60" valign="top"><p>&nbsp;</p></td>
      <td width="250" valign="top"><p>&nbsp;</p></td>
      <td width="22" valign="top"><p>&nbsp;</p></td>
    </tr>
    <tr>
      <td class="azul" width="60" valign="top"><p><strong>84.51</strong></p></td>     
      <td class="azul" width="250" valign="top"><p><strong>Máquinas y aparatos (excepto las máquinas de la partida 84.50) para lavar, limpiar, escurrir, secar, planchar, prensar (incluidas las prensas para fijar), blanquear, teñir, aprestar, acabar, recubrir o impregnar hilados, telas o manufacturas textiles y máquinas para el revestimiento de telas u otros soportes utilizados en la fabricación de cubresuelos, tales como linóleo; máquinas para enrrollar, desenrrollar, plegar, cortar o dentar telas.</strong></p></td>
      <td class="azul" width="22" valign="top"><p align="center"><strong>&nbsp;</strong></p></td>
    </tr>
    <tr>
      <td class="celeste" width="60" valign="top"><p>8451.10.00</p></td>      
      <td class="celeste" width="250" valign="top"><p>-      Máquinas para limpieza en seco:</p></td>
      <td class="celeste" width="22" valign="top"><p align="center">&nbsp;</p></td>
    </tr>
    <tr>
      <td class="celeste" width="60" valign="top"><p>8451.10.00.90</p></td>      
      <td class="celeste" width="250" valign="top"><p>-      -     Las demás</p></td>
      <td class="celeste" width="22" valign="top"><p align="center">AP</p></td>
    </tr>
  </table>
</body>
</html:html>