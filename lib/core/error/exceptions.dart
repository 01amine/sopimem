abstract class AppException implements Exception {
  final String message;
  const AppException([
    this.message = '',
  ]);

  @override
  String toString() => 'AppException(message: $message)';

  @override
  bool operator ==(covariant AppException other) {
    if (identical(this, other)) return true;
  
    return 
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

/// Thrown when a server request fails (e.g., 404, 500).
class ServerException extends AppException {
  const ServerException([super.message = 'Failed to connect to the server.']);
}

/// Thrown when no data is found in a local cache.
class CacheException extends AppException {
  const CacheException([super.message = 'No data found in cache.']);
}

/// Thrown when there's an issue with network connectivity.
class NetworkException extends AppException {
  const NetworkException([super.message = 'No internet connection.']);
}

/// Thrown when invalid input is provided.
class InvalidInputException extends AppException {
  const InvalidInputException([super.message = 'Invalid input provided.']);
}

/// Thrown for any other unexpected errors.
class UnexpectedException extends AppException {
  const UnexpectedException([super.message = 'An unexpected error occurred.']);
}