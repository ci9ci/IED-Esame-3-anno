import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_endpoint/src/data/repositories/api_repositories_impl.dart';
import 'package:test_endpoint/src/domain/usecases/ask_ai_usecase.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  void sendQuestion(String text) {
    AskAiUseCase(ApiRepositoryImpl())(AskAiUseCaseParams(text)).then((res) =>
        res.fold((left) => emit(HomeError(left)),
            (right) => emit(HomeLoaded(right))));
  }
}

abstract class HomeState extends Equatable {}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeError extends HomeState {
  HomeError(this.error);
  Exception error;
  @override
  List<Object?> get props => [];
}

class HomeLoaded extends HomeState {
  HomeLoaded(this.answer);
  String answer;
  @override
  List<Object?> get props => [];
}
