import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:challenge/di/get_it.dart';
import 'package:challenge/core/bo/address.dart';
import 'package:challenge/data/viacep/repository/viacep_repository.dart';
import 'package:challenge/feature/viacep/ui/detail/search_address_detail_page.dart';

class SearchAddressPage extends StatefulWidget {
  static String route = '/search_address';

  @override
  _SearchAddressPageState createState() => _SearchAddressPageState();
}

class _SearchAddressPageState extends State<SearchAddressPage> {
  var cepController = new TextEditingController();
  var isLoading = false;
  String? error = null;
  List<Address> addresses = [];

  int get addressesCount => addresses.length;

  late ViacepRepository repository = getIt.get<ViacepRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(children: [
          TextField(controller: cepController),
          MaterialButton(
            onPressed: () {
              searchAddress();
            },
            child: Text("Search"),
          ),
          if (isLoading) CupertinoActivityIndicator(),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: addressesCount,
                itemBuilder: (context, index) {
                  var address = addresses[index];
                  return GestureDetector(
                    onTap: () async {
                      await Navigator.pushNamed(
                        arguments: SearchDetailArguments(address),
                        context,
                        SearchAddressDetailPage.route,
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Wrap(
                        direction: Axis.vertical,
                        children: [
                          Text(address.street),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ]),
      ),
    );
  }

  Future<void> searchAddress() async {
    final cep = cepController.text;
    if (cep.isEmpty) {
      return;
    }
    setState(() {
      isLoading = true;
    });
    try {
      var address = await repository.getAddress(cep);
      setState(() {
        addresses.add(address);
        error = null;
        cepController.text = "";
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        cepController.text = "";
        isLoading = false;
      });
    }
  }
}
