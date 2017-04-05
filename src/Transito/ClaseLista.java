package Transito;

public class ClaseLista {
  private String codigo = "";
  private String dsc = "";
  private String acceso = "";
  private String index = "";

  public ClaseLista() {
  }

  public ClaseLista(String codigo, String dsc) {
    this.codigo = codigo;
    this.dsc = dsc;
  }

  public ClaseLista(String codigo, String dsc, String acceso, String index) {
    this.codigo = codigo;
    this.dsc = dsc;
    this.acceso = acceso;

    if (index != null) {
      this.index = "9";
    }
  }

  public String getCodigo() {
    return codigo;
  }

  public void setCodigo(String newCodigo) {
    codigo = newCodigo;
  }

  public String getDsc() {
    return dsc;
  }

  public void setDsc(String newDsc) {
    dsc = newDsc;
  }

  public String getAcceso() {
    return acceso;
  }

  public void setAcceso(String newAcceso) {
    acceso = newAcceso;
  }

  public String getIndex() {
    return index;
  }

  public void setIndex(String newIndex) {
    index = newIndex;
  }
}
