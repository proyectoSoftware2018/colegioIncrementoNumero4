
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

public class ListaAsignaciones {
    
    public LinkedList<Asignacion> lista;
    private Conexion conn;
    private PreparedStatement ps;
    
    public ListaAsignaciones(){
        lista = new LinkedList<Asignacion>();
        conn = new Conexion();
        ps = null;
    }
    
    public LinkedList<Asignacion> select() {
        try {
            ps = conn.getConnection().prepareCall("call ConsultarAsignacion");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) //Esta es la forma correcta de recorrer los valores obtenidos de una consulta
            {
               String cur =rs.getString(1);
               String pro =rs.getString(2);
               String gra =rs.getString(3);
               String sec =rs.getString(4);
               
               Asignacion a = new Asignacion(gra, sec, pro, cur);
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
    
        public LinkedList<Asignacion> registro(String profe){
        LinkedList<Asignacion> lis = new LinkedList<>();
        for(int i =0; i<tama();i++){
         if(lista.get(i).getProfesor().equalsIgnoreCase(profe)){
           lis.add(lista.get(i));
        }   
        }
        
        return lis;
    }
    
        public Asignacion verAsignacion(String gra,String sec, String cur){
            for(int i =0 ; i<tama();i++){
             if(lista.get(i).getGrado().equalsIgnoreCase(gra) && lista.get(i).getSeccion().equalsIgnoreCase(sec)
                && lista.get(i).getCurso().equalsIgnoreCase(cur)) {
                 return lista.get(i);
             }
            }
            return null;
        }
    
}
