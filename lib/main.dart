import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:app_anime/app/colors.dart';
import 'package:app_anime/app/presentation/bloc/theme_bloc.dart';
import 'package:app_anime/features/home/presentation/pages/list_animes_page.dart';
import 'package:app_anime/injection_container.dart' as ij;

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
            theme: ThemeData(
              brightness: state.brightness,
              accentColor: ACCENT_COLOR,
              fontFamily: 'Kalam',
              textTheme: TextTheme(
                body1: TextStyle(
                  fontSize: 16
                )
              )
            ),
            home: ListAnimesPage(),
          );
        },
      ),
    );
  }
}