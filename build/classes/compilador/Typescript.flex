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
CommentContent = ( [^] | \*+ [^/*] )

Identifier = [:jletter:] [:jletterdigit:]*

DecIntegerLiteral = 0 | [1-9][0-9]*

%state STRING

%%

/* keywords */
<YYINITIAL> "abstract"           {System.out.println("ABSTRACT "+yytext()); return symbol(sym.ABSTRACT); }
<YYINITIAL> "boolean"            {System.out.println("BOOLEAN "+yytext()); return symbol(sym.BOOLEAN); }
<YYINITIAL> "break"              {System.out.println("BREAK "+yytext()); return symbol(sym.BREAK); }
<YYINITIAL> "if"                 {System.out.println("IF "+yytext()); return symbol(sym.IF); }
<YYINITIAL> "import"             {System.out.println("IMPORT "+yytext()); return symbol(sym.IMPORT); }
<YYINITIAL> "in"                 {System.out.println("IN "+yytext()); return symbol(sym.IN); }
<YYINITIAL> "instanceOf"         {System.out.println("INSTANCEOF "+yytext()); return symbol(sym.INSTANCEOF); }
<YYINITIAL> "new"                {System.out.println("NEW "+yytext()); return symbol(sym.NEW); }
<YYINITIAL> "null"               {System.out.println("NULL "+yytext()); return symbol(sym.NULL); }
<YYINITIAL> "return"             {System.out.println("RETURN "+yytext()); return symbol(sym.RETURN); }
<YYINITIAL> "super"              {System.out.println("SUPER "+yytext()); return symbol(sym.SUPER); }
<YYINITIAL> "switch"             {System.out.println("SWITCH "+yytext()); return symbol(sym.SWITCH); }
<YYINITIAL> "this"               {System.out.println("THIS "+yytext()); return symbol(sym.THIS); }
<YYINITIAL> "throw"              {System.out.println("THROW "+yytext()); return symbol(sym.THROW); }
<YYINITIAL> "true"               {System.out.println("TRUE "+yytext()); return symbol(sym.TRUE); }
<YYINITIAL> "try"                {System.out.println("TRY "+yytext()); return symbol(sym.TRY); }
<YYINITIAL> "typeOf"             {System.out.println("TYPEOF "+yytext()); return symbol(sym.TYPEOF); }
<YYINITIAL> "var"                {System.out.println("VAR "+yytext()); return symbol(sym.VAR); }
<YYINITIAL> "void"               {System.out.println("VOID "+yytext()); return symbol(sym.VOID); }
<YYINITIAL> "while"              {System.out.println("WHILE "+yytext()); return symbol(sym.WHILE); }
<YYINITIAL> "with"               {System.out.println("WITH "+yytext()); return symbol(sym.WITH); }
<YYINITIAL> "case"               {System.out.println("CASE "+yytext()); return symbol(sym.CASE); }
<YYINITIAL> "catch"              {System.out.println("CATCH "+yytext()); return symbol(sym.CATCH); }
<YYINITIAL> "class"              {System.out.println("CLASS "+yytext()); return symbol(sym.CLASS); }
<YYINITIAL> "const"              {System.out.println("CONST "+yytext()); return symbol(sym.CONST); }
<YYINITIAL> "continue"           {System.out.println("CONTINUE "+yytext()); return symbol(sym.CONTINUE); }
<YYINITIAL> "debugger"           {System.out.println("DEBURGGER "+yytext()); return symbol(sym.DEBUGGER); }
<YYINITIAL> "default"            {System.out.println("DEFAULT "+yytext()); return symbol(sym.DEFAULT); }
<YYINITIAL> "delete"             {System.out.println("DELETE "+yytext()); return symbol(sym.DELETE); }
<YYINITIAL> "do"                 {System.out.println("DO "+yytext()); return symbol(sym.DO); }
<YYINITIAL> "else"               {System.out.println("ELSE "+yytext()); return symbol(sym.ELSE); }
<YYINITIAL> "enum"               {System.out.println("ENUM "+yytext()); return symbol(sym.ENUM); }
<YYINITIAL> "export"             {System.out.println("EXPORT "+yytext()); return symbol(sym.EXPORT); }
<YYINITIAL> "extends"            {System.out.println("EXTENDS "+yytext()); return symbol(sym.EXTENDS); }
<YYINITIAL> "false"              {System.out.println("FALSE "+yytext()); return symbol(sym.FALSE); }
<YYINITIAL> "finally"            {System.out.println("FINALLY "+yytext()); return symbol(sym.FINALLY); }
<YYINITIAL> "for"                {System.out.println("FOR "+yytext()); return symbol(sym.FOR); }
<YYINITIAL> "function"           {System.out.println("FUCTION "+yytext()); return symbol(sym.FUNCTION); }
<YYINITIAL> "as"                 {System.out.println("AS "+yytext()); return symbol(sym.AS); }
<YYINITIAL> "implements"         {System.out.println("IMPLEMENTS "+yytext()); return symbol(sym.IMPLEMENTS); }
<YYINITIAL> "interface"          {System.out.println("INTERFACE "+yytext()); return symbol(sym.INTERFACE); }
<YYINITIAL> "let"                {System.out.println("LET "+yytext()); return symbol(sym.LET); }
<YYINITIAL> "package"            {System.out.println("PACKAGE "+yytext()); return symbol(sym.PACKAGE); }
<YYINITIAL> "private"            {System.out.println("PRIVATE "+yytext()); return symbol(sym.PRIVATE); }
<YYINITIAL> "protected"          {System.out.println("PROTECTED "+yytext()); return symbol(sym.PROTECTED); }
<YYINITIAL> "public"             {System.out.println("PUBLIC "+yytext()); return symbol(sym.PUBLIC); }
<YYINITIAL> "static"             {System.out.println("STATIC "+yytext()); return symbol(sym.STATIC); }
<YYINITIAL> "yield"              {System.out.println("YIELD "+yytext()); return symbol(sym.YIELD); }
<YYINITIAL> "any"                {System.out.println("ANY "+yytext()); return symbol(sym.ANY); }
<YYINITIAL> "boolean"            {System.out.println("BOOLEAN "+yytext()); return symbol(sym.BOOLEAN); }
<YYINITIAL> "constructor"        {System.out.println("CONSTRUCTOR "+yytext()); return symbol(sym.CONSTRUCTOR); }
<YYINITIAL> "declare"            {System.out.println("DECLARE "+yytext()); return symbol(sym.DECLARE); }
<YYINITIAL> "get"                {System.out.println("GET "+yytext()); return symbol(sym.GET); }
<YYINITIAL> "module"             {System.out.println("MODULE "+yytext()); return symbol(sym.MODULE); }
<YYINITIAL> "require"            {System.out.println("REQUIRE "+yytext()); return symbol(sym.REQUIRE); }
<YYINITIAL> "number"             {System.out.println("NUMBER "+yytext()); return symbol(sym.NUMBER); }
<YYINITIAL> "set"                {System.out.println("SET "+yytext()); return symbol(sym.SET); }
<YYINITIAL> "string"             {System.out.println("STRING "+yytext()); return symbol(sym.STRING); }
<YYINITIAL> "symbol"             {System.out.println("SYMBOL "+yytext()); return symbol(sym.SYMBOL); }
<YYINITIAL> "type"               {System.out.println("TYPE "+yytext()); return symbol(sym.TYPE); }
<YYINITIAL> "from"               {System.out.println("FROM "+yytext()); return symbol(sym.FROM); }
<YYINITIAL> "of"                 {System.out.println("OF "+yytext()); return symbol(sym.OF); }
<YYINITIAL> "("                  {System.out.println("PARENTHESIS_OPEN "+yytext()); return symbol(sym.PARENTHESIS_OPEN); }
<YYINITIAL> ")"                  {System.out.println("PARENTHESIS_CLOSE "+yytext()); return symbol(sym.PARENTHESIS_CLOSE); }
<YYINITIAL> ";"                  {System.out.println("puntoYcoma"+yytext()); return symbol(sym.puntoYcoma); }
<YYINITIAL> "."                  {System.out.println("punto "+yytext()); return symbol(sym.punto); }
<YYINITIAL> ":"                  {System.out.println("Dospunto "+yytext()); return symbol(sym.Dospunto); }
<YYINITIAL> "["                  {System.out.println("corchete_open"+yytext()); return symbol(sym.corchete_open); }
<YYINITIAL> "]"                  {System.out.println("corchete_close "+yytext()); return symbol(sym.corchete_close); }
<YYINITIAL> "{"                  {System.out.println("llave_open"+yytext()); return symbol(sym.llave_open); }
<YYINITIAL> "}"                  {System.out.println("llave_close "+yytext()); return symbol(sym.llave_close); }
<YYINITIAL> ","                  {System.out.println("coma "+yytext()); return symbol(sym.coma); }
<YYINITIAL> "\""                  {System.out.println("COMILLA_DOBLE "+yytext()); return symbol(sym.COMILLA_DOBLE); }
<YYINITIAL> "'"                  {System.out.println("COMILLA_SIMPLE "+yytext()); return symbol(sym.COMILLA_SIMPLE); }


<YYINITIAL> {
/* identifiers */
{Identifier}             {System.out.println("Identifier "+yytext()); return symbol(sym.IDENTIFIER); }

/* literals */
{DecIntegerLiteral}      {System.out.println("DecIntegerLiteral "+yytext()); return symbol(sym.INTEGER_LITERAL); }
\"                       { string.setLength(0); yybegin(STRING); }

System.out.println
/* operators */
"+="                           {System.out.println("MASIGUAL "+yytext()); return symbol(sym.MASIGUAL); }
"-="                           {System.out.println("MENOSIGUAL "+yytext()); return symbol(sym.MENOSIGUAL); }
"*="                           {System.out.println("PORIGUAL "+yytext()); return symbol(sym.PORIGUAL); }
"/="                           {System.out.println("DIVISIONIGUAL "+yytext()); return symbol(sym.DIVISIONIGUAL); }
"%="                           {System.out.println("PorcentajeIGUAL "+yytext()); return symbol(sym.PorcentajeIGUAL); }
"++"                           {System.out.println("INCREMENTO "+yytext()); return symbol(sym.INCREMENTO); }
"--"                           {System.out.println("DECREMENTO "+yytext()); return symbol(sym.DECREMENTO); }
"!="                           {System.out.println("COMPARAIUAL "+yytext()); return symbol(sym.COMPARAIUAL); }
"<"                            {System.out.println("MAYORQUE "+yytext()); return symbol(sym.MAYORQUE); }
">"                            {System.out.println("MENORQUE "+yytext()); return symbol(sym.MENORQUE); }
"<="                           {System.out.println("MENORIGUAL "+yytext()); return symbol(sym.MENORIGUAL); }
">="                           {System.out.println("MAYORIGUAL "+yytext()); return symbol(sym.MAYORIGUAL); }
"&&"                           {System.out.println("AND "+yytext()); return symbol(sym.AND); } 
"||"                           {System.out.println("OR "+yytext()); return symbol(sym.OR); }
"!"                            {System.out.println("NOT "+yytext()); return symbol(sym.NOT); }
"=="                           {System.out.println("EQEQ "+yytext()); return symbol(sym.EQEQ); }
"="                            {System.out.println("EQ "+yytext()); return symbol(sym.EQ); }
"+"                            {System.out.println("PLUS "+yytext()); return symbol(sym.PLUS); }
"*"                            {System.out.println("POR "+yytext()); return symbol(sym.POR); }
"/"                            {System.out.println("DIVISION "+yytext()); return symbol(sym.DIVISION); } 
"%"                            {System.out.println("PORCENTAJE "+yytext()); return symbol(sym.PORCENTAJE); }
"-"                            {System.out.println("Menos "+yytext()); return symbol(sym.Menos); }

/* comments */
{Comment}                { System.out.println("Comment"+yytext());}

/* whitespace */
{WhiteSpace}             { }
}

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