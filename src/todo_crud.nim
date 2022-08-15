import std/asynchttpserver
import std/asyncdispatch
import ./todo_service

proc router(httpMethod: HttpMethod, path: string, req: Request) {.async, gcsafe.} =
  case httpMethod
  of HttpGet:
    case path
    of "/todos":
      echo "get 127.0.0.1:8080/todos"
      var todos_json = get_json_todos()
      await req.respond(Http200, todos_json, newHttpHeaders({ "Content-Type": "application/json" }))
    #[ of "/home":
      echo "get 127.0.0.1:8080/home"
      # fetchInfoFromDatabase()
    else:
      discard]#
  of HttpPost:
    case path
    of "/todos":
      echo "post 127.0.0.1:8080/todos"
      var post_result = post_todo(req)
      await req.respond(Http204, post_result, newHttpHeaders({ "Content-Type": "application/json" }))
    else:
      discard
  else:
    discard

proc main {.async.} =
  var server = newAsyncHttpServer()

  proc cb(req: Request) {.async, gcsafe.} =
    await router(req.reqMethod, req.url.path, req)

  server.listen(Port(8080))

  while true:
    if server.shouldAcceptRequest():
      await server.acceptRequest(cb)
    else:
      # too many concurrent connections, `maxFDs` exceeded
      # wait 500ms for FDs to be closed
      await sleepAsync(500)


waitFor main()