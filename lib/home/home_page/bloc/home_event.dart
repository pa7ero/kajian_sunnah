part of 'home_bloc.dart';

//====================================BloC Topik Event=========================

sealed class TopikEvent {}

class FetchTopik extends TopikEvent {}

//====================================BloC Ustadz Event=========================

sealed class UstadzEvent {}

class FetchUstadz extends UstadzEvent {}
