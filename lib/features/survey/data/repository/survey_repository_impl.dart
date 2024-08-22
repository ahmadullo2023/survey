part of '../../domain/repository/survey_repository.dart';

class SurveyRepositoryImpl implements SurveyRepository {

  final SurveyDataSource surveyDataSource = serviceLocator<SurveyDataSourceImpl>();

  @override
  Future<Either<Failure, GetSurveyEntity>> getSurvey() async {
    try {
      final response = await surveyDataSource.getSurveyList();
      return Right(response);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}



