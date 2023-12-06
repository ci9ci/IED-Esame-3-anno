import 'package:either_dart/either.dart';
import 'package:test_endpoint/src/domain/repositories/api_repository.dart';
import 'package:test_endpoint/src/domain/usecases/base_usecase.dart';

class AskAiUseCase implements UseCase<Exception, String, AskAiUseCaseParams> {
  const AskAiUseCase(this._apiRepository);

  final ApiRepository _apiRepository;

  @override
  Future<Either<Exception, String>> call(AskAiUseCaseParams params) =>
      _apiRepository.get(params.text);
}

class AskAiUseCaseParams implements Params {
  const AskAiUseCaseParams(this.text);
  final String text;
}
