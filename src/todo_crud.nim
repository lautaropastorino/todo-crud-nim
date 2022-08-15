import std/asynchttpserver
import std/asyncdispatch
import ./todo_response

proc router(httpMethod: HttpMethod, path: string, req: Request) {.async, gcsafe.} =
  case httpMethod
  of HttpGet:
    case path
    of "/todos":
      echo "get 127.0.0.1:8080/todos"
      await get_todos_response(req)
    #[ of "/home":
      echo "get 127.0.0.1:8080/home"
      # fetchInfoFromDatabase()
    else:
      discard
  of HttpPost:
    case path
    of "/hello":
      echo "post 127.0.0.1:8080/hello"
      # login()
    of "/home":
      echo "post 127.0.0.1:8080/home"
      # returnHome() ]#
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