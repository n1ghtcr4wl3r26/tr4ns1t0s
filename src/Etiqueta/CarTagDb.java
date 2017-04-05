package Etiqueta;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;

import javax.sql.DataSource;

import oracle.jdbc.OracleTypes;
import oracle.jdbc.pool.OracleConnectionPoolDataSource;


public class CarTagDb {
  private final int MENSAJE_LONGITUD = 680;
  private final String PROPIOS_MEDIOS = "1111111";
  private final char DELIMITADOR_COLUMNA = '|';
  private final char DELIMITADOR_REGISTRO = ';';
  private final char DELIMITADOR_CAMPO = ',';
  private InitialContext ic;
  private OracleConnectionPoolDataSource ds;
  private Connection cn;
  public int tipo = 0;

  public CarTagDb() {
    try {

      InitialContext ic = new InitialContext();
      DataSource ds = (DataSource)ic.lookup("jdbc/asy_transito");
      cn = ds.getConnection();

      cn.setAutoCommit(false);

    } catch (NamingException ne) {
      throw new RuntimeException(ne.toString());
    } catch (SQLException sqle) {
      throw new RuntimeException(sqle.toString());
    }
  }

  public String registroImpresion(String aduana_i, String anio_i, int numero_i, String usuario_i, String tag_i) throws Exception {
    String status = null;
    CallableStatement call = null;
    String qbe = "{call pkg_etiqueta.adicionar_etiqueta (?,?,?,?,?,?,?)}";

    try {
      call = cn.prepareCall(qbe.toString());
      call.setString(1, aduana_i);
      call.setString(2, anio_i);
      call.setInt(3, numero_i);
      call.setString(4, usuario_i);
      call.setString(5, tag_i);
      call.registerOutParameter(6, OracleTypes.VARCHAR);
      call.registerOutParameter(7, OracleTypes.NUMBER);
      call.execute();
      status = call.getString(6);
      tipo = call.getInt(7);

      cn.commit();
    } catch (SQLException e) {
      try {
        cn.rollback();
      } catch (SQLException q) {
      }
    } finally {
      try {
        if (call != null) {
          call.close();
          call = null;
        }
      } catch (SQLException e) {
      }
    }

    return status;
  }

  public String generarDatosUnidad(String transportador_i, String placa_i, String fecha_i) {
    ResultSet rs = null;
    PreparedStatement ps = null;
    StringBuffer data = new StringBuffer("");
    StringBuffer query = new StringBuffer("");
    
    query.append("SELECT a.ope_nit, a.nom_rzs, b.tbl_sta, c.mrc_cod, ");
    query.append(" c.nro_placa, c.nro_cha, x.mrc_dsc, c.trp_clr, ");
    query.append(" case c.trp_cls when 'VEH' then 'VEHICULO' ");
    query.append(" when 'REM' then 'REMOLQUE' end clase, z.est_dsc, ");
    query.append(" to_char(b.fch_ini, 'dd/mm/yyyy') desde, ");
    query.append(" to_char(b.fch_fin, 'dd/mm/yyyy') hasta ");
    query.append("FROM operador.olopetab a, ");
    query.append("  operador.olopetip e, operador.oope_trp b, ");
    query.append("  operador.oltratab c, operador.unmrctab x, ");
    query.append("  operador.unesttab z ");
    query.append("WHERE a.ult_ver = 0 ");
    query.append(" AND a.ope_nit = ? AND c.nro_placa = ? ");
    query.append(" AND to_date(?, 'ddmmyyyy') BETWEEN b.fch_ini AND b.fch_fin ");
    query.append(" AND a.emp_cod = e.emp_cod AND a.ult_ver = e.ult_ver ");
    query.append(" AND e.emp_cod = b.emp_cod AND e.ope_tip = b.ope_tip ");
    query.append(" AND e.ult_ver = b.ult_ver AND b.trp_cod = c.trp_cod ");
    query.append(" AND b.ult_ver = c.ult_ver ");
    query.append(" AND x.mrc_cod = c.mrc_cod AND x.ult_ver = 0 ");
    query.append(" AND z.est_cod = b.tbl_sta AND z.ult_ver = 0 ");
    //agregado por EJAG para obtener la informacion del nuevo OCE 04122014
    query.append(" AND 0 = (SELECT count(1) FROM ops$asy.bo_oce_opetipo x ");
    query.append(" where x.ope_numerodoc = a.ope_nit and x.tip_tipooperador in ('TRN','TRE','NAL') ");
    query.append(" and x.tip_num = 0 and x.tip_lst_ope = 'U' )  ");
    query.append(" and sysdate < to_date('15/12/2015','dd/mm/yyyy') ");
    query.append(" union ");
    query.append(" select a.ope_numerodoc, a.ope_razonsocial, b.tip_estado, c.pla_cod_marca,  c.pla_nro_placa, c.pla_nro_chasis, c.pla_desc_marca, c.pla_color, ");
    query.append(" case c.pla_tipo when 'VEH' then 'VEHICULO'   when 'REM' then 'REMOLQUE' end clase, decode(d.tar_estado,'H','Habilitado','I','Inhabilitado','B','Baja','-'), ");
    query.append(" to_char(d.tar_fecha_ini, 'dd/mm/yyyy') desde,   to_char(d.tar_fecha_fin, 'dd/mm/yyyy') hasta ");
    query.append(" from ops$asy.bo_oce_opecab a, ops$asy.bo_oce_opetipo b, ops$asy.bo_oce_placa c, ops$asy.bo_oce_tarope d ");
    query.append(" where a.ope_numerodoc =  ? and c.pla_nro_placa =  ? ");
    query.append(" and to_date(?, 'ddmmyyyy') BETWEEN d.tar_fecha_ini AND d.tar_fecha_fin  ");
    query.append(" and a.ope_numerodoc = b.ope_numerodoc and a.ope_num = 0  ");
    query.append(" and b.ope_numerodoc = d.ope_numerodoc ");
    query.append(" and b.tip_tipooperador = d.tip_tipooperador ");
    query.append(" and b.tip_lst_ope = 'U' and b.tip_num = 0  ");
    query.append(" and d.pla_nro_placa = c.pla_nro_placa and c.pla_num = 0 and rownum = 1 ");


    //    System.out.println("Unidad: " + query.toString());
    try {
      ps = cn.prepareStatement(query.toString(), ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
      ps.setString(1, transportador_i);
      ps.setString(2, placa_i);
      ps.setString(3, fecha_i);
      //agregado por EJAG para obtener la informacion del nuevo OCE 04122014
      ps.setString(4, transportador_i);
      ps.setString(5, placa_i);
      ps.setString(6, fecha_i);

      rs = ps.executeQuery();

      if (rs.next()) {
        ResultSetMetaData mdata = rs.getMetaData();
        int num_columnas = mdata.getColumnCount();

        for (int i = 5; i <= num_columnas; i++) {
          String cadena = (rs.getString(i) == null) ? "" : rs.getString(i).toUpperCase();
          data.append(cadena);
          data.append(DELIMITADOR_COLUMNA);
        }
      } else {
        data.append("ERROR_FATAL" + DELIMITADOR_COLUMNA);
        data.append(DELIMITADOR_COLUMNA);
        data.append(DELIMITADOR_COLUMNA);
        data.append(DELIMITADOR_COLUMNA);
        data.append(DELIMITADOR_COLUMNA);
        data.append(DELIMITADOR_COLUMNA);
        data.append(DELIMITADOR_COLUMNA);
        data.append(DELIMITADOR_COLUMNA);
      }
      return data.toString();
    } catch (SQLException e) {
      return null;
    } finally {
      try {
        if (rs != null) {
          rs.close();
        }

        if (ps != null) {
          ps.close();
        }
      } catch (SQLException e) {
        ;
      }
    }
  }

  public String generarDatosRemolque(String aduana_i, String viaje_i, String fecha_i) {
    ResultSet rs = null;
    PreparedStatement ps = null;
    String cadena = "";
    StringBuffer query = new StringBuffer("");
    query.append(" SELECT car_ctn_typ, car_ctn_ident ");
    query.append(" FROM car_bol_ctn ");
    query.append("  WHERE key_cuo = ? ");
    query.append("  AND key_voy_nber = ? ");
    query.append("  AND key_dep_date = to_date (?, 'ddmmyyyy') ");
    query.append("  AND key_lin_nbr = 1 ");
    query.append("  AND car_ctn_typ IN ('RMLQ', 'SMRQ') ");

    //		System.out.println("Remolque: " + query.toString());
    try {
      ps = cn.prepareStatement(query.toString(), ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
      ps.setString(1, aduana_i);
      ps.setString(2, viaje_i);
      ps.setString(3, fecha_i);

      rs = ps.executeQuery();

      if (rs.next() && !(rs.getString("car_ctn_ident") != null && rs.getString("car_ctn_ident").equals(""))) {
        cadena = rs.getString("car_ctn_ident");
      }

      return cadena;
    } catch (SQLException e) {
      return null;
    } finally {
      try {
        if (rs != null) {
          rs.close();
        }

        if (ps != null) {
          ps.close();
        }
      } catch (SQLException e) {
        ;
      }


    }
  }

  public String generarDatosTransitos(String anio_i, int numero_i) {
    ResultSet rs = null;
    PreparedStatement ps = null;
    StringBuffer data = new StringBuffer("");
    StringBuffer query = new StringBuffer("");
    query.append(" SELECT key_secuencia, tra_cuo_ini, ");
    query.append("  TO_CHAR (tra_fec_ini, 'dd/mm/yyyy hh24:mi:ss'), ");
    query.append("  tra_cuo_est, ");
    query.append("  TO_CHAR (tra_fec_est, 'dd/mm/yyyy'), ");
    query.append("  tra_pre ");
    query.append(" FROM transitos.tra_pla_rut ");
    query.append("  WHERE     car_reg_year = ? ");
    query.append("  AND car_reg_nber = ? ");
    query.append("  AND key_secuencia > 0 ");
    query.append("  AND tra_num = 0 ");
    query.append("  AND lst_ope = 'U' ");
    query.append(" ORDER BY key_secuencia ");

    //		System.out.println("Transitos: " + query.toString());
    try {
      ps = cn.prepareStatement(query.toString(), ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
      ps.setString(1, anio_i);
      ps.setInt(2, numero_i);

      rs = ps.executeQuery();

      if (rs.next()) {
        String cadena = (rs.getString("tra_pre") == null) ? "" : rs.getString("tra_pre").replace(DELIMITADOR_COLUMNA, ' ');
        data.append(cadena);
        data.append(DELIMITADOR_COLUMNA);

        boolean flag = false;
        String finicio = rs.getString(3);

        do {
          if (flag) {
            data.append(DELIMITADOR_REGISTRO);
            finicio = rs.getString(3).substring(0, 10);
          }

          data.append(rs.getString(1));
          data.append(DELIMITADOR_CAMPO);
          data.append(rs.getString(2));
          data.append(DELIMITADOR_CAMPO);
          data.append(finicio);
          data.append(DELIMITADOR_CAMPO);
          data.append(rs.getString(4));
          data.append(DELIMITADOR_CAMPO);
          data.append(rs.getString(5));
          flag = true;
        } while (rs.next());

        data.append(DELIMITADOR_COLUMNA);
      }
      return data.toString();
    } catch (SQLException e) {
      return null;
    } finally {
      try {
        if (rs != null) {
          rs.close();
        }

        if (ps != null) {
          ps.close();
        }
      } catch (SQLException e) {
        ;
      }


    }
  }

  public String generarDatosTag(String anio_i, int numero_i) {
    ResultSet rs = null;
    PreparedStatement ps = null;
    StringBuffer data = new StringBuffer("");
    StringBuffer query = new StringBuffer("");
    query.append("SELECT a.key_voy_nber, to_char(a.key_dep_date, 'ddmmyyyy') dep_date, ");
    query.append("	a.car_cntr_nbr, a.car_id_trp, a.key_cuo, a.car_reg_year, a.car_reg_nber, ");
    query.append("	to_char(a.car_reg_date, 'dd/mm/yyyy') reg_date, a.car_reg_time, ");
    query.append("    a.car_car_cod, a.car_car_nam, a.car_tr_regref, ");
    query.append("    to_char(a.car_tr_regdat, 'dd/mm/yyyy') tr_regdat, ");
    query.append("    a.car_mast_nam, a.car_mast_inf1, a.car_mast_inf2, ");
    query.append("    a.car_bl_nber, a.car_pac_nber, a.car_gros_mass, ");
    query.append("    b.key_lin_nbr, b.key_bol_ref, b.carbol_gros_mas, ");
    query.append("    b.carbol_pack_nber, b.carbol_pack_cod || '-' || c.pkg_dsc, ");
    query.append("    b.carbol_good1 || b.carbol_good2 || b.carbol_good3 || ");
    query.append("    b.carbol_good4 || b.carbol_good5 goods ");
    query.append("  FROM car_gen a, car_bol_gen b, unpkgtab c ");
    query.append(" WHERE     a.car_reg_year = ? ");
    query.append("       AND car_reg_nber = ? ");
    query.append("       AND a.key_cuo = b.key_cuo ");
    query.append("       AND a.key_dep_date = b.key_dep_date ");
    query.append("       AND a.key_voy_nber = b.key_voy_nber ");
    query.append("       AND b.key_lin_nbr = ? ");
    query.append("       AND b.carbol_sline_nber = 0 ");
    query.append("       AND b.carbol_pack_cod = c.pkg_cod ");
    query.append("       AND c.lst_ope = 'U' ");

    StringBuffer qmax = new StringBuffer("");
    qmax.append("SELECT MAX (b.key_lin_nbr) ");
    qmax.append("  FROM car_gen a, car_bol_gen b ");
    qmax.append(" WHERE     a.car_reg_year = ? ");
    qmax.append("       AND a.car_reg_nber = ? ");
    qmax.append("       AND a.key_cuo = b.key_cuo ");
    qmax.append("       AND a.key_voy_nber = b.key_voy_nber ");
    qmax.append("       AND a.key_dep_date = b.key_dep_date ");
    qmax.append("       AND b.carbol_sline_nber = 0 ");

    //    System.out.println(query.toString());
    try {
      //	Seleccionar el ultimo item		
      ps = cn.prepareStatement(qmax.toString(), ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
      ps.setString(1, anio_i);
      ps.setInt(2, numero_i);

      rs = ps.executeQuery();

      if (rs.next()) {
        int bol_i = rs.getInt(1);
        rs.close();
        ps.close();
        rs = null;
        ps = null;

        ps = cn.prepareStatement(query.toString(), ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
        ps.setString(1, anio_i);
        ps.setInt(2, numero_i);
        ps.setInt(3, bol_i);

        rs = ps.executeQuery();

        if (rs.next()) {
          ResultSetMetaData mdata = rs.getMetaData();
          int num_columnas = mdata.getColumnCount() - 1;

          for (int i = 5; i <= num_columnas; i++) {
            String cadena = (rs.getString(i) == null) ? "" : rs.getString(i);

            data.append(cadena);
            data.append(DELIMITADOR_COLUMNA);
          }

          if (rs.getString("car_car_cod").equals(PROPIOS_MEDIOS)) {
            data.append(DELIMITADOR_COLUMNA);
            data.append(DELIMITADOR_COLUMNA);
            data.append(DELIMITADOR_COLUMNA);
            data.append(DELIMITADOR_COLUMNA);
            data.append(DELIMITADOR_COLUMNA);
            data.append(DELIMITADOR_COLUMNA);
            data.append(DELIMITADOR_COLUMNA);
            data.append(DELIMITADOR_COLUMNA);
          } else {
            data.append(generarDatosUnidad(rs.getString("car_car_cod"), rs.getString("car_id_trp"), rs.getString("dep_date")));

            if (rs.getInt("car_cntr_nbr") > 0) {
              data.append(generarDatosRemolque(rs.getString("key_cuo"), rs.getString("key_voy_nber"), rs.getString("dep_date")));
            }
          }

          data.append(DELIMITADOR_COLUMNA);

          data.append(generarDatosTransitos(anio_i, numero_i));
          data.append(rs.getString("goods").replace(DELIMITADOR_COLUMNA, ' '));

          //        System.out.println(data.toString());
          //        System.out.println(data.toString().length());
        }
      }
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      try {
        if (rs != null) {
          rs.close();
        }

        if (ps != null) {
          ps.close();
        }
      } catch (SQLException e) {
        ;
      }
    }

    //		System.out.println(data.toString());
    return (data.length() > MENSAJE_LONGITUD) ? data.substring(1, MENSAJE_LONGITUD).toString() : data.toString();
  }

  public void dispose() {
    try {
      cn.close();
    } catch (SQLException e) {
      ;
    }
  }
}
