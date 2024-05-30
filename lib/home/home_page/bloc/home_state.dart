part of 'home_bloc.dart';

sealed class TopikState {}

final class TopikInitial extends TopikState {}

final class TopikLoading extends TopikState {}

final class TopikLoaded extends TopikState {
  List<Topik> topik;

  TopikLoaded(
    this.topik,
  );
}

final class TopikError extends TopikState {
  final String message;

  TopikError(
    this.message,
  );
}
