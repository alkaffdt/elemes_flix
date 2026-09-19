import 'package:elemes_flix/core/local_storage/shared_pref_repo.dart';
import 'package:elemes_flix/src/features/home/presentation/home_page.dart';
import 'package:elemes_flix/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(MyApp(sharedPreference: sharedPreferences));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.sharedPreference});

  final SharedPreferences sharedPreference;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [sharedPreferenceProvider.overrideWithValue(sharedPreference)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Elemes Flix',
        theme: AppTheme.theme,
        home: const HomePage(),
      ),
    );
  }
}
