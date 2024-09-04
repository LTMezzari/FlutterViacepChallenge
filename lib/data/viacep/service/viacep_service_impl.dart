import 'package:challenge/core/network/client/network_client.dart';
import 'package:challenge/data/viacep/model/address_network.dart';
import 'package:challenge/data/viacep/service/viacep_service.dart';

class ViacepServiceImpl extends ViacepService {
  final NetworkClient client;

  ViacepServiceImpl(this.client);

  @override
  Future<AddressNetwork> getAddress(String cep) async {
    final path = "$cep/json";
    final response = await client.get(path);
    return AddressNetwork.fromJson(response.body);
  }
}