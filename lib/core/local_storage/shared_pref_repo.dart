import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesRepositoryProvider =
    Provider<SharedPreferencesRepository>(
      (ref) => SharedPreferencesRepository(ref.watch(sharedPreferenceProvider)),
    );

final sharedPreferenceProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

class SharedPreferencesRepository {
  SharedPreferencesRepository(this.sharedPreferences);
  final SharedPreferences sharedPreferences;

  void setString(String key, String value) {
    sharedPreferences.setString(key, value);
  }

  void setInt(String key, int value) {
    sharedPreferences.setInt(key, value);
  }

  void setDouble(String key, double value) {
    sharedPreferences.setDouble(key, value);
  }

  void setBool(String key, bool value) {
    sharedPreferences.setBool(key, value);
  }

  void setStringList(String key, List<String> values) {
    sharedPreferences.setStringList(key, values);
  }

  void setDate(String key, DateTime value) {
    int date = value.microsecondsSinceEpoch;
    sharedPreferences.setInt(key, date);
  }

  String? getString(String key) {
    return sharedPreferences.getString(key);
  }

  List<String> getStringList(String key) {
    return sharedPreferences.getStringList(key) ?? [];
  }

  bool getBool(String key, {bool defaultValue = false}) {
    return sharedPreferences.getBool(key) ?? defaultValue;
  }

  double getDouble(String key) {
    return sharedPreferences.getDouble(key) ?? 0;
  }

  int getInt(String key) {
    return sharedPreferences.getInt(key) ?? 0;
  }

  DateTime getDate(String key) {
    final milliseconds = sharedPreferences.getInt(key) ?? 0;
    return DateTime.fromMicrosecondsSinceEpoch(milliseconds);
  }

  bool containsKey(String key) {
    return sharedPreferences.containsKey(key);
  }
}
