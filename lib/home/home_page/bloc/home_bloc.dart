// import 'package:flutter/foundation.dart';
import 'package:kajian_sunnah/model/topik_model.dart';
import 'package:kajian_sunnah/model/ustadz_model.dart';
import 'package:kajian_sunnah/model/category_model.dart';
import 'package:kajian_sunnah/service/category_service.dart';
import 'package:kajian_sunnah/service/ustadz_service.dart';
import 'package:kajian_sunnah/service/topik_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

//====================================BloC Topik Bloc==========================

class TopikBloc extends Bloc<TopikEvent, TopikState> {
  final TopikService topikService;

  TopikBloc(this.topikService) : super(TopikInitial()) {
    on<FetchTopik>(_onFetchTopik);
  }

  Future<void> _onFetchTopik(FetchTopik event, Emitter<TopikState> emit) async {
    emit(TopikLoading());
    try {
      final result = await topikService.get();
      if (result.isNotEmpty) {
        emit(TopikLoaded(result));
      } else {
        emit(TopikError('Tidak ada data yang ditemukan.'));
      }
    } catch (e) {
      emit(TopikError('Terjadi kesalahan saat memuat data: ${e.toString()}'));
    }
  }
}

//====================================BloC Ustadz Bloc=========================

class UstadzBloc extends Bloc<UstadzEvent, UstadzState> {
  final UstadzService ustadzService;

  UstadzBloc(this.ustadzService) : super(UstadzInitial()) {
    on<FetchUstadz>(_onFetchUstadz);
  }

  Future<void> _onFetchUstadz(
      FetchUstadz event, Emitter<UstadzState> emit) async {
    emit(UstadzLoading());
    try {
      final result = await ustadzService.get();
      if (result.isNotEmpty) {
        emit(UstadzLoaded(result));
      } else {
        emit(UstadzError('Tidak ada data yang ditemukan.'));
      }
    } catch (e) {
      emit(UstadzError('Terjadi kesalahan saat memuat data: ${e.toString()}'));
    }
  }
}

//====================================BloC Category Bloc=======================

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryService categoryService;

  CategoryBloc(this.categoryService) : super(CategoryInitial()) {
    on<FetchCategory>(_onFetchCategory);
  }

  Future<void> _onFetchCategory(
      FetchCategory event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    try {
      final result = await categoryService.get();
      if (result.isNotEmpty) {
        emit(CategoryLoaded(result));
      } else {
        emit(CategoryError('Tidak ada data yang ditemukan.'));
      }
    } catch (e) {
      emit(
          CategoryError('Terjadi kesalahan saat memuat data: ${e.toString()}'));
    }
  }
}
