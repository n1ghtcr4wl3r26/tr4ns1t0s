package eRegdocemb2295;

import org.apache.struts.action.ActionForm;

public class eBusqManifiestoForm extends ActionForm {
    
    private short aopcion ;

    private String tipo;
    
    private String reffechaSalida;  
    private String refaduanasel = "";
    private String refnroViaje;  
    
    private String aduanaDescripcion;
  
    private String reggestion;
    private String regaduanasel = "";
    private String regnroRegistro;
    private int opcion=0;
    private int fila=0;  

    
    private String docemb_fecha_embarque;
    private String  docemb_silista_rs1392015;
    private String  docemb_si_pri_rs1692016;
    private String  docemb_si_seg_rs1692016;
    private String docemb_otras_mercancias;
    private String docemb_est_autorizado;
    
    private String docemb_cantidad;
    
    private String docemb_cantidad_partidas;
    
    private String key_year;
    private String key_nber;
    private String key_cuo;
    private String dep_date;
    private String key_voy_nber;
    private String key_dep_date;
    private String key_bol_ref;
        
    private String chkDS2600;
    private String valds2600;
    private String chkDS2657;
    private String valds2657;
    private String chkDS2751;
    private String valds2751;
    private String chkDS2752;
    private String valds2752;
    private String chkDS2752CAN;
    private String valds2752CAN;    
    private String chkDS2865;
    private String valds2865;
    private String chkninguno;
    private String vkey_cuo;
    private String vkey_dep_date;
    private String vkey_voy_nber;
    private String vkey_bol_ref;
    private String vfec_embarque;
    private String vfec_d2657;
    private String vfec_d2600;
    private String vfec_d2751;
    private String vfec_d2752;
    private String vobservacion;
    private String vfec_d2865;
    
    private String vobs2295;
    
    
    private String aduautpreviaext;

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setReffechaSalida(String reffechaSalida) {
        this.reffechaSalida = reffechaSalida;
    }

    public String getReffechaSalida() {
        return reffechaSalida;
    }

    public void setRefnroViaje(String refnroViaje) {
        this.refnroViaje = refnroViaje;
    }

    public String getRefnroViaje() {
        return refnroViaje;
    }


    public void setAduanaDescripcion(String aduanaDescripcion) {
        this.aduanaDescripcion = aduanaDescripcion;
    }

    public String getAduanaDescripcion() {
        return aduanaDescripcion;
    }

    public void setReggestion(String reggestion) {
        this.reggestion = reggestion;
    }

    public String getReggestion() {
        return reggestion;
    }

    public void setRegnroRegistro(String regnroRegistro) {
        this.regnroRegistro = regnroRegistro;
    }

    public String getRegnroRegistro() {
        return regnroRegistro;
    }

    public void setRefaduanasel(String refaduanasel) {
        this.refaduanasel = refaduanasel;
    }

    public String getRefaduanasel() {
        return refaduanasel;
    }

    public void setRegaduanasel(String regaduanasel) {
        this.regaduanasel = regaduanasel;
    }

    public String getRegaduanasel() {
        return regaduanasel;
    }

    public void setAopcion(short aopcion) {
        this.aopcion = aopcion;
    }

    public short getAopcion() {
        return aopcion;
    }

  
    public void setFila(int fila) {
        this.fila = fila;
    }

    public int getFila() {
        return fila;
    }

    public void setOpcion(int opcion) {
        this.opcion = opcion;
    }

    public int getOpcion() {
        return opcion;
    }

    public void setDocemb_fecha_embarque(String docemb_fecha_embarque) {
        this.docemb_fecha_embarque = docemb_fecha_embarque;
    }

    public String getDocemb_fecha_embarque() {
        return docemb_fecha_embarque;
    }

    public void setDocemb_silista_rs1392015(String docemb_silista_rs1392015) {
        this.docemb_silista_rs1392015 = docemb_silista_rs1392015;
    }

    public String getDocemb_silista_rs1392015() {
        return docemb_silista_rs1392015;
    }

    public void setDocemb_si_pri_rs1692016(String docemb_si_pri_rs1692016) {
        this.docemb_si_pri_rs1692016 = docemb_si_pri_rs1692016;
    }

    public String getDocemb_si_pri_rs1692016() {
        return docemb_si_pri_rs1692016;
    }

    public void setDocemb_otras_mercancias(String docemb_otras_mercancias) {
        this.docemb_otras_mercancias = docemb_otras_mercancias;
    }

    public String getDocemb_otras_mercancias() {
        return docemb_otras_mercancias;
    }

    public void setDocemb_est_autorizado(String docemb_est_autorizado) {
        this.docemb_est_autorizado = docemb_est_autorizado;
    }

    public String getDocemb_est_autorizado() {
        return docemb_est_autorizado;
    }

    public void setDocemb_si_seg_rs1692016(String docemb_si_seg_rs1692016) {
        this.docemb_si_seg_rs1692016 = docemb_si_seg_rs1692016;
    }

    public String getDocemb_si_seg_rs1692016() {
        return docemb_si_seg_rs1692016;
    }

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

    public void setDep_date(String dep_date) {
        this.dep_date = dep_date;
    }

    public String getDep_date() {
        return dep_date;
    }

    public void setKey_voy_nber(String key_voy_nber) {
        this.key_voy_nber = key_voy_nber;
    }

    public String getKey_voy_nber() {
        return key_voy_nber;
    }

    public void setKey_dep_date(String key_dep_date) {
        this.key_dep_date = key_dep_date;
    }

    public String getKey_dep_date() {
        return key_dep_date;
    }

    public void setKey_bol_ref(String key_bol_ref) {
        this.key_bol_ref = key_bol_ref;
    }

    public String getKey_bol_ref() {
        return key_bol_ref;
    }

    public void setDocemb_cantidad(String docemb_cantidad) {
        this.docemb_cantidad = docemb_cantidad;
    }

    public String getDocemb_cantidad() {
        return docemb_cantidad;
    }

    public void setDocemb_cantidad_partidas(String docemb_cantidad_partidas) {
        this.docemb_cantidad_partidas = docemb_cantidad_partidas;
    }

    public String getDocemb_cantidad_partidas() {
        return docemb_cantidad_partidas;
    }

    public void setChkDS2600(String chkDS2600) {
        this.chkDS2600 = chkDS2600;
    }

    public String getChkDS2600() {
        return chkDS2600;
    }

    public void setValds2600(String valds2600) {
        this.valds2600 = valds2600;
    }

    public String getValds2600() {
        return valds2600;
    }

    public void setChkDS2657(String chkDS2657) {
        this.chkDS2657 = chkDS2657;
    }

    public String getChkDS2657() {
        return chkDS2657;
    }

    public void setValds2657(String valds2657) {
        this.valds2657 = valds2657;
    }

    public String getValds2657() {
        return valds2657;
    }

    public void setChkDS2751(String chkDS2751) {
        this.chkDS2751 = chkDS2751;
    }

    public String getChkDS2751() {
        return chkDS2751;
    }

    public void setValds2751(String valds2751) {
        this.valds2751 = valds2751;
    }

    public String getValds2751() {
        return valds2751;
    }

    public void setChkDS2752(String chkDS2752) {
        this.chkDS2752 = chkDS2752;
    }

    public String getChkDS2752() {
        return chkDS2752;
    }

    public void setValds2752(String valds2752) {
        this.valds2752 = valds2752;
    }

    public String getValds2752() {
        return valds2752;
    }

    public void setChkDS2752CAN(String chkDS2752CAN) {
        this.chkDS2752CAN = chkDS2752CAN;
    }

    public String getChkDS2752CAN() {
        return chkDS2752CAN;
    }

    public void setValds2752CAN(String valds2752CAN) {
        this.valds2752CAN = valds2752CAN;
    }

    public String getValds2752CAN() {
        return valds2752CAN;
    }

    public void setChkninguno(String chkninguno) {
        this.chkninguno = chkninguno;
    }

    public String getChkninguno() {
        return chkninguno;
    }

    public void setVkey_cuo(String vkey_cuo) {
        this.vkey_cuo = vkey_cuo;
    }

    public String getVkey_cuo() {
        return vkey_cuo;
    }

    public void setVkey_dep_date(String vkey_dep_date) {
        this.vkey_dep_date = vkey_dep_date;
    }

    public String getVkey_dep_date() {
        return vkey_dep_date;
    }

    public void setVkey_voy_nber(String vkey_voy_nber) {
        this.vkey_voy_nber = vkey_voy_nber;
    }

    public String getVkey_voy_nber() {
        return vkey_voy_nber;
    }

 

    public void setVkey_bol_ref(String vkey_bol_ref) {
        this.vkey_bol_ref = vkey_bol_ref;
    }

    public String getVkey_bol_ref() {
        return vkey_bol_ref;
    }

    public void setVfec_embarque(String vfec_embarque) {
        this.vfec_embarque = vfec_embarque;
    }

    public String getVfec_embarque() {
        return vfec_embarque;
    }


    public void setVfec_d2657(String vfec_d2657) {
        this.vfec_d2657 = vfec_d2657;
    }

    public String getVfec_d2657() {
        return vfec_d2657;
    }

    public void setVfec_d2600(String vfec_d2600) {
        this.vfec_d2600 = vfec_d2600;
    }

    public String getVfec_d2600() {
        return vfec_d2600;
    }

    public void setVfec_d2751(String vfec_d2751) {
        this.vfec_d2751 = vfec_d2751;
    }

    public String getVfec_d2751() {
        return vfec_d2751;
    }

    public void setVfec_d2752(String vfec_d2752) {
        this.vfec_d2752 = vfec_d2752;
    }

    public String getVfec_d2752() {
        return vfec_d2752;
    }

    public void setAduautpreviaext(String aduautpreviaext) {
        this.aduautpreviaext = aduautpreviaext;
    }

    public String getAduautpreviaext() {
        return aduautpreviaext;
    }

    public void setVobservacion(String vobservacion) {
        this.vobservacion = vobservacion;
    }

    public String getVobservacion() {
        return vobservacion;
    }

    public void setChkDS2865(String chkDS2865) {
        this.chkDS2865 = chkDS2865;
    }

    public String getChkDS2865() {
        return chkDS2865;
    }

    public void setValds2865(String valds2865) {
        this.valds2865 = valds2865;
    }

    public String getValds2865() {
        return valds2865;
    }

    public void setVfec_d2865(String vfec_d2865) {
        this.vfec_d2865 = vfec_d2865;
    }

    public String getVfec_d2865() {
        return vfec_d2865;
    }

    public void setVobs2295(String vobs2295) {
        this.vobs2295 = vobs2295;
    }

    public String getVobs2295() {
        return vobs2295;
    }
}

