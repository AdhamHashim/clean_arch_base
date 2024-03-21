class StatusCode {
  static const int internalServerError = 500;
  static const int badRequest = 400;
  static const int notFound = 404;
  static const int unauthorized = 401;
  static const int conflict = 409;
}

class ApiMethodType {
  static const String get = "GET";
  static const String post = "POST";
  static const String put = "PUT";
  static const String patch = "PATCH";
  static const String delete = "DELETE";
}
