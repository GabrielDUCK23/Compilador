/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compilador;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import java.util.logging.Level;
import java.util.logging.Logger;
import java_cup.runtime.Symbol;
import compilador.TypeScriptLexer;
import java_cup.runtime.Scanner;
/**
 *
 * @author 7053
 */
public class AnalizadorSintacticoJava {
    public static void main(String[] args) throws IOException {
        Reader lector = new BufferedReader(new FileReader("src\\Compilador\\Prueba.txt"));
        ParserJava s = new ParserJava(new TypeScriptLexer(lector));
        
//        String contenido= "byte  numero1;";
//        JavaSintactico s = new JavaSintactico(new JavaLexico(new StringReader(contenido)));
        try {
            System.out.println(s.parse());
            System.out.println("Analisis realizado correctamente");
        } catch (Exception ex) {
            ex.printStackTrace();
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