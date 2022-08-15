import ./Todo
import std/sequtils
import std/times
import marshal

var todos: seq[Todo] = @[
    newTodo("Alimentar al perro", "Darle la comida a firulais", now()),
    newTodo("Regar las plantas", "Regar las plantas del living", now())
]

proc add_todo*(todo: Todo) = 
    let new_todo: Todo = todo.with_id(todos.len)
    todos.add(new_todo)

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

proc get_json_todos*(): string =
    $$todos