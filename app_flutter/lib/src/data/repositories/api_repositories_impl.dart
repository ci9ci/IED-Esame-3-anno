import 'package:appterzoanno/src/data/datasources/api_service.dart';
import 'package:appterzoanno/src/data/models/result.dart';
import 'package:appterzoanno/src/domain/repositories/api_repository.dart';
import 'package:either_dart/src/either.dart';

class ApiRepositoryImpl extends ApiRepository {
  @override
  Future<Either<Exception, Result>> get(String prompt) async {
    try {
      final story = await ApiService()
          .getText('Generate a long story following the prompt: $prompt');
      final image = await ApiService()
          .getImage('Generate an image based on this prompt: $prompt');
      return Right(Result(story: story, imageURL: image));
    } catch (e) {
      return Left(e as Exception);
    }
  }
}
