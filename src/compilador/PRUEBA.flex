/* JFlex example: partial Java language lexer specification */
package compilador;
import java_cup.runtime.*;
/**
* This class is a simple example lexer.
*/
%%
%class TypeScriptLexer
%unicode
%cup
%line
%column
%{
        StringBuffer string = new StringBuffer();

        private Symbol symbol(int type) {
         return new Symbol(type, yyline, yycolumn);
        }
        private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
        }
%}

LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace = {LineTerminator} | [ \t\f]

/* comments */
Comment = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}

TraditionalComment = "/*" [^*] ~"*/" | "/*" "*"+ "/"
EndOfLineComment = "//" {InputCharacter}* {LineTerminator}?
DocumentationComment = "/**" {CommentContent} "*"+ "/"
CommentContent = ( [^*] | \*+ [^/*] )*

Identifier = [:jletter:] [:jletterdigit:]*

DecIntegerLiteral = 0 | [1-9][0-9]*

%state STRING

%%

/* keywords */
<YYINITIAL> "abstract"           {System.out.println("ABSTRACT"); return symbol(sym.ABSTRACT); }
<YYINITIAL> "boolean"            {System.out.println("BOOLEAN"); return symbol(sym.BOOLEAN); }
<YYINITIAL> "break"              {System.out.println("BREAK"); return symbol(sym.BREAK); }
<YYINITIAL> "if"                 {System.out.println("IF"); return symbol(sym.IF); }
<YYINITIAL> "import"             {System.out.println("IMPORT"); return symbol(sym.IMPORT); }




<YYINITIAL> {
/* identifiers */
{Identifier}             { return symbol(sym.IDENTIFIER); }

/* literals */
{DecIntegerLiteral}      { return symbol(sym.INTEGER_LITERAL); }
\"                       { string.setLength(0); yybegin(STRING); }

Systen.out.printl("");
/* operators */
"+="                           {System.out.println("MASIGUAL"); return symbol(sym.MASIGUAL); }
"-="                           {System.out.println("MENOSIGUAL"); return symbol(sym.MENOSIGUAL); }
"*="                           {System.out.println("PORIGUAL"); return symbol(sym.PORIGUAL); }
"/="                           {System.out.println("DIVISIONIGUAL"); return symbol(sym.DIVISIONIGUAL); }


/* comments */
{Comment}                { /* ignore */ }

/* whitespace */
{WhiteSpace}             { /* ignore */ }
}

<STRING> {
\"                             { yybegin(YYINITIAL); 
                                       return symbol(sym.STRING_LITERAL, 
                                       string.toString()); }
[^\n\r\"\\]+                   { string.append( yytext() ); }
\\t                            { string.append('\t'); }
\\n                            { string.append('\n'); }

\\r                            { string.append('\r'); }
\\\"                           { string.append('\"'); }
\\                             { string.append('\\'); }
}

/* error fallback */

