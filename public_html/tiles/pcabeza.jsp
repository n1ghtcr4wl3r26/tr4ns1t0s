<%@ page import="Main.*"%>

<%  ClaseSession cs = (ClaseSession) request.getSession().getAttribute("ClaseSession"); %>
<table border="0" width="100%" id="a">
<tr><td align="center" colspan="4">
<img src="img/TRANSITOS_logo.jpg" align="middle" />
</td></tr>
  <tr>
    <th>Usuario:</th><td><%=cs.getNomusu()%></td>
    
    <%if(cs.getSetapa() != null) {%>
    <th>Etapa:</th><td>
        <%=cs.getSetapa()%>
          </td>
    <%}else{%>
    <th>Etapa:</th><td>
        &nbsp;</td>
    <%}%>
  
  </tr>
</table>