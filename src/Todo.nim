import std/times
import std/strformat
import marshal

type
    Todo* = object
        id: int
        title: string
        description: string
        creation_date: DateTime

proc newTodo*(title, description: string, creation_date: DateTime): Todo =
    Todo(
        title: title,
        description: description, 
        creation_date: creation_date
    )

proc get_title*(todo: Todo): string =
    todo.title

proc get_description*(todo: Todo): string =
    todo.description

proc get_creation_date*(todo: Todo): DateTime =
    todo.creation_date

proc get_id*(todo: Todo): int = 
    todo.id

proc to_string*(todo: Todo): string = 
    &"{todo.title}:\n{todo.description}\n{todo.creation_date}"

proc to_json*(todo: Todo): string = 
    $$todo

proc with_id*(todo: Todo, id: int): Todo =
    Todo(
        id: id,
        title: todo.title,
        description: todo.description, 
        creation_date: todo.creation_date
    )
