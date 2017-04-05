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
    <tr><th>Decreto Supremo N°2752 de 01/05/2016</th></tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" align="center" id="c" class="marco">
  <tr>
    <td width="519" valign="top"><table width="100%" border="0" cellpadding="3" cellspacing="1" align="center" id="c2" class="marco">
      <tr>
        <th class="cafe" width="121"><p align="center"><strong>CODIGO</strong></p></th>
        <th class="cafe" width="519"><p align="center"><strong>DESCRIPCIÓN <br>
          DE LA MERCANCÍA</strong></p></th>
      </tr>
      <tr >
        <th class="azul" width="121" valign="top"><p><strong>61.01</strong></p></th>
        <th class="azul" width="519" valign="top"><p><strong>Abrigos, chaquetones, capas, anoraks, cazadoras y artículos similares,    de punto, para hombres o niños, excepto los artículos de la partida 61.03.</strong></p></th>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6101.20.00.00</p></td>
        <td width="519" valign="top"><p>-      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6101.30.00.00</p></td>
        <td width="519" valign="top"><p>-      De fibras sintéticas o    artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6101.90</p></td>
        <td width="519" valign="top"><p>-      De las demás materias    textiles:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6101.90.10.00</p></td>
        <td width="519" valign="top"><p>-      -      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6101.90.90.00</p></td>
        <td width="519" valign="top"><p>-      -      Las demás </p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>61.02</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Abrigos, chaquetones, capas, anoraks, cazadoras y artículos similares,    de punto, para mujeres o niñas, excepto los artículos de la partida 61.04.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6102.10.00.00</p></td>
        <td width="519" valign="top"><p>-      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6102.20.00.00</p></td>
        <td width="519" valign="top"><p>-      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6102.30.00.00</p></td>
        <td width="519" valign="top"><p>-      De fibras sintéticas o    artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6102.90.00.00</p></td>
        <td width="519" valign="top"><p>-      De las demás materias    textiles</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>61.03</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Trajes (ambos o ternos), conjuntos, chaquetas (sacos), pantalones    largos, pantalones con peto, pantalones cortos (calzones) y shorts (excepto    de baño), de punto, para hombres o niños.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6103.10</p></td>
        <td width="519" valign="top"><p>-      Trajes (ambos o ternos):</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6103.10.10.00</p></td>
        <td width="519" valign="top"><p>-      -      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6103.10.20.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6103.10.90.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Conjuntos:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6103.22.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6103.23.00.00</p></td>
        <td width="519" valign="top"><p>-      -         De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6103.29</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6103.29.10.00</p></td>
        <td width="519" valign="top"><p>-      -      -         De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6103.29.90.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Las demás</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Chaquetas (sacos):</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6103.31.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6103.32.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6103.33.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6103.39.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Pantalones largos,    pantalones con peto, pantalones cortos (calzones) y shorts:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6103.41.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6103.42.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6103.43.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6103.49.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>61.04</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Trajes sastre, conjuntos, chaquetas (sacos), vestidos, faldas, faldas    pantalón, pantalones largos, pantalones con peto, pantalones cortos    (calzones) y shorts (excepto de baño), de punto, para mujeres o niñas.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Trajes sastre:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.13.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.19</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.19.10.00</p></td>
        <td width="519" valign="top"><p>-      -      -         De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.19.20.00</p></td>
        <td width="519" valign="top"><p>-      -      -         De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.19.90.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Las demás </p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Conjuntos:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.22.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.23.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.29</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.29.10.00</p></td>
        <td width="519" valign="top"><p>-      -      -         De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.29.90.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Los demás</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Chaquetas (sacos):</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.31.00.00</p></td>
        <td width="519" valign="top"><p>-      -         De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.32.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.33.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.39.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Vestidos:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.41.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.42.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.43.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.44.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.49.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Faldas y faldas pantalón:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.51.00.00</p></td>
        <td width="519" valign="top"><p>-      -         De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.52.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.53.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.59.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Pantalones largos,    pantalones con peto, pantalones cortos (calzones) y shorts:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.61.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.62.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.63.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6104.69.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>61.05</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Camisas de punto para hombres o niños.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6105.10.00.00</p></td>
        <td width="519" valign="top"><p>-      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6105.20</p></td>
        <td width="519" valign="top"><p>-      De fibras sintéticas o    artificiales:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6105.20.10.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras acrílicas o modacrílicas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6105.20.90.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás fibras sintéticas o    artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6105.90.00.00</p></td>
        <td width="519" valign="top"><p>-      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>61.06</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Camisas, blusas y blusas camiseras, de punto, para mujeres o niñas.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6106.10.00.00</p></td>
        <td width="519" valign="top"><p>-      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6106.20.00.00</p></td>
        <td width="519" valign="top"><p>-      De fibras sintéticas o    artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6106.90.00.00</p></td>
        <td width="519" valign="top"><p>-      De las demás materias    textiles</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>61.07</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Calzoncillos (incluidos los largos y los slips), camisones, pijamas,    albornoces de baño, batas de casa y artículos similares, de punto, para    hombres o niños.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Calzoncillos (incluidos    los largos y los slips):</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6107.11.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6107.12.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas o artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6107.19.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Camisones y pijamas:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6107.21.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6107.22.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas o artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6107.29.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Los demás:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6107.91.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6107.99</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6107.99.10.00</p></td>
        <td width="519" valign="top"><p>-      -      -         De fibras sintéticas o artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6107.99.90.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Los demás</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>61.08</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Combinaciones, enaguas, bragas (bombachas, calzones) (incluso las que    no llegan hasta la cintura), camisones, pijamas, saltos de cama, albornoces    de baño, batas de casa y artículos similares, de punto, para mujeres o niñas.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Combinaciones y enaguas:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6108.11.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas o artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6108.19.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Bragas (bombachas,    calzones) (incluso las que no llegan hasta la cintura):</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6108.21.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6108.22.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas o artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6108.29.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Camisones y pijamas:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6108.31.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6108.32.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas o artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6108.39.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Los demás:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6108.91.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6108.92.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas o artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6108.99.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>61.09</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>«T-shirts» y camisetas interiores, de punto.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6109.10.00.00</p></td>
        <td width="519" valign="top"><p>-      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6109.90</p></td>
        <td width="519" valign="top"><p>-      De las demás materias    textiles:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6109.90.10.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras acrílicas o modacrílicas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6109.90.90.00</p></td>
        <td width="519" valign="top"><p>-      -      Las demás</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>61.10</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Suéteres (jerseys), «pullóveres», cárdiganes, chalecos y artículos    similares, de punto.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      De lana o pelo fino:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6110.11</p></td>
        <td width="519" valign="top"><p>-      -      De lana:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6110.11.10.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Suéteres (jerseys)</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6110.11.20.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Chalecos</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6110.11.30.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Cardiganes</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6110.11.90.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Los demás</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6110.12.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De cabra de Cachemira</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6110.19</p></td>
        <td width="519" valign="top"><p>-      -         Los demás:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6110.19.10.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Suéteres (jerseys)</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6110.19.20.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Chalecos</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6110.19.30.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Cardiganes</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6110.19.90.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Los demás</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6110.20</p></td>
        <td width="519" valign="top"><p>-      De algodón:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6110.20.10.00</p></td>
        <td width="519" valign="top"><p>-      -      Suéteres (jerseys)</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6110.20.20.00</p></td>
        <td width="519" valign="top"><p>-      -      Chalecos</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6110.20.30.00</p></td>
        <td width="519" valign="top"><p>-      -      Cardiganes</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6110.20.90.00</p></td>
        <td width="519" valign="top"><p>-      -      Los demás</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6110.30</p></td>
        <td width="519" valign="top"><p>-      De fibras sintéticas o    artificiales:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6110.30.10.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras acrílicas o modacrílicas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6110.30.90.00</p></td>
        <td width="519" valign="top"><p>-      -      Las demás</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6110.90.00.00</p></td>
        <td width="519" valign="top"><p>-      De las demás materias    textiles</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>61.11</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Prendas y complementos (accesorios), de vestir, de punto, para bebés.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6111.20.00.00</p></td>
        <td width="519" valign="top"><p>-      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6111.30.00.00</p></td>
        <td width="519" valign="top"><p>-      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6111.90</p></td>
        <td width="519" valign="top"><p>-      De las demás materias    textiles:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6111.90.10.00</p></td>
        <td width="519" valign="top"><p>-      -      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6111.90.90.00</p></td>
        <td width="519" valign="top"><p>-      -      Los demás</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>61.12</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Conjuntos de abrigo para entrenamiento o deporte (chandales), monos    (overoles) y conjuntos de esquí y bañadores, de punto.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Conjuntos de abrigo para    entrenamiento o deporte (chandales):</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6112.11.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6112.12.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6112.19.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6112.20.00.00</p></td>
        <td width="519" valign="top"><p>-      Monos (overoles) y    conjuntos de esquí</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Bañadores para hombres o    niños:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6112.31.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6112.39.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Bañadores para mujeres o    niñas:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6112.41.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6112.49.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>6113.00.00.00</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Prendas de vestir confeccionadas con tejidos de punto de las partidas    59.03, 59.06 ó 59.07.</strong></p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>61.14</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Las demás prendas de vestir, de punto.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6114.20.00.00</p></td>
        <td width="519" valign="top"><p>-      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6114.30.00.00</p></td>
        <td width="519" valign="top"><p>-      De fibras sintéticas o    artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6114.90</p></td>
        <td width="519" valign="top"><p>-      De las demás materias    textiles:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6114.90.10.00</p></td>
        <td width="519" valign="top"><p>-      -      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6114.90.90.00</p></td>
        <td width="519" valign="top"><p>-      -      Los demás</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>61.15</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Calzas, panty-medias, leotardos, medias, calcetines y demás artículos    de calcetería, incluso de compresión progresiva (por ejemplo, medias para    varices), de punto. </strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6115.10</p></td>
        <td width="519" valign="top"><p>-      Calzas,  panty-medias, leotardos y medias, de    compresión progresiva (por  ejemplo,    medias para varices):</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6115.10.10.00</p></td>
        <td width="519" valign="top"><p>-      -      Medias de compresión progresiva</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6115.10.90.00</p></td>
        <td width="519" valign="top"><p>-      -      Las demás</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Las demás calzas,    panty-medias y leotardos:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6115.21.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas, de título    inferior a 67 decitex por hilo sencillo</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6115.22.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas, de título    superior o igual a 67 decitex por hilo sencillo</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6115.29.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6115.30</p></td>
        <td width="519" valign="top"><p>-      Las demás medias de    mujer, de título inferior a 67 decitex por hilo sencillo:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6115.30.10.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6115.30.90.00</p></td>
        <td width="519" valign="top"><p>-      -      Las demás</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Los demás:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6115.94.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6115.95.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6115.96.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6115.99.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>61.16</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Guantes, mitones y manoplas, de punto.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6116.10.00.00</p></td>
        <td width="519" valign="top"><p>-      Impregnados, recubiertos    o revestidos con plástico o caucho</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Los demás:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6116.91.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6116.92.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6116.93.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6116.99.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>61.17</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Los demás complementos (accesorios) de vestir confeccionados, de    punto; partes de prendas o de complementos (accesorios), de vestir, de punto.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6117.10.00.00</p></td>
        <td width="519" valign="top"><p>-      Chales, pañuelos de    cuello, bufandas, mantillas, velos y artículos similares</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6117.80</p></td>
        <td width="519" valign="top"><p>-      Los demás complementos    (accesorios) de vestir:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6117.80.10.00</p></td>
        <td width="519" valign="top"><p>-      -      Rodilleras y tobilleras</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6117.80.20.00</p></td>
        <td width="519" valign="top"><p>-      -      Corbatas y lazos similares</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6117.80.90.00</p></td>
        <td width="519" valign="top"><p>-      -      Los demás</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6117.90</p></td>
        <td width="519" valign="top"><p>-      Partes:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6117.90.10.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas o artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6117.90.90.00</p></td>
        <td width="519" valign="top"><p>-      -      Las demás</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>62.01</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Abrigos, chaquetones, capas, anoraks, cazadoras y artículos similares,    para hombres o niños, excepto los artículos de la partida 62.03.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Abrigos, impermeables,    chaquetones, capas y artículos similares:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6201.11.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6201.12.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6201.13.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas o artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6201.19.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Los demás:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6201.91.00.00</p></td>
        <td width="519" valign="top"><p>-      -         De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6201.92.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6201.93.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas o artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6201.99.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>62.02</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Abrigos, chaquetones, capas, anoraks, cazadoras y artículos similares,    para mujeres o niñas, excepto los artículos de la partida 62.04.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Abrigos, impermeables,    chaquetones, capas y artículos similares:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6202.11.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6202.12.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6202.13.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas o artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6202.19.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Los demás:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6202.91.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6202.92.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6202.93.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas o artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6202.99.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>62.03</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Trajes (ambos o ternos), conjuntos, chaquetas (sacos), pantalones    largos, pantalones con peto, pantalones cortos (calzones) y shorts (excepto    de baño), para hombres o niños.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Trajes (ambos o ternos):</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6203.11.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6203.12.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6203.19.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Conjuntos:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6203.22.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6203.23.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6203.29</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6203.29.10.00</p></td>
        <td width="519" valign="top"><p>-      -      -         De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6203.29.90.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Los demás</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Chaquetas (sacos):</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6203.31.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6203.32.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6203.33.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6203.39.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Pantalones largos, pantalones    con peto, pantalones cortos (calzones) y shorts:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6203.41.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6203.42</p></td>
        <td width="519" valign="top"><p>-      -      De algodón:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6203.42.10.00</p></td>
        <td width="519" valign="top"><p>-      -      -         De  tejidos llamados «mezclilla    o denim»</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6203.42.20.00</p></td>
        <td width="519" valign="top"><p>-      -      -         De terciopelo rayado    («corduroy»)</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6203.42.90.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Los demás</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6203.43.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6203.49.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>62.04</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Trajes sastre, conjuntos, chaquetas (sacos), vestidos, faldas, faldas    pantalón, pantalones largos, pantalones con peto, pantalones cortos    (calzones) y shorts (excepto de baño), para mujeres o niñas.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Trajes sastre:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6204.11.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6204.12.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6204.13.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6204.19.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Conjuntos:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6204.21.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6204.22.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6204.23.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6204.29.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Chaquetas (sacos):</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6204.31.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6204.32.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6204.33.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6204.39.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Vestidos:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6204.41.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6204.42.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6204.43.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6204.44.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6204.49.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Faldas y faldas pantalón:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6204.51.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6204.52.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6204.53.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6204.59.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Pantalones largos,    pantalones con peto, pantalones cortos (calzones) y shorts:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6204.61.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6204.62.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6204.63.00.00</p></td>
        <td width="519" valign="top"><p>-      -         De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6204.69.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>62.05</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Camisas para hombres o niños.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6205.20.00.00</p></td>
        <td width="519" valign="top"><p>-      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6205.30.00.00</p></td>
        <td width="519" valign="top"><p>-      De fibras sintéticas o    artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6205.90</p></td>
        <td width="519" valign="top"><p>-      De las demás materias    textiles:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6205.90.10.00</p></td>
        <td width="519" valign="top"><p>-      -      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6205.90.90.00</p></td>
        <td width="519" valign="top"><p>-      -      Los demás</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>62.06</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Camisas, blusas y blusas camiseras, para mujeres o niñas.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6206.10.00.00</p></td>
        <td width="519" valign="top"><p>-      De seda o desperdicios de    seda</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6206.20.00.00</p></td>
        <td width="519" valign="top"><p>-      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6206.30.00.00</p></td>
        <td width="519" valign="top"><p>-      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6206.40.00.00</p></td>
        <td width="519" valign="top"><p>-      De fibras sintéticas o    artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6206.90.00.00</p></td>
        <td width="519" valign="top"><p>-      De las demás materias    textiles</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>62.07</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Camisetas, calzoncillos (incluidos los largos y los slips), camisones,    pijamas, albornoces de baño, batas de casa y artículos similares, para    hombres o niños.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Calzoncillos (incluidos    los largos y los slips):</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6207.11.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6207.19.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Camisones y pijamas:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6207.21.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6207.22.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas o artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6207.29.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Los demás:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6207.91.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6207.99</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6207.99.10.00</p></td>
        <td width="519" valign="top"><p>-      -      -         De fibras sintéticas o artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6207.99.90.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Los demás</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>62.08</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Camisetas, combinaciones, enaguas, bragas (bombachas, calzones)    (incluso las que no llegan hasta la cintura), camisones, pijamas, saltos de    cama, albornoces de baño, batas de casa y artículos similares, para mujeres o    niñas.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Combinaciones y enaguas:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6208.11.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas o artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6208.19.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Camisones y pijamas:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6208.21.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6208.22.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas o artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6208.29.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Los demás:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6208.91.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6208.92.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas o artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6208.99.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>62.09</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Prendas y complementos (accesorios), de vestir, para bebés.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6209.20.00.00</p></td>
        <td width="519" valign="top"><p>-      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6209.30.00.00</p></td>
        <td width="519" valign="top"><p>-      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6209.90</p></td>
        <td width="519" valign="top"><p>-      De las demás materias    textiles:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6209.90.10.00</p></td>
        <td width="519" valign="top"><p>-      -      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6209.90.90.00</p></td>
        <td width="519" valign="top"><p>-      -      Las demás</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>62.10</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Prendas de vestir confeccionadas con productos de las partidas 56.02,    56.03, 59.03, 59.06 ó 59.07.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6210.10.00.00</p></td>
        <td width="519" valign="top"><p>-      Con productos de las    partidas 56.02 ó 56.03</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6210.20.00.00</p></td>
        <td width="519" valign="top"><p>-      Las demás prendas de    vestir del tipo de las citadas en las subpartidas 6201.11a 6201.19</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6210.30.00.00</p></td>
        <td width="519" valign="top"><p>-      Las demás prendas de    vestir del tipo de las citadas en las subpartidas 6202.11 a 6202.19</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6210.40.00.00</p></td>
        <td width="519" valign="top"><p>-      Las demás prendas de    vestir para hombres o niños</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6210.50.00.00</p></td>
        <td width="519" valign="top"><p>-      Las demás prendas de vestir    para mujeres o niñas</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>62.11</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Conjuntos de abrigo para entrenamiento o deporte (chandales), monos    (overoles) y conjuntos de esquí y bañadores; las demás prendas de vestir.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Bañadores:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6211.11.00.00</p></td>
        <td width="519" valign="top"><p>-      -      Para hombres o niños</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6211.12.00.00</p></td>
        <td width="519" valign="top"><p>-      -      Para mujeres o niñas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6211.20.00.00</p></td>
        <td width="519" valign="top"><p>-      Monos (overoles) y    conjuntos de esquí</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Las demás prendas de    vestir para hombres o niños:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6211.32.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6211.33.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas o artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6211.39</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6211.39.10.00</p></td>
        <td width="519" valign="top"><p>-      -      -         De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6211.39.90.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Las demás</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Las demás prendas de    vestir para mujeres o niñas:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6211.42.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6211.43.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas o artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6211.49</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6211.49.10.00</p></td>
        <td width="519" valign="top"><p>-      -      -         De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6211.49.90.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Las demás</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>62.12</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Sostenes (corpiños), fajas, corsés, tirantes (tiradores), ligas y    artículos similares, y sus partes, incluso de punto.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6212.10.00.00</p></td>
        <td width="519" valign="top"><p>-      Sostenes (corpiños)</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6212.20.00.00</p></td>
        <td width="519" valign="top"><p>-      Fajas y fajas braga    (fajas bombacha)</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6212.30.00.00</p></td>
        <td width="519" valign="top"><p>-      Fajas sostén (fajas    corpiño)</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6212.90.00.00</p></td>
        <td width="519" valign="top"><p>-      Los demás</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>62.13</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Pañuelos de bolsillo.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6213.20.00.00</p></td>
        <td width="519" valign="top"><p>-      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6213.90</p></td>
        <td width="519" valign="top"><p>-      De las demás materias    textiles:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6213.90.10.00</p></td>
        <td width="519" valign="top"><p>-      -      De seda o desperdicios de seda</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6213.90.90.00</p></td>
        <td width="519" valign="top"><p>-      -      Las demás</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>62.14</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Chales, pañuelos de cuello, bufandas, mantillas, velos y artículos    similares.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6214.10.00.00</p></td>
        <td width="519" valign="top"><p>-      De seda o desperdicios de    seda</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6214.20.00.00</p></td>
        <td width="519" valign="top"><p>-      De lana o pelo fino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6214.30.00.00</p></td>
        <td width="519" valign="top"><p>-      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6214.40.00.00</p></td>
        <td width="519" valign="top"><p>-      De fibras artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6214.90.00.00</p></td>
        <td width="519" valign="top"><p>-      De las demás materias    textiles</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>62.15</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Corbatas y lazos similares.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6215.10.00.00</p></td>
        <td width="519" valign="top"><p>-      De seda o desperdicios de    seda</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6215.20.00.00</p></td>
        <td width="519" valign="top"><p>-      De fibras sintéticas o    artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6215.90.00.00</p></td>
        <td width="519" valign="top"><p>-      De las demás materias    textiles</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>6216.00</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Guantes, mitones y manoplas.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6216.00.10.00</p></td>
        <td width="519" valign="top"><p>-       Especiales para la    protección de trabajadores</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6216.00.90.00</p></td>
        <td width="519" valign="top"><p>-       Los demás</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>62.17</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Los demás complementos (accesorios) de vestir confeccionados; partes    de prendas o de complementos (accesorios), de vestir, excepto las de la    partida 62.12.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6217.10.00.00</p></td>
        <td width="519" valign="top"><p>-      Complementos (accesorios)    de vestir</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6217.90.00.00</p></td>
        <td width="519" valign="top"><p>-      Partes</p></td>
      </tr>
      <tr>
        <td width="121" valign="bottom"><p align="center"><strong>&nbsp;</strong></p></td>
        <td width="519" valign="bottom"><p align="center"><strong>I.     LOS DEMAS ARTICULOS TEXTILES CONFECCIONADOS</strong></p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>63.01</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Mantas.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6301.10.00.00</p></td>
        <td width="519" valign="top"><p>-      Mantas eléctricas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6301.20</p></td>
        <td width="519" valign="top"><p>-      Mantas de lana o pelo    fino (excepto las eléctricas):</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6301.20.10.00</p></td>
        <td width="519" valign="top"><p>-      -      De lana</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6301.20.20.00</p></td>
        <td width="519" valign="top"><p>-      -      De pelo de vicuña</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6301.20.90.00</p></td>
        <td width="519" valign="top"><p>-      -      Las demás</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6301.30.00.00</p></td>
        <td width="519" valign="top"><p>-      Mantas de algodón    (excepto las eléctricas)</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6301.40.00.00</p></td>
        <td width="519" valign="top"><p>-      Mantas de fibras    sintéticas (excepto las eléctricas)</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6301.90.00.00</p></td>
        <td width="519" valign="top"><p>-      Las demás mantas</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>63.02</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Ropa de cama, mesa, tocador o cocina.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6302.10</p></td>
        <td width="519" valign="top"><p>-      Ropa de cama, de punto:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6302.10.10.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas o artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6302.10.90.00</p></td>
        <td width="519" valign="top"><p>-      -      Las demás</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Las demás ropas de cama,    estampadas:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6302.21.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6302.22.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas o artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6302.29.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Las demás ropas de cama:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6302.31.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6302.32.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas o artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6302.39.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6302.40</p></td>
        <td width="519" valign="top"><p>-      Ropa de mesa, de punto:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6302.40.10.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas o artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6302.40.90.00</p></td>
        <td width="519" valign="top"><p>-      -      Las demás</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Las demás ropas de mesa:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6302.51.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6302.53.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas o artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6302.59</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6302.59.10.00</p></td>
        <td width="519" valign="top"><p>-      -      -         De lino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6302.59.90.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Las demás</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6302.60.00.00</p></td>
        <td width="519" valign="top"><p>-      Ropa de tocador o cocina,    de tejido con bucles del tipo toalla, de algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Las demás:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6302.91.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6302.93.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas o artificiales</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6302.99</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6302.99.10.00</p></td>
        <td width="519" valign="top"><p>-      -      -         De lino</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6302.99.90.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Las demás</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>63.03</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Visillos y cortinas; guardamalletas y rodapiés de cama.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      De punto:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6303.12.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6303.19</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6303.19.10.00</p></td>
        <td width="519" valign="top"><p>-      -      -         De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6303.19.90.00</p></td>
        <td width="519" valign="top"><p>-      -         -      Las demás</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Los demás:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6303.91.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6303.92.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6303.99.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>63.04</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Los demás artículos de tapicería, excepto los de la partida 94.04.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Colchas:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6304.11.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De punto</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6304.19.00.00</p></td>
        <td width="519" valign="top"><p>-      -      Las demás</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Los demás:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6304.91.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De punto</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6304.92.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón, excepto de punto</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6304.93.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas, excepto de punto</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6304.99.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles, excepto    de punto</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>63.05</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Sacos (bolsas) y talegas, para envasar.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6305.10</p></td>
        <td width="519" valign="top"><p>-      De yute o demás fibras    textiles del líber de la partida 53.03:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6305.10.10.00</p></td>
        <td width="519" valign="top"><p>-      -      De yute</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6305.10.90.00</p></td>
        <td width="519" valign="top"><p>-      -      Los demás</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6305.20.00.00</p></td>
        <td width="519" valign="top"><p>-      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      De materias textiles    sintéticas o artificiales:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6305.32.00.00</p></td>
        <td width="519" valign="top"><p>-      -      Continentes intermedios flexibles para    productos a granel</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6305.33</p></td>
        <td width="519" valign="top"><p>-      -      Los demás, de tiras o formas similares,    de polietileno o polipropileno:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6305.33.10.00</p></td>
        <td width="519" valign="top"><p>-      -      -         De polietileno</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6305.33.20.00</p></td>
        <td width="519" valign="top"><p>-      -      -         De polipropileno</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6305.39.00.00</p></td>
        <td width="519" valign="top"><p>-      -      Los demás</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6305.90</p></td>
        <td width="519" valign="top"><p>-      De las demás materias    textiles:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6305.90.10.00</p></td>
        <td width="519" valign="top"><p>-      -      De pita (cabuya, fique)</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6305.90.90.00</p></td>
        <td width="519" valign="top"><p>-      -      Las demás</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>63.06</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Toldos de cualquier clase; tiendas (carpas); velas para embarcaciones,    deslizadores o vehículos terrestres; artículos de acampar.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Toldos de cualquier    clase:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6306.12.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6306.19</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6306.19.10.00</p></td>
        <td width="519" valign="top"><p>-      -      -         De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6306.19.90.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Las demás</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Tiendas (carpas):</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6306.22.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De fibras sintéticas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6306.29.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6306.30.00.00</p></td>
        <td width="519" valign="top"><p>-      Velas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6306.40.00.00</p></td>
        <td width="519" valign="top"><p>-      Colchones neumáticos</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6306.90</p></td>
        <td width="519" valign="top"><p>-      Los demás:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6306.90.10.00</p></td>
        <td width="519" valign="top"><p>-      -      De algodón</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6306.90.90.00</p></td>
        <td width="519" valign="top"><p>-      -      De las demás materias textiles</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>63.07</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Los demás artículos confeccionados, incluidos los patrones para    prendas de vestir.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6307.10.00.00</p></td>
        <td width="519" valign="top"><p>-      Paños para fregar o lavar    (bayetas, paños rejilla), franelas y artículos similares para limpieza</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6307.20.00.00</p></td>
        <td width="519" valign="top"><p>-      Cinturones y chalecos    salvavidas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6307.90</p></td>
        <td width="519" valign="top"><p>-      Los demás:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6307.90.10.00</p></td>
        <td width="519" valign="top"><p>-      -      Patrones de prendas de vestir</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6307.90.20.00</p></td>
        <td width="519" valign="top"><p>-      -      Cinturones de seguridad</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6307.90.30.00</p></td>
        <td width="519" valign="top"><p>-      -      Mascarillas de protección</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6307.90.90.00</p></td>
        <td width="519" valign="top"><p>-      -      Los demás</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>6308.00.00.00</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Juegos constituidos por piezas de tejido e hilados, incluso con    accesorios, para la confección de alfombras, tapicería, manteles o    servilletas bordados o de artículos textiles similares, en envases para la    venta al por menor.</strong></p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>64.01</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Calzado impermeable con suela y parte superior de caucho o plástico,    cuya parte superior no se haya unido a la suela por costura o por medio de    remaches, clavos, tornillos, espigas o dispositivos similares, ni se haya    formado con diferentes partes unidas de la misma manera.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6401.10.00.00</p></td>
        <td width="519" valign="top"><p>-      Calzado con puntera    metálica de protección</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Los demás calzados:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6401.92.00.00</p></td>
        <td width="519" valign="top"><p>-      -      Que cubran el tobillo sin cubrir la    rodilla</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6401.99.00.00</p></td>
        <td width="519" valign="top"><p>-      -      Los demás</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>64.02</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Los demás calzados con suela y parte superior de caucho o plástico.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Calzado de deporte:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6402.12.00.00</p></td>
        <td width="519" valign="top"><p>-      -      Calzado de esquí y calzado para la    práctica de «snowboard» (tabla para nieve)</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6402.19.00.00</p></td>
        <td width="519" valign="top"><p>-      -      Los demás</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6402.20.00.00</p></td>
        <td width="519" valign="top"><p>-      Calzado con la parte    superior de tiras o bridas fijas a la suela por tetones (espigas)</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Los demás calzados:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6402.91.00.00</p></td>
        <td width="519" valign="top"><p>-      -      Que cubran el tobillo</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6402.99</p></td>
        <td width="519" valign="top"><p>-      -      Los demás:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6402.99.10.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Con puntera metálica de protección</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6402.99.90.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Los demás</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>64.03</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Calzado con suela de caucho, plástico, cuero natural o regenerado y    parte superior de cuero natural.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Calzado de deporte:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6403.12.00.00</p></td>
        <td width="519" valign="top"><p>-      -      Calzado de esquí y calzado para la    práctica de «snowboard» (tabla para nieve)</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6403.19.00.00</p></td>
        <td width="519" valign="top"><p>-      -      Los demás</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6403.20.00.00</p></td>
        <td width="519" valign="top"><p>-      Calzado con suela de    cuero natural y parte superior de tiras de cuero natural que pasan por el    empeine y rodean el dedo gordo</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6403.40.00.00</p></td>
        <td width="519" valign="top"><p>-      Los demás calzados, con    puntera metálica de protección</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Los demás calzados, con    suela de cuero natural:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6403.51.00.00</p></td>
        <td width="519" valign="top"><p>-      -      Que cubran el tobillo</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6403.59.00.00</p></td>
        <td width="519" valign="top"><p>-      -      Los demás</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Los demás calzados:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6403.91</p></td>
        <td width="519" valign="top"><p>-      -      Que cubran el tobillo:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6403.91.10.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Calzado con palmilla o plataforma de madera, sin plantillas ni puntera    metálica de protección</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6403.91.90.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Los demás</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6403.99</p></td>
        <td width="519" valign="top"><p>-      -      Los demás:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6403.99.10.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Calzado con palmilla o plataforma de madera, sin plantillas ni puntera    metálica de protección</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6403.99.90.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Los demás</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>64.04</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Calzado con suela de caucho, plástico, cuero natural o regenerado y    parte superior de materia textil.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Calzado con suela de    caucho o plástico:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6404.11</p></td>
        <td width="519" valign="top"><p>-      -      Calzado de deporte; calzado de tenis,    baloncesto, gimnasia, entrenamiento y calzados similares:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6404.11.10.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Calzado de deporte</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6404.11.20.00</p></td>
        <td width="519" valign="top"><p>-      -      -         Calzado de tenis, baloncesto, gimnasia, entrenamiento y calzados    similares</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6404.19.00.00</p></td>
        <td width="519" valign="top"><p>-      -      Los demás</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6404.20.00.00</p></td>
        <td width="519" valign="top"><p>-      Calzado con suela de    cuero natural o regenerado</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>64.05</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Los demás calzados.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6405.10.00.00</p></td>
        <td width="519" valign="top"><p>-      Con la parte superior de    cuero natural o regenerado</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6405.20.00.00</p></td>
        <td width="519" valign="top"><p>-      Con la parte superior de    materia textil</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>6405.90.00.00</p></td>
        <td width="519" valign="top"><p>-      Los demás</p></td>
      </tr>
      <tr>
        <td class="azul" width="121" valign="top"><p><strong>94.03</strong></p></td>
        <td class="azul" width="519" valign="top"><p><strong>Los demás muebles y sus partes.</strong></p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>9403.30.00.00</p></td>
        <td width="519" valign="top"><p>-      Muebles de madera de los    tipos utilizados en oficinas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>9403.40.00.00</p></td>
        <td width="519" valign="top"><p>-      Muebles de madera de los    tipos utilizados en cocinas</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>9403.50.00.00</p></td>
        <td width="519" valign="top"><p>-      Muebles de madera de los    tipos utilizados en dormitorios</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>9403.60.00.00</p></td>
        <td width="519" valign="top"><p>-      Los demás muebles de    madera</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>&nbsp;</p></td>
        <td width="519" valign="top"><p>-      Muebles de otras    materias, incluidos el roten (ratán), mimbre, bambú o materias similares:</p></td>
      </tr>
      <tr>
        <td width="121" valign="top"><p>9403.81.00.00</p></td>
        <td width="519" valign="top"><p>-      -      De bambú o rotén (ratán)</p></td>
      </tr>
    </table>      <p>&nbsp;</p></td>
  </tr>
  </table>
</body>
</html:html>