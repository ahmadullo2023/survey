part of '../../domain/repository/answer_repository.dart';


class AnswerRepositoryImpl implements AnswerRepository {
  final SurveyDataSource answerDataSource = serviceLocator<SurveyDataSourceImpl>();


  @override
  Future<Either<Failure, void>> postSurveyAnswer({required String surId, required String queId}) async {
    try {
      final response = await answerDataSource.postSurveyAnswer(surId: surId, queId: queId);
      return Right(response);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

}
