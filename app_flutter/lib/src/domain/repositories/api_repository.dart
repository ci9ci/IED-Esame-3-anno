import 'package:appterzoanno/src/data/models/result.dart';
import 'package:either_dart/either.dart';

abstract class ApiRepository {
  Future<Either<Exception, Result>> get(String text);
}
