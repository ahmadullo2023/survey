part of 'data_source.dart';

class SurveyDataSourceImpl implements SurveyDataSource {
  final Dio dio;

  SurveyDataSourceImpl(this.dio);

  @override
  Future<SurveyInfoModel> getSurveyList() async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.survey,
        options: Options(headers: {
          'Authorization':
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI3MzI5NDc4LCJpYXQiOjE3MjQ3Mzc0NzgsImp0aSI6IjgwYmY1ZGZlMjE3NjQxOGRiMTY4ZjYwNzEyZDIxNWM4IiwidXNlcl9pZCI6IjA5MmI2ZmE0LTlmMTMtNGMxMC05NjM3LTlhZTQxYzkwZmRhYyIsImRldmljZV9pZCI6IkY4MEVEN0YwLUZFMkEtNDNFNC1CRTU1LUQ0OEZGQUQzQTJDMiJ9.cpRnAgIDaWZ0H5R8bmaSCMp04oDwL6eUf0B6B67RARQ"
        }),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return SurveyInfoModel.fromJson(response.data);
      } else {
        throw ServerException(
          message: response.data.toString(),
          statusCode: response.statusCode ?? 500,
        );
      }
    } on DioException {
      rethrow;
    } on FormatException {
      rethrow;
    }
  }


  @override
  Future<void> postRejectSurvey({required String id}) async {
    try {
      final Response response = await dio.post(
        "${Constants.baseUrl + Urls.reject + id}/",
        options: Options(headers: {
          'Authorization':
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI3MzI5NDc4LCJpYXQiOjE3MjQ3Mzc0NzgsImp0aSI6IjgwYmY1ZGZlMjE3NjQxOGRiMTY4ZjYwNzEyZDIxNWM4IiwidXNlcl9pZCI6IjA5MmI2ZmE0LTlmMTMtNGMxMC05NjM3LTlhZTQxYzkwZmRhYyIsImRldmljZV9pZCI6IkY4MEVEN0YwLUZFMkEtNDNFNC1CRTU1LUQ0OEZGQUQzQTJDMiJ9.cpRnAgIDaWZ0H5R8bmaSCMp04oDwL6eUf0B6B67RARQ"
        }),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return;
      } else {
        throw ServerException(
          message: response.data,
          statusCode: response.statusCode ?? 500,
        );
      }
    } on DioException {
      rethrow;
    } on FormatException {
      rethrow;
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
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI3MzI5NDc4LCJpYXQiOjE3MjQ3Mzc0NzgsImp0aSI6IjgwYmY1ZGZlMjE3NjQxOGRiMTY4ZjYwNzEyZDIxNWM4IiwidXNlcl9pZCI6IjA5MmI2ZmE0LTlmMTMtNGMxMC05NjM3LTlhZTQxYzkwZmRhYyIsImRldmljZV9pZCI6IkY4MEVEN0YwLUZFMkEtNDNFNC1CRTU1LUQ0OEZGQUQzQTJDMiJ9.cpRnAgIDaWZ0H5R8bmaSCMp04oDwL6eUf0B6B67RARQ"

        }),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return;
      } else {
        throw ServerException(
          message: response.data,
          statusCode: response.statusCode ?? 500,
        );
      }
    } on DioException {
      rethrow;
    } on FormatException {
      rethrow;
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
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI3MzI5NDc4LCJpYXQiOjE3MjQ3Mzc0NzgsImp0aSI6IjgwYmY1ZGZlMjE3NjQxOGRiMTY4ZjYwNzEyZDIxNWM4IiwidXNlcl9pZCI6IjA5MmI2ZmE0LTlmMTMtNGMxMC05NjM3LTlhZTQxYzkwZmRhYyIsImRldmljZV9pZCI6IkY4MEVEN0YwLUZFMkEtNDNFNC1CRTU1LUQ0OEZGQUQzQTJDMiJ9.cpRnAgIDaWZ0H5R8bmaSCMp04oDwL6eUf0B6B67RARQ"
        }),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return;
      } else {
        throw ServerException(
          message: response.data,
          statusCode: response.statusCode ?? 500,
        );
      }
    } on DioException {
      rethrow;
    } on FormatException {
      rethrow;
    }
  }
}
