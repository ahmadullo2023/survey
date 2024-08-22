import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/singletons/service_locator.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/answer_repository.dart';

class AnswerSurveyUseCase implements UseCase<void, AnswerSurveyParams> {
  final AnswerRepository answerSurvey = serviceLocator<AnswerRepositoryImpl>();

  @override
  Future<Either<Failure, void>> call(AnswerSurveyParams params) async {
    return await answerSurvey.postSurveyAnswer(
        surId: params.surId, queId: params.queId);
  }
}

class AnswerSurveyParams {
  final String surId;
  final String queId;

  AnswerSurveyParams({required this.surId, required this.queId});
}