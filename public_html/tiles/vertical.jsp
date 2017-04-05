<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ page import="Main.*,Usuario.*,java.util.*"%>

<%
  ClaseSession cs = (ClaseSession) request.getSession().getAttribute("ClaseSession");
  boolean menu = false;
%>
<tiles:importAttribute/>
<html:form action="/MenuAction">
  <html:hidden property="etapa"/>
  <table border="0" cellspacing="2" cellpadding="0" width="100%" id="b">
    <tr><th>&nbsp;</th></tr>
    <%
    try {
      String opcion="";
      ClaseMenu dmenu;
      
      Iterator i = cs.getLista().iterator();
      while( i.hasNext() ) {
            dmenu = (ClaseMenu)i.next();
            opcion = "etapa.value="+dmenu.getCodigo();
            
            if(dmenu.getNivel() == 200){
                %><tr><td class="t14"><%= dmenu.getDsc() %></td></tr><%                    
            }
            else {
                %><tr><th><html:submit value="<%= dmenu.getDsc() %>" onclick="<%= opcion %>"/></th></tr><%
            }
      } 
    } catch(Exception e) 
    { System.out.println(e.getMessage()); }%>
  </table>
 

</html:form>


