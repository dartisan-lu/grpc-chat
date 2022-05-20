///
//  Generated code. Do not modify.
//  source: hellochat.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'hellochat.pb.dart' as $0;
export 'hellochat.pb.dart';

class UserClient extends $grpc.Client {
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.LoginReply>(
      '/hellochat.User/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LoginReply.fromBuffer(value));

  UserClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options, $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.LoginReply> login($0.LoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }
}

abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'hellochat.User';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.LoginReply>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.LoginReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.LoginReply> login_Pre($grpc.ServiceCall call, $async.Future<$0.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$0.LoginReply> login($grpc.ServiceCall call, $0.LoginRequest request);
}

class ChatClient extends $grpc.Client {
  static final _$read = $grpc.ClientMethod<$0.ReadRequest, $0.ReadReply>('/hellochat.Chat/Read',
      ($0.ReadRequest value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.ReadReply.fromBuffer(value));
  static final _$send = $grpc.ClientMethod<$0.SendRequest, $0.SendReply>('/hellochat.Chat/Send',
      ($0.SendRequest value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.SendReply.fromBuffer(value));

  ChatClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options, $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.ReadReply> read($0.ReadRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$read, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.SendReply> send($0.SendRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$send, request, options: options);
  }
}

abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'hellochat.Chat';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ReadRequest, $0.ReadReply>(
        'Read',
        read_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.ReadRequest.fromBuffer(value),
        ($0.ReadReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SendRequest, $0.SendReply>(
        'Send',
        send_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SendRequest.fromBuffer(value),
        ($0.SendReply value) => value.writeToBuffer()));
  }

  $async.Stream<$0.ReadReply> read_Pre($grpc.ServiceCall call, $async.Future<$0.ReadRequest> request) async* {
    yield* read(call, await request);
  }

  $async.Future<$0.SendReply> send_Pre($grpc.ServiceCall call, $async.Future<$0.SendRequest> request) async {
    return send(call, await request);
  }

  $async.Stream<$0.ReadReply> read($grpc.ServiceCall call, $0.ReadRequest request);
  $async.Future<$0.SendReply> send($grpc.ServiceCall call, $0.SendRequest request);
}
