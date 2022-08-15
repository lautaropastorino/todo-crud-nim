import asynchttpserver
import std/asyncdispatch
import ./todo_persistence

proc get_todos_response*(req: Request) {.async, gcsafe.} = 
    await req.respond(Http200, get_json_todos(), newHttpHeaders({ "Content-Type": "application/json" }))