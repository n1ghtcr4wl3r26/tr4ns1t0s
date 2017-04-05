package Transito;

import java.sql.Connection;

import java.sql.DriverManager;

import javax.naming.InitialContext;

import javax.sql.DataSource;


public class Sql {
    private Connection cn = null;

    public void abreConexion() throws Exception {
        try {

            InitialContext ic = new InitialContext();
            DataSource ds = (DataSource)ic.lookup("jdbc/asy_181");
            cn = (Connection)ds.getConnection();
            cn.setAutoCommit(false);

            /*DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            cn = DriverManager.getConnection("jdbc:oracle:thin:@172.16.2.4:1521:basy", "nsga_operador", "nsg4_0p3r4d0r");*/
        } catch (Exception e) {
            throw new Exception("Se produjo un error al abrir la Conexion a la base de datos.");
        }
    }

    public void abreBitacora() {
        try {

            InitialContext ic = new InitialContext();
            DataSource ds = (DataSource)ic.lookup("jdbc/bitacora");
            cn = (Connection)ds.getConnection();

            /*DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            cn = DriverManager.getConnection("jdbc:oracle:thin:@172.16.2.4:1521:basy", "ops$asy", "s1d4n34");*/

        } catch (Exception e) {
            ;
        }
    }

    public void cierraConexion() {
        try {
            if (cn != null) {
                cn.close();
            }

            cn = null;
        } catch (Exception e) {
            ;
        }
    }

    public void setCn(Connection cn) {
        this.cn = cn;
    }

    public Connection getCn() {
        return cn;
    }
}
