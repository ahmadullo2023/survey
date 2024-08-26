import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/singletons/service_locator.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/finish_repository.dart';

class FinishSurveyUseCase implements UseCase<void, FinishSurveyParams> {
  final FinishRepository finishSurvey = serviceLocator<FinishRepositoryImpl>();

  @override
  Future<Either<Failure, void>> call(FinishSurveyParams params) async {
    return await finishSurvey.postSurveyFinish(
        surId: params.surId, queId: params.queId, optionsData: params.optionsData);
  }
}

class FinishSurveyParams {
  final String surId;
  final String queId;
  final Map<String, dynamic> optionsData;

  FinishSurveyParams(
      {required this.surId, required this.queId, required this.optionsData});
}
