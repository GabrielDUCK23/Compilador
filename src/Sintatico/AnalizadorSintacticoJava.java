package Sintatico;
import Sintatico.ParserJava;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import java.util.logging.Level;
import java.util.logging.Logger;
import java_cup.Lexer;
import java_cup.runtime.Symbol;
//import lexico.JavaLexico;

/**
 *
 * @author 7053
 */
public class AnalizadorSintacticoJava {
    public static void main(String[] args) throws IOException {
        Reader lector = new BufferedReader(new FileReader("src/sintactico/prueba_sintactico.txt"));
        ParserJava s = new ParserJava(new Lexer(lector));
        
//        String contenido= "byte  numero1;";
//        JavaSintactico s = new JavaSintactico(new JavaLexico(new StringReader(contenido)));
        try {
            System.out.println(s.parse());
            System.out.println("Analisis realizado correctamente");
        } catch (Exception ex) {
            try {
                Symbol sym = s.debug_parse();
                System.out.println("Error de sintaxis. Linea: " + (sym.right + 1) +
                        " Columna: " + (sym.left + 1) + ", Texto: \"" + sym.value + "\"");
                System.out.println(ex.getMessage());
            } catch (Exception ex1) {
                Logger.getLogger(AnalizadorSintacticoJava.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }
}