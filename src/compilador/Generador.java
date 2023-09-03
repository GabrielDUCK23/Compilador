/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package compilador;

/**
 *
 * @author DELL
 */

import java.io.File;
import java.io.IOException;

public class Generador {
    public static void main(String[] args) throws IOException, Exception {
//        String pathFlex="C:\\Users\\7053\\Documents\\NetBeansProjects\\UEDL_COMPILADORES\\src\\sintactico\\java_lexico_sintactico.jflex";

        String pathFlex="src\\compilador\\Typescript.flex";
        File file=new File(pathFlex);
        jflex.Main.generate(file);
        String[] parametrosLex = {pathFlex};
        jflex.Main.generate(parametrosLex);
        
      

        //String[] parametros = {"-parser", "Sintactico", "C:\\Users\\7053\\Documents\\NetBeansProjects\\UEDL_COMPILADORES\\src\\sintactico\\sintactico.cup"};
        String[] parametros = {"-destdir", "src\\compilador","-parser", "ParserJava", 
            "-progress", "src\\compilador\\tokens.cup"};
        java_cup.Main.main(parametros);
        
    }
    
   
}