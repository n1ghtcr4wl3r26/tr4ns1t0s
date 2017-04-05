package Main;

public class Ctte {
    public static final short eLogin = 0;
    public static final short eInicio = 1;
    public static final short eFinalizacion = 2;
    public static final short eModificacion = 3;
    public static final short eCierre = 4;

    public static final short eTransbordo = 18;

    public static final short eActa = 5;
    public static final short eHabilitaEmpresa = 6;
    public static final short eHabilitaMedio = 7;
    public static final short ePaso = 8;
    public static final short ePasoPtoCtl = 9;
    public static final short eRuta = 11;
    public static final short eEtiqueta = 12;
    public static final short ePasoEtiqueta = 13;
    public static final short eRegistroGarantia = 14;
    public static final short eDespacho = 15;
    public static final short eEtiquetaGenerica = 40;

    public static final short eGenerica = 30;

    public static final short eSalidaPuerto = 16;
    public static final short eListaSalidaPuerto = 17;
    public static final short erTransito = 21;
    public static final short erMicDta = 22;
    public static final short erActa = 23;
    public static final short erFueraPlazo = 24;
    public static final short erFueraPlazo2 = 50;
    public static final short erBitacora = 25;
    public static final short erPlaca = 26;
    public static final short erResxAP = 28;
    public static final short eReportePeso = 29;

    public static final short erManPendiente = 32;

    public static final short erControldeRiesgo = 34;

    //digitalizacion de precintos
    public static final short erDigitalizarPrecinto = 20;
    public static final short erVerificarManifiesto = 37;

    //para la aplicacion del decreto supremo 2295
    public static final short eAplicacionDS2295 = 10;
    public static final short enmiendaControlDE = 101;
    
    public static final short eRegistroDeposito = 122;
    public static final short eConsultaDeposito = 126;
    

    public static final short eRegistroVariable = 61;
    public static final short eListaVariableAdmin = 61;
    public static final short eListaVariable = 62;
    public static final short eEvaluarControl = 63;

    public static final short eGestionCorreo = 64;

    public static final short erReporteAlerta = 71;
    public static final short erReporteRiesgo = 72;
    public static final short erReporteVariable = 81;
    public static final short erReporteCantidadRiesgoEstado = 82;
    public static final short erReporteCantidadAlertaRiesgo = 83;
    public static final short erReporteCantidadAlertaVariable = 84;



    public static final short eCambiaClave = 100;
    public static final short btnAcepta = 1;
    public static final short btnCancela = 2;

    //subir imagenes 22092015
    public static final short btnSubirImagen = 4;
    public static final short btnEliminarImagen = 5;

    public static final short lAdiciona = 1;
    public static final short lEdita = 2;
    public static final short lBorra = 3;
    public static final short lBusca = 4;
    public static final short lSalir = 5;
    public static final short mt_nuevo = 1;
    public static final short mt_pendiente = 2;
    public static final short mt_concluido = 3;
    public static final short mt_no_existe = 4;
    public static final short mt_placa_pendiente = 5;
    public static final short mt_registrado = 6;
    public static final short mt_eliminado = 7;
    public static final short mt_acta = 8;
    public static final short mt_tna = 9;
    public static final short mt_no_usuario = 10;
    public static final short mt_no_eliminado = 11;
    public static final short mt_no_localizado = 12;
    public static final short mt_no_aduana_paso1 = 13;
    public static final short mt_no_aduana_paso2 = 14;
    public static final short mt_no_aduana_paso3 = 15;
    public static final short mt_no_aduana_paso4 = 16;
    public static final short mt_no_aduana_paso5 = 17;
    public static final short mt_no_unico_salidapuerto = 18;
    public static final short mt_no_man_operador = 19;
    public static final short mt_no_salidapuerto = 20;
    // edgar arteaga 12012015, para impresion de etiquetas
    public static final short mt_no_habilitadounetitab = 51;
    public static final short mt_no_habilitadoimportador = 52;


    public static final short mt_no_aduana_pctl1 = 43;
    public static final short mt_no_aduana_pctl2 = 44;
    public static final short mt_no_aduana_pctl3 = 45;
    public static final short mt_no_aduana_pctl4 = 46;
    public static final short mt_no_aduana_pctl5 = 47;
    public static final short mt_no_aduana_pctl6 = 48;

    public static final short mt_correcto = 29;
    public static final short mt_error = 99;
    public static final boolean bExiste = true;
    public static final boolean bNoExiste = false;
    
    //CONTROL PARA EL DECRETO SUPREMO 2752
    public static final short mt_no_ds2752 = 80;
    public static final short mt_no_ds2752zf = 81;
    //CONTROL PARA EL DECRETO SUPREMO 2865
    public static final short mt_no_ds2865 = 82;
    public static final short mt_no_ds2865zf = 83;
    /// Carga la(s) aduana

    public static final short dbEstado = 1;
    public static final short dbLeeAsignaRutaPlazo = 20;
    public static final short dbLeeCierreRutaPlazo = 21;
    public static final short dbGrabaAsignaRutaPlazo = 30;
    public static final short dbGrabaCierreRutaPlazo = 31;
    public static final short dbGrabaActaTna = 32;
    public static final short dbBajaCierreRutaPlazo = 33;
    public static final short dbBajaActaMedio = 34;
    public static final short dbAnadeRutaPlazo = 35;
    public static final short dbVerificaEtiqueta = 36;
    public static final short dbVerificaPlazoEtiqueta = 37;
    public static final short dbGrabaPlazoEtiqueta = 38;
    public static final short dbGenerica = 39;

    //requerimiento de habilitacion de transbordo
    public static final short dbGrabaTransbordoRutaPlazo = 40;

    //subir imagen paquete 22092015
    public static final short dbGrabaImagen = 41;
    public static final short dbEliminaImagen = 42;

    //subir documentos opcio MIRA
    public static final short dbCargaPDF = 922;
    public static final short dbEliPDF = 923;
    public static final short dbDescargaZip = 925;
    public static final short dbCargaParcial = 926;
    //crud documentos
    public static final short opAbmDocumentosAdicionales = 102;
    public static final short opRepDocumentosAdicionales= 54;
    
    //justificaciones
    public static final short opJustificacionesTNA = 103;
    
    public static final short dbCargaImagen = 222;
    public static final short dbCargaImagenP = 223;

    public static final int pAcepta = 1;
    public static final int pCancela = 2;
    public static final int pBusca = 3;
    public static final String btCancela = "opcion.value=" + Ctte.pCancela + ";bCancel=true";
    public static final String btAcepta = "opcion.value=" + Ctte.pAcepta + ";bCancel=false";

    public static final int btbuscarManif = 66;
    public static final int btebuscarManif = 67;
    
    
    public static final int btgrabaDocemb = 97;
    public static final int btgrabamanif = 98;
    public static final int btgrabamanofnoaut = 99;

    //para registro llegada a deposito transitorio
    public static final short eRegLlegadaDepTransitorio = 130;
    public static final short dbGrabarLlegadaDepTransitorio = 131;
    
    //PARA DOCUMENTO SOPORTE

    public static final short dbGrabaCab = 924;


}
