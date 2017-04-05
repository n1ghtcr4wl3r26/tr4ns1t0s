package Transito;

import org.apache.struts.action.ActionForm;


public class TransbordoRutaPlazoForm extends ActionForm {
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
  
    private String aduanacierre = "";
    private String tipodoc = "";
    private String modo = "";
    private String aduanades = "";
    private String precintos = "";
    private String obsdes = "";

    private String secuenciaini = "";
        
    private String aduanaini = "";
    private String fechaini = "";
    private String horaini = "";
        
    private String manyear = "";
    private String mancuo = "";
    private String mannber = "";

    
    
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

    public void setAduanades(String aduanades) {
        this.aduanades = aduanades;
    }

    public String getAduanades() {
        return aduanades;
    }

    public void setPrecintos(String precintos) {
        this.precintos = precintos;
    }

    public String getPrecintos() {
        return precintos;
    }

    public void setSecuenciaini(String secuenciaini) {
        this.secuenciaini = secuenciaini;
    }

    public String getSecuenciaini() {
        return secuenciaini;
    }

    public void setAduanaini(String aduanaini) {
        this.aduanaini = aduanaini;
    }

    public String getAduanaini() {
        return aduanaini;
    }

    public void setFechaini(String fechaini) {
        this.fechaini = fechaini;
    }

    public String getFechaini() {
        return fechaini;
    }

    public void setHoraini(String horaini) {
        this.horaini = horaini;
    }

    public String getHoraini() {
        return horaini;
    }

    public void setObsdes(String obsdes) {
        this.obsdes = obsdes;
    }

    public String getObsdes() {
        return obsdes;
    }

    public void setTipodoc(String tipodoc) {
        this.tipodoc = tipodoc;
    }

    public String getTipodoc() {
        return tipodoc;
    }

    public void setModo(String modo) {
        this.modo = modo;
    }

    public String getModo() {
        return modo;
    }

    public void setAduanacierre(String aduanacierre) {
        this.aduanacierre = aduanacierre;
    }

    public String getAduanacierre() {
        return aduanacierre;
    }

    public void setManyear(String manyear) {
        this.manyear = manyear;
    }

    public String getManyear() {
        return manyear;
    }

    public void setMancuo(String mancuo) {
        this.mancuo = mancuo;
    }

    public String getMancuo() {
        return mancuo;
    }

    public void setMannber(String mannber) {
        this.mannber = mannber;
    }

    public String getMannber() {
        return mannber;
    }
}
