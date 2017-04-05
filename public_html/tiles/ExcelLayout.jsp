<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

<%
  
  response.setHeader("Cache-control", "no-cache");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
  //response.setHeader("Content-Disposition", "attachment; filename=\"tmp.xls\"");
  response.setHeader("Content-Disposition", "attachment; filename=\"Control_Riesgo.xls\"");
%>
<html>
<head>
  <meta name="description" content="Reportes de Seguimiento y Control de Selectividad">
  <meta name="Author" content="Edgar Joaquin Arteaga Gutierrez" lang="es"> 
  <meta name="copyright" content="2015, Aduana Nacional de Bolivia" lang="es">   
   
  <title>Reporte de Control de Riesgo</title>

</head>
<body>

    <tiles:insert attribute="body"/>

</body>
</html>

