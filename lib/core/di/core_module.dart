import 'package:get_it/get_it.dart';

import 'package:challenge/di/get_it.dart';
import 'package:challenge/core/network/client/network_client.dart';
import 'package:challenge/core/network/client/network_client_impl.dart';

class CoreModuleDI {
  static Future<void> inject() async {
    getIt.registerSingleton<NetworkClient>(NetworkClientImpl());
  }
}