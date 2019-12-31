import 'dart:async';
import 'dart:io';

class ServerHandler {
  static HttpServer server = null;

  Future<void> bindServer() async {
   server = await HttpServer.bind("192.168.1.101", 8080,);
    print(
        "Server running on IP : " + server.address.toString() + " On Port : " +
            server.port.toString());
    await for (var request in server) {
      print(request.requestedUri.query.split("&"));
      switch (request.requestedUri.path) {
        case "/":
          request.response
            ..headers.contentType = new ContentType(
                "text", "plain", charset: "utf-8")
            ..write('Hello, world')
            ..close();
          break;
        case "/message":
          request.response
            ..headers.contentType = new ContentType(
                "text", "plain", charset: "utf-8")
            ..write('Hello, world')
            ..close();
          break;
      }
    }
  }
}