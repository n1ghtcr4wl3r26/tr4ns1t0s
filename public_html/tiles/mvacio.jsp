<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<html:html>
  <head>
    <meta name="Autor" content="W. Roberto Albarracín Gutiérrez" lang="es"/>
    <meta name="copyright" content="© 2008, Aduana Nacional de Bolivia" lang="es"/>
    <link href="css/Estilos.css" rel="stylesheet" type="text/css" media="screen"/>
    <title><tiles:getAsString name="title"/></title>
  </head>
<script language="javascript" type="text/javascript">
bCancel = false;
</script>

<body>
  <table width="100%" border="0" style="margin:0 auto">
    <tr>
      <td align="center" valign="middle">
        <tiles:insert attribute="body"/>
      </td>
    </tr>
    <tr height="20px">
      <td class="s9">
        <tiles:insert attribute="footer"/>
      </td>
    </tr>
  </table>
</body>
</html:html>