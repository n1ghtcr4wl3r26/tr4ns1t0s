<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<%@ page import="Main.*, Transito.*"%>

<%

  request.getSession().removeAttribute( "ClaseSession" );
  request.getSession().removeAttribute( "AsignaRutaPlazoForm" );
  request.getSession().removeAttribute( "ActaTnaForm" );
%>

<script language="JavaScript" type="text/JavaScript">

  document.location = "http://www.aduana.gob.bo"

</script>
