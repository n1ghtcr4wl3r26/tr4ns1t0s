package Main;

public class ClaseMenu {
  int codigo = 0;
  String dsc = "";
  int nivel = 0;
  String accion = "";

  public ClaseMenu() {
  }

  public ClaseMenu(int codigo, String dsc) {
    this.codigo = codigo;
    this.dsc = dsc;
  }
  
  public ClaseMenu(int codigo, String dsc,int nivel, String accion) {
    this.codigo = codigo;
    this.dsc = dsc;
    this.nivel = nivel;
    this.accion = accion;
  }

  public void setCodigo(int codigo) {
    this.codigo = codigo;
  }

  public int getCodigo() {
    return codigo;
  }

  public void setDsc(String dsc) {
    this.dsc = dsc;
  }

  public String getDsc() {
    return dsc;
  }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    public int getNivel() {
        return nivel;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }

    public String getAccion() {
        return accion;
    }
}
