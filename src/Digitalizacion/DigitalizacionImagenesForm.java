package Digitalizacion;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

public class DigitalizacionImagenesForm extends ActionForm {
   
      private String key_year;
      private String key_nber;
      private String key_cuo;
      private String boton;
      private String tipo_img;
      private FormFile file_img;
      private String cod_img;      
      private String imagen_prev;
      private String codusu;

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

    public void setCodusu(String codusu) {
        this.codusu = codusu;
    }

    public String getCodusu() {
        return codusu;
    }
}

