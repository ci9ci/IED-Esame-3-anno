import 'package:either_dart/either.dart';

abstract class ApiRepository {
  Future<Either<Exception, String>> get(String text);
}
