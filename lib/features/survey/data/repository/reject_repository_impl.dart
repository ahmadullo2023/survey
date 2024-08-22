part of '../../domain/repository/reject_repository.dart';


class RejectRepositoryImpl implements RejectRepository {
  final SurveyDataSource rejectDataSource = serviceLocator<SurveyDataSourceImpl>();


  @override
  Future<Either<Failure, void>> postRejectSurvey({required String id}) async {
    try {
      final response = await rejectDataSource.postRejectSurvey(id: id);
      return Right(response);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
