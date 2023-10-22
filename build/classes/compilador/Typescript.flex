/* JFlex example: partial Java language lexer specification */
package compilador;
import java_cup.runtime.*;


/*

//Suarez Florez Jair Alfonso   
//Rios Sánchez Gabriel Ernesto
//Sánchez González Héctor Ulises

*/


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
CommentContent = ( [^] | \*+ [^/*] )

Identifier = [:jletter:] [:jletterdigit:]*

DecIntegerLiteral = 0 | [1-9][0-9]*

%state STRING

%%

/* keywords */
<YYINITIAL> "abstract"           {System.out.println("ABSTRACT "+yytext()); return symbol(sym.ABSTRACT,yytext()); }
<YYINITIAL> "break"              {System.out.println("BREAK "+yytext()); return symbol(sym.BREAK,yytext()); }
<YYINITIAL> "if"                 {System.out.println("IF "+yytext()); return symbol(sym.IF,yytext()); }
<YYINITIAL> "import"             {System.out.println("IMPORT "+yytext()); return symbol(sym.IMPORT,yytext()); }
<YYINITIAL> "in"                 {System.out.println("IN "+yytext()); return symbol(sym.IN,yytext()); }
<YYINITIAL> "instanceOf"         {System.out.println("INSTANCEOF "+yytext()); return symbol(sym.INSTANCEOF,yytext()); }
<YYINITIAL> "new"                {System.out.println("NEW "+yytext()); return symbol(sym.NEW,yytext()); }
<YYINITIAL> "null"               {System.out.println("NULL "+yytext()); return symbol(sym.NULL,yytext()); }
<YYINITIAL> "return"             {System.out.println("RETURN "+yytext()); return symbol(sym.RETURN,yytext()); }
<YYINITIAL> "super"              {System.out.println("SUPER "+yytext()); return symbol(sym.SUPER,yytext()); }
<YYINITIAL> "switch"             {System.out.println("SWITCH "+yytext()); return symbol(sym.SWITCH,yytext()); }
<YYINITIAL> "this"               {System.out.println("THIS "+yytext()); return symbol(sym.THIS,yytext()); }
<YYINITIAL> "throw"              {System.out.println("THROW "+yytext()); return symbol(sym.THROW,yytext()); }
<YYINITIAL> "true"               {System.out.println("TRUE "+yytext()); return symbol(sym.TRUE,yytext()); }
<YYINITIAL> "try"                {System.out.println("TRY "+yytext()); return symbol(sym.TRY,yytext()); }
<YYINITIAL> "typeOf"             {System.out.println("TYPEOF "+yytext()); return symbol(sym.TYPEOF,yytext()); }
<YYINITIAL> "var"                {System.out.println("VAR "+yytext()); return symbol(sym.VAR,yytext()); }
<YYINITIAL> "void"               {System.out.println("VOID "+yytext()); return symbol(sym.VOID,yytext()); }
<YYINITIAL> "while"              {System.out.println("WHILE "+yytext()); return symbol(sym.WHILE,yytext()); }
<YYINITIAL> "with"               {System.out.println("WITH "+yytext()); return symbol(sym.WITH,yytext()); }
<YYINITIAL> "case"               {System.out.println("CASE "+yytext()); return symbol(sym.CASE,yytext()); }
<YYINITIAL> "catch"              {System.out.println("CATCH "+yytext()); return symbol(sym.CATCH,yytext()); }
<YYINITIAL> "class"              {System.out.println("CLASS "+yytext()); return symbol(sym.CLASS,yytext()); }
<YYINITIAL> "const"              {System.out.println("CONST "+yytext()); return symbol(sym.CONST,yytext()); }
<YYINITIAL> "continue"           {System.out.println("CONTINUE "+yytext()); return symbol(sym.CONTINUE,yytext()); }
<YYINITIAL> "debugger"           {System.out.println("DEBURGGER "+yytext()); return symbol(sym.DEBUGGER,yytext()); }
<YYINITIAL> "default"            {System.out.println("DEFAULT "+yytext()); return symbol(sym.DEFAULT,yytext()); }
<YYINITIAL> "delete"             {System.out.println("DELETE "+yytext()); return symbol(sym.DELETE,yytext()); }
<YYINITIAL> "do"                 {System.out.println("DO "+yytext()); return symbol(sym.DO,yytext()); }
<YYINITIAL> "else"               {System.out.println("ELSE "+yytext()); return symbol(sym.ELSE,yytext()); }
<YYINITIAL> "enum"               {System.out.println("ENUM "+yytext()); return symbol(sym.ENUM,yytext()); }
<YYINITIAL> "export"             {System.out.println("EXPORT "+yytext()); return symbol(sym.EXPORT,yytext()); }
<YYINITIAL> "extends"            {System.out.println("EXTENDS "+yytext()); return symbol(sym.EXTENDS,yytext()); }
<YYINITIAL> "false"              {System.out.println("FALSE "+yytext()); return symbol(sym.FALSE,yytext()); }
<YYINITIAL> "finally"            {System.out.println("FINALLY "+yytext()); return symbol(sym.FINALLY,yytext()); }
<YYINITIAL> "for"                {System.out.println("FOR "+yytext()); return symbol(sym.FOR,yytext()); }
<YYINITIAL> "forEach"            {System.out.println("FOREACH "+yytext()); return symbol(sym.FOREACH,yytext()); }
<YYINITIAL> "function"           {System.out.println("FUCTION "+yytext()); return symbol(sym.FUNCTION,yytext()); }
<YYINITIAL> "as"                 {System.out.println("AS "+yytext()); return symbol(sym.AS,yytext()); }
<YYINITIAL> "implements"         {System.out.println("IMPLEMENTS "+yytext()); return symbol(sym.IMPLEMENTS,yytext()); }
<YYINITIAL> "interface"          {System.out.println("INTERFACE "+yytext()); return symbol(sym.INTERFACE,yytext()); }
<YYINITIAL> "let"                {System.out.println("LET "+yytext()); return symbol(sym.LET,yytext()); }
<YYINITIAL> "package"            {System.out.println("PACKAGE "+yytext()); return symbol(sym.PACKAGE,yytext()); }
<YYINITIAL> "private"            {System.out.println("PRIVATE "+yytext()); return symbol(sym.PRIVATE,yytext()); }
<YYINITIAL> "protected"          {System.out.println("PROTECTED "+yytext()); return symbol(sym.PROTECTED,yytext()); }
<YYINITIAL> "public"             {System.out.println("PUBLIC "+yytext()); return symbol(sym.PUBLIC,yytext()); }
<YYINITIAL> "static"             {System.out.println("STATIC "+yytext()); return symbol(sym.STATIC,yytext()); }
<YYINITIAL> "yield"              {System.out.println("YIELD "+yytext()); return symbol(sym.YIELD,yytext()); }
<YYINITIAL> "any"                {System.out.println("ANY "+yytext()); return symbol(sym.ANY,yytext()); }
<YYINITIAL> "boolean"            {System.out.println("BOOLEAN "+yytext()); return symbol(sym.BOOLEAN,yytext()); }
<YYINITIAL> "constructor"        {System.out.println("CONSTRUCTOR "+yytext()); return symbol(sym.CONSTRUCTOR,yytext()); }
<YYINITIAL> "declare"            {System.out.println("DECLARE "+yytext()); return symbol(sym.DECLARE,yytext()); }
<YYINITIAL> "get"                {System.out.println("GET "+yytext()); return symbol(sym.GET,yytext()); }
<YYINITIAL> "module"             {System.out.println("MODULE "+yytext()); return symbol(sym.MODULE,yytext()); }
<YYINITIAL> "require"            {System.out.println("REQUIRE "+yytext()); return symbol(sym.REQUIRE,yytext()); }
<YYINITIAL> "number"             {System.out.println("NUMBER "+yytext()); return symbol(sym.NUMBER,yytext()); }
<YYINITIAL> "set"                {System.out.println("SET "+yytext()); return symbol(sym.SET,yytext()); }
<YYINITIAL> "string"             {System.out.println("STRING "+yytext()); return symbol(sym.STRING,yytext()); }
<YYINITIAL> "symbol"             {System.out.println("SYMBOL "+yytext()); return symbol(sym.SYMBOL,yytext()); }
<YYINITIAL> "type"               {System.out.println("TYPE "+yytext()); return symbol(sym.TYPE,yytext()); }
<YYINITIAL> "from"               {System.out.println("FROM "+yytext()); return symbol(sym.FROM,yytext()); }
<YYINITIAL> "of"                 {System.out.println("OF "+yytext()); return symbol(sym.OF,yytext()); }
<YYINITIAL> "("                  {System.out.println("PARENTHESIS_OPEN "+yytext()); return symbol(sym.PARENTHESIS_OPEN,yytext()); }
<YYINITIAL> ")"                  {System.out.println("PARENTHESIS_CLOSE "+yytext()); return symbol(sym.PARENTHESIS_CLOSE,yytext()); }
<YYINITIAL> ";"                  {System.out.println("puntoYcoma"+yytext()); return symbol(sym.puntoYcoma,yytext()); }
<YYINITIAL> "."                  {System.out.println("punto "+yytext()); return symbol(sym.punto,yytext()); }
<YYINITIAL> ":"                  {System.out.println("Dospuntos "+yytext()); return symbol(sym.Dospuntos,yytext()); }
<YYINITIAL> "["                  {System.out.println("corchete_open"+yytext()); return symbol(sym.corchete_open,yytext()); }
<YYINITIAL> "]"                  {System.out.println("corchete_close "+yytext()); return symbol(sym.corchete_close,yytext()); }
<YYINITIAL> "{"                  {System.out.println("llave_open"+yytext()); return symbol(sym.llave_open,yytext()); }
<YYINITIAL> "}"                  {System.out.println("llave_close "+yytext()); return symbol(sym.llave_close,yytext()); }
<YYINITIAL> ","                  {System.out.println("coma "+yytext()); return symbol(sym.coma,yytext()); }
<YYINITIAL> "\""                  {System.out.println("COMILLA_DOBLE "+yytext()); return symbol(sym.COMILLA_DOBLE,yytext()); }
<YYINITIAL> "'"                  {System.out.println("COMILLA_SIMPLE "+yytext()); return symbol(sym.COMILLA_SIMPLE,yytext()); }


<YYINITIAL> {
/* identifiers */
{Identifier}             {System.out.println("Identifier "+yytext()); return symbol(sym.IDENTIFIER,yytext()); }

/* literals */
{DecIntegerLiteral}      {System.out.println("DecIntegerLiteral "+yytext()); return symbol(sym.INTEGER_LITERAL,yytext()); }
\"                       { string.setLength(0); yybegin(STRING); }


System.out.println
/* operators */
"+="                           {System.out.println("MASIGUAL "+yytext()); return symbol(sym.MASIGUAL,yytext()); }
"-="                           {System.out.println("MENOSIGUAL "+yytext()); return symbol(sym.MENOSIGUAL,yytext()); }
"*="                           {System.out.println("PORIGUAL "+yytext()); return symbol(sym.PORIGUAL,yytext()); }
"/="                           {System.out.println("DIVISIONIGUAL "+yytext()); return symbol(sym.DIVISIONIGUAL,yytext()); }
"%="                           {System.out.println("PorcentajeIGUAL "+yytext()); return symbol(sym.PorcentajeIGUAL,yytext()); }
"++"                           {System.out.println("INCREMENTO "+yytext()); return symbol(sym.INCREMENTO,yytext()); }
"--"                           {System.out.println("DECREMENTO "+yytext()); return symbol(sym.DECREMENTO,yytext()); }
"!="                           {System.out.println("COMPARAIGUAL "+yytext()); return symbol(sym.COMPARAIGUAL,yytext()); }
"<"                            {System.out.println("MENORQUE "+yytext()); return symbol(sym.MENORQUE,yytext()); }
">"                            {System.out.println("MAYORQUE "+yytext()); return symbol(sym.MAYORQUE,yytext()); }
"<="                           {System.out.println("MENORIGUAL "+yytext()); return symbol(sym.MENORIGUAL,yytext()); }
">="                           {System.out.println("MAYORIGUAL "+yytext()); return symbol(sym.MAYORIGUAL,yytext()); }
"&&"                           {System.out.println("AND "+yytext()); return symbol(sym.AND,yytext()); } 
"||"                           {System.out.println("OR "+yytext()); return symbol(sym.OR,yytext()); }
"!"                            {System.out.println("NOT "+yytext()); return symbol(sym.NOT,yytext()); }
"=="                           {System.out.println("EQEQ "+yytext()); return symbol(sym.EQEQ,yytext()); }
"="                            {System.out.println("EQ "+yytext()); return symbol(sym.EQ,yytext()); }
"+"                            {System.out.println("PLUS "+yytext()); return symbol(sym.PLUS,yytext()); }
"*"                            {System.out.println("POR "+yytext()); return symbol(sym.POR,yytext()); }
"/"                            {System.out.println("DIVISION "+yytext()); return symbol(sym.DIVISION,yytext()); } 
"%"                            {System.out.println("PORCENTAJE "+yytext()); return symbol(sym.PORCENTAJE,yytext()); }
"-"                            {System.out.println("Menos "+yytext()); return symbol(sym.Menos,yytext()); }

/* comments */
{Comment}                { System.out.println("Comment"+yytext());}

/* whitespace */
{WhiteSpace}             { }
}

\"[^\"]*\"  {System.out.println("CADENA "+yytext()); return symbol(sym.CADENA,yytext()); }

<STRING> {
\"                             { yybegin(YYINITIAL); 
                                       return symbol(sym.STRING_LITERAL, 
                                       string.toString()); }
[^\n\r\"\\]+                   { string.append( yytext() ); }
\\t                            { string.append('\t'); }
\\n                            {string.append('\n'); }

\\r                            { string.append('\r'); }
\\\"                           { string.append('\"'); }
\\                             { string.append('\\'); }
}



/* error fallback */