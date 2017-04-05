package Transito;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;


public class AsignaRutaPlazoForm extends ActionForm {
  private ArrayList lista = new ArrayList();
  private short accion = -1;
  private String codtrans = "";
  private String dsctrans = "";
  private String placa = "";
  private int tiptra = 0;
  private String fecha = ""; //fecha actual
  private String hora = ""; //hora actual
  private String pre1 = "";
  private String obs = "";
  private String paso = "";
  private boolean tiene = false;
  private String boleta = "";
  private String entidad = "";
  private String fecini = "";
  private String fecfin = "";
  private double monto = 0d;
  private String moneda = "";
  private String fecreg = ""; //fecha de registro --YYYYMMDDHHMI
  private String feclim = ""; //fecha actual + 24 horas --YYYYMMDDHHMI
  private String pre2 = "";
  private String transito = "";
  
  private String verificacion = "";
  
  //adjuntar imagenes 22092015
  private String tipo_img;
  private FormFile file_img;
  private String cod_img;
  
  private String imagen_prev;
  
  
  

  public void reset(ActionMapping mapping, HttpServletRequest request) {
    super.reset(mapping, request);
  }

  public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
    return super.validate(mapping, request);
  }

  public short getAccion() {
    return accion;
  }

  public void setAccion(short newAccion) {
    accion = newAccion;
  }

  public String getCodtrans() {
    return codtrans;
  }

  public void setCodtrans(String newCodtrans) {
    codtrans = newCodtrans;
  }

  public String getDsctrans() {
    return dsctrans;
  }

  public void setDsctrans(String newDsctrans) {
    dsctrans = newDsctrans;
  }

  public String getPlaca() {
    return placa;
  }

  public void setPlaca(String newPlaca) {
    placa = newPlaca;
  }

  public int getTiptra() {
    return tiptra;
  }

  public void setTiptra(int newTiptra) {
    tiptra = newTiptra;
  }

  public ArrayList getLista() {
    return lista;
  }

  public void setLista(ArrayList newLista) {
    lista = newLista;
  }

  public ClaseLista getLista(int index) {
    return (ClaseLista)lista.get(index);
  }

  public void setLista(ClaseLista ad, int index) {
    lista.set(index, ad);
  }

  public String getFecha() {
    return fecha;
  }

  public void setFecha(String newFecha) {
    fecha = newFecha;
  }

  public String getHora() {
    return hora;
  }

  public void setHora(String newHora) {
    hora = newHora;
  }

  public String getPre1() {
    return pre1;
  }

  public void setPre1(String newPre1) {
    pre1 = newPre1;
  }

  public boolean isTiene() {
    return tiene;
  }

  public void setTiene(boolean newTiene) {
    tiene = newTiene;
  }

  public String getBoleta() {
    return boleta;
  }

  public void setBoleta(String newBoleta) {
    boleta = newBoleta;
  }

  public String getEntidad() {
    return entidad;
  }

  public void setEntidad(String newEntidad) {
    entidad = newEntidad;
  }

  public String getFecini() {
    return fecini;
  }

  public void setFecini(String newFecini) {
    fecini = newFecini;
  }

  public String getFecfin() {
    return fecfin;
  }

  public void setFecfin(String newFecfin) {
    fecfin = newFecfin;
  }

  public double getMonto() {
    return monto;
  }

  public void setMonto(double newMonto) {
    monto = newMonto;
  }

  public String getMoneda() {
    return moneda;
  }

  public void setMoneda(String newMoneda) {
    moneda = newMoneda;
  }

  public String getFecreg() {
    return fecreg;
  }

  public void setFecreg(String newFecreg) {
    fecreg = newFecreg;
  }

  public String getObs() {
    return obs;
  }

  public void setObs(String newObs) {
    obs = newObs;
  }

  public String getPaso() {
    return paso;
  }

  public void setPaso(String newPaso) {
    paso = newPaso;
  }

  public String getFeclim() {
    return feclim;
  }

  public void setFeclim(String newFeclim) {
    feclim = newFeclim;
  }

  public String getPre2() {
    return pre2;
  }

  public void setPre2(String newPre2) {
    pre2 = newPre2;
  }

  public String getTransito() {
    return transito;
  }

  public void setTransito(String newTransito) {
    transito = newTransito;
  }

    public void setVerificacion(String verificacion) {
        this.verificacion = verificacion;
    }

    public String getVerificacion() {
        return verificacion;
    }

    public void setTipo_img(String tipo_img) {
        this.tipo_img = tipo_img;
    }

    public String getTipo_img() {
        return tipo_img;
    }

    public void setFile_img(FormFile file_img) {
        this.file_img = file_img;
    }

    public FormFile getFile_img() {
        return file_img;
    }

    public void setCod_img(String cod_img) {
        this.cod_img = cod_img;
    }

    public String getCod_img() {
        return cod_img;
    }

    public void setImagen_prev(String imagen_prev) {
        this.imagen_prev = imagen_prev;
    }

    public String getImagen_prev() {
        return imagen_prev;
    }
}
