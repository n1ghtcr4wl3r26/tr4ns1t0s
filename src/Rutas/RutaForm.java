package Rutas;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;


public class RutaForm extends ActionForm {
  private String p_rou_cod = "";
  private String p_cuo_sal = "";
  private String p_cuo_arr = "";
  private String p_rou_ter = "";
  
  private String p_rou_ter_ver = "";
    
  private String p_rou_mod = "";
  private String p_des;
  private int opcion = 0;
  private int lopcion = 0;
  
  

  public void reset(ActionMapping mapping, HttpServletRequest request) {
    super.reset(mapping, request);
  }

  public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
    return super.validate(mapping, request);
  }

  public String getP_rou_cod() {
    return p_rou_cod;
  }

  public void setP_rou_cod(String newP_rou_cod) {
    p_rou_cod = newP_rou_cod;
  }

  public String getP_cuo_sal() {
    return p_cuo_sal;
  }

  public void setP_cuo_sal(String newP_cuo_sal) {
    p_cuo_sal = newP_cuo_sal;
  }

  public String getP_cuo_arr() {
    return p_cuo_arr;
  }

  public void setP_cuo_arr(String newP_cuo_arr) {
    p_cuo_arr = newP_cuo_arr;
  }

  public String getP_rou_ter() {
    return p_rou_ter;
  }

  public void setP_rou_ter(String newP_rou_ter) {
    p_rou_ter = newP_rou_ter;
  }

  public String getP_rou_mod() {
    return p_rou_mod;
  }

  public void setP_rou_mod(String newP_rou_mod) {
    p_rou_mod = newP_rou_mod;
  }

  public String getP_des() {
    return p_des;
  }

  public void setP_des(String newP_des) {
    p_des = newP_des;
  }

  public int getOpcion() {
    return opcion;
  }

  public void setOpcion(int newOpcion) {
    opcion = newOpcion;
  }

  public int getLopcion() {
    return lopcion;
  }

  public void setLopcion(int newLopcion) {
    lopcion = newLopcion;
  }

    public void setP_rou_ter_ver(String p_rou_ter_ver) {
        this.p_rou_ter_ver = p_rou_ter_ver;
    }

    public String getP_rou_ter_ver() {
        return p_rou_ter_ver;
    }
}
