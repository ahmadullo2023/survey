part of '../../domain/repository/finish_repository.dart';

class FinishRepositoryImpl implements FinishRepository {
  final SurveyDataSource finishDataSource =
      serviceLocator<SurveyDataSourceImpl>();

  @override
  Future<Either<Failure, void>> postSurveyFinish(
      {required String surId,
      required String queId,
      required Map<String, dynamic> optionsData}) async {
    try {
      final response = await finishDataSource.postSurveyAnswer(
          surId: surId, queId: queId, optionsData: optionsData);
      return Right(response);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
