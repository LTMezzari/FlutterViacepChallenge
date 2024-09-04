import 'package:challenge/core/di/core_module.dart';
import 'package:challenge/data/viacep/di/viacep_data_module.dart';

class AppModuleDI {
  static Future<void> inject() async {
    //Core
    await CoreModuleDI.inject();
    //Data
    await ViacepDataModuleDI.inject();
    //Feature
  }
}