import 'package:flutter_test/flutter_test.dart';

import 'package:challenge/core/bo/address.dart';
import 'package:challenge/core/network/client/network_client.dart';
import 'package:challenge/core/network/client/response.dart';
import 'package:challenge/data/viacep/model/address_network.dart';
import 'package:challenge/data/viacep/service/viacep_service_impl.dart';
import 'package:challenge/di/get_it.dart';

class TestNetworkClient extends NetworkClient {

  final ClientResponse Function(String) onGetCalled;

  TestNetworkClient(this.onGetCalled);

  Future<ClientResponse> get(String path) async {
    return onGetCalled(path);
  }
}

void main() {
  group('Viacep service tests group', () {
    late ViacepServiceImpl sub;

    late ClientResponse Function(String) onGetCalled;

    setUp(() {
      sub = ViacepServiceImpl(
          TestNetworkClient((path) {
            return onGetCalled(path);
          })
      );
    });

    test('Given a valid cep should return successful network address', () async {
      final cep = "39400349";
      final Map<String, dynamic> json = {
        "cep": cep,
        "logradouro": "",
        "complemento": "",
        "unidade": "",
        "bairro": "",
        "localidade": "",
        "uf": "",
        "estado": "",
        "regiao": "",
        "ibge": "",
        "gia": "",
        "ddd": "",
        "siafi": ""
      };

      onGetCalled = (path) {
        expect(path, "$cep/json");
        return ClientResponse.success(json, message: "Test");
      };
      final result = await sub.getAddress(cep);
      expect(result is AddressNetwork, true);
      expect(result.cep, cep);
    });

    test('Given a cep should return failure', () async {
      final cep = "39400349";
      final Map<String, dynamic> json = {
        "cep": cep,
        "logradouro": "",
        "complemento": "",
        "unidade": "",
        "bairro": "",
        "localidade": "",
        "uf": "",
        "estado": "",
        "regiao": "",
        "ibge": "",
        "gia": "",
        "ddd": "",
        "siafi": ""
      };

      onGetCalled = (path) {
        expect(path, "$cep/json");
        return ClientResponse.failure(message: "Error");
      };
      final result = await sub.getAddress(cep);
      expect(result is AddressNetwork, true);
      expect(result.cep, cep);
    });
  });
}
