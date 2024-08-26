part of 'data_source.dart';

class SurveyDataSourceImpl implements SurveyDataSource {
  final Dio dio = serviceLocator<DioSettings>().dio();

  @override
  Future<SurveyInfoModel> getSurveyList() async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.survey,
        options: Options(headers: {
          'Authorization':
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI2NjY0ODAwLCJpYXQiOjE3MjQwNzI4MDAsImp0aSI6IjM4MWRhNWM5M2FkMTQ2ZjA4MGIyNGU1NzllZGUxYTk4IiwidXNlcl9pZCI6IjA5MmI2ZmE0LTlmMTMtNGMxMC05NjM3LTlhZTQxYzkwZmRhYyIsImRldmljZV9pZCI6IkY4MEVEN0YwLUZFMkEtNDNFNC1CRTU1LUQ0OEZGQUQzQTJDMiJ9.ZaNNyQlgXTjqJ5czKefgd8QHbzNyTUZAVeORz7lOWrs"
        }),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return SurveyInfoModel.fromJson(response.data);
      } else {
        throw ServerException.fromJson(response.data);
      }
    } on DioException catch (e) {
      throw ServerException.fromJson(e.response?.data);
    } on FormatException {
      throw const ServerException(message: 'ERROR');
    }
  }

  @override
  Future<void> postRejectSurvey({required String id}) async {
    try {
      final Response response = await dio.post(
        "${Constants.baseUrl + Urls.reject + id}/",
        options: Options(headers: {
          'Authorization':
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI2NjY0ODAwLCJpYXQiOjE3MjQwNzI4MDAsImp0aSI6IjM4MWRhNWM5M2FkMTQ2ZjA4MGIyNGU1NzllZGUxYTk4IiwidXNlcl9pZCI6IjA5MmI2ZmE0LTlmMTMtNGMxMC05NjM3LTlhZTQxYzkwZmRhYyIsImRldmljZV9pZCI6IkY4MEVEN0YwLUZFMkEtNDNFNC1CRTU1LUQ0OEZGQUQzQTJDMiJ9.ZaNNyQlgXTjqJ5czKefgd8QHbzNyTUZAVeORz7lOWrs"
        }),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return;
      } else {
        throw ServerException.fromJson(response.data);
      }
    } on DioException catch (e) {
      throw ServerException.fromJson(e.response?.data);
    } on FormatException {
      throw const ServerException(message: 'ERROR');
    }
  }

  @override
  Future<void> postSurveyAnswer(
      {required String surId,
      required String queId,
      required Map<String, dynamic> optionsData}) async {
    try {
      final Response response = await dio.post(
        "${Constants.baseUrl + Urls.answer}$surId/$queId/",
        data: optionsData,
        options: Options(headers: {
          'Authorization':
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI2NjY0ODAwLCJpYXQiOjE3MjQwNzI4MDAsImp0aSI6IjM4MWRhNWM5M2FkMTQ2ZjA4MGIyNGU1NzllZGUxYTk4IiwidXNlcl9pZCI6IjA5MmI2ZmE0LTlmMTMtNGMxMC05NjM3LTlhZTQxYzkwZmRhYyIsImRldmljZV9pZCI6IkY4MEVEN0YwLUZFMkEtNDNFNC1CRTU1LUQ0OEZGQUQzQTJDMiJ9.ZaNNyQlgXTjqJ5czKefgd8QHbzNyTUZAVeORz7lOWrs"
        }),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return;
      } else {
        throw ServerException.fromJson(response.data);
      }
    } on DioException catch (e) {
      throw ServerException.fromJson(e.response?.data);
    } on FormatException {
      throw const ServerException(message: 'ERROR');
    }
  }


  @override
  Future<void> postSurveyFinish({
        required String surId,
        required String queId,
        required Map<String, dynamic> optionsData}) async {
    try {
      final Response response = await dio.post(
        "${Constants.baseUrl + Urls.finish}$surId/$queId/",
        data: optionsData,
        options: Options(headers: {
          'Authorization':
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI2NjY0ODAwLCJpYXQiOjE3MjQwNzI4MDAsImp0aSI6IjM4MWRhNWM5M2FkMTQ2ZjA4MGIyNGU1NzllZGUxYTk4IiwidXNlcl9pZCI6IjA5MmI2ZmE0LTlmMTMtNGMxMC05NjM3LTlhZTQxYzkwZmRhYyIsImRldmljZV9pZCI6IkY4MEVEN0YwLUZFMkEtNDNFNC1CRTU1LUQ0OEZGQUQzQTJDMiJ9.ZaNNyQlgXTjqJ5czKefgd8QHbzNyTUZAVeORz7lOWrs"
        }),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return;
      } else {
        throw ServerException.fromJson(response.data);
      }
    } on DioException catch (e) {
      throw ServerException.fromJson(e.response?.data);
    } on FormatException {
      throw const ServerException(message: 'ERROR');
    }
  }


}
