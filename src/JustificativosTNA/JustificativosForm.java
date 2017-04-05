package JustificativosTNA;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

public class JustificativosForm extends ActionForm {
    private String key_year;
    private String key_nber;
    private String key_cuo;
    private String boton;
    
    private String tipo_img;
    private FormFile file_img;
    private String cod_img;      
    private String imagen_prev;
    private String codusu;
    
    private String aduanapres;
    private String adu_pres;
    private String cite_just;
    private String fecha_just;
    private String hoja_ruta;
    private String causa;
    private String observacion;
    private FormFile file_jus;
    private String documento;
    
    private String fec_actual;
    
    

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

    public void setAduanapres(String aduanapres) {
        this.aduanapres = aduanapres;
    }

    public String getAduanapres() {
        return aduanapres;
    }

    public void setCite_just(String cite_just) {
        this.cite_just = cite_just;
    }

    public String getCite_just() {
        return cite_just;
    }

    public void setFecha_just(String fecha_just) {
        this.fecha_just = fecha_just;
    }

    public String getFecha_just() {
        return fecha_just;
    }

    public void setHoja_ruta(String hoja_ruta) {
        this.hoja_ruta = hoja_ruta;
    }

    public String getHoja_ruta() {
        return hoja_ruta;
    }

    public void setCausa(String causa) {
        this.causa = causa;
    }

    public String getCausa() {
        return causa;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setFile_jus(FormFile file_jus) {
        this.file_jus = file_jus;
    }

    public FormFile getFile_jus() {
        return file_jus;
    }

    public void setAdu_pres(String adu_pres) {
        this.adu_pres = adu_pres;
    }

    public String getAdu_pres() {
        return adu_pres;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public String getDocumento() {
        return documento;
    }

    public void setFec_actual(String fec_actual) {
        this.fec_actual = fec_actual;
    }

    public String getFec_actual() {
        return fec_actual;
    }
}
