import 'package:flutter_base/src/core/network/dio_service.dart';
import 'package:flutter_base/src/core/network/network_service.dart';
import 'package:flutter_base/src/core/res/constans_manager.dart';

import '../../../features/home /data/imports/data_imports.dart';

void setUpServiceLocators() {
  homeSetUpServiceLocator();
  setUpGeneralDependencies();
}

void setUpGeneralDependencies() {
  ConstantManager.GET_IT_LOCATOR.registerLazySingleton<NetworkService>(
    () => DioService(),
  );
}
