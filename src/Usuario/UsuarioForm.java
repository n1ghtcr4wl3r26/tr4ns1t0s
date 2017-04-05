package Usuario;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;


public class UsuarioForm extends ActionForm {
  private String usuario = "";
  private String clave = "";
  private ArrayList opciones=new ArrayList();

  public void reset(ActionMapping mapping, HttpServletRequest request) {
    super.reset(mapping, request);
  }

  public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
    return super.validate(mapping, request);
  }

  public void setUsuario(String newUsuario) {
    this.usuario = newUsuario;
  }

  public String getUsuario() {
    return usuario;
  }

  public void setClave(String NewClave) {
    this.clave = NewClave;
  }

  public String getClave() {
    return clave;
  }

    public void setOpciones(ArrayList opciones) {
        this.opciones = opciones;
    }

    public ArrayList getOpciones() {
        return opciones;
    }
}
