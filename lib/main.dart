import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/core/constant/shared_pref.dart';
import 'package:graduation_project/feature/account/presentation/view_model/bloc/language_bloc.dart';
import 'package:graduation_project/feature/routing/app_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool storedValue = pref.getBool('boolValue') ?? false;
  final appRouter = AppRouter();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(isDarkTheme: storedValue),
      child: MyApp(
        appRouter: appRouter,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LanguageBloc(),
        ),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: appRouter.router,
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
          );
        },
      ),
    );
  }
}
