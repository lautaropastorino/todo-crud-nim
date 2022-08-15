# Backend para aplicación de tareas escrito en [Nim](https://nim-lang.org/)

### Métodos

> GET localhost:8080/todos 

Devuelve un json con una lista de los *to-do* registrados 

> POST localhost:8080/todos 

```
{
    "title": "Cargar nafta",
    "description": "Llenar el tanque de nafta infinia"
}
```
Inserta un *to-do* y devuelve el recurso creado

> PATCH localhost:8080/todos 

(próximamente)

> DELETE localhost:8080/todos 

(próximamente)

### Compilar y ejecutar:
```
nim c -r src/todo_crud.nim
```