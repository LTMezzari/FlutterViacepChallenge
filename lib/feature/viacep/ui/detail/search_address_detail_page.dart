import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:challenge/di/get_it.dart';
import 'package:challenge/core/bo/address.dart';
import 'package:challenge/commons/route_arguments.dart';

class SearchDetailArguments {
  final Address address;

  SearchDetailArguments(this.address);
}

class SearchAddressDetailPage extends StatefulWidget {
  static String route = '/search_address_detail';

  _SearchAddressDetailPageState createState() => _SearchAddressDetailPageState();
}

class _SearchAddressDetailPageState extends State<SearchAddressDetailPage> {

  late SearchDetailArguments arguments = routeArguments(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Text("CEP: ${arguments.address.cep}"),
            Text("Street: ${arguments.address.street}"),
            Text("Neighborhood: ${arguments.address.neighborhood}"),
            Text("City: ${arguments.address.city}"),
            Text("State: ${arguments.address.state}"),
            Text("UF: ${arguments.address.uf}"),
          ],
        ),
      ),
    );
  }
}