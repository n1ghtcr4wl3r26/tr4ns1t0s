<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<!DOCTYPE html>
<html:html>
  <head>
    <meta charset="utf-8">
    <meta name="Autor" content="W. Roberto Albarracín Gutiérrez" lang="es"/>
    <meta name="copyright" content="© 2008, Aduana Nacional de Bolivia" lang="es"/>
    <link href="css/Estilos.css" rel="stylesheet" type="text/css" media="screen"/>
    <script type="text/javascript" src="js/jquery.js"></script>
    <title><tiles:getAsString name="title"/></title>
  </head>
  
<script language="javascript" type="text/javascript">
  bCancel = false;
</script>
<body>
<div align="center">
  <table style="height:100%;width:960px;" border=0 cellpadding=0 cellspacing=0 class="m">
    <tr height="20px"><td colspan="2">
        <tiles:insert attribute="header"/>
    </td></tr>
    <tr align="center" valign="middle"><td width="20%" valign="top">
      <tiles:insert attribute="vertical"/>
    </td><td valign="top">
      <html:errors/>
      <tiles:insert attribute="body"/>
    </td></tr>
    <tr height="20px"><td colspan="2" class="s9">
      <tiles:insert attribute="footer"/>
    </td></tr>
  </table>
</div>
</body>
</html:html>