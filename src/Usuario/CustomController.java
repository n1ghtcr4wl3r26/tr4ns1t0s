package Usuario;

import Main.ClaseSession;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.tiles.TilesRequestProcessor;


public class CustomController extends TilesRequestProcessor {
  public CustomController() {
    super();
  }

  protected boolean processRoles(HttpServletRequest request, HttpServletResponse response, ActionMapping mapping) throws IOException, ServletException {
    String[] roles = mapping.getRoleNames();

    if ((roles == null) || (roles.length < 1)) {
      return true;
    }

    ClaseSession cs = (ClaseSession)request.getSession().getAttribute("ClaseSession");

    if (cs != null) {
      for (int i = 0; i < roles.length; i++) {
        if (cs.getRol().equals(roles[i])) {
          return true;
        }
      }
    }

    response.sendError(HttpServletResponse.SC_BAD_REQUEST, getInternal().getMessage("notAuthorized", mapping.getPath()));

    return false;
  }

  public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    super.process(request, response);
  }
}
