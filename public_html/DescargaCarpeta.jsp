<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="java.io.*"%>
<%
  String nFile = request.getParameter( "zip" );String manif = request.getParameter( "manif" );response.setHeader("Content-Disposition","attachment;filename="+manif+".zip"); response.setContentType("application/octet-stream");
 // String nRuta = request.getParameter( "ruta" );
try
{
    FileInputStream archivo = new FileInputStream(nFile);
    int longitud = archivo.available();
    byte[] datos = new byte[longitud];
    archivo.read(datos);
    archivo.close();

    ServletOutputStream ouputStream = response.getOutputStream();
    ouputStream.write(datos);
    ouputStream.flush();
    ouputStream.close();
}
catch(Exception e)
{ 
    e.printStackTrace();
}%>