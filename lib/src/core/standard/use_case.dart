import 'package:multiple_result/multiple_result.dart';
 
abstract class UseCase<Type, Param> {
  Future<Result<Type, Failure>> call([Param param]);
  // i use [] to make param optional
}


abstract class UseCaseWithoutParam<Type> {
  Future<Result<Type, Failure>> call();
  // i use [] to make param optional
}
