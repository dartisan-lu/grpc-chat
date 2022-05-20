import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hello_grpc_common/protos/hellochat.pbgrpc.dart';

import '../services/grpc_service.dart';

class ChatWindow extends StatefulWidget {
  const ChatWindow({Key? key}) : super(key: key);

  @override
  State<ChatWindow> createState() => _ChatWindowState();
}

class _ChatWindowState extends State<ChatWindow> {
  var lines = 'CHAT:';
  late StreamController<ReadReply> stream;
  late GrpcService grpcService;

  _ChatWindowState() {
    grpcService = GrpcService(defaultTargetPlatform);
    grpcService.getChatStream().stream.forEach((value) {
      setState(() {
        lines = '$lines\n${value.name}: ${value.message}';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(lines);
  }

  @override
  void dispose() {
    super.dispose();
    stream.close();
  }
}
