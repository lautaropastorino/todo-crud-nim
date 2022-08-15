import std/times

type
    Todo* = object
        id: int
        title: string
        description: string
        creation_date: DateTime

proc newTodo*(title, description: string): Todo =
    Todo(
        title: title,
        description: description, 
        creation_date: now()
    )

proc get_title*(todo: Todo): string =
    todo.title

proc get_description*(todo: Todo): string =
    todo.description

proc get_creation_date*(todo: Todo): DateTime =
    todo.creation_date

proc get_id*(todo: Todo): int = 
    todo.id

proc with_id*(todo: Todo, id: int): Todo =
    Todo(
        id: id,
        title: todo.title,
        description: todo.description, 
        creation_date: todo.creation_date
    )
