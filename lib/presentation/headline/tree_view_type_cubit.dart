import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madagascar_workcoode/core/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TreeViewTypeCubit extends Cubit<bool> {
  
  TreeViewTypeCubit(super.initialState);
  
  void toggle() {
    final sharedPreferences = locator.get<SharedPreferences>();
    final newViewType = !(sharedPreferences.getBool("viewType") ?? true);
    sharedPreferences.setBool("viewType", newViewType);
    emit(newViewType);
  }
  
}