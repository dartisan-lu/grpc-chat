import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hello_grpc_web/widgets/chat_window.dart';

import '../services/grpc_service.dart';

class WelcomeScaffold extends StatelessWidget {
  final messageController = TextEditingController();
  late final GrpcService grpcService;

  WelcomeScaffold({Key? key}) : super(key: key) {
    grpcService = GrpcService(defaultTargetPlatform);
  }

  Future<void> submit() async {
    grpcService.sendMessage('USER', messageController.value.text);
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      TextField(
        controller: messageController,
      ),
      ElevatedButton(onPressed: submit, child: const Text('SUBMIT')),
      const ChatWindow(),
    ]));
  }
}
