package ManifiestoDocs;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;


public class ManifiestoForm extends ActionForm{
    
    private String key_cuo;
    private String car_reg_year;
    private String car_reg_nber;
    private String opcion;
    private String fecha_arrribo;
    private String hora_arribo;
    private String tranportador;
    private String medio;
    private String key_bol_ref;
    private String tip_documento;
    private String emisor;
    private String nro_referencia;
    private String fecha_emision;
    private String importe;
    private String tip_divisa;
    private String otr_divisa;
    private String doc_adicional;
    private String desc_documento;

    private String nreferencia;
    private String narchivo;
    private FormFile  docPdf;
    private String codigo;
    private String referencia;
    private String r_aduana;
    private String carpeta;
    private String ruta;
    private String doc_embarque;
    
    private String cant_veh;// verifica si es "VEHICULOS_NUEVOS" DESPACHO ABREVIADO PARA VEHICULOS
    
    //MEMORIZADOS
    private String car_dep_date;
    private String car_voy_nber;
    private String tipo="reg";
    private String lista_origen="";
    private String lista_destino="";
    private String arch_zip="";
    //DESPACHO PARCIAL
    private String p_key_cuo;
    private String p_car_reg_year;
    private String p_car_reg_nber;
    private String p_key_bol_ref;
    

    public void setKey_cuo(String key_cuo) {
        this.key_cuo = key_cuo;
    }

    public String getKey_cuo() {
        return key_cuo;
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

    public void setOpcion(String opcion) {
        this.opcion = opcion;
    }

    public String getOpcion() {
        return opcion;
    }

    public void setFecha_arrribo(String fecha_arrribo) {
        this.fecha_arrribo = fecha_arrribo;
    }

    public String getFecha_arrribo() {
        return fecha_arrribo;
    }

    public void setHora_arribo(String hora_arribo) {
        this.hora_arribo = hora_arribo;
    }

    public String getHora_arribo() {
        return hora_arribo;
    }

    public void setTranportador(String tranportador) {
        this.tranportador = tranportador;
    }

    public String getTranportador() {
        return tranportador;
    }

    public void setMedio(String medio) {
        this.medio = medio;
    }

    public String getMedio() {
        return medio;
    }

    public void setKey_bol_ref(String key_bol_ref) {
        this.key_bol_ref = key_bol_ref;
    }

    public String getKey_bol_ref() {
        return key_bol_ref;
    }

    public void setTip_documento(String tip_documento) {
        this.tip_documento = tip_documento;
    }

    public String getTip_documento() {
        return tip_documento;
    }

    public void setEmisor(String emisor) {
        this.emisor = emisor;
    }

    public String getEmisor() {
        return emisor;
    }

    public void setNro_referencia(String nro_referencia) {
        this.nro_referencia = nro_referencia;
    }

    public String getNro_referencia() {
        return nro_referencia;
    }

    public void setFecha_emision(String fecha_emision) {
        this.fecha_emision = fecha_emision;
    }

    public String getFecha_emision() {
        return fecha_emision;
    }

    public void setImporte(String importe) {
        this.importe = importe;
    }

    public String getImporte() {
        return importe;
    }

    public void setTip_divisa(String tip_divisa) {
        this.tip_divisa = tip_divisa;
    }

    public String getTip_divisa() {
        return tip_divisa;
    }

    public void setOtr_divisa(String otr_divisa) {
        this.otr_divisa = otr_divisa;
    }

    public String getOtr_divisa() {
        return otr_divisa;
    }

    public void setDoc_adicional(String doc_adicional) {
        this.doc_adicional = doc_adicional;
    }

    public String getDoc_adicional() {
        return doc_adicional;
    }

    public void setDesc_documento(String desc_documento) {
        this.desc_documento = desc_documento;
    }

    public String getDesc_documento() {
        return desc_documento;
    }

    public void setNreferencia(String nreferencia) {
        this.nreferencia = nreferencia;
    }

    public String getNreferencia() {
        return nreferencia;
    }

    public void setNarchivo(String narchivo) {
        this.narchivo = narchivo;
    }

    public String getNarchivo() {
        return narchivo;
    }

   

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setReferencia(String referencia) {
        this.referencia = referencia;
    }

    public String getReferencia() {
        return referencia;
    }

    public void setR_aduana(String r_aduana) {
        this.r_aduana = r_aduana;
    }

    public String getR_aduana() {
        return r_aduana;
    }

    public void setCarpeta(String carpeta) {
        this.carpeta = carpeta;
    }

    public String getCarpeta() {
        return carpeta;
    }

    public void setRuta(String ruta) {
        this.ruta = ruta;
    }

    public String getRuta() {
        return ruta;
    }

    public void setDocPdf(FormFile docPdf) {
        this.docPdf = docPdf;
    }

    public FormFile getDocPdf() {
        return docPdf;
    }

    public void setDoc_embarque(String doc_embarque) {
        this.doc_embarque = doc_embarque;
    }

    public String getDoc_embarque() {
        return doc_embarque;
    }

    public void setCant_veh(String cant_veh) {
        this.cant_veh = cant_veh;
    }

    public String getCant_veh() {
        return cant_veh;
    }

    public void setCar_dep_date(String car_dep_date) {
        this.car_dep_date = car_dep_date;
    }

    public String getCar_dep_date() {
        return car_dep_date;
    }

    public void setCar_voy_nber(String car_voy_nber) {
        this.car_voy_nber = car_voy_nber;
    }

    public String getCar_voy_nber() {
        return car_voy_nber;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setLista_origen(String lista_origen) {
        this.lista_origen = lista_origen;
    }

    public String getLista_origen() {
        return lista_origen;
    }

    public void setLista_destino(String lista_destino) {
        this.lista_destino = lista_destino;
    }

    public String getLista_destino() {
        return lista_destino;
    }

    public void setArch_zip(String arch_zip) {
        this.arch_zip = arch_zip;
    }

    public String getArch_zip() {
        return arch_zip;
    }

    public void setP_key_cuo(String p_key_cuo) {
        this.p_key_cuo = p_key_cuo;
    }

    public String getP_key_cuo() {
        return p_key_cuo;
    }

    public void setP_car_reg_year(String p_car_reg_year) {
        this.p_car_reg_year = p_car_reg_year;
    }

    public String getP_car_reg_year() {
        return p_car_reg_year;
    }

    public void setP_car_reg_nber(String p_car_reg_nber) {
        this.p_car_reg_nber = p_car_reg_nber;
    }

    public String getP_car_reg_nber() {
        return p_car_reg_nber;
    }

    public void setP_key_bol_ref(String p_key_bol_ref) {
        this.p_key_bol_ref = p_key_bol_ref;
    }

    public String getP_key_bol_ref() {
        return p_key_bol_ref;
    }
}
