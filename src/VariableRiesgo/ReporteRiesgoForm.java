package VariableRiesgo;


import org.apache.struts.action.ActionForm;


public class ReporteRiesgoForm extends ActionForm {
    private int id;
    private int gestion;
    private int tipo;
    private String tipo_desc;
    private int cantidad;
    private int inicio;
    private int fin;
    private String fec_solicitud;
    private String email;
    private String fec_registro;
    private String usuario;
    private String respuesta;
    private String token;
        
    private String fec_desde;
    private String fec_hasta;
    private String boton;
    private String sw_reporte;
    private String tipo_var;

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setGestion(int gestion) {
        this.gestion = gestion;
    }

    public int getGestion() {
        return gestion;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public int getTipo() {
        return tipo;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setInicio(int inicio) {
        this.inicio = inicio;
    }

    public int getInicio() {
        return inicio;
    }

    public void setFin(int fin) {
        this.fin = fin;
    }

    public int getFin() {
        return fin;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setFec_registro(String fec_registro) {
        this.fec_registro = fec_registro;
    }

    public String getFec_registro() {
        return fec_registro;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setFec_solicitud(String fec_solicitud) {
        this.fec_solicitud = fec_solicitud;
    }

    public String getFec_solicitud() {
        return fec_solicitud;
    }

    public void setRespuesta(String respuesta) {
        this.respuesta = respuesta;
    }

    public String getRespuesta() {
        return respuesta;
    }

    public void setTipo_desc(String tipo_desc) {
        this.tipo_desc = tipo_desc;
    }

    public String getTipo_desc() {
        return tipo_desc;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getToken() {
        return token;
    }

    public void setFec_desde(String fec_desde) {
        this.fec_desde = fec_desde;
    }

    public String getFec_desde() {
        return fec_desde;
    }

    public void setFec_hasta(String fec_hasta) {
        this.fec_hasta = fec_hasta;
    }

    public String getFec_hasta() {
        return fec_hasta;
    }

    public void setBoton(String boton) {
        this.boton = boton;
    }

    public String getBoton() {
        return boton;
    }

    public void setSw_reporte(String sw_reporte) {
        this.sw_reporte = sw_reporte;
    }

    public String getSw_reporte() {
        return sw_reporte;
    }

    public void setTipo_var(String tipo_var) {
        this.tipo_var = tipo_var;
    }

    public String getTipo_var() {
        return tipo_var;
    }
}
