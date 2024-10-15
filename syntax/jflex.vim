" jflex.vim - Syntax highlighting for JFlex files

if exists("b:current_syntax")
  finish
endif

syn case ignore

" Define keywords and directives
syn keyword jflexKeyword %class %unicode %{
syn keyword jflexKeyword %%

" Highlight the section for Java code between %{ and %}
syn region jflexJavaCode start="%{" end="%}" contains=@java

" Highlight regular expressions (enclosed in double quotes)
syn region jflexRegex start="\"" end="\"" contains=jflexEscape,Special

" Highlight strings and character classes inside the regular expressions
syn match jflexEscape /\\./
syn match jflexCharClass /\[[^]]*\]/

" Highlight comments (single-line and multi-line)
syn match jflexComment "//.*$"
syn region jflexMultilineComment start="/\*" end="\*/"

" Highlight predefined actions like yyline, yycolumn, etc.
syn keyword jflexPredef yyline yycolumn yytext

" Highlight integer values
syn match jflexNumber /\<[0-9]\+\>/

" Highlight end of file (EOF) tokens
syn keyword jflexKeyword <<EOF>>

" Define syntax groups
hi def link jflexKeyword Keyword
hi def link jflexJavaCode java
hi def link jflexRegex String
hi def link jflexEscape Special
hi def link jflexCharClass Character
hi def link jflexComment Comment
hi def link jflexMultilineComment Comment
hi def link jflexPredef Identifier
hi def link jflexNumber Number

let b:current_syntax = "jflex"

