import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/core/helper/api_helper.dart';
import 'package:graduation_project/feature/account/presentation/view_model/language_bloc/language_bloc.dart';
import 'package:graduation_project/feature/routing/app_router.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'core/helper/location_service.dart';
import 'feature/account/data/repository/user_repo_impl.dart';
import 'feature/account/presentation/view_model/user_data_cubit/user_data_cubit.dart';
import 'feature/map/presentation/view_model/bloc/map_bloc.dart';
import 'feature/map/presentation/view_model/bloc/map_event.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final String token;
  const MyApp({
    super.key,
    required this.appRouter,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LanguageBloc(),
        ),
        // BlocProvider(
        //   create: (context) =>
        //       UserDataCubit(UserRepoImpl(ApiHelper()))..fetchUserData(token),
        // ),
        BlocProvider(
          create: (context) => MapBloc(LocationService())..add(LoadMap()),
        ),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return MaterialApp.router(
            builder: FlutterSmartDialog.init(),
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
