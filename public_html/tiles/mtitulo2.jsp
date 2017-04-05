<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<html:html>
  <head>
    <meta name="copyright" content="© 2015, Aduana Nacional de Bolivia" lang="es"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="css/Estilos.css" rel="stylesheet" type="text/css" media="screen"/>
    <title><tiles:getAsString name="title"/></title>
  </head>
<script language="javascript" type="text/javascript">
bCancel = false;
</script>
<body>
<div align="center">
  <table style="height:100%;width:960px;" border=0 cellpadding=0 cellspacing=0 class="m">
    <tr height="20px"><td>
      <tiles:insert attribute="header"/>
    </td></tr>
    <tr align="center" valign="middle"><td>
      <html:errors/>
      <tiles:insert attribute="body"/>
    </td></tr>
    <tr height="20px"><td class="s9">
      <tiles:insert attribute="footer"/>
    </td></tr>
  </table>
</div>
</body>
</html:html>