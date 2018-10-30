
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

public class ListaSecciones {
    
    public LinkedList<Seccion> lista;
    private Conexion conn;
    private PreparedStatement ps;
    
    public ListaSecciones(){
        lista = new LinkedList<Seccion>();
        conn = new Conexion();
        ps = null;
    }
    
    public LinkedList<Seccion> select() {
        try {
            ps = conn.getConnection().prepareCall("call ConsultarSeccion");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) //Esta es la forma correcta de recorrer los valores obtenidos de una consulta
            {
               String alu =rs.getString(1);
               Seccion a = new Seccion(alu);
               lista.add(a);
            }
            
            
            return lista;
        } catch (Exception e) {
            System.out.println("error");
            return null;
        }
        finally {

            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.desconectar();
                }
            } catch (SQLException ex) {
                System.out.println("error");
                
            }

        }
    }
    
    public int tama(){
        return lista.size();
    }
    

    
    
}
