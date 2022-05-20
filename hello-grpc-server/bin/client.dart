import 'package:grpc/grpc.dart';
import 'package:hello_grpc_common/protos/hellochat.pbgrpc.dart';

void main(List<String> arguments) async {
  final channel =
      ClientChannel('localhost', port: 5050, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));

  final stub = UserClient(channel);
  var request = LoginRequest()..name = "SYSTEM";
  print('Request: $request');
  var response = await stub.login(request);
  print('Response: $response');

  final stub2 = ChatClient(channel);
  var rq2 = ReadRequest();
  var rp2 = stub2.read(rq2);
  rp2.forEach((e) {
    print('${e.name}: ${e.message}');
  });
  await channel.shutdown();
}
