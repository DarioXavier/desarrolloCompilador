#ifndef SYMBOLTABLE_H
#define SYMBOLTABLE_H

/* Estructura para almacenar una entrada de tabla de símbolos */
struct entry_s {
	int type;		/* Tipo de lexema */
        char *lexeme;		/* String que representa el lexema */
	float value;		/* Valor numérico de la entrada */
        struct entry_s *next;	/* Puntero a la entrada siguiente */
};
typedef struct entry_s entry_t;

/* Estructura de la tabla de simbolos */
struct table_s {
        int t_size;             /* Tamaño de la tabla */
        entry_t *t_head;        /* Puntero a la primera entrada */
};
typedef struct table_s table_t;

/* Tabla de simbolos */
table_t table;

/* Inicializa la tabla de simbolos */
void init_table();

/* Crea una nueva entrada y devuelve un puntero */
entry_t *create_entry(int type, const char *lexeme, float value);

/* Pone la entrada al principio de la tabla de símbolos (binding) */
void put_entry(entry_t *new_entry);

/* Busca en la tabla de símbolos un lexema */
/* Retorna
 	-NULL Si la entrada buscada no existe
	-Un puntero a la entrada encontrada */
entry_t *get_entry(const char *lexeme);

/* Retorna un valor float para la entrada */
float get_value(const char *lexeme);

/* Establece un nuevo valor numerico para la entrada */
void set_value(const char *lexeme, float value);

/* Retorna un valor int para la entrada */
int get_type(const char *lexeme);

#endif
