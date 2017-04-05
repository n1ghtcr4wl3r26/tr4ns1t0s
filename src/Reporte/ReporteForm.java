package Reporte;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;


public class ReporteForm extends ActionForm {
  private String nit = "";
  private String i_aduana = "";
  private String d_aduana = "";
  private String salida = "PDF";
  private String p_medio = "";
  private String d_fecha = "";
  private String i_fecha = "";
  private String check1 = "";
  private String check2 = "";
  private String check3 = "";
  private String check4 = "";
  private String check5 = "";
  private String check6 = "";
  private String check7 = "";
  private String tipo = "";
private String empresa ="";
private String transporte ="";
private String placa ="";
private String chofer = "";
private String remitente = "";
private String proveedor = "";


private String boton ="";

  public void reset(ActionMapping mapping, HttpServletRequest request) {
    super.reset(mapping, request);
  }

  public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
    return super.validate(mapping, request);
  }

  public String getNit() {
    return nit;
  }

  public void setNit(String newNit) {
    nit = newNit;
  }

  public String getI_aduana() {
    return i_aduana;
  }

  public void setI_aduana(String newI_aduana) {
    i_aduana = newI_aduana;
  }

  public String getD_aduana() {
    return d_aduana;
  }

  public void setD_aduana(String newD_aduana) {
    d_aduana = newD_aduana;
  }

  public String getSalida() {
    return salida;
  }

  public void setSalida(String newSalida) {
    salida = newSalida;
  }

  public String getP_medio() {
    return p_medio;
  }

  public void setP_medio(String newP_medio) {
    p_medio = newP_medio;
  }

  public String getD_fecha() {
    return d_fecha;
  }

  public void setD_fecha(String newD_fecha) {
    d_fecha = newD_fecha;
  }

  public String getI_fecha() {
    return i_fecha;
  }

  public void setI_fecha(String newI_fecha) {
    i_fecha = newI_fecha;
  }

  public String getCheck1() {
    return check1;
  }

  public void setCheck1(String newCheck1) {
    check1 = newCheck1;
  }

  public String getCheck2() {
    return check2;
  }

  public void setCheck2(String newCheck2) {
    check2 = newCheck2;
  }

  public String getCheck3() {
    return check3;
  }

  public void setCheck3(String newCheck3) {
    check3 = newCheck3;
  }

  public String getCheck4() {
    return check4;
  }

  public void setCheck4(String newCheck4) {
    check4 = newCheck4;
  }

  public String getCheck5() {
    return check5;
  }

  public void setCheck5(String newCheck5) {
    check5 = newCheck5;
  }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setCheck6(String check6) {
        this.check6 = check6;
    }

    public String getCheck6() {
        return check6;
    }

    public void setCheck7(String check7) {
        this.check7 = check7;
    }

    public String getCheck7() {
        return check7;
    }

    public void setEmpresa(String empresa) {
        this.empresa = empresa;
    }

    public String getEmpresa() {
        return empresa;
    }

    public void setTransporte(String transporte) {
        this.transporte = transporte;
    }

    public String getTransporte() {
        return transporte;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getPlaca() {
        return placa;
    }

    public void setChofer(String chofer) {
        this.chofer = chofer;
    }

    public String getChofer() {
        return chofer;
    }

    public void setRemitente(String remitente) {
        this.remitente = remitente;
    }

    public String getRemitente() {
        return remitente;
    }

    public void setBoton(String boton) {
        this.boton = boton;
    }

    public String getBoton() {
        return boton;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }

    public String getProveedor() {
        return proveedor;
    }
}
