<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.ArrayList" %>
<%
 // String nFile = request.getParameter( "arch" );
  //String nRuta = request.getParameter( "ruta" );
  
  String nFile = "";//request.getParameter( "arch" );
  String nRuta = "";//request.getParameter( "ruta" );
  
   //nFile = request.getParameter( "arch" );
   nRuta = request.getParameter( "ruta" );
   nFile = nRuta.substring(nRuta.lastIndexOf("/")+1);
   nFile = nFile.replace(" ","+");
   nRuta = nRuta.replace(" ","+");
   /*Utilidadesbase64 base = new Utilidadesbase64();
   nFile = base.Desencriptar(nFile);
   nRuta = base.Desencriptar(nRuta);*/
try
{
    FileInputStream archivo = new FileInputStream(nRuta);
    int longitud = archivo.available();
    byte[] datos = new byte[longitud];
    archivo.read(datos);
    archivo.close();

    response.setContentType("application/octet-stream");
    response.setHeader("Content-Disposition","attachment;filename=\""+nFile+"\"");

    ServletOutputStream ouputStream = response.getOutputStream();
    ouputStream.write(datos);
    ouputStream.flush();
    ouputStream.close();

}
catch(Exception e)
{ 
    e.printStackTrace();
} 
%>
