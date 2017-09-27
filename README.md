Diseño e implementación de un compilador funcional para una determinada gramática de lenguaje de programación. La primera parte del proyecto se enfocará en el analizador léxico.

MANEJO DEL ARCHIVO

El archivo tendrá la extensión *.l "nombre_archivo.l"

El archivo de compila por consola en Linux con el comando flex nombre_archivo.l, desde el directorio que contiene el archivo.

El resultado de la ejecución crea un archivo llex.yy.c, que se ejecuta con el compilador GNU de linux con el comando gcc llex.yy.c -lfl

La compilación crea un archivo ejecutable a.out, que se ejecuta desde el directorio que contiene al archivo con el comando ./a.out archivo_ejemplo

Se genera un archivo secuenciaTokens.txt, que contiene la secuencia de tokens reconocidos por el analizador lexicográfico, así como la línea del error.
