Diseño e implementación de un compilador funcional para una determinada gramática de lenguaje de programación. La segunda parte del proyecto se enfocará en el analizador sintáctico.

MANEJO DE LOS ARCHIVOS

La tabla de símbolos es manejada como una librería, debe ser llamada en el archivo del analizador sintáctico.

El archivo del analizador sintáctico tendrá la extensión *.y "nombre_archivo.y"
El archivo de compila por consola en Linux con el comando bison -yd nombre_archivo.l, desde el directorio que contiene el archivo.
El resultado de la ejecución crea dos archivos y.tab.c y y.tab.h.

El archivo y.tab.h debe ser llamado como librería en el archivo del analizador lexicográfico.
El archivo del analizador lexicográfico tendrá la extensión *.l "nombre_archivo.l"
El archivo de compila por consola en Linux con el comando flex nombre_archivo.l, desde el directorio que contiene el archivo.
El resultado de la ejecución crea un archivo llex.yy.c.

Para crear el archivo ejecutable del analziador sintáctico se lo hace con el compilador GNU de linux, con el comando gcc y.tab.c lex.yy.c -lfl.

La compilación crea un archivo ejecutable a.out, que se lo utiliza desde el directorio que contiene al archivo con el comando ./a.out archivo_ejemplo
