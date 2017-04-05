package VariableRiesgo;


import org.apache.struts.action.ActionForm;


public class VariableRiesgoForm extends ActionForm {
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
    
    private String tipo_variable;
    private String valor;
    private String criterio;
    private String criterio_otro;
    private String boton;
    private String mensaje;
    
    private String ptipo_variable;
    private String pvalor;
    private String pfecha_inicio;
    private String pfecha_vencimiento;
    private String pobservacion;
    private String ppais;
    
    private String var_estado;
    private String sw_consultar;
    private String sw_listar;
    
    

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

    public void setTipo_variable(String tipo_variable) {
        this.tipo_variable = tipo_variable;
    }

    public String getTipo_variable() {
        return tipo_variable;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    public String getValor() {
        return valor;
    }

    public void setBoton(String boton) {
        this.boton = boton;
    }

    public String getBoton() {
        return boton;
    }

    public void setPtipo_variable(String ptipo_variable) {
        this.ptipo_variable = ptipo_variable;
    }

    public String getPtipo_variable() {
        return ptipo_variable;
    }

    public void setPvalor(String pvalor) {
        this.pvalor = pvalor;
    }

    public String getPvalor() {
        return pvalor;
    }

    public void setPfecha_inicio(String pfecha_inicio) {
        this.pfecha_inicio = pfecha_inicio;
    }

    public String getPfecha_inicio() {
        return pfecha_inicio;
    }

    public void setPfecha_vencimiento(String pfecha_vencimiento) {
        this.pfecha_vencimiento = pfecha_vencimiento;
    }

    public String getPfecha_vencimiento() {
        return pfecha_vencimiento;
    }

    public void setPobservacion(String pobservacion) {
        this.pobservacion = pobservacion;
    }

    public String getPobservacion() {
        return pobservacion;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setVar_estado(String var_estado) {
        this.var_estado = var_estado;
    }

    public String getVar_estado() {
        return var_estado;
    }

    public void setSw_consultar(String sw_consultar) {
        this.sw_consultar = sw_consultar;
    }

    public String getSw_consultar() {
        return sw_consultar;
    }

    public void setSw_listar(String sw_listar) {
        this.sw_listar = sw_listar;
    }

    public String getSw_listar() {
        return sw_listar;
    }

    public void setPpais(String ppais) {
        this.ppais = ppais;
    }

    public String getPpais() {
        return ppais;
    }

    public void setCriterio(String criterio) {
        this.criterio = criterio;
    }

    public String getCriterio() {
        return criterio;
    }

    public void setCriterio_otro(String criterio_otro) {
        this.criterio_otro = criterio_otro;
    }

    public String getCriterio_otro() {
        return criterio_otro;
    }
}
