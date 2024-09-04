class ClientResponse {
  final dynamic body;
  final String? message;
  final ResponseStatus status;

  ClientResponse.success(this.body, {this.message}) : status = ResponseStatus.success;

  ClientResponse.failure({this.body, this.message}) : status = ResponseStatus.failure;
}

enum ResponseStatus { success, failure }
