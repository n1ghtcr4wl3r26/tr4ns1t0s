package Etiqueta;

import java.util.StringTokenizer;
import java.util.Vector;


public class TransitoTag {
  public final int _GEN_LEYENDA = 0;
  public final int _GEN_ADUANA = 1;
  public final int _GEN_DESDE = 2;
  public final int _GEN_HASTA = 3;
  public final int _GEN_NUMERO = 4;
  public final int _ADUANA = 0;
  public final int _REGISTRO_ANIO = 1;
  public final int _REGISTRO_NUMERO = 2;
  public final int _REGISTRO_FECHA = 3;
  public final int _REGISTRO_HORA = 4;
  public final int _TRANSPORTE_ID = 5;
  public final int _TRANSPORTE_NOMBRE = 6;
  public final int _MANIF_ANT_REF = 7;
  public final int _MANIF_ANT_FECHA = 8;
  public final int _CONDUCTOR_NOMBRE = 9;
  public final int _CONDUCTOR_INF1 = 10;
  public final int _CONDUCTOR_INF2 = 11;
  public final int _TOTAL_BOL = 12;
  public final int _TOTAL_BULTOS = 13;
  public final int _TOTAL_PESO = 14;
  public final int _BOL_NUMERO = 15;
  public final int _BOL_REFERENCIA = 16;
  public final int _BOL_PESO = 17;
  public final int _BOL_BULTOS = 18;
  public final int _BOL_EMBALAJE = 19;
  public final int _UT_PLACA = 20;
  public final int _UT_CHASIS = 21;
  public final int _UT_MARCA = 22;
  public final int _UT_COLOR = 23;
  public final int _UT_CLASE = 24;
  public final int _UT_ESTADO = 25;
  public final int _UT_DESDE = 26;
  public final int _UT_HASTA = 27;
  public final int _BOL_REMOLQUE = 28;
  public final int _TRA_PRECINTOS = 29;
  public final int _TRA_RUTAS = 30;
  public final int _BOL_MERCANCIA = 31;
  public final int _PR_SECUENCIA = 0;
  public final int _PR_INI_ADUANA = 1;
  public final int _PR_INI_FECHA = 2;
  public final int _PR_DES_ADUANA = 3;
  public final int _PR_DES_FECHA = 4;
  private String[] tokens;
  private final String DELIMITADOR_COLUMNA = "|";
  private final String DELIMITADOR_REGISTRO = ";";
  private final String DELIMITADOR_CAMPO = ",";
  private String mensaje;
  private String tag;

  public TransitoTag() {
  }

  public TransitoTag(String mensaje_i) {
    Vigenere cipher = new Vigenere();
    mensaje = cipher.descifrar(mensaje_i);
    tag = mensaje_i;
    tokens = split(mensaje, DELIMITADOR_COLUMNA);
  }

  private String[] split(String cadena_i, String caracter_i) {
    Vector split = new Vector();
    int i = -1;
    int j = 0;
    boolean flag = true;

    while (flag) {
      j = cadena_i.indexOf(caracter_i, i + 1);
      flag = j >= 0;

      if (flag) {
        if (j == (i + 1)) {
          split.add("");
        } else {
          split.add(cadena_i.substring(i + 1, j));
        }

        i = j;
      } else {
        split.add(cadena_i.substring(i + 1));
      }
    }

    String[] items = new String[split.size()];
    items = (String[])split.toArray(items);

    return items;
  }

  public String getMensaje() {
    return mensaje;
  }

  public String getTag() {
    return tag;
  }

  public String[] getRutaDetalle(String registro_i) {
    return split(registro_i, DELIMITADOR_CAMPO);
  }

  public String[] getRutas() {
    return split(tokens[_TRA_RUTAS], DELIMITADOR_REGISTRO);
  }

  public String getString(int indice_i) {
    return tokens[indice_i];
  }

  public boolean isValid() {
    return (tokens != null) && (tokens.length == 32);
  }

  public static void main(String[] args) {
    String mensaje =
      "z110913H7aSkqhW7jPOtPQRIg5R0Vc9fPdcBfgKrdbxgXo1DE92WIIeIgQPmLKhLWhhjhZ19K5vV7BAmCKg8dux7fpYLPvAvgU0KSBGbSjSJx6XAnVP8CHn5EXmbXWpxegSedMqRhPWE0coeAIocfJWkToCvIdqU59IKubr6ww6jD7fg2o2gIp6naA4oVCEHOcDv19eZHk0Sdb7XHk84QXRDkuVgDv8S3GPcwCE5CWPvha5O5V5tEhntX57JBYhBGRsqL2fsPbZeOcgIoex4hfvSGMgSL9ejJHPh7Ri0LfdsA5wbhfgRtRTsfGehjEtUwb9HfduW84GLC2shsTEPsJio4DuEqwH5W0jDkNNELFjahuWnxEN1n5fElui8F8IsWfjtXXR4nkK96TIdKUstuiA4PiZfm05k6TetvVoisq34oYa6f6TBXh9ZlnV?FfGRIfv5aq1VZ8ou7MGvqbdgkSa0KsI0QgOmW0z";

    //String mensaje = "z110913Z8RfLg9sA0KQEYV12DHwei0pEThvFa6NF8VYtG1HlQSA0nVB2FUT8NF8Ps9XKuQ2QTFPlU72qKn5pddhcg419qMd0xtcbPnRkw2CmQd3C7iRNuqpvWdL9lxYgRFgqO2He?usFMGQIBs8Y7imOJbQCOSP5Vp2gqL0IAxQF8bTqCkEx3u2D7HuRqHh99BmuIxQApFT3dZBZCDvrOQRDHC7YssWcg6PuPB29b0geBBIElfJ5lW1E8lFwaOgds9Q8H7k7U2ODA8F5KQ88fEGNLfxDHpui8Ui8reW63tk76bE0HOFH694R7pKGeTRWsQGKwVgsDm86vjI7Zwv2di57VgIRH01CQLslo5rorHThZlMouo21siaz";
    //String mensaje = "z110913PeGOcMQwbiGsuuhZi8GjRh4Ynf3dhWcpJLCpU6TCQMKmtaU6iogmnpBgqwQDbdFdM1Frb8IQTnOYWKqtEZFIX9FGavFEBwkoQpWbWZBBmSqmvFoOKgpeC5pioWwxbciQTdo8rNm5Bhn71TV94Zmkrk3QnwBeDqlwguhKrGfgVYrmLCxPvRhfEpnuN9wASB5PLwKZYYqjbgeRCoAp7Qgdi6kC5Y5q7IX9F1FIkhTAwW0NeHoZWFoTvWjNtJCVoGdXNntpebGCPcDobmorTiGdkKf8LlOblAU1mUZYcVmaIZhaueiqwGYhjkYcdoGRmFpgqfRZc6ATXD3Gs4l8MFQAEYEeSKH3nkkna6Tf1qWn3xRZsvBZnp0CSCR41EME5GwLGeJKsxhE0xjSg5Pjvd34bYFQz";
    TransitoTag tag = new TransitoTag(mensaje);

    if (tag.isValid()) {
      System.out.print(tag.getString(tag._REGISTRO_NUMERO));
      System.out.print("\t");
      System.out.println(tag.getString(tag._REGISTRO_ANIO));

      String[] rutas = tag.getRutas();

      for (int k = 0; k < rutas.length; k++) {
        System.out.print(rutas[k]);
        System.out.print("\n");

        String[] detalle = tag.getRutaDetalle(rutas[k]);

        for (int l = 0; l < detalle.length; l++) {
          System.out.print(detalle[l]);
          System.out.print("\t");
        }

        System.out.print("\n");
      }
    } else {
      System.out.println("Formato invalido");
    }
  }
}
