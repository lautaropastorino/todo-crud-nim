import ./Todo
import std/sequtils

var todos: seq[Todo] = @[
    newTodo("Alimentar al perro", "Darle la comida a firulais").with_id(1),
    newTodo("Regar las plantas", "Regar las plantas del living").with_id(2)
]

proc add_todo*(todo: Todo): Todo = 
    let new_todo: Todo = todo.with_id(todos.len + 1) # Esto puede ser un problema si se reciben dos requests a la vez, se debería aplicar un lock sobre la lista
    todos.add(new_todo)
    new_todo

proc remove_todo*(todo: Todo) =
    var index_to_remove = -1
    for index, t in todos:
        if t.get_id == todo.get_id:
            index_to_remove = index
            break
    if index_to_remove >= 0:
        todos.delete(index_to_remove..index_to_remove)

proc get_todos*(): seq[Todo] = 
    todos

    