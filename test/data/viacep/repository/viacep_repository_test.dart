import 'package:flutter_test/flutter_test.dart';

import 'package:challenge/core/bo/address.dart';
import 'package:challenge/data/viacep/model/address_network.dart';
import 'package:challenge/data/viacep/repository/viacep_repository_impl.dart';
import 'package:challenge/data/viacep/service/viacep_service.dart';
import 'package:challenge/di/get_it.dart';

class TestViacepService extends ViacepService {

  final AddressNetwork Function(String) onGetAddressCalled;

  TestViacepService(this.onGetAddressCalled);

  Future<AddressNetwork> getAddress(String cep) async {
    return onGetAddressCalled(cep);
  }
}

void main() {
  group('Viacep repository tests group', () {
    late ViacepRepositoryImpl sub;

    late AddressNetwork Function(String) onGetAddressCalled;

    setUp(() {
      sub = ViacepRepositoryImpl(
          TestViacepService((cep) {
            return onGetAddressCalled(cep);
          })
      );
    });

    test('Given a valid cep should return a list of Address', () async {
      final cep = "39400349";
      final AddressNetwork fetchedAddress = AddressNetwork(
        cep,
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
      );
      onGetAddressCalled = (s) {
        expect(s, cep);
        return fetchedAddress;
      };
      final result = await sub.getAddress(cep);
      expect(result is Address, true);
      expect(result.cep, fetchedAddress.cep);
    });
  });
}
