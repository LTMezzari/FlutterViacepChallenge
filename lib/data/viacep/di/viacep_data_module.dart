import 'package:get_it/get_it.dart';

import 'package:challenge/di/get_it.dart';
import 'package:challenge/data/viacep/service/viacep_service.dart';
import 'package:challenge/data/viacep/service/viacep_service_impl.dart';
import 'package:challenge/data/viacep/repository/viacep_repository.dart';
import 'package:challenge/data/viacep/repository/viacep_repository_impl.dart';

class ViacepDataModuleDI {
  static Future<void> inject() async {
    getIt.registerSingleton<ViacepService>(ViacepServiceImpl(getIt.get()));
    getIt.registerSingleton<ViacepRepository>(ViacepRepositoryImpl(getIt.get()));
  }
}