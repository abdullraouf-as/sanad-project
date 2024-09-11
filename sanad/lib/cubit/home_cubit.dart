import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sanad/models.dart';
import 'package:sanad/services/apiService.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.apiService) : super(HomeInitial()) {
    loadData();
  }

  final ApiService apiService;
  Future<void> loadData() async {
    final response = await apiService.loadData();
    if (response.statusCode == 200) {
      emit(HomeLoaded(
          data: jsonDecode(response.body))); //TODO convert the data to activity
    } else {
      emit(HomeError()); //TODO add error code to state
    }
  }
}
