import 'dart:async';

import 'package:flutter/src/foundation/platform.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_web.dart';
import 'package:hello_grpc_common/protos/hellochat.pbgrpc.dart';

class GrpcService {
  TargetPlatform platform;
  GrpcService(this.platform);

  getChannel() {
    switch (platform) {
      case TargetPlatform.android:
        return ClientChannel('localhost',
            port: 5050, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
      case TargetPlatform.iOS:
        return ClientChannel('localhost',
            port: 5050, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
      default:
        return GrpcWebClientChannel.xhr(Uri.parse('http://localhost:5051'));
    }
  }

  StreamController<ReadReply> getChatStream() {
    final stub = ChatClient(getChannel());
    var request = ReadRequest();
    var stream = StreamController<ReadReply>();
    stream.addStream(stub.read(request));
    return stream;
  }

  void sendMessage(String user, String message) async {
    final stub = ChatClient(getChannel());
    var request = SendRequest()
      ..name = user
      ..message = message;
    await stub.send(request);
  }
}
