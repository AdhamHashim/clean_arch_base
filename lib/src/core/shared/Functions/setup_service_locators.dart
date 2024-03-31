import 'package:flutter_base/src/core/helpers/notification_service.dart';
import 'package:flutter_base/src/core/network/dio_service.dart';
import 'package:flutter_base/src/core/network/network_service.dart';

import '../../../config/res/constans_manager.dart';
import '../../../features/home /data/imports/data_imports.dart';

void setUpServiceLocator() {
  setUpHomeDependencies();
  setUpGeneralDependencies();
}

void setUpGeneralDependencies() {
  ConstantManager.serviceLocator.registerLazySingleton<NetworkService>(
    () => DioService(),
  );

  ConstantManager.serviceLocator.registerLazySingleton<NotificationService>(
    () => NotificationService(),
  );
}
