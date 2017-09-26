package Transito;


//import ManifiestoDocs.ManifiestoForm;


import DepositoTrans.RegLlegDepositoTransitorioForm;

import Digitalizacion.DigitalizacionImagenesForm;

import Etiqueta.TransitoTag;

import Main.ClaseSession;
import Main.Ctte;

import ManifiestoDocs.ManifiestoForm;
import ManifiestoDocs.fun_util;

import Rutas.RutaForm;

import bo.gob.aduana.sga.client.ClienteSGA;
import bo.gob.aduana.sga.client.SGAResponse;
import bo.gob.aduana.sga.proxy.ws.service.impl.BusinessException;

import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import java.net.MalformedURLException;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;

import javax.naming.InitialContext;

import javax.servlet.http.HttpServletRequest;

import javax.sql.DataSource;

import oracle.jdbc.OracleTypes;

import org.apache.commons.codec.binary.Base64;
import org.apache.struts.upload.FormFile;


//EDGAR ARTEAGA NUEVO OCE 18122014


public class ClaseSql {

    private DataSource ds = null;
    public Connection cn = null;
    public Statement st = null;
  private ResultSet rs = null;
    
    
    private String fechab = "";

      public void getConexion() throws Exception {
        InitialContext ic = new InitialContext();
        DataSource ds = (DataSource)ic.lookup("jdbc/asy_transito");
        cn = ds.getConnection();
        st = cn.createStatement();
    }
    /*PARA DESPACHO ABREVIADO*/  
    public void getConexionMira() throws Exception {
      InitialContext ic = new InitialContext();
      DataSource ds = (DataSource)ic.lookup("jdbc/mira");
      cn = ds.getConnection();
      st = cn.createStatement();
    }
    /*
    public void getConexion3() throws Exception {
        InitialContext ic = new InitialContext();
        DataSource ds = (DataSource)ic.lookup("jdbc/mira");
        cn = ds.getConnection();
        st = cn.createStatement();
    }  
    
    private void getConexion2 () throws SQLException, NamingException
    {
      InitialContext ic = new InitialContext();
      DataSource ds;
      ds = (DataSource)ic.lookup("jdbc/mira");
      cn = (Connection)ds.getConnection();
      st = cn.createStatement();
    }
    
    private void getClose2 () throws SQLException
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
*/
    

    public void getClose() {
        try {
            if (st != null) {
                st.close();
            }

            if (cn != null) {
                cn.close();
            }

            cn = null;
            st = null;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    /*
    public String pReadDataBase (HttpServletRequest request, int iOpcion)
    {
      try
      {
        this.getConexion2();

        switch (iOpcion)
        {
        case Ctte.dbCargaPDF:
                this.pSubePDFD(request);
                break;
        case Ctte.dbEliPDF:
                this.pElimPDFD(request);
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
              this.getClose2();
        }
        catch (SQLException e)
        {
              return e.getMessage();
        }
      }
    }
    
        */
    
    

    public void pAccesoDatos(HttpServletRequest request, int opcion) throws Exception {
        try {
            this.getConexion();

            switch (opcion) {
            case Ctte.dbEstado:
                this.fEstadoTramite(request);

                break;

            case Ctte.dbGrabaAsignaRutaPlazo:
                this.fGrabaRutaPlazo(request);

                break;

            case Ctte.dbGrabaCierreRutaPlazo:
                this.fGrabaCierreRutaPlazo(request);

                break;
                //transbordo de transito
            case Ctte.dbGrabaTransbordoRutaPlazo:
                this.fGrabaTransbordoRutaPlazo(request);
                break;

                //subir imagenes 22092015
            case Ctte.dbGrabaImagen:
                this.fGrabaImagen(request);
                break;

            case Ctte.dbEliminaImagen:
                this.fEliminaImagen(request);
                break;

            case Ctte.dbGrabaActaTna:
                this.fGrabaTna(request);

                break;

            case Ctte.dbAnadeRutaPlazo:
                this.fGrabaPlazoHoras(request);

                break;

            case Ctte.dbVerificaEtiqueta:
                this.fVerificaEtiqueta(request);

                break;
                //PlazoEtiqueta
            case Ctte.dbVerificaPlazoEtiqueta:
                this.fVerificaPlazoEtiqueta(request);
                break;
            case Ctte.dbGrabaPlazoEtiqueta:
                this.fGrabaPlazoEtiqueta(request);
                break;
            case Ctte.dbGrabarLlegadaDepTransitorio:
                this.fGrabaLlegadaDepositoTransitorio(request);
                break;
                

            
            }
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            this.getClose();
        }
    }
    public String pReadDataBase (HttpServletRequest request, int iOpcion)
    {
      try
      {
        this.getConexion();

        switch (iOpcion)
        {
        case Ctte.dbCargaPDF:
            this.pSubePDFD(request);
            break;
        case Ctte.dbEliPDF:
            this.pElimPDFD(request);
            break;
        
        case Ctte.dbGrabaCab:
            this.pGrabaCab(request);
            break;
        
        case Ctte.dbDescargaZip:
            this.pDescargaZip(request);
            break;
        
        case Ctte.dbCargaParcial:
            this.pCargaParcial(request);
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
                  this.getClose();
            
        }
    }
    public void fEstadoTramite(HttpServletRequest request) throws Exception {
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
        TramiteForm bTramite = (TramiteForm)request.getAttribute("TramiteForm");
        
        CallableStatement call = null;
        ResultSet rs = null;
        String sI;
        if(bTramite.getDeposito() != null && bTramite.getDeposito().equals("SI"))
        {
            call = cn.prepareCall("{? = call pkg_transito.verfica_transito_dep( ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ) }");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.registerOutParameter(8, OracleTypes.VARCHAR);
            call.registerOutParameter(9, OracleTypes.VARCHAR);
            call.registerOutParameter(10, OracleTypes.CURSOR);
            call.registerOutParameter(11, OracleTypes.CURSOR);
            call.setString(2, bTramite.getAduana());
            call.setString(3, bTramite.getGestion());
            call.setString(4, bTramite.getRegistro());
            call.setString(5, cs.getAduanas());
            call.setString(6, cs.getCodusu());
            call.setShort(7, cs.getOpcion());
            call.execute();
            sI = (String)call.getObject(1);
        } else {
            call = cn.prepareCall("{? = call pkg_transito.verfica_transito( ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ) }");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.registerOutParameter(8, OracleTypes.VARCHAR);
            call.registerOutParameter(9, OracleTypes.VARCHAR);
            call.registerOutParameter(10, OracleTypes.CURSOR);
            call.registerOutParameter(11, OracleTypes.CURSOR);
            call.setString(2, bTramite.getAduana());
            call.setString(3, bTramite.getGestion());
            call.setString(4, bTramite.getRegistro());
            call.setString(5, cs.getAduanas());
            call.setString(6, cs.getCodusu());
            call.setShort(7, cs.getOpcion());
            call.execute();
            sI = (String)call.getObject(1);
        }
        
        
        String res = "0";
        int i = Integer.parseInt(sI);
        if (bTramite.getAduana().substring(0, 1).equals("0"))
            res = Devuelve_Estado(bTramite.getAduana(), bTramite.getGestion(), bTramite.getRegistro());

        switch (i) {
        case Ctte.mt_correcto:
            break;
        
        case 150:
            throw new Exception("No Tiene registro de arribado a Dep\363sito Transitorio");

        case Ctte.mt_tna:
            throw new Exception("Tiene un transito no arribado");

        case Ctte.mt_concluido:
            throw new Exception("El Tr&aacute;nsito ya est&aacute; concluido");

        case Ctte.mt_eliminado:
            if (res.equals("M")) {
                throw new Exception("El Tr&aacute;nsito ya est&aacute; registrado");
            } else {
                throw new Exception("El Tr&aacute;nsito fue cancelado anteriormente");
            }

        case Ctte.mt_no_existe:

            if (cs.getOpcion() == Ctte.eInicio) {
                throw new Exception("El Manifiesto no est&aacute; registrado");
            } else {
                if (res.equals("M")) {
                    throw new Exception("El Tr&aacute;nsito no realiz&oacute; Registro Salida de Puerto");
                } else {
                    throw new Exception("El Tr&aacute;nsito no est&aacute; registrado");
                }
            }

        case Ctte.mt_no_usuario:

            if (cs.getOpcion() == Ctte.ePaso) {
                throw new Exception("El Usuario no est&aacute; registrado en la Aduana de Paso");
            } else {
                throw new Exception("El Usuario no est&aacute; registrado en la Aduana de Partida");
            }

        case Ctte.mt_nuevo:
            throw new Exception("El Tr&aacute;nsito no est&aacute; registrado");
        
        case 70:
                throw new Exception("El manifiesto no tiene registro de Control de Documento de Embarque");
        
        case 71:
                throw new Exception("No autorizado D.S. 2295");
        
        case 72:
                throw new Exception("No se puede iniciar tr&aacute;nsito, por mercanc&iacute;a con D.S. 2295");

        //Error DS2752 , devuelve excepciones por registro de algun documento de embarque asociado al DS2752
        case Ctte.mt_no_ds2752:
                throw new Exception("Requiere Autorizaci&oacute;n Previa D.S. 2752");
        
        case Ctte.mt_no_ds2752zf:
                throw new Exception("No compatible destino Zona Franca, D.S. 2752");
        //**************
        
        //Error DS2865 , devuelve excepciones por registro de algun documento de embarque asociado al DS2865
        case Ctte.mt_no_ds2865:
                throw new Exception("Requiere Autorizaci&oacute;n Previa D.S. 2865");
        
        case Ctte.mt_no_ds2865zf:
                throw new Exception("No compatible destino Zona Franca, D.S. 2865");
        //**************
        
        case Ctte.mt_placa_pendiente:
            throw new Exception("El Medio tiene un tr&aacute;nsito pendiente o no se encuentra habilitado");

        case Ctte.mt_registrado:
            throw new Exception("El tr&aacute;nsito ya est&aacute; registrado");

        case Ctte.mt_pendiente:
            throw new Exception("El tr&aacute;nsito ya est&aacute; registrado");

        case Ctte.mt_no_eliminado:
            throw new Exception("El tr&aacute;nsito no puede ser cerrado");

        case Ctte.mt_no_localizado:
            throw new Exception("El tr&aacute;nsito falta localizar");

        case Ctte.mt_no_aduana_paso1:
            throw new Exception("El Manifiesto de Partida no est&aacute; registrado en una Aduana Boliviana en el Exterior");

        case Ctte.mt_no_aduana_paso2:
            if (res.equals("M")) {
                throw new Exception("El Tr&aacute;nsito no realiz&oacute; Registro Salida de Puerto");
            } else {
                throw new Exception("El Tr&aacute;nsito ya realiz&oacute; un cierre");
            }

        case Ctte.mt_no_aduana_paso3:
            throw new Exception("El Tr&aacute;nsito ya registro la Aduana de Paso");

        case Ctte.mt_no_aduana_paso4:
            throw new Exception("El Tr&aacute;nsito no puede Reasignarse por que ya registro la Aduana de Paso");

        case Ctte.mt_no_aduana_pctl1:
            throw new Exception("El Manifiesto de Partida no est&aacute; registrado en un Aeropuerto Internacional");

        case Ctte.mt_no_aduana_pctl2:
            throw new Exception("El Tr&aacute;nsito ya realiz&oacute; un cierre");

        case Ctte.mt_no_aduana_pctl3:
            throw new Exception("El Tr&aacute;nsito ya se registro en el Punto de Control");

        case Ctte.mt_no_aduana_pctl4:
            throw new Exception("El Tr&aacute;nsito no puede Reasignarse por que ya se registro el Punto de Control");

        case Ctte.mt_no_aduana_pctl6:
            throw new Exception("Operaci&oacute;n no permitida. No corresponde su presentaci&oacute;n en Punto de Control por ser tr&aacute;nsito v&iacute;a terrestre.");

        case Ctte.mt_no_aduana_paso5:
            throw new Exception("El Tr&aacute;nsito no puede cancelarse por que ya registro la Aduana de Paso");

        case Ctte.mt_no_unico_salidapuerto:
            throw new Exception("El Tr&aacute;nsito " + bTramite.getAduana() + "/" + bTramite.getGestion() + "-" +
                                bTramite.getRegistro() + " ya ha sido registrado con Salida de Puerto o fue cerrado");

        case Ctte.mt_no_salidapuerto:
            throw new Exception("El Tr&aacute;nsito " + bTramite.getAduana() + "/" + bTramite.getGestion() + "-" +
                                bTramite.getRegistro() + " no ha sido registrado con Salida de Puerto");

        case Ctte.mt_no_man_operador:
            throw new Exception("El Tr&aacute;nsito " + bTramite.getAduana() + "/" + bTramite.getGestion() + "-" +
                                bTramite.getRegistro() + " esta asociado a medio de transporte NO vigente");

        case Ctte.mt_no_habilitadounetitab:
            throw new Exception("La Aduana no se encuentra habilitada para impresi&oacute;n de etiquetas.");

        case Ctte.mt_no_habilitadoimportador:
            throw new Exception("El Operador no tiene correctamente habilitada la tarjeta de operaciones, en la fecha del manifiesto.");

        }

        sI = (String)call.getObject(8);

        boolean bBoleta = sI.equals("0") ? false : true;

        sI = (String)call.getObject(9);

        boolean bTna = sI.equals("0") ? false : true;
        bTramite.setTna(bTna);

        cs.setKey_cuo(bTramite.getAduana());
        cs.setKey_year(bTramite.getGestion());
        cs.setKey_nber(bTramite.getRegistro());
        cs.setDscadu(bTramite.getSaduana());

        try {
            ResultSet rsc = null;

            switch (cs.getOpcion()) {
            case Ctte.eInicio:
                rsc = (ResultSet)call.getObject(10);
                this.fLeeAsignaRutaPlazo(request, rsc, bBoleta);

                break;

            case Ctte.eModificacion:
            case Ctte.ePaso:
            case Ctte.ePasoPtoCtl:
                rsc = (ResultSet)call.getObject(10);

                ResultSet rsi = (ResultSet)call.getObject(11);
                this.fLeeModificaRutaPlazo(request, rsc, rsi, bBoleta);

                break;

            case Ctte.eCierre:
                break;

            case Ctte.eFinalizacion:
                break;
            }
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    private void fLeeAsignaRutaPlazo(HttpServletRequest request, ResultSet rsc, boolean bBoleta) throws Exception {
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");

        if (!(rsc == null || !rsc.next())) {
            AsignaRutaPlazoForm bRuta = new AsignaRutaPlazoForm();
            request.getSession().setAttribute("AsignaRutaPlazoForm", bRuta);

            bRuta.setTiene(bBoleta);
            bRuta.setCodtrans(rsc.getString("car_car_cod"));
            bRuta.setDsctrans(rsc.getString("car_car_nam"));
            bRuta.setPlaca(rsc.getString("car_id_trp"));
            bRuta.setTiptra(rsc.getShort("car_mot_cod"));
            bRuta.setFecreg(rsc.getString("registro"));
            bRuta.setFeclim(rsc.getString("actual"));
            bRuta.setFecha(rsc.getString("fechaact"));
            bRuta.setHora(rsc.getString("horact"));
            bRuta.setPre2(rsc.getString("precinto"));
            bRuta.setPre1(rsc.getString("pre_emic"));

            do {
                ClaseLista cl = new ClaseLista(rsc.getString("tra_cuo_ini"), rsc.getString("tra_dsc_ini"));
                bRuta.getLista().add(cl);
            } while (rsc.next());
        } else {
            throw new Exception("El manifiesto no existe");
        }
    }

    private void fLeeModificaRutaPlazo(HttpServletRequest request, ResultSet rsc, ResultSet rsi,
                                       boolean bBoleta) throws Exception {
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");

        if (!(rsc == null || !rsc.next())) {
            AsignaRutaPlazoForm bRuta = new AsignaRutaPlazoForm();
            request.getSession().setAttribute("AsignaRutaPlazoForm", bRuta);

            bRuta.setTiene(bBoleta);
            bRuta.setCodtrans(rsc.getString("car_car_cod"));
            bRuta.setDsctrans(rsc.getString("car_car_nam"));
            bRuta.setPlaca(rsc.getString("car_id_trp"));
            bRuta.setTiptra(rsc.getShort("car_mot_cod"));
            bRuta.setFecreg(rsc.getString("registro"));
            bRuta.setFeclim(rsc.getString("actual"));
            bRuta.setFecha(rsc.getString("fechaact"));
            bRuta.setHora(rsc.getString("horact"));
            bRuta.setPre1(rsc.getString("tra_pre"));
            bRuta.setObs(rsc.getString("obs"));
            bRuta.setPre2(rsc.getString("precinto"));

            if (bBoleta) {
                bRuta.setBoleta(rsc.getString("act_boleta"));
                bRuta.setEntidad(rsc.getString("act_entidad"));
                bRuta.setFecfin(rsc.getString("act_fec_fin"));
                bRuta.setFecini(rsc.getString("act_fec_ini"));
                bRuta.setMoneda(rsc.getString("act_moneda"));
                bRuta.setMonto(rsc.getDouble("act_monto"));
            }

            if (!(rsi == null || !rsi.next())) {
                do {
                    ClaseLista cl =
                        new ClaseLista(rsi.getString("tra_cuo_est"), rsi.getString("tra_dsc_est"), rsi.getString("key_secuencia"),
                                       rsi.getString("fecdes"));
                    bRuta.getLista().add(cl);
                } while (rsi.next());
            }
        } else {
            throw new Exception("El manifiesto no existe");
        }
    }

    private void fGrabaRutaPlazo(HttpServletRequest request) throws Exception {
        AsignaRutaPlazoForm bRuta = (AsignaRutaPlazoForm)request.getSession().getAttribute("AsignaRutaPlazoForm");
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");

        ClaseLista lLista;
        String sLista = "";

        for (int j = 1; j < (bRuta.getLista().size() + 1); j++) {
            for (Iterator i = bRuta.getLista().iterator(); i.hasNext(); ) {
                lLista = (ClaseLista)i.next();

                if (Integer.parseInt(lLista.getAcceso()) == j) {
                    if (lLista.getIndex().equals("9")) {
                        sLista = sLista + lLista.getIndex() + ";" + lLista.getCodigo() + ";";
                    } else {
                        sLista = sLista + lLista.getAcceso() + ";" + lLista.getCodigo() + ";";
                    }
                }
            }
        }

        CallableStatement call = null;
        call = cn.prepareCall("{?=call pkg_transito.graba_ruta_plazo(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
        call.registerOutParameter(1, OracleTypes.VARCHAR);
        call.setString(2, cs.getKey_cuo());
        call.setString(3, cs.getKey_year());
        call.setString(4, cs.getKey_nber());
        call.setInt(5, bRuta.getTiptra());
        call.setString(6, bRuta.getFecha() + " " + bRuta.getHora());
        call.setString(7, bRuta.getPaso());
        call.setString(8, sLista);
        call.setString(9, bRuta.getPre1());
        call.setString(10, bRuta.getObs());
        call.setString(11, bRuta.getBoleta());
        call.setString(12, bRuta.getEntidad());
        call.setString(13, bRuta.getFecini());
        call.setString(14, bRuta.getFecfin());
        call.setDouble(15, bRuta.getMonto());
        call.setString(16, bRuta.getMoneda());

        call.setString(17, cs.getCodusu());

        call.execute();

        String sAns = (String)call.getObject(1);

        if (!sAns.equals("Correcto")) {
            Util ut = new Util();
            ut.ProcesoAsignaTecnico(cs.getKey_year(), cs.getKey_cuo(), cs.getKey_nber(), cs.getCodusu());
            throw new Exception(sAns);
        }
    }

    private void fGrabaCierreRutaPlazo(HttpServletRequest request) throws Exception {
        CierraRutaPlazoForm bRuta = (CierraRutaPlazoForm)request.getAttribute("CierraRutaPlazoForm");
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");

        CallableStatement call = null;
        call = cn.prepareCall("{? = call pkg_transito.cierra_transito( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ) }");
        call.registerOutParameter(1, OracleTypes.VARCHAR);
        call.registerOutParameter(13, OracleTypes.VARCHAR);
        call.setString(2, cs.getKey_cuo());
        call.setString(3, cs.getKey_year());
        call.setInt(4, Integer.parseInt(cs.getKey_nber()));
        call.setInt(5, Integer.parseInt(bRuta.getSecuencia()));
        call.setString(6, bRuta.getAduana());
        call.setString(7, bRuta.getFecha() + " " + bRuta.getHora());
        call.setString(8, bRuta.getCodtrans());
        call.setString(9, bRuta.getPlaca());
        call.setString(10, bRuta.getTipo());
        call.setString(11, bRuta.getObs());
        call.setString(12, cs.getCodusu());

        call.execute();

        String sAns = (String)call.getObject(1);

        if (sAns.equals("Correcto")) {
            bRuta.setHoras((String)call.getObject(13));
        } else {
            throw new Exception(sAns);
        }
    }

    private void fGrabaTransbordoRutaPlazo(HttpServletRequest request) throws Exception {
        TransbordoRutaPlazoForm bRuta = (TransbordoRutaPlazoForm)request.getAttribute("TransbordoRutaPlazoForm");
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");

        CallableStatement call = null;
        call =
cn.prepareCall("{? = call pkg_transito.transbordo_transito( ?, ?, ?, ?, ?,  ?, ?, ?, ?, ?,  ?, ?,   ?, ?, ?, ?, ?,   ?, ?, ?    ) }");
        call.registerOutParameter(1, OracleTypes.VARCHAR);
        call.registerOutParameter(13, OracleTypes.VARCHAR);
        call.setString(2, cs.getKey_cuo());
        call.setString(3, cs.getKey_year());
        call.setInt(4, Integer.parseInt(cs.getKey_nber()));
        call.setInt(5, Integer.parseInt(bRuta.getSecuencia()));
        call.setString(6, bRuta.getAduanacierre());
        call.setString(7, bRuta.getFecha() + " " + bRuta.getHora());
        call.setString(8, bRuta.getCodtrans());
        call.setString(9, bRuta.getPlaca());
        call.setString(10, bRuta.getTipo());
        call.setString(11, bRuta.getObs());
        call.setString(12, cs.getCodusu());

        call.setString(14, bRuta.getTipodoc());
        call.setString(15, bRuta.getModo());
        call.setString(16, bRuta.getPrecintos());
        call.setString(17, bRuta.getAduanades());
        call.setString(18, bRuta.getObsdes());

        call.registerOutParameter(19, OracleTypes.VARCHAR);
        call.registerOutParameter(20, OracleTypes.VARCHAR);
        call.registerOutParameter(21, OracleTypes.VARCHAR);


        call.execute();

        String sAns = (String)call.getObject(1);

        if (sAns.equals("Correcto")) {
            bRuta.setHoras((String)call.getObject(13));

            bRuta.setManyear((String)call.getObject(19));
            bRuta.setMancuo((String)call.getObject(20));
            bRuta.setMannber((String)call.getObject(21));

        } else {
            throw new Exception(sAns);
        }


    }

    private void fGrabaImagen(HttpServletRequest request) throws Exception {
        DigitalizacionImagenesForm bean = (DigitalizacionImagenesForm)request.getAttribute("DigitalizacionImagenesForm");
        //AsignaRutaPlazoForm bRuta = (AsignaRutaPlazoForm)request.getSession().getAttribute("AsignaRutaPlazoForm");
        //ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");

        //subir archivo y devolver el nombre y la direccion del archivo
        SimpleDateFormat fFecha = new SimpleDateFormat("yyyyMMddHHmmss");
        Calendar fecha = Calendar.getInstance();
        fecha.setTime(fecha.getTime());
        String fecmarca = fFecha.format(fecha.getTime());
        String nombre_archivo;
        String nombre_archivo_thumb;

        
        
        String cod_img = bean.getCod_img();  //Util.devuelve_codimg_next(bean.getKey_cuo(), bean.getKey_year(), bean.getKey_nber());
        fecmarca = bean.getTipo_img()+"_"+cod_img;
        

        nombre_archivo = bean.getKey_year() + bean.getKey_cuo() + bean.getKey_nber() + "-" + fecmarca + ".jpg";
        nombre_archivo_thumb = bean.getKey_year() + bean.getKey_cuo() + bean.getKey_nber() + "-" + fecmarca + "_thumb" + ".jpg";

        File subdir = new File("/u03/oracle/user_projects/data/transitos_img/"+bean.getKey_cuo()+"/");
        //File subdir = new File("/u06/oracle/user_projects/data/transitos_img/"+bean.getKey_cuo()+"/");
        if(!subdir.exists())
            subdir.mkdir();
        File subdir1 = new File("/u03/oracle/user_projects/data/transitos_img/"+bean.getKey_cuo()+"/"+bean.getKey_year()+"/");
        //File subdir1 = new File("/u06/oracle/user_projects/data/transitos_img/"+bean.getKey_cuo()+"/"+bean.getKey_year()+"/");
        if(!subdir1.exists())
            subdir1.mkdir();    


        //String ruta = "/u03/oracle/user_projects/data/transitos_img/" + nombre_archivo;
        //String ruta_thumb = "/u03/oracle/user_projects/data/transitos_img/" + nombre_archivo_thumb;
        String ruta = "/u03/oracle/user_projects/data/transitos_img/"+bean.getKey_cuo()+"/"+bean.getKey_year()+"/" + nombre_archivo;
        //String ruta = "/u06/oracle/user_projects/data/transitos_img/"+bean.getKey_cuo()+"/"+bean.getKey_year()+"/" + nombre_archivo;
        String ruta_thumb = "/u03/oracle/user_projects/data/transitos_img/"+bean.getKey_cuo()+"/"+bean.getKey_year()+"/" + nombre_archivo_thumb;
        //String ruta_thumb = "/u06/oracle/user_projects/data/transitos_img/"+bean.getKey_cuo()+"/"+bean.getKey_year()+"/" + nombre_archivo_thumb;


        File arch = new File(ruta);

        //if (file.getFileSize() <= 0) {
        if (bean.getImagen_prev().length() <= 20) {
            throw new Exception("El Archivo no existe o esta vac&iacute;o. ");
        } else {

            //tamano de archivo permitido 500kb 
            //int tamfile = file.getFileSize();
          //  if (file.getFileSize() < 2524288) {
                //lee el archivo excel


                String imagebyte = bean.getImagen_prev();
                imagebyte = imagebyte.substring(23);
                
                
                
                byte[] buf = Base64.decodeBase64(imagebyte); //imagebyte.getBytes();
                
                           
                InputStream stream = new ByteArrayInputStream(buf);

                BufferedImage src2 = ImageIO.read(stream);
                
                if (src2.getWidth() > 1000) { //reducimos la resolucion

                                        int width2 = 1000;
                    int height2 = 1000 * src2.getHeight() / src2.getWidth();
                    BufferedImage dest2 = new BufferedImage(width2, height2, BufferedImage.TYPE_INT_RGB);
                    Graphics2D g2 = dest2.createGraphics();
                    AffineTransform at2 =
                        AffineTransform.getScaleInstance((double)width2 / src2.getWidth(), (double)height2 / src2.getHeight());
                    g2.drawRenderedImage(src2, at2);
                    
                    ImageIO.write(dest2, "jpg", new File(ruta));


                } else {
                    //mantenemos el tamaño de la imagen
                    InputStream stream2 = new ByteArrayInputStream(buf);
                    OutputStream bos = new FileOutputStream(ruta);
                    int bytesRead = 0;
                    byte[] buffer = new byte[8192];
                    while ((bytesRead = stream2.read(buffer, 0, 8192)) != -1) {
                        bos.write(buffer, 0, bytesRead);
                    }
                    bos.close();
                    stream2.close();
                }

                int width = 150;
                int height = 150;
                InputStream stream3 = new ByteArrayInputStream(buf);
                BufferedImage src = ImageIO.read(stream3);
                BufferedImage dest = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
                Graphics2D g = dest.createGraphics();
                AffineTransform at =
                AffineTransform.getScaleInstance((double)width / src.getWidth(), (double)height / src.getHeight());
                g.drawRenderedImage(src, at);
                ImageIO.write(dest, "jpg", new File(ruta_thumb));
                stream3.close();
                
            stream.close();

       

            CallableStatement call = null;
            call = cn.prepareCall("{? = call pkg_imagenes.graba_imagen_cod( ?, ?, ?, ?, ?,  ?, ?, ?, ?,?  ) }");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.setString(2, bean.getKey_cuo());
            call.setString(3, bean.getKey_year());
            call.setString(4, bean.getKey_nber());
            call.setString(5, cod_img);

            call.setString(6, bean.getTipo_img());
            call.setString(7, ruta);
            call.setString(8, ruta_thumb);
            call.setString(9, nombre_archivo);
            call.setString(10, nombre_archivo_thumb);
            call.setString(11, bean.getCodusu());


            call.execute();


            String sAns = (String)call.getObject(1);

            if (!sAns.equals("CORRECTO")) {
                throw new Exception(sAns);
            }
        }

    }

    private void fEliminaImagen(HttpServletRequest request) throws Exception {
        DigitalizacionImagenesForm bean = (DigitalizacionImagenesForm)request.getAttribute("DigitalizacionImagenesForm");
        //AsignaRutaPlazoForm bRuta = (AsignaRutaPlazoForm)request.getSession().getAttribute("AsignaRutaPlazoForm");
        //ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");

        CallableStatement call = null;
        call = cn.prepareCall("{? = call pkg_imagenes.elimina_imagen( ?, ?, ?, ?, ?  ) }");
        call.registerOutParameter(1, OracleTypes.VARCHAR);
        call.setString(2, bean.getKey_cuo());
        call.setString(3, bean.getKey_year());
        call.setString(4, bean.getKey_nber());
        call.setString(5, bean.getCod_img());
        call.setString(6, bean.getCodusu());


        call.execute();


        String sAns = (String)call.getObject(1);

        if (!sAns.equals("CORRECTO")) {
            throw new Exception(sAns);
        }
    }

    
        private void grabaBitacora(String bitacora) {        
            Sql sql=new Sql();
            try {
                sql.abreBitacora();
                sql.getCn().createStatement().execute(bitacora);
                //System.out.println("bitacora);
                sql.getCn().commit();
            } catch (Exception e) {
                try {
                    System.out.println("BITACORA= "+e.getMessage());
                   sql.getCn().rollback();
                } catch (Exception ee) {
                    ;
                }
            } finally {
                sql.cierraConexion();
            }
        }

    private void grabaFecha (){
            Sql sql = new Sql();
            String sConsulta ="select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') from dual";
            try {
                ResultSet result_Set = null;
                sql.abreBitacora();
                result_Set = sql.getCn().createStatement().executeQuery(sConsulta);
                result_Set.next();
                fechab = result_Set.getString(1);
                sql.getCn().commit();
                            
            }
            catch (Exception e) {
                try {
                    System.out.println("OBTIENE FECHA= "+e.getMessage());
                    sql.getCn().rollback();
                } catch (Exception ee) {
                    ;
                }
            } finally {
                sql.cierraConexion();
            }
        }

    private void fGrabaTna(HttpServletRequest request) throws Exception {
        ActaTnaForm bActa = (ActaTnaForm)request.getSession().getAttribute("ActaTnaForm");
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");

        CallableStatement call = null;
        call = cn.prepareCall("{? = call PKG_ACTA.graba_acta( ?, ?, ?, ?, ?, ?, ?, ?, ? ) }");
        call.registerOutParameter(1, OracleTypes.VARCHAR);

        ClaseLista cl;
        String Str = "";
        int j = 0;
        //EDGAR ARTEAGA NUEVO OCE 18122014
        String ws_aduana;
        String ws_gestion;
        String ws_nber;
        String ws_secuencia;
        String ws_nit;
        String ws_placa;
        String ws_acta;
        String ws_usuario;
        short ws_opcion;
        String ws_res = "";
        String ws_msg;
        
        String datos = "";
        String salida = "";
        String coderror = "1";
        
        //****
        if (bActa.getLista() == null) {
            throw new Exception("No existe registros.");
        }

        for (int i = 0; i < bActa.getLista().length; i++) {
            cl = bActa.getLista(i);

            if (cl != null) {
                if (!cl.getAcceso().equals("")) {
                    Str = cl.getCodigo();
                    ws_aduana = Str.substring(0, 3);
                    call.setString(2, Str.substring(0, 3));
                    Str = Str.substring(4);
                    ws_gestion = Str.substring(0, 4);
                    call.setString(3, Str.substring(0, 4));
                    Str = Str.substring(5);
                    j = Str.indexOf(";");
                    ws_nber = Str.substring(0, j);
                    call.setString(4, Str.substring(0, j));
                    Str = Str.substring(j + 1);
                    ws_secuencia = Str;
                    call.setString(5, Str);
                    Str = cl.getDsc();
                    j = Str.indexOf(";");
                    ws_nit = Str.substring(0, j);
                    call.setString(6, Str.substring(0, j));
                    Str = Str.substring(j + 1);
                    ws_placa = Str;
                    call.setString(7, Str);
                    ws_acta = cl.getAcceso();
                    call.setString(8, cl.getAcceso());
                    ws_usuario = cs.getCodusu();
                    call.setString(9, cs.getCodusu());
                    ws_opcion = cs.getOpcion();
                    call.setInt(10, cs.getOpcion());

                    call.execute();

                    String sAns = (String)call.getObject(1);

                    //EDGAR ARTEAGA NUEVO OCE 18122014
                        if (sAns.equals("encontrado: ENVIAR BAJA AL NUEVO OCE")) {
                            
                            try
                            {
                              ClienteSGA sga = new ClienteSGA();
                              datos = "vNroPlaca " + ws_placa + "vEstado " + "S" + " vNroActaIntervencion " + ws_acta + " vUsuario " + ws_usuario ;
                                
                              SGAResponse responsex = sga.actualizarUt(ws_placa, "S", ws_acta, ws_usuario);
                              System.out.println("Resultado: " + responsex.getResultado());
                              System.out.println("Mensaje: " + responsex.getMensaje());
                              ws_res = responsex.getResultado();
                              ws_msg = responsex.getMensaje();
                              salida = ws_msg;
                              if (ws_res.equals("OK")) {
                                 coderror = "0";
                                 fGrabaActaNuevoOCE(ws_aduana, ws_gestion, ws_nber, ws_secuencia, ws_nit, ws_placa,ws_acta, ws_usuario);
                                 sAns = "Nuevo OCE: " + ws_msg;
                              } 
                              else {
                                 fGrabaActaNuevoOCE(ws_aduana, ws_gestion, ws_nber, ws_secuencia, ws_nit, ws_placa, ws_acta, ws_usuario);
                                 j = ws_msg.indexOf(":");
                                 ws_msg = ws_msg.substring(j + 1);
                                 sAns = "Nuevo OCE: " + ws_msg;
                              } 
                            }
                            catch (BusinessException e) {
                                e.printStackTrace();
                                ws_res = "ERROR:";
                                ws_msg = e.toString();
                                salida = ws_msg;
                                sAns = "Error de Conectividad con el servicio";                        
                            }
                            catch(MalformedURLException e){
                                ws_res = "ERROR:";
                                ws_msg = e.toString();
                                salida = ws_msg;
                                sAns = "Nuevo OCE: " + ws_msg;
                            }
                            catch(Exception e){
                                ws_res = "ERROR:";
                                ws_msg = e.toString();
                                salida = ws_msg;
                                sAns = "Nuevo OCE: " + ws_msg;
                            }
                            finally {  
                                grabaFecha();
                                grabaBitacora("insert into int_bitacora values('wsSuspencionMedios', 'fRegistraActaIntervencion', '"+fechab+"', 'BO', 0,'" +
                                                      (datos.length() < 459 ? datos : datos.substring(0, 459)) + "'," + coderror + ",'" +
                                                      (salida.length() < 500 ? salida : salida.substring(0, 499)) +"',sysdate)");
                            } 
                            
                            
                        }
                        //*******
                    if (!sAns.equals("Correcto")) {
                        throw new Exception(sAns + "<br>En el tramite: " + cl.getCodigo());
                    }
                }
            }
        }
    }

    private void fGrabaActaNuevoOCE(String ws_aduana, String ws_gestion, String ws_nber, String ws_secuencia,
                                    String ws_nit, String ws_placa, String ws_acta, String ws_usuario) {
        try {
            CallableStatement call = null;
            call = cn.prepareCall("{? = call pkg_acta.graba_acta_nuevooce( ?, ?, ?, ?, ?, ?, ?, ?) }");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.setString(2, ws_aduana);
            call.setString(3, ws_gestion);
            call.setInt(4, Integer.parseInt(ws_nber));
            call.setInt(5, Integer.parseInt(ws_secuencia));
            call.setString(6, ws_nit);
            call.setString(7, ws_placa);
            call.setString(8, ws_acta);
            call.setString(9, ws_usuario);
            call.execute();

            String x = (String)call.getObject(1);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


    private void fGrabaPlazoHoras(HttpServletRequest request) throws Exception {
        RutaForm bRuta = (RutaForm)request.getAttribute("RutaForm");

        if (bRuta.getP_rou_ter().equals(bRuta.getP_rou_ter_ver()) && bRuta.getLopcion() == 2) {
            throw new Exception("No realiz&oacute; ninguna modificaci&oacute;n en el 'Tiempo de Recorrido', de la ruta que esta editando");
        } else {

            ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");

            CallableStatement call = null;
            call = cn.prepareCall("{? = call pk_rutas.graba( ?, ?, ?, ?, ?, ?, ?, ?) }");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.setString(2, bRuta.getP_rou_cod());
            call.setString(3, bRuta.getP_cuo_sal());
            call.setString(4, bRuta.getP_cuo_arr());
            call.setString(5, bRuta.getP_rou_ter());
            call.setString(6, bRuta.getP_rou_mod());
            call.setString(7, cs.getCodusu());
            call.setString(8, bRuta.getP_des());
            call.setInt(9, bRuta.getLopcion());
            call.execute();

            String x = (String)call.getObject(1);

            if (!x.equals("Correcto")) {
                throw new Exception("No se puede a&ntilde;adir la Ruta y Plazo, porque la misma ya existe");
            }
        }
    }

    private void fVerificaEtiqueta(HttpServletRequest request) throws Exception {
        LectorForm bForm = (LectorForm)request.getAttribute("LectorForm");
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");

        TransitoTag tag = new TransitoTag(bForm.getEtiqueta());

        if (tag.isValid()) {
            if (tag.getString(tag._ADUANA).equals("ETIQUETA DE CONTROL GENERICA")) {
                throw new Exception("La Etiqueta le&iacute;da es GENERICA por favor debe hacer un registro en la opci&oacute;n del Men&uacute; Principal Aduana de Paso.");
            }

            CallableStatement call = null;
            call =
cn.prepareCall("{?=call pkg_verifica_transito.verifica_etiqueta(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.registerOutParameter(32, OracleTypes.VARCHAR);
            call.setString(2, tag.getString(tag._ADUANA));
            call.setString(3, tag.getString(tag._REGISTRO_ANIO));
            call.setString(4, tag.getString(tag._REGISTRO_NUMERO));
            call.setString(5, tag.getString(tag._REGISTRO_FECHA));
            call.setString(6, tag.getString(tag._REGISTRO_HORA));
            call.setString(7, tag.getString(tag._TRANSPORTE_ID));
            call.setString(8, tag.getString(tag._TRANSPORTE_NOMBRE));
            call.setString(9, tag.getString(tag._MANIF_ANT_REF));
            call.setString(10, tag.getString(tag._MANIF_ANT_FECHA));
            call.setString(11, tag.getString(tag._CONDUCTOR_NOMBRE));
            call.setString(12, tag.getString(tag._CONDUCTOR_INF1));
            call.setString(13, tag.getString(tag._CONDUCTOR_INF2));
            call.setString(14, tag.getString(tag._TOTAL_BOL));
            call.setString(15, tag.getString(tag._TOTAL_BULTOS));
            call.setString(16, tag.getString(tag._TOTAL_PESO));
            call.setString(17, tag.getString(tag._BOL_NUMERO));
            call.setString(18, tag.getString(tag._BOL_REFERENCIA));
            call.setString(19, tag.getString(tag._BOL_PESO));
            call.setString(20, tag.getString(tag._BOL_BULTOS));
            call.setString(21, tag.getString(tag._BOL_EMBALAJE));
            call.setString(22, tag.getString(tag._UT_PLACA));
            call.setString(23, tag.getString(tag._UT_CHASIS));
            call.setString(24, tag.getString(tag._BOL_REMOLQUE));
            call.setString(25, tag.getString(tag._TRA_PRECINTOS));

            String[] rutas = tag.getRutas();
            String[] detalle = tag.getRutaDetalle(rutas[0]);

            call.setString(26, detalle[0]);
            call.setString(27, detalle[1]);
            call.setString(28, detalle[2]);
            call.setString(29, detalle[3]);
            call.setString(30, detalle[4]);

            call.setInt(31, bForm.getOpcion());
            call.execute();

            if (!call.getString(1).equals("correcto")) {
                throw new Exception("La Etiqueta leida no corresponde con el Transito. " + call.getString(1));
            }

            cs.setOpcion(Ctte.ePaso);

            TramiteForm bTramite = new TramiteForm();
            request.setAttribute("TramiteForm", bTramite);
            bTramite.setAduana(tag.getString(tag._ADUANA));
            bTramite.setGestion(tag.getString(tag._REGISTRO_ANIO));
            bTramite.setRegistro(tag.getString(tag._REGISTRO_NUMERO));

            this.fEstadoTramite(request);

            if (bTramite.isTna() == true) {
                throw new Exception("El medio de tr&aacute;nsporte esta registrado como <font color='#FF0000'><strong>Tr&aacute;nsito No Arribado</strong></font>");
            }

            if (bForm.getOpcion() == 1) {
                AsignaRutaPlazoForm bRuta = new AsignaRutaPlazoForm();
                bRuta = (AsignaRutaPlazoForm)request.getSession().getAttribute("AsignaRutaPlazoForm");

                if (cs.getKey_cuo().equals("072")) {
                    bRuta.setPaso("422");
                } else {
                    bRuta.setPaso("241");
                }

                String obs = bRuta.getObs() + "Aduana de Paso Auto.";

                bRuta.setObs(((obs.length() > 100) ? obs.substring(1, 100) : obs));

                this.fGrabaRutaPlazo(request);
            } else {
                cs.setDscadu(cs.getKey_cuo() + ": " + call.getString(32));
            }
        } else {
            throw new Exception("La Etiqueta leida es invalida.");
        }
    }

    //PlazoEtiqueta

    private void fVerificaPlazoEtiqueta(HttpServletRequest request) throws Exception {
        LectorForm bForm = (LectorForm)request.getAttribute("LectorForm");
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");

        TransitoTag tag = new TransitoTag(bForm.getEtiqueta());

        if (tag.isValid()) {
            if (tag.getString(tag._ADUANA).equals("ETIQUETA DE CONTROL GENERICA")) {
                throw new Exception("La Etiqueta le&iacute;da es GENERICA.");
            }

            CallableStatement call = null;
            call =
cn.prepareCall("{?=call pkg_verifica_transito.verifica_etiqueta(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.registerOutParameter(32, OracleTypes.VARCHAR);
            call.setString(2, tag.getString(tag._ADUANA));
            call.setString(3, tag.getString(tag._REGISTRO_ANIO));
            call.setString(4, tag.getString(tag._REGISTRO_NUMERO));
            call.setString(5, tag.getString(tag._REGISTRO_FECHA));
            call.setString(6, tag.getString(tag._REGISTRO_HORA));
            call.setString(7, tag.getString(tag._TRANSPORTE_ID));
            call.setString(8, tag.getString(tag._TRANSPORTE_NOMBRE));
            call.setString(9, tag.getString(tag._MANIF_ANT_REF));
            call.setString(10, tag.getString(tag._MANIF_ANT_FECHA));
            call.setString(11, tag.getString(tag._CONDUCTOR_NOMBRE));
            call.setString(12, tag.getString(tag._CONDUCTOR_INF1));
            call.setString(13, tag.getString(tag._CONDUCTOR_INF2));
            call.setString(14, tag.getString(tag._TOTAL_BOL));
            call.setString(15, tag.getString(tag._TOTAL_BULTOS));
            call.setString(16, tag.getString(tag._TOTAL_PESO));
            call.setString(17, tag.getString(tag._BOL_NUMERO));
            call.setString(18, tag.getString(tag._BOL_REFERENCIA));
            call.setString(19, tag.getString(tag._BOL_PESO));
            call.setString(20, tag.getString(tag._BOL_BULTOS));
            call.setString(21, tag.getString(tag._BOL_EMBALAJE));
            call.setString(22, tag.getString(tag._UT_PLACA));
            call.setString(23, tag.getString(tag._UT_CHASIS));
            call.setString(24, tag.getString(tag._BOL_REMOLQUE));
            call.setString(25, tag.getString(tag._TRA_PRECINTOS));

            String[] rutas = tag.getRutas();
            String[] detalle = tag.getRutaDetalle(rutas[0]);

            call.setString(26, detalle[0]);
            call.setString(27, detalle[1]);
            call.setString(28, detalle[2]);
            call.setString(29, detalle[3]);
            call.setString(30, detalle[4]);

            call.setInt(31, bForm.getOpcion());
            call.execute();

            if (!call.getString(1).equals("correcto")) {
                if (cs.getOpcion() == Ctte.eSalidaPuerto) {
                    if (!call.getString(1).equals("1110")) //casos verifica informacion de etiqueta contra la ultima version de la BD
                        throw new Exception("La Etiqueta leida no corresponde con el Transito. " + call.getString(1) +
                                            " o el Tr&aacute;nsito " + tag.getString(tag._ADUANA) + "/" +
                                            tag.getString(tag._REGISTRO_ANIO) + "-" +
                                            tag.getString(tag._REGISTRO_NUMERO) +
                                            " ya ha sido registrado con Salida de Puerto o fue cerrado");
                } else
                    throw new Exception("La Etiqueta leida no corresponde con el Transito. " + call.getString(1));
            }

            cs.setOpcion(Ctte.eSalidaPuerto);

            TramiteForm bTramite = new TramiteForm();
            request.setAttribute("TramiteForm", bTramite);
            bTramite.setAduana(tag.getString(tag._ADUANA));
            bTramite.setGestion(tag.getString(tag._REGISTRO_ANIO));
            bTramite.setRegistro(tag.getString(tag._REGISTRO_NUMERO));

            this.fEstadoTramite(request);

            if (bTramite.isTna() == true) {
                throw new Exception("El medio de tr&aacute;nsporte esta registrado como <font color='#FF0000'><strong>Tr&aacute;nsito No Arribado</strong></font>");
            }

            /*AsignaRutaPlazoForm bRuta = new AsignaRutaPlazoForm();
        request.getSession().setAttribute("AsignaRutaPlazoForm", bRuta);
        bRuta.setTransito(tag.getString(tag._ADUANA)+"/"+tag.getString(tag._REGISTRO_ANIO)+"-"+tag.getString(tag._REGISTRO_NUMERO));
        bRuta.setCodtrans(tag.getString(tag._TRANSPORTE_ID));
        bRuta.setDsctrans(tag.getString(tag._TRANSPORTE_NOMBRE));
        bRuta.setPre1(tag.getString(tag._CONDUCTOR_NOMBRE));
        bRuta.setPre2(tag.getString(tag._CONDUCTOR_INF1));
        bRuta.setFecini(tag.getString(tag._TOTAL_BULTOS));
        bRuta.setFeclim(tag.getString(tag._TOTAL_PESO));
        bRuta.setFecreg(tag.getString(tag._TOTAL_BOL));
        bRuta.setPlaca(tag.getString(tag._UT_PLACA));
        bRuta.setBoleta(tag.getString(tag._UT_CHASIS));
        bRuta.setEntidad(tag.getString(tag._BOL_REMOLQUE));
        bRuta.setMoneda(tag.getString(tag._TRA_PRECINTOS));*/

            //if (bForm.getOpcion() == 1) {


            /*if (cs.getKey_cuo().equals("072")) {
          bRuta.setPaso("422");
        } else {
          bRuta.setPaso("241");
        }

        String obs = bRuta.getObs() + "Aduana de Paso Auto.";

        bRuta.setObs(((obs.length() > 100) ? obs.substring(1, 100) : obs));*/
            //this.fGrabaPlazoEtiqueta(request);
            //this.fGrabaRutaPlazo(request);
            //} else {
            //cs.setDscadu(cs.getKey_cuo() + ": " + call.getString(32));
            //}
        } else {
            throw new Exception("La Etiqueta leida es invalida.");
        }
    }

    private void fGrabaPlazoEtiqueta(HttpServletRequest request) throws Exception {
        LectorForm bean = (LectorForm)request.getAttribute("LectorForm");
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");


        CallableStatement call = null;
        call = cn.prepareCall("{?=call pkg_transito.graba_plazo_etiqueta(?,?,?,?,?,?)}");
        call.registerOutParameter(1, OracleTypes.VARCHAR);
        call.setString(2, cs.getKey_cuo());
        call.setString(3, cs.getKey_year());
        call.setString(4, cs.getKey_nber());
        call.setString(5, cs.getAduanas());
        call.setString(6, cs.getCodusu());
        call.setDouble(7, Double.parseDouble(bean.getPeso()));

        call.execute();

        String sAns = (String)call.getObject(1);

        if (!sAns.equals("Correcto")) {
            throw new Exception(sAns);
        }
    }

    public String AccesoDespacho(HttpServletRequest request, int opcion) throws Exception {
        DespachoForm bDespacho = (DespachoForm)request.getAttribute("DespachoForm");
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");

        CallableStatement call = null;
        String ans = "";

        try {
            this.getConexion();

            switch (opcion) {
            case 1021:
                call = cn.prepareCall("{?=call pkg_despacho.lista_aduanas(?)}");
                call.registerOutParameter(1, OracleTypes.CURSOR);
                call.setString(2, cs.getAduanas());
                call.execute();
                ResultSet fp = (ResultSet)call.getObject(1);
                if (!(fp == null || !fp.next())) {
                    do {
                        ans =
 ans + "<ans>correcto</ans><cod>" + fp.getString(1) + "</cod><dsc>" + fp.getString(1) + ": " + fp.getString(2) +
   "</dsc><si>" + fp.getString(3) + "</si>";
                    } while (fp.next());
                } else {
                    ans = "<ans>No se encontro la lista de Aduanas.</ans>";
                }
                return ans;
            case 1001:
            case 1002:

                call = cn.prepareCall("{?=call pkg_despacho.consulta_despacho(?,?,?,?,?,?)}");
                call.registerOutParameter(1, OracleTypes.CURSOR);
                call.registerOutParameter(7, OracleTypes.VARCHAR);
                call.setInt(2, opcion);
                call.setString(3, bDespacho.getGestion());
                call.setString(4, bDespacho.getAduana());
                call.setString(5, bDespacho.getRegistro());
                call.setString(6, cs.getCodusu());
                call.execute();

                ans = call.getString(7);
                String res = "";


                if (!ans.equals("correcto"))
                    return "<ans>" + ans.replace("&", " ").replace("'", " ") + "</ans>";

                NumberFormat formatter = new DecimalFormat("###########0.00");
                double peso = 0;

                ResultSet rs = (ResultSet)call.getObject(1);
                if (!(rs == null || !rs.next())) {
                    ans =
 "<ans>correcto</ans><dui>" + rs.getString("dui") + "</dui><duipeso>" + formatter.format(rs.getDouble("duipeso")) +
   "</duipeso><duiimp>" + rs.getString("duiimportador") + "</duiimp><docs>";
                    do {
                        ans =
 ans + "<doc><docadu>" + rs.getString("key_cuo") + "</docadu><docges>" + rs.getString("car_reg_year") +
   "</docges><docreg>";
                        ans =
 ans + rs.getString("car_reg_nber") + "</docreg><destino>" + rs.getString("destino") + "</destino><forma>";
                        ans =
 ans + rs.getString("forma") + "</forma><tipo>" + rs.getString("tipo") + "</tipo><empresa>" + rs.getString("empresa") +
   "</empresa><placa>";
                        ans =
 ans + rs.getString("placa") + "</placa><estado>" + rs.getString("estado") + "</estado><peso>" +
   formatter.format(rs.getDouble("peso")) + "</peso><imp>" + rs.getString("importador") + "</imp></doc>";
                        if (rs.getInt("estado") == 1)
                            peso = peso + rs.getDouble("peso");
                    } while (rs.next());
                    ans = ans + "<pesofin>" + formatter.format(peso) + "</pesofin></docs>";

                    return (ans.replace("'", " ")).replace("&", " ");

                } else {
                    return "<ans>No se encontr&oacute; ning&uacute;n registro con los datos ingresados.</ans>";
                }

            case 1011:
                String[] lista;
                lista = bDespacho.getGestion().split("\\|");

                for (int i = 0; i < lista.length - 1; i++) {

                    call = cn.prepareCall("{?=call pkg_despacho.registra_despacho(?,?,?,?,?,?,?,?,?)}");
                    call.registerOutParameter(1, OracleTypes.VARCHAR);
                    call.registerOutParameter(10, OracleTypes.VARCHAR);
                    call.setString(2, lista[lista.length - 1].substring(0, 4));
                    call.setString(3, lista[lista.length - 1].substring(5, 8));
                    call.setString(4, lista[lista.length - 1].substring(11));
                    call.setString(5, lista[i].substring(0, 4));
                    call.setString(6, lista[i].substring(5, 8));
                    call.setString(7, lista[i].substring(9));
                    call.setString(8, bDespacho.getAduana());
                    call.setString(9, cs.getCodusu());
                    call.execute();
                    if (call.getString(1).equals("correcto"))
                        ans = ans + lista[i] + " Manifiesto Destino " + call.getString(10) + "|";
                    else
                        ans =
 ans + lista[i] + " no se pudo generar el Manifiesto de Destino. " + call.getString(1) + "|";
                }
                return "<datos>" + (ans.replace("'", " ")).replace("&", " ") + "</datos>";
            }

            return "";
        } catch (Exception e) {
            return "<ans>No se puede efectuar la operación\n" +
                e.getMessage().replace("'", " ") + "</ans>";
        }
    }

    public String Devuelve_Estado(String cuo, String year, String nber) throws Exception {

        CallableStatement call = null;
        String ans = "";

        try {
            //this.getConexion();

            call = cn.prepareCall("{?=call pkg_transito.devuelve_estado(?,?,?)}");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.setString(2, cuo);
            call.setString(3, year);
            call.setString(4, nber);
            call.execute();

            ans = call.getString(1);
            return ans;

        } catch (Exception e) {
            return "0";
        } finally {

            //this.getClose();
        }

    }

    public String Devuelve_Estado_por_DUI(String cuo, String year, String nber) throws Exception {

        CallableStatement call = null;
        String ans = "";

        try {
            //this.getConexion();

            call = cn.prepareCall("{?=call pkg_transito.devuelve_estado_por_DUI(?,?,?)}");
            call.registerOutParameter(1, OracleTypes.VARCHAR);
            call.setString(2, cuo);
            call.setString(3, year);
            call.setString(4, nber);
            call.execute();

            ans = call.getString(1);
            return ans;

        } catch (Exception e) {
            return "0";
        } finally {

            //this.getClose();
        }

    }
    
    //Opcion subir da de archivos MIRA 07102015
    /*
    private void pSubePDFD(HttpServletRequest request)
        throws Exception, SQLException
    {
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
        try
        {
            ManifiestoForm bDoc = (ManifiestoForm) request.getAttribute("ManifiestoForm");
            int tam = 0;
            FormFile file = bDoc.getDocPdf();
            
            if(!file.getFileName().equals("")){
            tam = file.getFileSize();
            if(file.getFileSize() <= 0 )
                throw new SQLException("El archivo que envio no tiene el formato PDF");
            if (file.getFileSize() > 1024*1024 )//1 Mb
               throw new SQLException("El archivo es muy grande ");
            String str = file.getFileName();
            
            boolean resultado = str.toLowerCase().endsWith(".pdf");
            if(!resultado)
                throw new SQLException("El archivo que envio no tiene el formato PDF");

            //str = this.limpiaCadena(str);
            
            File folder = new File(bDoc.getCarpeta());
            if(!folder.exists())
                folder.mkdir();
            InputStream stream = file.getInputStream();
            String fil = bDoc.getRuta();
            OutputStream bos = new FileOutputStream(fil);
            int bytesRead = 0;
            byte buffer[] = new byte[8192];
            while((bytesRead = stream.read(buffer, 0, 8192)) != -1) 
                bos.write(buffer, 0, bytesRead);
            bos.close();
            }
            CallableStatement call = null;
            
                      
            call = cn.prepareCall("{? = call PKG_MANIFIESTODOCS.g_imagen( ?,?,?,?,?,?,?,?,?, ?,?,?,?,?) }");
            call.registerOutParameter(1, 12);
            call.setString(2, bDoc.getCar_reg_year());
            call.setString(3, bDoc.getKey_cuo()); // cs.getAduana());
            call.setLong(4, Long.parseLong(bDoc.getCar_reg_nber()));
            call.setString(5, bDoc.getTip_documento());
            call.setInt(6, Integer.parseInt(bDoc.getNreferencia()));
            call.setString(7, bDoc.getEmisor());
            call.setString(8, bDoc.getNro_referencia());
            call.setString(9, bDoc.getFecha_emision());
            call.setString(10, bDoc.getImporte());
            call.setString(11, bDoc.getTip_divisa());
            call.setString(12, null);
            call.setString(13, bDoc.getRuta());
            //call.setString(14, cs.getUsuario());
            call.setString(14, cs.getCodusu());
            call.setInt(15, tam);
            call.execute();
            String ans = (String)call.getObject(1);
            if(!ans.equals("Correcto"))
                throw new SQLException(ans);
        }
        catch(Exception e)
        {
            throw new SQLException(e.getMessage());
        }
    }
    private void pElimPDFD(HttpServletRequest request)
        throws Exception, SQLException
    {
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
        try
        {
            ManifiestoForm bDoc = (ManifiestoForm) request.getAttribute("ManifiestoForm");
            
            CallableStatement call = null;
            call = cn.prepareCall("{? = call PKG_MANIFIESTODOCS.elim_reg( ?,?,?,?,?,? ) }");
            call.registerOutParameter(1, 12);
            call.setString(2, bDoc.getCar_reg_year());
            call.setString(3, bDoc.getKey_cuo()); // cs.getAduana());
            call.setString(4, bDoc.getCar_reg_nber());
            call.setString(5, bDoc.getNro_referencia());
            call.setString(6, bDoc.getNreferencia());
            //call.setString(7, cs.getUsuario());
            call.setString(7, cs.getCodusu());
            call.execute();
            String ans = (String)call.getObject(1);
            if(!ans.equals("Correcto"))
                throw new SQLException(ans);
        }
        catch(Exception e)
        {
            throw new SQLException(e.getMessage());
        }
    }*/
    /*
    private void pSubeImagen(HttpServletRequest request)
        throws Exception, SQLException
    {
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
        try
        {
            CarpetaForm bDoc = (CarpetaForm)request.getAttribute("CarpetaForm");
            FormFile file = bDoc.getDocPdf();
            int tam = file.getFileSize();
            if(file.getFileSize() <= 0)
                throw new SQLException("El archivo que envio no tiene el formato PDF");
            if (file.getFileSize() > cs.getPeso_file()*1024 )//1 Mb
               throw new SQLException("El archivo es muy grande ");
            String str = file.getFileName();
            
            boolean resultado = str.toLowerCase().endsWith(".pdf");
            if(!resultado)
                throw new SQLException("El archivo que envio no tiene el formato PDF");

            //str = this.limpiaCadena(str);
            
            File folder = new File(bDoc.getCarpeta());
            if(!folder.exists())
                folder.mkdir();
            InputStream stream = file.getInputStream();
            OutputStream bos = new FileOutputStream(bDoc.getRuta());
            int bytesRead = 0;
            byte buffer[] = new byte[8192];
            while((bytesRead = stream.read(buffer, 0, 8192)) != -1) 
                bos.write(buffer, 0, bytesRead);
            bos.close();
            CallableStatement call = null;
            call = cn.prepareCall("{? = call PKG_CARPETA.g_imagen( ?,?,?,?,?,?,?,?,?,? ) }");
            call.registerOutParameter(1, 12);
            call.setString(2, cs.getGestion());
            call.setString(3, cs.getAduana());
            call.setString(4, cs.getNumero());
            call.setString(5, bDoc.getCodigo());
            call.setString(6, bDoc.getReferencia());
            call.setString(7, bDoc.getCarpeta());
            call.setString(8, bDoc.getRuta());
            call.setInt(9, tam);
            call.setString(10, cs.getUsuario());
            call.setString(11, cs.getEstado());
            call.execute();
            String ans = (String)call.getObject(1);
            if(!ans.equals("Correcto"))
                throw new SQLException(ans);
        }
        catch(Exception e)
        {
            throw new SQLException(e.getMessage());
        }
    }
*/


    private void fGrabaLlegadaDepositoTransitorio(HttpServletRequest request) throws Exception {
        RegLlegDepositoTransitorioForm bean = (RegLlegDepositoTransitorioForm)request.getAttribute("RegLlegDepositoTransitorioForm");        
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
        
       /* SimpleDateFormat fFecha = new SimpleDateFormat("yyyyMMddHHmmss");
        Calendar fecha = Calendar.getInstance();
        fecha.setTime(fecha.getTime());
        String fecmarca = fFecha.format(fecha.getTime()); */
        SimpleDateFormat fFecha = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Calendar fecha = Calendar.getInstance();
        fecha.setTime(fecha.getTime());
        String fhoy = fFecha.format(fecha.getTime());
        
        boolean sUp = false;
        String nombreArch = "";
        String ruta ="";
         
        String namedate = fhoy;
        namedate = namedate.replaceAll("/", "-");
        namedate = namedate.replaceAll(":", "-");
        namedate = namedate.replaceAll(" ", "-");            
        FormFile file = bean.getFile_manifiesto();
        nombreArch = bean.getCar_reg_year() + bean.getKey_cuo() + bean.getCar_reg_nber()+"_"+ bean.getCod_depositoTransitorio() + "-" + namedate + ".pdf";           
        
        File subdir = new File("/u03/oracle/user_projects/data/transitos/RegLlegadaDepTransitorio/"+ bean.getCar_reg_year()+"/");
        if(!subdir.exists())
            subdir.mkdir();
        File subdir1 = new File("/u03/oracle/user_projects/data/transitos/RegLlegadaDepTransitorio/"+ bean.getCar_reg_year()+"/" +bean.getKey_cuo()+"/");
        if(!subdir1.exists())
            subdir1.mkdir();
        ruta = "/u03/oracle/user_projects/data/transitos/RegLlegadaDepTransitorio/"+ bean.getCar_reg_year()+"/" +bean.getKey_cuo()+"/" + nombreArch;
                    
        InputStream stream = file.getInputStream();
        System.out.println(file.getFileSize());
        
            /*tamano de archivo permitido 1Mb */
            if (file.getFileSize() < 1048576) {
                OutputStream bos = new FileOutputStream(ruta);
                int bytesRead = 0;
                byte[] buffer = new byte[8192];
                while ((bytesRead = stream.read(buffer, 0, 8192)) != -1)
                    bos.write(buffer, 0, bytesRead);
                bos.close();
                sUp = true;
            } else {  
                throw new Exception("Tama&ntilde;o de archivo no permitido. ");
            }

            if(sUp){
            
                CallableStatement call = null;
                call = cn.prepareCall("{? = call pkg_deposito_trans.f_graba_lleg_dep_transitorio( ?,?,?,?,?,  ?,? ) }");
                call.registerOutParameter(1, OracleTypes.VARCHAR);
                call.setString(2, bean.getKey_cuo());
                call.setString(3, bean.getCar_reg_year());
                call.setString(4, bean.getCar_reg_nber());
                call.setString(5, bean.getCod_depositoTransitorio());                       
                call.setString(6, nombreArch);
                call.setString(7, ruta);
                call.setString(8, cs.getCodusu());        
                call.execute();

                String sAns = (String)call.getObject(1);
                request.setAttribute("pans", sAns);
                
                if (!sAns.equals("CORRECTO")) {
                    File archivoman = new File(ruta);
                    archivoman.delete();                    
                    throw new Exception(sAns);
                }
            }else{                        
                    throw new Exception("No se pudo registrar el archivo. ");
                }
            
        }

    private void pSubePDFD(HttpServletRequest request)
        throws Exception, SQLException
    {
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
        Date date = new Date();
        try
        {
            ManifiestoForm bDoc = (ManifiestoForm) request.getAttribute("ManifiestoForm");
            int tam = 0;
            String mes_dep = "";
            String anio_dep="";
            FormFile file = bDoc.getDocPdf();
            
            if(!file.getFileName().equals("")){
            tam = file.getFileSize();
            if(file.getFileSize() <= 0 )
                throw new SQLException("El archivo que envio no tiene el formato PDF");
            //if (file.getFileSize() > 300*1024 )//300 kb
           /* if(cs.getPeso_file()==0){
                cs.setPeso_file(300);
            }*/
           if (file.getFileSize() > cs.getPeso_file()*1024 )//300 kb
              throw new SQLException("<font size='4px' color='red'>El archivo supera los <b>"+cs.getPeso_file()/1024+" Mb </b> permitidos </font>");
           
           String str = file.getFileName();
                
           String fil3 = df.format(date)+"-"+bDoc.getTip_documento()+".pdf";
           
                
           
           
           boolean resultado = str.toLowerCase().endsWith(".pdf");
           
           if(!resultado)
               throw new SQLException("El archivo que envio no tiene el formato PDF");
           
           File subdir5 = new File(cs.getUnidad()+"manifiestos");
           //if(!subdir5.exists()){
               if (cs.getUnidad().indexOf("manifiestos")<0){
                   
                   File subdir3 = new File(cs.getUnidad()+"mira");
                   if(!subdir3.exists())
                       subdir3.mkdir();
                   File subdir4 = new File(cs.getUnidad()+"mira/manifiestos");
                   if(!subdir4.exists())
                       subdir4.mkdir();
               //}else{
                   File subdir = new File(cs.getUnidad()+"mira/manifiestos/"+bDoc.getKey_cuo()+"/");
                   //File subdir = new File("/u06/oracle/user_projects/data/mira/pmanifiestos/"+cs.getLoginForm().getAduana()+"/");
                   
                   if(!subdir.exists())
                       subdir.mkdir();
                   //File subdir1 = new File("/u03/oracle/user_projects/data/mira/manifiestos/"+cs.getLoginForm().getAduana()+"/"+bbusq.getCar_reg_year()+"/");
                   
                   
                   mes_dep = bDoc.getCar_dep_date().split("/")[1];
                   anio_dep = bDoc.getCar_dep_date().split("/")[2];
                   
                   File subdir1 = new File(cs.getUnidad()+"mira/manifiestos/"+bDoc.getKey_cuo()+"/"+anio_dep+"/");
                   //File subdir1 = new File("/u06/oracle/user_projects/data/mira/pmanifiestos/"+cs.getLoginForm().getAduana()+"/"+anio_dep+"/");
                   
                   if(!subdir1.exists())
                       subdir1.mkdir();
                   File subdir2 = new File(cs.getUnidad()+"mira/manifiestos/"+bDoc.getKey_cuo()+"/"+anio_dep+"/"+mes_dep+"/");
                   //File subdir2 = new File("/u06/oracle/user_projects/data/mira/pmanifiestos/"+cs.getLoginForm().getAduana()+"/"+anio_dep+"/"+mes_dep+"/");
                   
                   if(!subdir2.exists())
                       subdir2.mkdir();
                    
                   //bbusq.setRuta((new StringBuilder()).append(bbusq.getCarpeta()).append(fil).toString());
                   File folder = new File(cs.getUnidad()+"mira/manifiestos/"+bDoc.getKey_cuo()+"/"+anio_dep+"/"+mes_dep+"/"+bDoc.getCarpeta());
                   
                   if(!folder.exists())
                       folder.mkdir();
                   /*String[] carp= bDoc.getCarpeta().split("/");
                   int dim = carp.length-1;*/
               
                   bDoc.setRuta((new StringBuilder()).append(cs.getUnidad()+"mira/manifiestos/"+bDoc.getKey_cuo()+"/"+anio_dep+"/"+mes_dep+"/"+bDoc.getCarpeta()).append(fil3).toString());
               }else{
                   bDoc.setRuta((new StringBuilder()).append(cs.getUnidad()).append(fil3).toString());
                }
           /*}else{
                bDoc.setRuta((new StringBuilder()).append(cs.getUnidad()).append(fil3).toString());
            }  */
            /*
            

            //str = this.limpiaCadena(str);
            File subdir = new File("/u03/oracle/user_projects/data/mira/manifiestos/"+bDoc.getKey_cuo()+"/");//DIRECCION U03 PARA MANIFIESTOS
            //File subdir = new File("/u06/oracle/user_projects/data/mira/pmanifiestos/"+bDoc.getKey_cuo()+"/");
            if(!subdir.exists())
                subdir.mkdir();

            String mes_dep = "";
            String anio_dep="";
            mes_dep = bDoc.getCar_dep_date().split("/")[1];
            anio_dep = bDoc.getCar_dep_date().split("/")[2];
            
            
            
            //File subdir1 = new File("/u06/oracle/user_projects/data/mira/pmanifiestos/"+bDoc.getKey_cuo()+"/"+anio_dep+"/");
            File subdir1 = new File("/u03/oracle/user_projects/data/mira/manifiestos/"+bDoc.getKey_cuo()+"/"+anio_dep+"/");
            
            if(!subdir1.exists())
                subdir1.mkdir();
            //File subdir2 = new File("/u06/oracle/user_projects/data/mira/pmanifiestos/"+bDoc.getKey_cuo()+"/"+anio_dep+"/"+mes_dep+"/");
            File subdir2 = new File("/u03/oracle/user_projects/data/mira/manifiestos/"+bDoc.getKey_cuo()+"/"+anio_dep+"/"+mes_dep+"/");
            
            if(!subdir2.exists())
                subdir2.mkdir();
            
            
            File folder = new File(bDoc.getCarpeta());
            if(!folder.exists())
                folder.mkdir();
            */
            
            /*String[] carp= bDoc.getCarpeta().split("/");
            int dim = carp.length-1;*/
            InputStream stream = file.getInputStream();
            String fil = bDoc.getRuta();
            OutputStream bos = new FileOutputStream(fil);
            int bytesRead = 0;
            byte buffer[] = new byte[8192];
            while((bytesRead = stream.read(buffer, 0, 8192)) != -1) 
                bos.write(buffer, 0, bytesRead);
            bos.close();
            }
            else{
                bDoc.setRuta(null);
            }
            CallableStatement call = null;
            
            //call = cn.prepareCall("{? = call MIRA.PKG_MANIFIESTODOCS_MEM.g_imagen( ?,?,?,?,?,?,?,?,?, ?,?,?,?,?,?,?, ?,?,?) }");//DESARROLLO
            //call = cn.prepareCall("{? = call APP_MIRA.PKG_MANIFIESTODOCS_MEM.g_imagen( ?,?,?,?,?,?,?,?,?, ?,?,?,?,?,?,?, ?,?,?) }");//PRODUCCION
            call = cn.prepareCall("{? = call "+cs.getEsquema()+".PKG_MANIFIESTODOCS_MEM.g_imagen( ?,?,?,?,?,?,?,?,?, ?,?,?,?,?,?,?, ?,?,?) }");//VARIABLE ESQUEMA
            call.registerOutParameter(1, 12);
            call.setString(2, bDoc.getCar_reg_year());
            call.setString(3, bDoc.getKey_cuo());
            //call.setLong(4, Long.parseLong(bDoc.getCar_reg_nber()));
            if(bDoc.getTipo().equals("reg"))
                call.setLong(4, Long.parseLong(bDoc.getCar_reg_nber()));
            else
                call.setLong(4, -1); 
            call.setString(5, bDoc.getTip_documento());
            call.setInt(6, Integer.parseInt(bDoc.getNreferencia()));
            call.setString(7, bDoc.getEmisor());
            call.setString(8, bDoc.getNro_referencia());
            call.setString(9, bDoc.getFecha_emision().equals("null")?null:bDoc.getFecha_emision());
            call.setString(10, null);//bDoc.getImporte());
            call.setString(11, null);//bDoc.getTip_divisa());
            call.setString(12, null);
            call.setString(13, bDoc.getRuta());
            call.setString(14, cs.getCodusu());
            call.setInt(15, tam);
            call.setString(16, cs.getRol());
            call.setString(17,bDoc.getDoc_embarque());
            
            //MEMORIZADA
            call.setString(18, bDoc.getCar_dep_date());
            call.setString(19, bDoc.getCar_voy_nber());
            call.setString(20, "reg");//si es referencia o registro   bDoc.getTipo()
            
            call.execute();
            String ans = (String)call.getObject(1);
            if(!ans.equals("Correcto"))
                throw new SQLException(ans);
        }
        catch(Exception e)
        {
            throw new SQLException(e.getMessage());
        }
    }
    private void pElimPDFD(HttpServletRequest request)
        throws Exception, SQLException
    {
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
        try
        {
            ManifiestoForm bDoc = (ManifiestoForm) request.getAttribute("ManifiestoForm");
            
            CallableStatement call = null;
            //call = cn.prepareCall("{? = call MIRA.PKG_MANIFIESTODOCS_MEM.elim_reg( ?,?,?,?,?,?,?, ?,?,? ) }");//DESARROLLO
            //call = cn.prepareCall("{? = call APP_MIRA.PKG_MANIFIESTODOCS_MEM.elim_reg( ?,?,?,?,?,?,?, ?,?,? ) }");//PRODUCCION
            call = cn.prepareCall("{? = call "+cs.getEsquema()+".PKG_MANIFIESTODOCS_MEM.elim_reg( ?,?,?,?,?,?,?, ?,?,? ) }");//PRODUCCION
            call.registerOutParameter(1, 12);
            call.setString(2, bDoc.getCar_reg_year());
            call.setString(3, bDoc.getKey_cuo());
            //call.setLong(4, Long.parseLong(bDoc.getCar_reg_nber()));
            if(bDoc.getTipo().equals("reg"))
                call.setLong(4, Long.parseLong(bDoc.getCar_reg_nber()));
            else
                call.setLong(4, -1);
            call.setString(5, bDoc.getNro_referencia());
            call.setString(6, bDoc.getNreferencia());
            call.setString(7, cs.getCodusu());
            call.setString(8, bDoc.getDoc_embarque());
            
            //memorizada
            call.setString(9, bDoc.getCar_dep_date());
            call.setString(10,bDoc.getCar_voy_nber());
            call.setString(11, "reg"); //sis es referencia o registro
            
            call.execute();
            String ans = (String)call.getObject(1);
            if(!ans.equals("Correcto"))
                throw new SQLException(ans);
        }
        catch(Exception e)
        {
            throw new SQLException(e.getMessage());
        }
    }
    
    private void pGrabaCab(HttpServletRequest request)
        throws Exception, SQLException
    {
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
        try
        {
            ManifiestoForm bDoc = (ManifiestoForm) request.getAttribute("ManifiestoForm");
            
            CallableStatement call = null;
            
            String sta= cs.getRol().equals("SIDUNEA.TRANSPORTISTA")?"F":"C";
            //call = cn.prepareCall("{? = call MIRA.PKG_MANIFIESTODOCS_MEM.g_cabecera( ?,?,?,?,?,?, ?,?,?) }");//DESARROLLO
            //call = cn.prepareCall("{? = call APP_MIRA.PKG_MANIFIESTODOCS_MEM.g_cabecera( ?,?,?,?,?,?, ?,?,?) }");//PRODUCCION "
            call = cn.prepareCall("{? = call "+cs.getEsquema()+".PKG_MANIFIESTODOCS_MEM.g_cabecera( ?,?,?,?,?,?, ?,?,?) }");//VARIABLE ESQUEMA "+cs.getEsquema()+"
            call.registerOutParameter(1, 12);
            call.setString(2, bDoc.getCar_reg_year());
            call.setString(3, bDoc.getKey_cuo());
            call.setLong(4, Long.parseLong(bDoc.getCar_reg_nber()));
            call.setString(5, sta);
            call.setString(6, cs.getCodusu());
            call.setString(7, cs.getRol());
            
            //MEMORIZADA
            call.setString(8, bDoc.getCar_dep_date());
            call.setString(9, bDoc.getCar_voy_nber());
            call.setString(10, "reg");//si es referencia o registro
            call.execute();
            String ans = (String)call.getObject(1);
            if(!ans.equals("Correcto"))
                throw new SQLException(ans);
        }
        catch(Exception e)
        {
            throw new SQLException(e.getMessage());
        }
    }
    
    private void pDescargaZip(HttpServletRequest request)
        throws Exception, SQLException
    {
        try
        {
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
        ManifiestoForm bDoc = (ManifiestoForm) request.getAttribute("ManifiestoForm");
        
        fun_util util = new fun_util();
        
        List filenames2 = new ArrayList();
            
        String[] lista_or, lista_de;
        lista_or = bDoc.getLista_origen().split("\\|");
        lista_de = bDoc.getLista_destino().split("\\|");
        
        //File subdir = new File("/u03/oracle/user_projects/data/mira/comprimidos/"+bDoc.getKey_cuo()+"/");
        File subdir4 = new File(cs.getUnidad().substring(0,cs.getUnidad().lastIndexOf("manifiestos"))+"comprimidos/");
            
        if(!subdir4.exists())
            subdir4.mkdir();
            
        File subdir = new File(cs.getUnidad().substring(0,cs.getUnidad().lastIndexOf("manifiestos"))+"comprimidos/"+bDoc.getKey_cuo()+"/");
            
        if(!subdir.exists())
            subdir.mkdir();
        String mes_dep = "";
        String anio_dep="";
        mes_dep = bDoc.getCar_dep_date().split("/")[1];
        anio_dep = bDoc.getCar_dep_date().split("/")[2];
        
        //File subdir1 = new File("/u03/oracle/user_projects/data/mira/comprimidos/"+bDoc.getKey_cuo()+"/"+anio_dep+"/");
        File subdir1 = new File(cs.getUnidad().substring(0,cs.getUnidad().lastIndexOf("manifiestos"))+"comprimidos/"+bDoc.getKey_cuo()+"/"+anio_dep+"/");
        
        if(!subdir1.exists())
            subdir1.mkdir();
        //File subdir2 = new File("/u03/oracle/user_projects/data/mira/comprimidos/"+bDoc.getKey_cuo()+"/"+anio_dep+"/"+mes_dep+"/");
        File subdir2 = new File(cs.getUnidad().substring(0,cs.getUnidad().lastIndexOf("manifiestos"))+"comprimidos/"+bDoc.getKey_cuo()+"/"+anio_dep+"/"+mes_dep+"/");
        
        if(!subdir2.exists())
            subdir2.mkdir();
        
        
        //File folder = new File("/u03/oracle/user_projects/data/mira/comprimidos/"+bDoc.getKey_cuo()+"/"+anio_dep+"/"+mes_dep+"/"+bDoc.getCar_reg_year()+"-"+bDoc.getCar_reg_nber());
        File folder = new File(cs.getUnidad().substring(0,cs.getUnidad().lastIndexOf("manifiestos"))+"comprimidos/"+bDoc.getKey_cuo()+"/"+anio_dep+"/"+mes_dep+"/"+bDoc.getCar_reg_year()+"-"+bDoc.getCar_reg_nber());
        if(!folder.exists())
            folder.mkdir();
        
        for (int i = 0; i < lista_or.length ; i++) {
            
            File origen = new File(lista_or[i]);
            File destino = new File(lista_de[i]);
            
            if(origen.length()> 0){
                InputStream in = new FileInputStream(origen);
                OutputStream out = new FileOutputStream(destino);
    
                byte[] buf = new byte[1024];
                int len;
                 
                while ((len = in.read(buf)) > 0) {
                  out.write(buf, 0, len);
                }
    
                in.close();
                out.close();
            }else{
                throw new SQLException("No se encontraron archivos para descargar");
            }
        }
        
        filenames2 =  Arrays.asList(lista_de);              
        
        String prueba="";
        prueba = util.createzipList(filenames2, bDoc.getArch_zip(), bDoc.getArch_zip());
        
        for (int i = 0; i < lista_de.length ; i++) {
            
            File destino = new File(lista_de[i]);
            destino.delete();
        }
        cs.setDescarga_mic("1");//PELIGRO OJO
        }
        catch(Exception e)
        {
            throw new SQLException(e.getMessage());
        }
    }
    
    private void pCargaParcial(HttpServletRequest request)
        throws Exception, SQLException
    {
        ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");
        try
        {
            ManifiestoForm bDoc = (ManifiestoForm) request.getAttribute("ManifiestoForm");
            
            CallableStatement call = null;
            
            //call = cn.prepareCall("{? = call MIRA.PKG_MANIFIESTODOCS_MEM.g_imagen_p( ?,?,?,?,?,?,?,?,?, ?,?,?,?,?) }");//DESARROLLO
            //call = cn.prepareCall("{? = call APP_MIRA.PKG_MANIFIESTODOCS_MEM.g_imagen_p( ?,?,?,?,?,?,?,?,?, ?,?,?,?,?) }");//PRODUCCION
            call = cn.prepareCall("{? = call "+cs.getEsquema()+".PKG_MANIFIESTODOCS_MEM.g_imagen_p( ?,?,?,?,?,?,?,?,?, ?,?,?,?,?) }");//VARIABLE ESQUEMA
            call.registerOutParameter(1, 12);
            //MANIFIESTO ORIGEN
            call.setString(2, bDoc.getCar_reg_year());
            call.setString(3, bDoc.getKey_cuo());
            if(bDoc.getTipo().equals("reg"))
                call.setLong(4, Long.parseLong(bDoc.getCar_reg_nber()));
            else
                call.setLong(4, -1);
            
            //MANIFIESTO PARCIAL            
            call.setString(5, bDoc.getP_car_reg_year());
            call.setString(6, bDoc.getP_key_cuo());
            if(bDoc.getTipo().equals("reg"))
                call.setLong(7, Long.parseLong(bDoc.getP_car_reg_nber()));
            else
                call.setLong(7, -1);
            call.setString(8, bDoc.getP_key_bol_ref());
            call.setString(9, "P");
            
            call.setString(10, cs.getCodusu());
            call.setString(11, cs.getRol());
            //call.setString(12,bDoc.getDoc_embarque());
            call.setString(12,bDoc.getP_key_bol_ref());
            
            //MEMORIZADA
            call.setString(13, bDoc.getCar_dep_date());
            call.setString(14, bDoc.getCar_voy_nber());
            call.setString(15, "reg");//si es referencia o registro   bDoc.getTipo()
            
            call.execute();
            String ans = (String)call.getObject(1);
            if(!ans.equals("Correcto"))
                throw new SQLException(ans);
        }
        catch(Exception e)
        {
            throw new SQLException(e.getMessage());
        }
    }
}
