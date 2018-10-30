
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

public class ListaCursos {
    
    public LinkedList<Curso> lista;
    private Conexion conn;
    private PreparedStatement ps;
    
    public ListaCursos(){
        lista = new LinkedList<Curso>();
        conn = new Conexion();
        ps = null;
    }
    
    public LinkedList<Curso> select() {
        try {
            ps = conn.getConnection().prepareCall("call ConsultarCurso");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) //Esta es la forma correcta de recorrer los valores obtenidos de una consulta
            {
               String cod =rs.getString(1);
               String cur =rs.getString(2);
               
               Curso a = new Curso(cod, cur);
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
    
    public Curso buscar(String cur){
        for(int i=0; i<tama();i++){
            if(lista.get(i).getCodigo().equalsIgnoreCase(cur)){
                
                return lista.get(i);
                
            }
        }
        return null;
    }
    
    
}
