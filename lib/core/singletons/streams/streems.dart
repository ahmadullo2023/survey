import 'dart:async';

class ServerErrorStream {
  final StreamController<bool> _serverErrorStreamController =
  StreamController<bool>.broadcast();
  Stream<bool> get stream => _serverErrorStreamController.stream;
  StreamSink<bool> get sink => _serverErrorStreamController.sink;
}
