import 'package:challenge/data/viacep/repository/viacep_repository.dart';
import 'package:challenge/data/viacep/service/viacep_service.dart';

import 'package:challenge/core/bo/address.dart';

class ViacepRepositoryImpl extends ViacepRepository {
  final ViacepService service;

  ViacepRepositoryImpl(this.service);

  @override
  Future<Address> getAddress(String cep) async {
    final address = await service.getAddress(cep);
    return address.toModel();
  }
}