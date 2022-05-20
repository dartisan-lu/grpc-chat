import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:hello_grpc_common/protos/hellochat.pbgrpc.dart';

class UserService extends UserServiceBase {
  StreamController<ReadReply> stream;
  UserService(this.stream);

  @override
  Future<LoginReply> login(ServiceCall call, LoginRequest request) async {
    print('Message [login] : ${request.name}');
    stream.add(ReadReply()
      ..message = '[[JOINED THE CHAT]]'
      ..name = request.name);
    return LoginReply()..success = true;
  }
}

class ChatService extends ChatServiceBase {
  StreamController<ReadReply> stream;
  ChatService(this.stream);

  @override
  Stream<ReadReply> read(ServiceCall call, ReadRequest request) {
    print('Message [read]');
    return stream.stream;
  }

  @override
  Future<SendReply> send(ServiceCall call, SendRequest request) async {
    print('Message [send]');
    stream.add(ReadReply()
      ..message = request.message
      ..name = request.name);
    return SendReply()..success = true;
  }
}

void main(List<String> arguments) async {
  var stream = StreamController<ReadReply>.broadcast();
  final server = Server([UserService(stream), ChatService(stream)]);
  await server.serve(port: 5050);
  print('Server waiting for response on : ${server.port}');
}
