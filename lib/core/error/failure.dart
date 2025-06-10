import 'package:equatable/equatable.dart';

/// Base class for all failures in the application.
abstract class Failure extends Equatable {
  final String message;

  const Failure([this.message = 'An unexpected error occurred.']);

  @override
  List<Object?> get props => [message];
}

/// Represents a failure when interacting with a remote server.
class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Server error. Please try again later.']);
}

/// Represents a failure when interacting with a local cache.
class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Failed to retrieve data from cache.']);
}

/// Represents a failure due to network connectivity issues.
class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No internet connection. Please check your network settings.']);
}

/// Represents a failure due to invalid input data.
class InvalidInputFailure extends Failure {
  const InvalidInputFailure([super.message = 'Invalid input. Please check your provided data.']);
}

/// Represents any other unexpected failure.
class UnexpectedFailure extends Failure {
  const UnexpectedFailure([super.message = 'An unexpected error occurred.']);
}