import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/core/constant/shared_pref.dart';
import 'package:graduation_project/core/helper/api_helper.dart';
import 'package:graduation_project/feature/Auth/data/repo/auth_repo_impl.dart';
import 'package:graduation_project/feature/routing/app_router.dart';
import 'package:graduation_project/my_app.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/constant/function/get_token.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance(); //save language
  SharedPreferences pref = await SharedPreferences.getInstance(); //save theme
  bool storedValue = pref.getBool('boolValue') ?? false;
  final authRepo = AuthRepoImpl(ApiHelper());
  bool isLoggedIn = await authRepo.isLoggedIn(); //save login state
  final appRouter = AppRouter(isLoggedIn: isLoggedIn);
  final token = await getToken();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(isDarkTheme: storedValue),
      child: MyApp(
        appRouter: appRouter,
        token: token ?? '',
      ),
    ),
  );
}
