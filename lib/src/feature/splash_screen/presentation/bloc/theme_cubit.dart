import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit(this._preferences) : super(false);

  final SharedPreferences _preferences;

  void initTheme() {
    emit(_preferences.getBool('isDark') ?? true);
  }

  Future<void> changeTheme() async {
    emit(!state);

    await _preferences.setBool('isDark', !state);
  }

  ThemeMode get theme => state ? ThemeMode.dark : ThemeMode.light;
}
