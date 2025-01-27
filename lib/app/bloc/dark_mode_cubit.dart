import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madagascar_workcoode/core/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkModeCubit extends Cubit<bool>{
  DarkModeCubit(super.initialState);

  void update() {
    final sharedPreferences = locator.get<SharedPreferences>();
    final newMode = !(sharedPreferences.getBool("darkMode") ?? false);
    sharedPreferences.setBool("darkMode", newMode);
    emit(newMode);
  }
}