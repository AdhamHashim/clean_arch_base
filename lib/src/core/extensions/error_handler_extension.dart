import 'package:multiple_result/multiple_result.dart';
import '../error/exceptions.dart';
import '../error/failure.dart';

extension ErrorHandler<T extends Object> on Future<T> {
  Future<Result<T, Failure>> handleCallbackWithFailure() async {
    try {
      final result = await this;
      return Success(result);
    } on ServerException catch (e) {
      return Error(Failure(e.message));
    }
  }
}
