import 'package:challenge/core/network/client/response.dart';

abstract class NetworkClient {
  Future<ClientResponse> get(String path);
}