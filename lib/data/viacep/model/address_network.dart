import 'package:challenge/core/bo/address.dart';

class AddressNetwork {
  final String cep;
  final String street;
  final String complement;
  final String unity;
  final String neighborhood;
  final String city;
  final String uf;
  final String estate;
  final String region;
  final String ibge;
  final String gia;
  final String ddd;
  final String siafi;

  AddressNetwork(
      this.cep,
      this.street,
      this.complement,
      this.unity,
      this.neighborhood,
      this.city,
      this.uf,
      this.estate,
      this.region,
      this.ibge,
      this.gia,
      this.ddd,
      this.siafi);

  static AddressNetwork fromJson(Map<String, dynamic> json) {
    return AddressNetwork(
      json["cep"],
      json["logradouro"],
      json["complemento"],
      json["unidade"],
      json["bairro"],
      json["localidade"],
      json["uf"],
      json["estado"],
      json["regiao"],
      json["ibge"],
      json["gia"],
      json["ddd"],
      json["siafi"]
    );
  }

  Address toModel() {
    return Address(
      cep,
      street,
      complement,
      unity,
      neighborhood,
      city,
      uf,
      estate,
      region,
      ibge,
      gia,
      ddd,
      siafi
    );
  }
}