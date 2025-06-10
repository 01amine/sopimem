part of 'splash_bloc.dart';

@immutable
sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object?> get props => [];
}

final class SplashInitial extends SplashState {
  const SplashInitial();
}

final class SplashLoading extends SplashState {
  const SplashLoading();
}

final class SplashLoaded extends SplashState {
  const SplashLoaded();
}

final class SplashError extends SplashState {
  final String message;

  const SplashError({required this.message});

  @override
  List<Object?> get props => [message];
}