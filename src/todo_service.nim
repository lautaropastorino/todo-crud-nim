import ./todo_repository
import ./Todo
import marshal
import json
import std/asynchttpserver

proc get_json_todos*(): string = 
    $$get_todos()

proc post_todo*(req: Request): string =
    let json_body = parseJson(req.body)
    let todo = newTodo(
        json_body["title"].getStr(),
        json_body["description"].getStr(),
    )
    $$add_todo(todo)
    