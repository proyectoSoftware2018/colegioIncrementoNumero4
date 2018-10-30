
package modelo;

import java.sql.PreparedStatement;
import java.sql.SQLException;




public class Nota {
    
   public String alumno,profesor,cur,gra,sec,bime;
   int noral,nprac,ntrab,ncuad,exabi;
   double proce,promedio;
   private Conexion conn;
   private PreparedStatement ps;

    public Nota(String alumno, String profesor, String cur, String gra, String sec,String bime, int noral, int nprac, int ntrab, int ncuad, int exabi, double proce, double promedio) {
        this.alumno = alumno;
        this.profesor = profesor;
        this.cur = cur;
        this.gra = gra;
        this.sec = sec;
        this.bime = bime;
        this.noral = noral;
        this.nprac = nprac;
        this.ntrab = ntrab;
        this.ncuad = ncuad;
        this.exabi = exabi;
        this.proce = proce;
        this.promedio = promedio;
        conn = new Conexion();
        ps = null;
    }
    
    public boolean insert() {
        
        try {
            ps = conn.getConnection().prepareCall("call InsertarNota(?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, alumno);
            ps.setString(2, profesor);
            ps.setString(3, cur);
            ps.setString(4, gra);
            ps.setString(5, sec);
            ps.setString(6, bime);
            ps.setInt(7, noral);
            ps.setInt(8, nprac);
            ps.setInt(9, ntrab);
            ps.setInt(10, ncuad);
            ps.setInt(11, exabi);
            ps.setDouble(12, proce);
            ps.setDouble(13, promedio);
            
            ps.executeUpdate();
            return true;
           
        } catch (Exception e) {
             return false;
        }

       
    }
    
    public boolean editar() {
        
        try {
            ps = conn.getConnection().prepareCall("call EditarNota(?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, alumno);
            ps.setString(2, profesor);
            ps.setString(3, cur);
            ps.setString(4, gra);
            ps.setString(5, sec);
            ps.setString(6, bime);
            ps.setInt(7, noral);
            ps.setInt(8, nprac);
            ps.setInt(9, ntrab);
            ps.setInt(10, ncuad);
            ps.setInt(11, exabi);
            ps.setDouble(12, proce);
            ps.setDouble(13, promedio);
            
            ps.executeUpdate();
            return true;
           
        } catch (Exception e) {
            System.out.println("el error es "+e);
             return false;
             
        }

       
    }

    public String getBime() {
        return bime;
    }

    public void setBime(String bime) {
        this.bime = bime;
    }

    public String getAlumno() {
        return alumno;
    }

    public void setAlumno(String alumno) {
        this.alumno = alumno;
    }

    public String getProfesor() {
        return profesor;
    }

    public void setProfesor(String profesor) {
        this.profesor = profesor;
    }


    public int getNoral() {
        return noral;
    }

    public void setNoral(int noral) {
        this.noral = noral;
    }

    public int getNprac() {
        return nprac;
    }

    public void setNprac(int nprac) {
        this.nprac = nprac;
    }

    public int getNtrab() {
        return ntrab;
    }

    public void setNtrab(int ntrab) {
        this.ntrab = ntrab;
    }

    public int getNcuad() {
        return ncuad;
    }

    public void setNcuad(int ncuad) {
        this.ncuad = ncuad;
    }

    public int getExabi() {
        return exabi;
    }

    public void setExabi(int exabi) {
        this.exabi = exabi;
    }

    public double getProce() {
        double p;
        proce=(noral+nprac+ntrab+ncuad)/4;
        p=Math.round(proce);
        return p;
    }

    public void setProce(double proce) {
        this.proce = proce;
    }

    public double getPromedio() {
        double p;
        promedio=(proce+exabi)/2;
        p=Math.round(promedio);
        return p;
    }

    public void setPromedio(double promedio) {
        this.promedio = promedio;
    }

    public String getCur() {
        return cur;
    }

    public void setCur(String cur) {
        this.cur = cur;
    }

    public String getGra() {
        return gra;
    }

    public void setGra(String gra) {
        this.gra = gra;
    }

    public String getSec() {
        return sec;
    }

    public void setSec(String sec) {
        this.sec = sec;
    }
   
    
   
}
