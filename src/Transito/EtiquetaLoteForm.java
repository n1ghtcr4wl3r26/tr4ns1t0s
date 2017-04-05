package Transito;


import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;


public class EtiquetaLoteForm extends ActionForm {
  
  private String aduana = "";
  private String gestion = "";
  //private String cantidad = "";
  private int cantidad = 0;
  private String fdesde = ""; //fecha actual
  private String fhasta = ""; //hora actual
  private String impresora = "";
  private String obs = "";
  private String fecreg = ""; //fecha de registro --YYYYMMDDHHMI
  private String pre2 = "";
  private String transito = "";
  private String solicitud="";

  public void reset(ActionMapping mapping, HttpServletRequest request) {
    super.reset(mapping, request);
  }

  public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
    return super.validate(mapping, request);
  }


    public void setAduana(String aduana) {
        this.aduana = aduana;
    }

    public String getAduana() {
        return aduana;
    }

    public void setGestion(String gestion) {
        this.gestion = gestion;
    }

    public String getGestion() {
        return gestion;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setFdesde(String fdesde) {
        this.fdesde = fdesde;
    }

    public String getFdesde() {
        return fdesde;
    }

    public void setFhasta(String fhasta) {
        this.fhasta = fhasta;
    }

    public String getFhasta() {
        return fhasta;
    }

    public void setImpresora(String impresora) {
        this.impresora = impresora;
    }

    public String getImpresora() {
        return impresora;
    }

    public void setObs(String obs) {
        this.obs = obs;
    }

    public String getObs() {
        return obs;
    }

    public void setFecreg(String fecreg) {
        this.fecreg = fecreg;
    }

    public String getFecreg() {
        return fecreg;
    }

    public void setPre2(String pre2) {
        this.pre2 = pre2;
    }

    public String getPre2() {
        return pre2;
    }

    public void setTransito(String transito) {
        this.transito = transito;
    }

    public String getTransito() {
        return transito;
    }

    public void setSolicitud(String solicitud) {
        this.solicitud = solicitud;
    }

    public String getSolicitud() {
        return solicitud;
    }
}
