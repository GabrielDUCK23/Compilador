/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package compilador;

import compilador.TypeScriptLexer;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java_cup.runtime.Symbol;

/**
 *
 * @authors
 * Braulio Israel Garcia Martinez
 * Manuel Yael Soto Baeza
 * Arath Patricio Marquez Estrada
 * 
 */
public class Main {
    public static void main(String[] args) {
        try {
            String result = "";
            String fileName = "src\\compilador\\Prueba.txt";
            analizadorSintactico("src\\compilador\\tokens.cup");
            lexerGenerator("src\\compilador\\TypeScript.flex");
            BufferedReader bufferReader = new BufferedReader(new FileReader(fileName));
          
            
            TypeScriptLexer lexer = new TypeScriptLexer(bufferReader);
            
            while ( true ) {
//                GoToken gotoken = goLangLexer.yylex();
//                System.out.println(gotoken.toString() + "\n");
                Symbol token = lexer.next_token();
                if ( token.sym == sym.EOF ) {
                    result += "FIN";
                    System.out.println(result);
                    break;
                }
                else {
//                    System.out.println( token.sym );
                }
            }
            showNames();
        }
        catch ( Exception ex ) {
            System.out.println(ex.toString());
        }
    }
    
    // Scanner
    public static void lexerGenerator(String path) {
        File file = new File(path);
        jflex.Main.generate(file);
    }
    
    // Parser
    public static void analizadorSintactico(String path) throws IOException, Exception {
        String[] parametros = {"-destdir", "src\\compilador", "-parser", "ParserJava", "-progress", "src\\compilador\\tokens.cup"};
        java_cup.Main.main(parametros);
    }
    
    public static void showNames() {
        System.out.print("\n");
        System.out.println("Gabriel Ernesto Rios Sanchez\nJair Alfonso Suárez Flores\nHéctor Ulises Sánchez González");
      
    }
}
