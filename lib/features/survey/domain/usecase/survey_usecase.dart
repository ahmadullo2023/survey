import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/singletons/service_locator.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/survey_entities.dart';
import '../repository/survey_repository.dart';


class GetSurveyListUseCase implements UseCase<GetSurveyEntity,  NoParams> {
  final SurveyRepository surveyRepository = serviceLocator<SurveyRepositoryImpl>();


  @override
  Future<Either<Failure, GetSurveyEntity>> call(
      NoParams params,
      ) async {
    return await surveyRepository.getSurvey();
  }
}
