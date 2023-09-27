/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package compilador;

/**
 *
 * @author DELL
 */


import compilador.sym;
import compilador.sym;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java_cup.runtime.Symbol;

/**
 *
 * @author 7053
 */
public class AnalizadorLexico1 {
    public static void main(String[] args) throws IOException {
//         File archivo = new File("archivo.txt");
//        PrintWriter escribir;
       
        try {
            Reader lector = new BufferedReader(new FileReader("src\\Compilador\\Prueba.txt"));
            TypeScriptLexer lexer = new TypeScriptLexer(lector);
            String resultado = "";
            while (true) {
                Symbol token = lexer.next_token();
//                System.out.println("Token: "+token.toString());
                if (token.sym == sym.EOF) {
                    resultado += "FIN";
                    System.out.println(resultado);
                    break;
                }
            }
         //   System.out.println("Resultado final nuevo "+lexer.getResultado());
        } catch (FileNotFoundException ex) {
            
        } catch (IOException ex) {
            
        }
    }
}
//public class AnalizadorLexico1 {
//    public static void main(String[] args) {
//        try {
//            Reader lector = new BufferedReader(new FileReader("src\\Compilador\\Type.txt"));
//            TypeScriptLexer lexer = new TypeScriptLexer(lector);
//            String resultado = "";
//            while (true) {
//                Symbol token = lexer.next_token();
//                System.out.println("Token: " + token.toString());
//                if (token.sym == sym.EOF) {
//                    resultado += "FIN";
//                    System.out.println(resultado);
//                    break;
//                }
//            }
//            lector.close(); // Cerrar el lector después de usarlo
//        } catch (FileNotFoundException ex) {
//            System.err.println("Archivo no encontrado: " + ex.getMessage());
//        } catch (IOException ex) {
//            System.err.println("Error de lectura: " + ex.getMessage());
//        }
//    }
//}