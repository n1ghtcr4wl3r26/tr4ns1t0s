package eRegdocemb2295;


import Main.ClaseSession;
import Main.Ctte;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.naming.NamingException;

import javax.servlet.http.HttpServletRequest;

import javax.sql.DataSource;

import oracle.jdbc.OracleTypes;


public class eClaseSqlmanif
{
  private DataSource ds = null;
  private Connection cn = null;
  private Statement st = null;
  private ResultSet rs = null;
  String variacion = "NO";

  public eClaseSqlmanif () {}

  private void getConexion () throws SQLException, NamingException
  {
    InitialContext ic = new InitialContext();
    DataSource ds;
    ds = (DataSource)ic.lookup("jdbc/asy_transito");
    cn = (Connection)ds.getConnection();
    st = cn.createStatement();
  }

  private void getClose () throws SQLException
  {
    try
    {
      if (rs != null)
        rs.close();

      if (st != null)
        st.close();

      if (cn != null)
        cn.close();
    
      rs = null;
      ds = null;
      cn = null;
      st = null;
    }
    catch (SQLException e)
    {
      System.out.println(e.getMessage());
    }
  }

  public String pReadDataBase (HttpServletRequest request, int iOpcion)
  {
    try
    {
      this.getConexion();

      switch (iOpcion)
      {
     
          case Ctte.btbuscarManif:
              this.pDevManif(request);
              break;
      
          case Ctte.btebuscarManif:
              this.peDevManif(request);
              break;
          
          case Ctte.btgrabaDocemb:
              this.graba(request);
              break;
      
          case Ctte.btgrabamanif:
              this.grabamanif(request);
              break;
          
          case Ctte.btgrabamanofnoaut:
              this.grabamanifnoaut(request);
              break;          
          
          case 25:
              this.grabaautorizacionprevia(request);
              break;
          
      }
      return "";
    }
    catch (Exception e)
    {
      return e.getMessage();
    }
    finally
    {
      try
      {
            this.getClose();
      }
      catch (SQLException e)
      {
            return e.getMessage();
      }
    }
  }

 
    private void grabaautorizacionprevia(HttpServletRequest request) throws Exception {
        eBusqManifiestoForm bman = (eBusqManifiestoForm)request.getAttribute("eBusqManifiestoForm");
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
        
        
        CallableStatement call = null;
        call = cn.prepareCall("{? = call pkg_ds2295.graba_autorizacion_previa( ?, ?, ?, ?,  ?, ?,  ?,?,  ?,?,  ?,?,  ?,?,  ?,  ?   ,?,  ?,?) }");
        call.registerOutParameter(1, OracleTypes.VARCHAR);
        call.setString(2, bman.getVkey_cuo());
        call.setString(3, bman.getVkey_voy_nber());
        call.setString(4, bman.getVkey_dep_date());
        call.setString(5, bman.getVkey_bol_ref());
        
        call.setString(6, bman.getChkDS2600());
        call.setString(7, bman.getValds2600());
        
        call.setString(8, bman.getChkDS2657());
        call.setString(9, bman.getValds2657());
        
        call.setString(10, bman.getChkDS2751());
        call.setString(11, bman.getValds2751());
        
        call.setString(12, bman.getChkDS2752());
        call.setString(13, bman.getValds2752());
        
        call.setString(14, bman.getChkDS2752CAN());
        call.setString(15, bman.getValds2752CAN());
        
        call.setString(16, bman.getChkninguno());
        call.setString(17, cs.getCodusu());
        call.setString(18, bman.getVobservacion());
        //call.setString(12, bman.getDocemb_cantidad());
        call.setString(19, bman.getChkDS2865());
        call.setString(20, bman.getValds2865());
        
        
         
        call.execute();
        String rs = call.getString(1);

        if (!rs.equals("SI"))
            throw new Exception(rs);
    }
    

    private void pDevManif(HttpServletRequest request) throws Exception {
        eBusqManifiestoForm bman = (eBusqManifiestoForm)request.getAttribute("eBusqManifiestoForm");
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
        CallableStatement call = null;
        call = cn.prepareCall("{? = call pkg_ds2295.f_existe_manifiesto( ?, ?, ?, ?, ?, ?, ?,?,?,? ) }");
        call.registerOutParameter(1, OracleTypes.VARCHAR);
        call.setString(2, bman.getRefnroViaje());
        call.setString(3, bman.getRefaduanasel());
        call.setString(4, bman.getReffechaSalida());
        
        call.setString(5, bman.getReggestion());
        call.setString(6, bman.getRegaduanasel());
        call.setString(7, bman.getRegnroRegistro());
        
        call.setString(8, bman.getTipo().toUpperCase());
        
        call.registerOutParameter(9, OracleTypes.VARCHAR);
        call.registerOutParameter(10, OracleTypes.VARCHAR);
        call.registerOutParameter(11, OracleTypes.VARCHAR);
        
        call.execute();
        String rs = call.getString(1);
       
     if (!rs.equals("SI")){
            throw new Exception(rs);
     }else{

            String vskey_voy_nber = call.getString(9);
            String vskey_cuo = call.getString(10);
            String vskey_dep_date = call.getString(11);

            request.getSession().setAttribute("varrefnber", vskey_voy_nber);
             request.getSession().setAttribute("varaduana", vskey_cuo);
             request.getSession().setAttribute("vardepdate", vskey_dep_date);
         }
    }
    
    private void peDevManif(HttpServletRequest request) throws Exception {
        eBusqManifiestoForm bman = (eBusqManifiestoForm)request.getAttribute("eBusqManifiestoForm");
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
        CallableStatement call = null;
        call = cn.prepareCall("{? = call pkg_ds2295.fe_existe_manifiesto( ?, ?, ?, ?, ?, ?, ?,?,?,? ) }");
        call.registerOutParameter(1, OracleTypes.VARCHAR);
        call.setString(2, bman.getRefnroViaje());
        call.setString(3, bman.getRefaduanasel());
        call.setString(4, bman.getReffechaSalida());
        
        call.setString(5, bman.getReggestion());
        call.setString(6, bman.getRegaduanasel());
        call.setString(7, bman.getRegnroRegistro());
        
        call.setString(8, bman.getTipo().toUpperCase());
        
        call.registerOutParameter(9, OracleTypes.VARCHAR);
        call.registerOutParameter(10, OracleTypes.VARCHAR);
        call.registerOutParameter(11, OracleTypes.VARCHAR);
        
        call.execute();
        String rs = call.getString(1);
       
     if (!rs.equals("SI")){
            throw new Exception(rs);
     }else{

            String vskey_voy_nber = call.getString(9);
            String vskey_cuo = call.getString(10);
            String vskey_dep_date = call.getString(11);

            request.getSession().setAttribute("varrefnber", vskey_voy_nber);
             request.getSession().setAttribute("varaduana", vskey_cuo);
             request.getSession().setAttribute("vardepdate", vskey_dep_date);
         }
    }
    
    private void graba(HttpServletRequest request) throws Exception {
        eBusqManifiestoForm bman = (eBusqManifiestoForm)request.getAttribute("eBusqManifiestoForm");
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
        CallableStatement call = null;
        if(bman.getAduautpreviaext().equals("1")){
            call = cn.prepareCall("{? = call pkg_ds2295.graba_docemb2( ?, ?, ?, ?, ?,   ?) }");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.setString(2, bman.getKey_cuo());            
            call.setString(3, bman.getKey_voy_nber());
            call.setString(4, bman.getKey_dep_date());            
            call.setString(5, bman.getKey_bol_ref());
            call.setString(6, bman.getDocemb_fecha_embarque());            
            call.setString(7, cs.getCodusu());
            //call.setString(12, bman.getDocemb_cantidad());
        }
        else
        {
            call = cn.prepareCall("{? = call pkg_ds2295.graba_docemb_enmienda( ?, ?, ?, ?, ?,   ?, ?,?, ?, ? ,?,?) }");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.setString(2, bman.getKey_cuo());
            
            call.setString(3, bman.getKey_voy_nber());
            call.setString(4, bman.getKey_dep_date());
            
            call.setString(5, bman.getKey_bol_ref());
            call.setString(6, bman.getDocemb_fecha_embarque());
            
            call.setString(7, bman.getDocemb_silista_rs1392015());
            
            call.setString(8, bman.getDocemb_si_pri_rs1692016());
            call.setString(9, bman.getDocemb_si_seg_rs1692016());
            call.setString(10, bman.getDocemb_otras_mercancias());
            call.setString(11, bman.getDocemb_cantidad_partidas());
            call.setString(12, cs.getCodusu());
            call.setString(13, bman.getVobs2295());
            //call.setString(12, bman.getDocemb_cantidad());
        }         
        call.execute();
        String rs = call.getString(1);
        if (!rs.equals("SI"))
            throw new Exception(rs);
    }
    
    
    private void grabamanif(HttpServletRequest request) throws Exception {
        eBusqManifiestoForm bman = (eBusqManifiestoForm)request.getAttribute("BusqManifiestoForm");
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
        CallableStatement call = null;
        call = cn.prepareCall("{? = call pkg_ds2295.graba_man_autorizado( ?, ?, ?, ?, ? ) }");
        call.registerOutParameter(1, OracleTypes.VARCHAR);
        call.setString(2, bman.getKey_cuo());
        
        call.setString(3, bman.getKey_voy_nber());
        call.setString(4, bman.getKey_dep_date());
        call.setString(5, bman.getDocemb_cantidad());
        call.setString(6, cs.getCodusu());

        call.execute();
        String rs = call.getString(1);
        if (!rs.equals("SI"))
            throw new Exception(rs);
    }    

    
    private void grabamanifnoaut(HttpServletRequest request) throws Exception {
        eBusqManifiestoForm bman = (eBusqManifiestoForm)request.getAttribute("eBusqManifiestoForm");
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
        CallableStatement call = null;
        call = cn.prepareCall("{? = call pkg_ds2295.graba_docemb_no_autorizado( ?, ?, ?, ? ) }");
        call.registerOutParameter(1, OracleTypes.VARCHAR);
        call.setString(2, bman.getKey_cuo());
        
        call.setString(3, bman.getKey_voy_nber());
        call.setString(4, bman.getKey_dep_date());
        
        call.setString(5, cs.getCodusu());
        
        
         
        call.execute();
        String rs = call.getString(1);
        if (!rs.equals("SI"))
            throw new Exception(rs);
    }  
    
    
}

