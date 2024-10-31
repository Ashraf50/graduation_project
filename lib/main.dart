import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/core/constant/shared_pref.dart';
import 'package:graduation_project/feature/home/presentation/view_model/bloc/language_bloc.dart';
import 'package:graduation_project/feature/splash_screen/presentation/view/onboard_screen_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool storedValue = pref.getBool('boolValue') ?? false;
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(isDarkTheme: storedValue),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LanguageBloc()..add(InitialLanguageEvent()),
        ),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeProvider.getThemeData,
            locale: state is AppChangeLanguage ? Locale(state.langCode) : null,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            localeListResolutionCallback: (deviceLocales, supportedLocales) {
              if (deviceLocales != null) {
                for (var deviceLocale in deviceLocales) {
                  for (var supportedLocale in supportedLocales) {
                    if (deviceLocale.languageCode ==
                        supportedLocale.languageCode) {
                      return deviceLocale;
                    }
                  }
                }
              }
              return supportedLocales.first;
            },
            home: const OnboardScreen(),
          );
        },
      ),
    );
  }
}
