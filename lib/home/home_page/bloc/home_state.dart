part of 'home_bloc.dart';

//====================================BloC Topik State=========================

sealed class TopikState {}

final class TopikInitial extends TopikState {}

final class TopikLoading extends TopikState {}

final class TopikLoaded extends TopikState {
  final List<Topik> topik;
  TopikLoaded(this.topik);
}

final class TopikError extends TopikState {
  TopikError(String s);

  get message => null;
}

//====================================BloC Ustadz State=========================

sealed class UstadzState {}

final class UstadzInitial extends UstadzState {}

final class UstadzLoading extends UstadzState {}

final class UstadzLoaded extends UstadzState {
  final List<Ustadz> ustadz;
  UstadzLoaded(this.ustadz);
}

final class UstadzError extends UstadzState {
  UstadzError(String s);

  get message => null;
}
