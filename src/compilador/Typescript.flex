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
<YYINITIAL> "in"                 {System.out.println("IN"); return symbol(sym.IN); }
<YYINITIAL> "instanceOf"         {System.out.println("INSTANCEOF"); return symbol(sym.INSTANCEOF); }
<YYINITIAL> "new"                {System.out.println("NEW"); return symbol(sym.NEW); }
<YYINITIAL> "null"               {System.out.println("NULL"); return symbol(sym.NULL); }
<YYINITIAL> "return"             {System.out.println("RETURN"); return symbol(sym.RETURN); }
<YYINITIAL> "super"              {System.out.println("SUPER"); return symbol(sym.SUPER); }
<YYINITIAL> "switch"             {System.out.println("SWITCH"); return symbol(sym.SWITCH); }
<YYINITIAL> "this"               {System.out.println("THIS"); return symbol(sym.THIS); }
<YYINITIAL> "throw"              {System.out.println("THROW"); return symbol(sym.THROW); }
<YYINITIAL> "true"               {System.out.println("TRUE"); return symbol(sym.TRUE); }
<YYINITIAL> "try"                {System.out.println("TRY"); return symbol(sym.TRY); }
<YYINITIAL> "typeOf"             {System.out.println("TYPEOF"); return symbol(sym.TYPEOF); }
<YYINITIAL> "var"                {System.out.println("VAR"); return symbol(sym.VAR); }
<YYINITIAL> "void"               {System.out.println("VOID"); return symbol(sym.VOID); }
<YYINITIAL> "while"              {System.out.println("WHILE"); return symbol(sym.WHILE); }
<YYINITIAL> "with"               {System.out.println("WITH"); return symbol(sym.WITH); }
<YYINITIAL> "case"               {System.out.println("CASE"); return symbol(sym.CASE); }
<YYINITIAL> "catch"              {System.out.println("CATCH"); return symbol(sym.CATCH); }
<YYINITIAL> "class"              {System.out.println("CLASS"); return symbol(sym.CLASS); }
<YYINITIAL> "const"              {System.out.println("CONST"); return symbol(sym.CONST); }
<YYINITIAL> "continue"           {System.out.println("CONTINUE"); return symbol(sym.CONTINUE); }
<YYINITIAL> "debugger"           {System.out.println("DEBURGGER"); return symbol(sym.DEBUGGER); }
<YYINITIAL> "default"            {System.out.println("DEFAULT"); return symbol(sym.DEFAULT); }
<YYINITIAL> "delete"             {System.out.println("DELETE"); return symbol(sym.DELETE); }
<YYINITIAL> "do"                 {System.out.println("DO"); return symbol(sym.DO); }
<YYINITIAL> "else"               {System.out.println("ELSE"); return symbol(sym.ELSE); }
<YYINITIAL> "enum"               {System.out.println("ENUM"); return symbol(sym.ENUM); }
<YYINITIAL> "export"             {System.out.println("EXPORT"); return symbol(sym.EXPORT); }
<YYINITIAL> "extends"            {System.out.println("EXTENDS"); return symbol(sym.EXTENDS); }
<YYINITIAL> "false"              {System.out.println("FALSE"); return symbol(sym.FALSE); }
<YYINITIAL> "finally"            {System.out.println("FINALLY"); return symbol(sym.FINALLY); }
<YYINITIAL> "for"                {System.out.println("FOR"); return symbol(sym.FOR); }
<YYINITIAL> "function"           {System.out.println("FUCTION"); return symbol(sym.FUNCTION); }
<YYINITIAL> "as"                 {System.out.println("AS"); return symbol(sym.AS); }
<YYINITIAL> "implements"         {System.out.println("IMPLEMENTS"); return symbol(sym.IMPLEMENTS); }
<YYINITIAL> "interface"          {System.out.println("INTERFACE"); return symbol(sym.INTERFACE); }
<YYINITIAL> "let"                {System.out.println("LET"); return symbol(sym.LET); }
<YYINITIAL> "package"            {System.out.println("PACKAGE"); return symbol(sym.PACKAGE); }
<YYINITIAL> "private"            {System.out.println("PRIVATE"); return symbol(sym.PRIVATE); }
<YYINITIAL> "protected"          {System.out.println("PROTECTED"); return symbol(sym.PROTECTED); }
<YYINITIAL> "public"             {System.out.println("PUBLIC"); return symbol(sym.PUBLIC); }
<YYINITIAL> "static"             {System.out.println("STATIC"); return symbol(sym.STATIC); }
<YYINITIAL> "yield"              {System.out.println("YIELD"); return symbol(sym.YIELD); }
<YYINITIAL> "any"                {System.out.println("ANY"); return symbol(sym.ANY); }
<YYINITIAL> "boolean"            {System.out.println("BOOLEAN"); return symbol(sym.BOOLEAN); }
<YYINITIAL> "constructor"        {System.out.println("CONSTRUCTOR"); return symbol(sym.CONSTRUCTOR); }
<YYINITIAL> "declare"            {System.out.println("DECLARE"); return symbol(sym.DECLARE); }
<YYINITIAL> "get"                {System.out.println("GET"); return symbol(sym.GET); }
<YYINITIAL> "module"             {System.out.println("MODULE"); return symbol(sym.MODULE); }
<YYINITIAL> "require"            {System.out.println("REQUIRE"); return symbol(sym.REQUIRE); }
<YYINITIAL> "number"             {System.out.println("NUMBER"); return symbol(sym.NUMBER); }
<YYINITIAL> "set"                {System.out.println("SET"); return symbol(sym.SET); }
<YYINITIAL> "string"             {System.out.println("STRING"); return symbol(sym.STRING); }
<YYINITIAL> "symbol"             {System.out.println("SYMBOL"); return symbol(sym.SYMBOL); }
<YYINITIAL> "type"               {System.out.println("TYPE"); return symbol(sym.TYPE); }
<YYINITIAL> "from"               {System.out.println("FROM"); return symbol(sym.FROM); }
<YYINITIAL> "of"                 {System.out.println("OF"); return symbol(sym.OF); }


<YYINITIAL> {
/* identifiers */
{Identifier}             { return symbol(sym.IDENTIFIER); }

/* literals */
{DecIntegerLiteral}      { return symbol(sym.INTEGER_LITERAL); }
\"                       { string.setLength(0); yybegin(STRING); }

System.out.println
/* operators */
"+="                           {System.out.println("MASIGUAL"); return symbol(sym.MASIGUAL); }
"-="                           {System.out.println("MENOSIGUAL"); return symbol(sym.MENOSIGUAL); }
"*="                           {System.out.println("PORIGUAL"); return symbol(sym.PORIGUAL); }
"/="                           {System.out.println("DIVISIONIGUAL"); return symbol(sym.DIVISIONIGUAL); }
"%="                           {System.out.println("PorcentajeIGUAL"); return symbol(sym.PorcentajeIGUAL); }
"++"                           {System.out.println("INCREMENTO"); return symbol(sym.INCREMENTO); }
"--"                           {System.out.println("DECREMENTO"); return symbol(sym.DECREMENTO); }
"!="                           {System.out.println("COMPARAIUAL"); return symbol(sym.COMPARAIUAL); }
"<"                            {System.out.println("MAYORQUE"); return symbol(sym.MAYORQUE); }
">"                            {System.out.println("MENORQUE"); return symbol(sym.MENORQUE); }
"<="                           {System.out.println("MENORIGUAL"); return symbol(sym.MENORIGUAL); }
">="                           {System.out.println("MAYORIGUAL"); return symbol(sym.MAYORIGUAL); }
"&&"                           {System.out.println("AND"); return symbol(sym.AND); } 
"||"                           {System.out.println("OR"); return symbol(sym.OR); }
"!"                            {System.out.println("NOT"); return symbol(sym.NOT); }
"=="                           {System.out.println("EQEQ"); return symbol(sym.EQEQ); }
"="                            {System.out.println("EQ"); return symbol(sym.EQ); }
"+"                            {System.out.println("PLUS"); return symbol(sym.PLUS); }
"*"                            {System.out.println("POR"); return symbol(sym.POR); }
"/"                            {System.out.println("DIVISION"); return symbol(sym.DIVISION); } 
"%"                            {System.out.println("PORCENTAJE"); return symbol(sym.PORCENTAJE); }

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
