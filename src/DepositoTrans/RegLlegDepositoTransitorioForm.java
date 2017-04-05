package DepositoTrans;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

public class RegLlegDepositoTransitorioForm extends ActionForm {
   
      private String car_reg_year;
      private String car_reg_nber;
      private String key_cuo;
      private String boton;
      private String cod_depositoTransitorio;

      private FormFile file_manifiesto;

    public void setKey_cuo(String key_cuo) {
        this.key_cuo = key_cuo;
    }

    public String getKey_cuo() {
        return key_cuo;
    }

    public void setBoton(String boton) {
        this.boton = boton;
    }

    public String getBoton() {
        return boton;
    }



    public void setFile_manifiesto(FormFile file_manifiesto) {
        this.file_manifiesto = file_manifiesto;
    }

    public FormFile getFile_manifiesto() {
        return file_manifiesto;
    }

    public void setCar_reg_year(String car_reg_year) {
        this.car_reg_year = car_reg_year;
    }

    public String getCar_reg_year() {
        return car_reg_year;
    }

    public void setCar_reg_nber(String car_reg_nber) {
        this.car_reg_nber = car_reg_nber;
    }

    public String getCar_reg_nber() {
        return car_reg_nber;
    }

    public void setCod_depositoTransitorio(String cod_depositoTransitorio) {
        this.cod_depositoTransitorio = cod_depositoTransitorio;
    }

    public String getCod_depositoTransitorio() {
        return cod_depositoTransitorio;
    }
}
