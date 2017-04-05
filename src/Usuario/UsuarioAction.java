package Usuario;


import Main.ClaseMenu;
import Main.ClaseSession;

import cliente.ClaseEnvio;
import cliente.ServiciosUsuario;

import cliente.bean.ClaseOpcion;
import cliente.bean.ClaseUsuario;

import java.io.IOException;
import java.io.StringReader;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import org.xml.sax.InputSource;


//******


//******


public class UsuarioAction extends Action {
    //*********
    private String GetTagXML(Document doc, String tag) {
        try {
            NodeList listaNodosHijos = doc.getElementsByTagName(tag);
            return listaNodosHijos.item(0).getFirstChild().getNodeValue();
        } catch (Exception e) {
            return "";
        }
    }

    private String GetTagXML(Element doc, String tag) {
        try {
            return (doc.getElementsByTagName(tag).item(0).getFirstChild().getNodeValue());
        } catch (Exception e) {
            return "";
        }
    }
    //*******
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
                                 HttpServletResponse response) throws IOException, ServletException {
        UsuarioForm bConecta = (UsuarioForm)form;
        ActionMessages msg = new ActionMessages();
        String link = "inicio";
        try {
            ServiciosUsuario serviciosUsuario = new ServiciosUsuario();
            ClaseEnvio cliente = serviciosUsuario.getServiciosUsuario();
            ClaseUsuario fu = null;

            //****** INI AUTENTICACION CON EL VIRTUAL
            String xmlv = "";
            String vparam = request.getParameter("vsessionid");
            DocumentBuilderFactory factoryv = DocumentBuilderFactory.newInstance();
            DocumentBuilder builderv = factoryv.newDocumentBuilder();
            if (vparam != null) {
                try {
                    xmlv = cliente.fUsuarioVirtual(vparam);
                    Document doc = builderv.parse(new InputSource(new StringReader(xmlv)));
                    doc.getDocumentElement().normalize();
                    bConecta.setUsuario(GetTagXML(doc, "Usuario"));
                    bConecta.setClave(GetTagXML(doc, "Clave"));
                } catch (Exception ex) {
                    ;
                }
            }
            //***** FIN AUTENTICACION CON EL VIRTUAL
            String xml = cliente.listaOpcionesXML(bConecta.getUsuario().toUpperCase(), bConecta.getClave(), "TRANSITO");
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc = builder.parse(new InputSource(new StringReader(xml)));
            doc.getDocumentElement().normalize();
            String Usuario = GetTagXML(doc, "Usuario");
            String Perfil = GetTagXML(doc, "Perfil");
            ClaseSession cs = new ClaseSession();
            request.getSession().setAttribute("ClaseSession", cs);
            cs.setCodusu(bConecta.getUsuario());
            cs.setNomusu(GetTagXML(doc, "Usuario"));
            request.getSession().setAttribute("user.nick", bConecta.getUsuario().toUpperCase());
            cs.setAduanas(GetTagXML(doc, "Aduana"));
            cs.setRol(GetTagXML(doc, "Perfil"));
            cs.setNit(GetTagXML(doc, "Nit"));
            cs.getLista().clear();
            bConecta.getOpciones().clear();
            bConecta.setOpciones(new ArrayList());
            NodeList OpcionesLista = ((Element)doc.getElementsByTagName("Opciones").item(0)).getElementsByTagName("Opcion");
            List<ClaseOpcion> lista = new ArrayList<ClaseOpcion>();
            ClaseOpcion co = null;
            if (OpcionesLista != null) {
                Element itemOpcion2 = (Element)OpcionesLista.item(0);
                cs.setOpcion(Short.parseShort(GetTagXML(itemOpcion2, "Codigo")));
                for (int i = 0; i < OpcionesLista.getLength(); i++) {
                    Element itemOpcion = (Element)OpcionesLista.item(i);
                    co = new ClaseOpcion();
                    co.setCodopc(GetTagXML(itemOpcion, "Codigo"));
                    co.setDesc(GetTagXML(itemOpcion, "Descripcion"));
                    co.setCodant(GetTagXML(itemOpcion, "NivelSuperior"));
                    co.setAccion(GetTagXML(itemOpcion, "Accion"));
                    lista.add(co);
                }
            }
            ClaseMenu menu = null;
            List<ClaseMenu> listaPrincipal = new ArrayList<ClaseMenu>();
            List<ClaseMenu> listaAdministrador = new ArrayList<ClaseMenu>();
            List<ClaseMenu> listaFiscalizacionA = new ArrayList<ClaseMenu>();
            List<ClaseMenu> listaFiscalizacionR = new ArrayList<ClaseMenu>();
            List<ClaseMenu> listaFiscalizacionE = new ArrayList<ClaseMenu>();
            List<ClaseMenu> listaConsultas = new ArrayList<ClaseMenu>();
            List<ClaseMenu> listaMiscelaneos = new ArrayList<ClaseMenu>();
            List<ClaseMenu> listaDepositoTrans = new ArrayList<ClaseMenu>();
            // SALIDA DE PUERTO (MIC ANTICIPADO)
            // Modificado para desahibilar opcion 16 y 17 del perfil OPERATIVO a Aduana de Usuario que no sean 072 Arica, 071 Matarani
            while (lista.size() > 0) {
                int menor = 999;
                int numero = 0;
                int indice = 0;
                menu = new ClaseMenu();
                for (int j = 0; j < lista.size(); j++) {
                    if (lista.get(j).getCodopc() != null) {
                        numero = Integer.parseInt(lista.get(j).getCodopc());
                        if (numero == 16 || numero == 17) { // Opciones de SALIDAPUERTO
                            if (cs.getAduanas().equals("072") ||
                                cs.getAduanas().equals("071")) { //Aduanas MIC ANTICIPADO
                                if (numero < menor) {
                                    indice = j;
                                    menu.setCodigo(numero);
                                    menu.setDsc(lista.get(j).getDesc());
                                    menor = numero;
                                }
                            }
                        } else {
                            if (numero < menor) {
                                indice = j;
                                menu.setCodigo(numero);
                                menu.setDsc(lista.get(j).getDesc());
                                menor = numero;
                            }
                        }
                    }
                }
                if (menu.getCodigo() != 0) {
                    //cs.getLista().add(menu);
                    if ((menu.getCodigo() > 0 && menu.getCodigo() < 21) || (menu.getCodigo() >= 101 && menu.getCodigo() < 120)) {
                        if (listaPrincipal.size() == 0) {
                            listaPrincipal.add(new ClaseMenu(00, "Men&uacute; Principal", 200, ""));
                        }
                        listaPrincipal.add(menu);
                    }
                    if (menu.getCodigo() >= 21 && menu.getCodigo() < 50) {
                        if (listaConsultas.size() == 0) {
                            listaConsultas.add(new ClaseMenu(00, "Reportes", 200, ""));
                        }
                        listaConsultas.add(menu);
                    }
                    if (menu.getCodigo() >= 60 && menu.getCodigo() < 71) {
                        if (listaFiscalizacionA.size() == 0) {
                            listaFiscalizacionA.add(new ClaseMenu(00, "Variables de Riesgo", 200, ""));
                        }
                        listaFiscalizacionA.add(menu);
                    }
                    if (menu.getCodigo() >= 71 && menu.getCodigo() < 81) {
                        if (listaFiscalizacionR.size() == 0) {
                            listaFiscalizacionR.add(new ClaseMenu(00, "Consultas Variables de Riesgo", 200, ""));
                        }
                        listaFiscalizacionR.add(menu);
                    }
                    if (menu.getCodigo() >= 81 && menu.getCodigo() < 100) {
                        if (listaFiscalizacionE.size() == 0) {
                            listaFiscalizacionE.add(new ClaseMenu(00, "Estadisticas", 200, ""));
                        }
                        listaFiscalizacionE.add(menu);
                    }
                    if (menu.getCodigo() >= 121 && menu.getCodigo() < 140) {
                        if (listaDepositoTrans.size() == 0) {
                            listaDepositoTrans.add(new ClaseMenu(00, "Depositos Transitorios", 200, ""));
                        }
                        listaDepositoTrans.add(menu);
                    }
                }
                lista.remove(indice);
            }
            if (listaConsultas.size() > 0) {
                //Agregar consultas
                listaConsultas.add(new ClaseMenu(31, "Transitos de Puerto"));
            }
            listaMiscelaneos.add(new ClaseMenu(00, "Miscelaneos", 200, ""));
            //Agregar a miscelaneos
            listaMiscelaneos.add(new ClaseMenu(100, "Cambiar contrase&ntilde;a"));
            listaMiscelaneos.add(new ClaseMenu(0, "Salir"));
            cs.getLista().addAll(listaPrincipal);
            cs.getLista().addAll(listaAdministrador);
            cs.getLista().addAll(listaFiscalizacionA);
            cs.getLista().addAll(listaFiscalizacionR);
            cs.getLista().addAll(listaFiscalizacionE);
            cs.getLista().addAll(listaConsultas);
            cs.getLista().addAll(listaDepositoTrans);
            cs.getLista().addAll(listaMiscelaneos);
            if (cs.getOpcion() == 1) {
                link = "tramite";
            } else {
                link = "inicio";
            }
            return mapping.findForward(link);
        } catch (Exception e) {
            msg.add("error", new ActionMessage("error", "El Usuario y/o Contrase&ntilde;a no esta correcto"));
            msg.add("error", new ActionMessage("error", e.getMessage()));
            return mapping.findForward("usuario");
        } finally {
            if (!msg.isEmpty()) {
                this.saveErrors(request, msg);
            }
        }
    }
}
