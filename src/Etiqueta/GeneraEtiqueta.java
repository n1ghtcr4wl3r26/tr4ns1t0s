package Etiqueta;


public class GeneraEtiqueta {
  public GeneraEtiqueta() {
  }

  public StringBuffer genera(String gestion, String aduana, int registro, String usuario) {
    StringBuffer cripto = new StringBuffer("");
    CarTagDb tag = null;
    String anio = gestion;
    int numero = registro;

    String referencia = anio + "/" + numero;
    String nombrearchivo = anio + "_" + numero + ".tag";

    try {
      tag = new CarTagDb();

      Vigenere cipher = new Vigenere();
      String cadena = tag.generarDatosTag(anio, numero);
      String textocifrado = cipher.cifrar(cadena);
      String fecha = tag.registroImpresion(aduana, anio, numero, usuario, textocifrado);

      if ((fecha != null) && !fecha.equals("")) {
        switch (tag.tipo) {
          case 1: //(aduana.equals("421") || aduana.equals("072"))
            cripto.append("^XA ");
            cripto.append("^DFR:TAG.GRF^FS ");
            cripto.append("^FO0,15 ^ADN,15,10 ^FN1^FS(transito) ");
            cripto.append("^FO140,15 ^ADN,15,10 ^FN2^FS(fecha) ");
            cripto.append("^FO0,35 ^BY2,3 ^B7N,3,4,8,,N ^FN3^FS(barcode) ");
            cripto.append("^XZ ");

            break;

          case 2: //} else {
            cripto.append("^XA~SD20^LH325,20^DFR:TAG.GRF^FS");
            cripto.append("^FO0,15 ^ADN,18,10 ^FN1^FS(transito)");
            cripto.append("^FO300,15 ^ADN,18,10 ^FN2^FS(fecha)");
            cripto.append("^FO0,35 ^BY3,3 ^B7N,4,5,8,,N ^FN3^FS(barcode)");
            cripto.append("^XZ");
        }

        cripto.append("^XA ");
        cripto.append("^XFR:TAG.GRF ");
        cripto.append("^FN1^FD ");
        cripto.append(referencia);
        cripto.append("^FS ");
        cripto.append("^FN2^FD ");
        cripto.append(fecha);
        cripto.append("^FS ");
        cripto.append("^FN3^FD ");
        cripto.append(textocifrado);
        cripto.append("^FS ");
        cripto.append("^FS ");
        cripto.append("^XZ ");
      } else {
        cripto.append("Error... no es posible generar la etiqueta de control.");
      }
    } catch (Exception e) {
      System.out.println(e.getMessage());
    } finally {
      if (tag != null) {
        tag.dispose();
      }
    }

    return cripto;
  }
}
