import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/core/constant/shared_pref.dart';
import 'package:graduation_project/feature/routing/app_router.dart';
import 'package:graduation_project/my_app.dart';
import 'package:graduation_project/my_bloc_observel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/constant/app_strings.dart';
import 'core/constant/function/get_token.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: AppStrings.supaBaseUrl,
    anonKey: AppStrings.supaBaseAnonKey,
  );
  await SharedPreferenceUtils.init();
  sharedPreferences = await SharedPreferences.getInstance(); //save language
  SharedPreferences pref = await SharedPreferences.getInstance(); //save theme
  bool storedValue = pref.getBool('boolValue') ?? false;
  var tokenid = SharedPreferenceUtils.getData(key: 'token');
  bool isLoggedIn = false;
  if (tokenid != null) {
    isLoggedIn = true;
  }
  // final authRepo = AuthRepoImpl(ApiHelper());
  // bool isLoggedIn = await authRepo.isLoggedIn(); //save login state
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
