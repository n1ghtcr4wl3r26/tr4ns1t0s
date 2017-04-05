package Transito;

import org.apache.struts.action.ActionForm;


public class CierraRutaPlazoForm extends ActionForm {
  private String aduana = "";
  private String fecha = "";
  private String hora = "";
  private String tipo = "";
  private short accion = -1;
  private String secuencia = "";
  private String obs = "";
  private String codtrans = "";
  private String dsctrans = "";
  private String placa = "";
  private String horas = "";

  public String getAduana() {
    return aduana;
  }

  public void setAduana(String newAduana) {
    aduana = newAduana;
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

  public String getTipo() {
    return tipo;
  }

  public void setTipo(String newTipo) {
    tipo = newTipo;
  }

  public short getAccion() {
    return accion;
  }

  public void setAccion(short newAccion) {
    accion = newAccion;
  }

  public String getSecuencia() {
    return secuencia;
  }

  public void setSecuencia(String newSecuencia) {
    secuencia = newSecuencia;
  }

  public String getObs() {
    return obs;
  }

  public void setObs(String newObs) {
    obs = newObs;
  }

  public String getCodtrans() {
    return codtrans;
  }

  public void setCodtrans(String newCodtrans) {
    codtrans = newCodtrans;
  }

  public String getPlaca() {
    return placa;
  }

  public void setPlaca(String newPlaca1) {
    placa = newPlaca1;
  }

  public String getHoras() {
    return horas;
  }

  public void setHoras(String newHoras) {
    horas = newHoras;
  }

  public String getDsctrans() {
    return dsctrans;
  }

  public void setDsctrans(String newDsctrans) {
    dsctrans = newDsctrans;
  }
}
