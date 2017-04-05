<?xml version="1.0" encoding="iso-8859-1"?>
<%response.setContentType( "text/xml" );%>
<%@ page import="java.sql.CallableStatement"%>
<%@ page import="oracle.jdbc.pool.OracleConnectionPoolDataSource"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="oracle.jdbc.OracleTypes"%>
<%@ page import="Main.*"%>

<%
  String aduana = request.getParameter( "adu" );
  String vnber = request.getParameter( "vnber" );    
  String vdepd = request.getParameter( "vdepd" );
  String vbolr = request.getParameter( "vbolr" );  
  
  DataSource ds = null;
  Connection cn = null;
  Statement st = null;
  
  String xml = "";
  ClaseSession cs = (ClaseSession) request.getSession().getAttribute( "ClaseSession" );
  
  try
    {

    InitialContext ic = new InitialContext();
    ds = (DataSource)ic.lookup("jdbc/asy_transito");
    cn = (Connection)ds.getConnection();
    st = cn.createStatement();
    ResultSet rs = null;

    CallableStatement call = null;
    call = cn.prepareCall("{? = call "+cs.getEsquema()+".PKG_MANIFIESTODOCS_MEM.lista_doc_adicional( ?, ?, ?, ? ) }");
    call.registerOutParameter( 1, OracleTypes.CURSOR );
    
    call.setString( 2, aduana);
    call.setString( 3, vnber);
    call.setString( 4, vdepd);
    call.setString( 5, vbolr);
    
    call.execute();

    rs = (ResultSet) call.getObject( 1 );
    if(! (rs == null || !rs.next()) ){
    
        xml=xml+"<documento><ans>Correcto</ans>";
        do{
        
        xml=xml+ "<items><doccod>"+(String) rs.getString( 1 )+"</doccod>"+
        "<atddsc>"+(String) rs.getString( 2 )+"</atddsc>"+
        "<mostrar>"+(String) rs.getString( 3 )+"</mostrar>"+
        "<obligatorio>"+(String) rs.getString( 4 )+"</obligatorio>"+
        "<condicion>"+(String) rs.getString( 5 )+"</condicion>"+
        "<fecha>"+(String) rs.getString( 6 )+"</fecha>"+
        "<numero>"+(String) rs.getString( 7 )+"</numero>"+
        "</items>";
        } while( rs.next() );
        xml=xml+"</documento>";
        
      }else{
      
        xml=xml+"<documento><ans>Error</ans></documento>";
      }
    }
    catch( SQLException e )
    {
      e.printStackTrace();
        if (st != null)
          st.close();
    
        if (cn != null)
          cn.close();
    
       ds = null;
       st = null;
       cn = null;
    }

    catch (Exception e)
    {
        e.printStackTrace();
          if (st != null)
            st.close();
    
          if (cn != null)
            cn.close();
    
        ds = null;
        st = null;
        cn = null;
    
      xml=xml+"<documento><ans>Error</ans></documento>";
    }
    finally
    {
        try
            {
              if (st != null)
                st.close();
        
              if (cn != null)
                cn.close();
        
                ds = null;
                st = null;
                cn = null;
                
            }
            catch( Exception e )
            {
              e.printStackTrace();
            }
            
    %><%= xml %><%
    
    }
%>