import '../../../core/bo/address.dart';

abstract class ViacepRepository {
  Future<Address> getAddress(String cep);
}