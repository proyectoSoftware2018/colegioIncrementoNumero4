
package modelo;


import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

public class reniec {
    public String getNombre(String url){
        String datos="";
        try {
            Document doc = Jsoup.connect(url).get();
            Element el = doc.body();
            datos = el.text();
        } catch (IOException ex) {
            Logger.getLogger(reniec.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return datos;
    }
}
