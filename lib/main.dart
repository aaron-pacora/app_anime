import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:app_anime/core/navigation/route.dart';
import 'package:app_anime/app/colors.dart';
import 'package:app_anime/app/presentation/bloc/theme_bloc.dart';
import 'package:app_anime/injection_container.dart' as ij;

import 'package:app_anime/features/home/presentation/pages/recent_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ij.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(create: (_) => ij.sl<ThemeBloc>())
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (_, ThemeState state){
          return MaterialApp(
            title: 'Legion Anime',
            themeMode: state.themeMode,
            theme: ThemeData(
              primaryColor: PRIMARY_COLOR,
              accentColor: ACCENT_COLOR,
              fontFamily: 'Kalam',
              textTheme: TextTheme(
                body1: TextStyle(
                  fontSize: 16
                ),
                overline: TextStyle(color: Colors.white),
              ),
              iconTheme: IconThemeData(
                color: PRIMARY_COLOR
              ),
              canvasColor: BACKGROUND_COLOR,
              cupertinoOverrideTheme: CupertinoThemeData(
                primaryColor: Colors.white,
              ),
              cursorColor: Colors.white,
              backgroundColor: Colors.white
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              fontFamily: 'Kalam',
              accentColor: ACCENT_COLOR,
              textTheme: TextTheme(
                body1: TextStyle(
                  fontSize: 16
                ),
              ),
              cupertinoOverrideTheme: CupertinoThemeData(
                primaryColor: PRIMARY_COLOR,
              ),
              cursorColor: PRIMARY_COLOR
            ),
            onGenerateRoute: Routes.onGenerateRoute,
            home: RecentPage(),
          );
        },
      ),
    );
  }
}