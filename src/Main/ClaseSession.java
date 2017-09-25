package Main;

import java.util.ArrayList;
import java.util.List;


public class ClaseSession {
  private List<ClaseMenu> lista = new ArrayList<ClaseMenu>();
  private short opcion = Ctte.eLogin;
  private String setapa;
  private String codusu = "";
  private String nomusu = "";
  private String rol = "";
  private String key_cuo = "";
  private String aduana = "";
    
  private String key_year = "";
  private String key_nber = "";
  private String key_sec = "";
  private String dscadu = "";
  private String aduanas = "";
  private boolean breporte = false;
  private boolean resumen = false;
  private boolean resumen2 = false;
  private int etiqueta = 0;
  //PlazoEtiqueta
  private int plazoEtiqueta = 0;
  private String error = "";

    private String nit = "";

//PARA LA DESCARGA DE DOCUMENTOS COMPRIMIDOS
    private String descarga_mic="0";
    //TAMA?O DE LOS DOCUMENTOS SOPORTE
    private int peso_file =0;
    //ESQUEMA MIRA DESARROLLO APP_MIRA PRODUCCION
    private String esquema="mira";//DESARROLLO
    //private String esquema="app_mira";//PRODUCCION
    
    private String unidad="";
    
  public void setOpcion(short newOpcion) {
    opcion = newOpcion;

    switch (this.opcion) {
      case Ctte.eInicio:
        this.setapa = "Inicio del Tr&aacute;nsito";

        break;

      case Ctte.eModificacion:
        this.setapa = "Reasignaci&oacute;n del Tr&aacute;nsito";

        break;

      case Ctte.eFinalizacion:
        this.setapa = "Cierre del Tr&aacute;nsito";

        break;
    
      case Ctte.eTransbordo:
        this.setapa = "Transbordo del Tr&aacute;nsito";

        break;

      case Ctte.erTransito:
        this.setapa = "Reporte del Tr&aacute;nsito";

        break;

      case Ctte.eCierre:
        this.setapa = "Cancelaci&oacute;n del Tr&aacute;nsito";

        break;

      case Ctte.erMicDta:
        this.setapa = "Reporte Detalle MIC.DTA.";

        break;

      case Ctte.eActa:
        this.setapa = "Registro del Acta de Intervenci&oacute;n";

        break;

      case Ctte.ePaso:
        this.setapa = "Aduana de Paso";

        break;

      case Ctte.ePasoPtoCtl:
        this.setapa = "Punto de Control";

        break;

      case Ctte.eRuta:
        this.setapa = "ABC - Rutas y Plazos";

        break;

      case Ctte.eHabilitaEmpresa:
        this.setapa = "Habilita Empresas que tengan Actas de Intervenci&oacute;n";

        break;

      case Ctte.eHabilitaMedio:
        this.setapa = "Habilita Medios que tengan Actas de Intervenci&oacute;n";

        break;
    
      case Ctte.erResxAP:
        this.setapa = "Resumen de Tr&aacute;nsitos";

        break;
    
      case Ctte.eLogin:
        this.setapa = "Ingreso al Sistema";

        break;

      case Ctte.eCambiaClave:
        this.setapa = "Cambio de Clave";

        break;

      case Ctte.erBitacora:
        this.setapa = "Despliega la Bit&aacute;cora de un Tr&aacute;nsito Registrado";

        break;

      case Ctte.erActa:
        this.setapa = "Las Actas de Interveci&oacute;n a las Empresas y Medios de Transporte";

        break;

      case Ctte.erFueraPlazo:
        this.setapa = "Tr&aacute;nsitos por Estados";

        break;

      case Ctte.erPlaca:
        this.setapa = "Tr&aacute;nsitos por Placa";

        break;

      case Ctte.eEtiqueta:
        this.setapa = "Imprime Etiqueta de Control";

        break;

      case Ctte.ePasoEtiqueta:
        this.setapa = "Aduana de Paso - Leer Etiqueta de Tr&aacute;nsito";

        break;

      case Ctte.eReportePeso:
        this.setapa = "Reporte de Registro de Peso";

        break;

      case Ctte.eDespacho:
        this.setapa = "Despacho Anticipado.";

        break;
      //SaldoEtiqueta    
      case Ctte.eSalidaPuerto:
          this.setapa = "Salida de puerto - Leer etiqueta de TRANSITO";

          break;
        case Ctte.eListaSalidaPuerto:
            this.setapa = "Lista Salida de puerto";

        break;
    
        case Ctte.erManPendiente:
          this.setapa = "Reporte de Manifiestos Pendientes";

          break;

    
    //Regisro de Documentos Adicionales
    case Ctte.opAbmDocumentosAdicionales:
        //this.setapa = "Registrar documentos Adicionales";
        this.setapa = "Confirmación Registro Manifiesto";

    break;
    
    //Reporte de Control de Riesgo
    case Ctte.erControldeRiesgo:
        this.setapa = "Reporte Control de Riesgo";

    //Registreo informacion decreto supremo 2295
    case Ctte.eAplicacionDS2295:
    	this.setapa = "Control D/E";
    break;
    
    //Digitalizacion de Imagenes
    case Ctte.erDigitalizarPrecinto:
        this.setapa = "Digitalizaci&oacute;n de Precinto";
    break;
    
    case Ctte.erVerificarManifiesto:
        this.setapa = "Verificaci&oacute;n del Manifiesto";
    break;
    
    //reporte transitos puerto
        case 31:
          this.setapa = "Reporte de Tr&aacute;nsitos de Puerto";


            break;
		case Ctte.eEtiquetaGenerica:
            this.setapa = "Etiquetas Genericas";

            break;
    case Ctte.eGenerica:
            this.setapa = "Etiquetas Genericas";
            break;
    
    case Ctte.eRegistroVariable:
        this.setapa = "Lista Variables";
        break;

    case Ctte.eListaVariable:
            this.setapa = "Lista Variables";
            break;
        
    case Ctte.eEvaluarControl:
        this.setapa = "Evaluar Riesgos";
        break;
        
    case Ctte.eGestionCorreo:
        this.setapa = "Gesti&oacute;n de Correo";
        break;
                        
    case Ctte.erReporteAlerta:
        this.setapa = "Alertas Generadas por MIC";
        break;
                
    case Ctte.erReporteRiesgo:
        this.setapa = "Riesgos Identificados";
        break;
                
    case Ctte.erReporteVariable:
        this.setapa = "Variable de Riesgos";
        break;
                
    case Ctte.erReporteCantidadRiesgoEstado:
        this.setapa = "N&uacute;mero de Riesgos y su Estado por Variable de Riesgo";
        break;
        
    case Ctte.erReporteCantidadAlertaRiesgo:
        this.setapa = "N&uacute;mero de Alertas Generadas por Riesgo";
        break;
                
    case Ctte.erReporteCantidadAlertaVariable:
        this.setapa = "N&uacute;mero de Alertas por Variable de Riesgo y Resultado";
            break;
    
    case Ctte.eRegLlegadaDepTransitorio:
        this.setapa = "Registro LLegada a Dep&oacute;sito Transitorio";
            break;

    case 122:
        this.setapa = "Registro Dep&oacute;sito Transitorio";
            break;
    
    case 126:
        this.setapa = "Dep&oacute;sitos Transitorios Registrados";
            break;
    
    case 103:
        this.setapa = "Justificativos TNA";
            break;
    
    case Ctte.enmiendaControlDE:
        this.setapa = "Enmienda Control D/E";
        break;
    }
  }

  public short getOpcion() {
    return opcion;
  }

  public void setSetapa(String setapa) {
    this.setapa = setapa;
  }

  public String getSetapa() {
    return setapa;
  }

  public void setCodusu(String codusu) {
    this.codusu = codusu;
  }

  public String getCodusu() {
    return codusu;
  }

  public void setNomusu(String nomusu) {
    this.nomusu = nomusu;
  }

  public String getNomusu() {
    return nomusu;
  }

  public void setRol(String rol) {
    this.rol = rol;
  }

  public String getRol() {
    return rol;
  }

  public void setKey_cuo(String key_cuo) {
    this.key_cuo = key_cuo;
  }

  public String getKey_cuo() {
    return key_cuo;
  }

  public void setKey_year(String key_year) {
    this.key_year = key_year;
  }

  public String getKey_year() {
    return key_year;
  }

  public void setKey_nber(String key_nber) {
    this.key_nber = key_nber;
  }

  public String getKey_nber() {
    return key_nber;
  }

  public void setDscadu(String dscadu) {
    this.dscadu = dscadu;
  }

  public String getDscadu() {
    return dscadu;
  }

  public void setAduanas(String aduanas) {
    this.aduanas = aduanas;
  }

  public String getAduanas() {
    return aduanas;
  }

  public void setBreporte(boolean breporte) {
    this.breporte = breporte;
  }

  public boolean isBreporte() {
    return breporte;
  }

  public void setResumen(boolean resumen) {
    this.resumen = resumen;
  }

  public boolean isResumen() {
    return resumen;
  }

  public void setResumen2(boolean resumen2) {
    this.resumen2 = resumen2;
  }

  public boolean isResumen2() {
    return resumen2;
  }

  public void setEtiqueta(int etiqueta) {
    this.etiqueta = etiqueta;
  }

  public int getEtiqueta() {
    return etiqueta;
  }

  public void setLista(List<ClaseMenu> lista) {
    this.lista = lista;
  }

  public List<ClaseMenu> getLista() {
    return lista;
  }

    public int getPlazoEtiqueta() {
        return plazoEtiqueta;
    }

    public void setPlazoEtiqueta(int plazoEtiqueta) {
        this.plazoEtiqueta = plazoEtiqueta;
    }

    public void setKey_sec(String key_sec) {
        this.key_sec = key_sec;
    }

    public String getKey_sec() {
        return key_sec;
    }

    public void setError(String error) {
        this.error = error;
    }

    public String getError() {
        return error;
    }

    public void setAduana(String aduana) {
        this.aduana = aduana;
    }

    public String getAduana() {
        return aduana;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getNit() {
        return nit;
    }

    public void setDescarga_mic(String descarga_mic) {
        this.descarga_mic = descarga_mic;
    }

    public String getDescarga_mic() {
        return descarga_mic;
    }

    public void setPeso_file(int peso_file) {
        this.peso_file = peso_file;
    }

    public int getPeso_file() {
        return peso_file;
    }

    public void setEsquema(String esquema) {
        this.esquema = esquema;
    }

    public String getEsquema() {
        return esquema;
    }

    public void setUnidad(String unidad) {
        this.unidad = unidad;
    }

    public String getUnidad() {
        return unidad;
    }
}
