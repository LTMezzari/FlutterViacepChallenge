import 'dart:convert';

import 'package:challenge/core/network/client/network_client.dart';
import 'package:challenge/core/network/client/response.dart';
import 'package:http/http.dart' as http;

class NetworkClientImpl extends NetworkClient {

  final _client = http.Client();
  final _baseUrl = "https://viacep.com.br/ws/";

  @override
  Future<ClientResponse> get(String path) async {
    final uri = Uri.parse(_baseUrl + path);
    final response = await _client.get(uri);
    final message = response.reasonPhrase;
    print("GET => $uri");
    print("Result Status => ${response.statusCode}");
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      final rawData = jsonDecode(response.body);
      print("Result GET => $uri");
      print("Result Body:");
      print(response.body);
      return ClientResponse.success(rawData, message: message);
    }
    return ClientResponse.failure(message: message);
  }
}