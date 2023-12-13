import 'package:appterzoanno/src/data/datasources/api_service.dart';
import 'package:appterzoanno/src/domain/repositories/api_repository.dart';
import 'package:either_dart/src/either.dart';

class ApiRepositoryImpl extends ApiRepository {
  @override
  Future<Either<Exception, String>> get(String prompt) async {
    // TODO: implement get
    try {
      //final generatedText = await ApiService().getText(prompt);
      final res = await ApiService().getImage(prompt);
      return Right(res);
    } catch (e) {
      return Left(e as Exception);
    }
  }
}
