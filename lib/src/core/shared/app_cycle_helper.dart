enum AppCycle {
  production('https//production'),
  development('https//development'),;

  final String baseUrl;

  const AppCycle(this.baseUrl);
}

class AppCycleHelper {
  late final AppCycle _appCycle;

  AppCycleHelper._();

  static final AppCycleHelper _instance = AppCycleHelper._();

  factory AppCycleHelper() => _instance;

  AppCycle get appCycle => _appCycle;

  void setAppCycle(AppCycle appCycle) {
    _appCycle = appCycle;
  }
}
