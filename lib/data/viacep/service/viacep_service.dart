import '../model/address_network.dart';

abstract class ViacepService {
  Future<AddressNetwork> getAddress(String cep);
}