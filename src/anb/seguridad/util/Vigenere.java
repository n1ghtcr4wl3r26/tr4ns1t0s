package anb.seguridad.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.Random;


public class Vigenere {
  private final int LONGITUD_TRASH = 6;
  private final int LONGITUD_CLAVE = 20;
  private final String NUMEROS = "1234567890";
  private final String MAYUSCULAS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  private final char ALFA_OMEGA = 'z';

  //  private final String MINUSCULAS = "abcdefghijklmnopqrstuvwxyz";
  private final String MINUSCULAS = "abcdefghijklmnopqrstuvwx";
  private final String OTROS = " .:,;'=-+|/*%&#$Ñ()[]_" + '"' + '\\';
  private final char CARACTER_COMODIN = '?';
  private final String CADENA_MAESTRA = NUMEROS + MAYUSCULAS + OTROS;
  private final String CADENA_CLAVE = NUMEROS + MAYUSCULAS + MINUSCULAS;
  private String[] tabla = new String[LONGITUD_CLAVE * 2];

  public Vigenere() {
  }

  public static void main(String[] args) {
    Vigenere cry = new Vigenere();
    String cadena = cry.cifrar("GENARO NATALIO CONDORI ESTACA, FABIAN JOEL CONDORI ROCHA, JOHAN NATANIEL CONDORI ROCHA");
    System.out.println(cadena);
    System.out.println(cry.descifrar(cadena));
    cadena = cry.cifrar("GENARO NATALIO CONDORI ESTACA, FABIAN JOEL CONDORI ROCHA, JOHAN NATANIEL CONDORI ROCHA");
    System.out.println(cadena);
    System.out.println(cry.descifrar(cadena));
  }

  private String generarClave() {
    String clave = "";
    Random randomGenerator = new Random(new Date().getTime());

    for (int i = 1; i <= LONGITUD_CLAVE; i++) {
      int indice = randomGenerator.nextInt(CADENA_CLAVE.length());
      clave += CADENA_CLAVE.substring(indice, indice + 1);
    }

    return clave;
  }

  private String invertir(String cadena_i) {
    char[] letras = cadena_i.toCharArray();
    String cadena = "";

    for (int i = letras.length; i > 0; i--) {
      cadena += letras[i - 1];
    }

    return cadena;
  }

  private void desplazarTabla() {
    String[] temp = new String[tabla.length];
    int par = 1;
    int non = 0;
    int indice = par;
    boolean flag = true;

    for (int i = 0; i < (tabla.length); i++) {
      if (flag && (i >= LONGITUD_CLAVE)) {
        indice = non;
        flag = !flag;
      }

      temp[indice] = tabla[i];
      indice = indice + 2;
    }

    tabla = temp;
  }

  private void inicializarTabla(String clave_i) {
    for (int i = 0; i < clave_i.length(); i++) {
      int indice = CADENA_CLAVE.indexOf(clave_i.substring(i, i + 1));
      String cadena = CADENA_CLAVE.substring(indice) + CADENA_CLAVE.substring(0, indice);
      tabla[i] = cadena;
      tabla[tabla.length - (i + 1)] = invertir(cadena);
    }
  }

  private void listarTabla() {
    for (int i = 0; i < tabla.length; i++) {
      System.out.println(i + " " + tabla[i]);
    }
  }

  public String cifrar(String mensaje_i) {
    char[] mensajeChars = mensaje_i.toCharArray();
    int fila = 0;

    String clave = generarClave();
    inicializarTabla(clave);
    clave = invertir(clave);

    String hoy = ahora();
    char[] hoy2 = hoy.toCharArray();
    int index = (int)hoy2[5];
    StringBuffer buffer = new StringBuffer(hoy);

    for (int i = 0; i < mensajeChars.length; i++) {
      fila = i % tabla.length;

      if ((fila == 0) && (i > 0)) {
        desplazarTabla();
      }

      char caracter = mensajeChars[i];

      int indice = CADENA_MAESTRA.indexOf(caracter);

      if (indice >= 0) {
        char[] cadena = tabla[fila].toCharArray();
        buffer.append(cadena[indice]);
      } else {
        buffer.append(CARACTER_COMODIN);
      }
    }

    buffer.insert(index, clave);

    return ALFA_OMEGA + buffer.toString() + ALFA_OMEGA;
  }

  private String ahora() {
    String s = "error";

    DateFormat formatter;
    Date date = new Date();
    formatter = new SimpleDateFormat("yyMMdd");

    s = formatter.format(date);

    return s;
  }

  public String descifrar(String mensaje_i) {
    int alfa = mensaje_i.indexOf(ALFA_OMEGA) + 1 + LONGITUD_TRASH;
    int omega = mensaje_i.lastIndexOf(ALFA_OMEGA);

    String mensaje = mensaje_i.substring(alfa, omega);

    char[] trash = mensaje_i.substring(alfa - 1, alfa).toCharArray();
    int index = (int)trash[0];

    String clave = mensaje.substring(index - LONGITUD_TRASH, index - LONGITUD_TRASH + LONGITUD_CLAVE);
    clave = invertir(clave);

    String mensaje2 = mensaje.substring(0, index - LONGITUD_TRASH) + mensaje.substring(index - LONGITUD_TRASH + LONGITUD_CLAVE);
    char[] mensajeChars = mensaje2.toCharArray();

    inicializarTabla(clave);

    int fila = 0;

    StringBuffer buffer = new StringBuffer("");

    for (int i = 0; i < mensajeChars.length; i++) {
      fila = i % tabla.length;

      if ((fila == 0) && (i > 0)) {
        desplazarTabla();
      }

      char caracter = mensajeChars[i];

      int indice = tabla[fila].indexOf(caracter);

      if (indice >= 0) {
        char[] cadena = CADENA_MAESTRA.toCharArray();
        buffer.append(cadena[indice]);
      } else {
        buffer.append(caracter);
      }
    }

    return buffer.toString();
  }
}
