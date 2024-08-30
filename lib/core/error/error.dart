class ServerException implements Exception {
  final String message;
  final int statusCode;

  const ServerException({required this.statusCode, required this.message});

  @override
  String toString() {
    return 'ServerException(statusCode $statusCode   errorMessage: $message)';
  }
}

class NoInternetException implements Exception {
  const NoInternetException();
}

class CacheException implements Exception {
  final String message;

  const CacheException({required this.message});
}
