// import 'package:app_anime/app/domain/entities/theme_entity.dart';
import 'package:app_anime/app/domain/entities/theme_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app_anime/app/data/models/theme_model.dart';

abstract class ThemeLocalDatasource {
  Future<ThemeModel> saveTheme();
  Future<ThemeModel> getTheme();
}

class ThemeLocalDatasourceImpl implements ThemeLocalDatasource {

  final SharedPreferences sharedPreferences;
  ThemeLocalDatasourceImpl({this.sharedPreferences});

  @override
  Future<ThemeModel> getTheme() async {
    DateTime now = DateTime.now();
    if(now.hour >= 6 && now.hour <= 18){
      return Future.value(ThemeModel(currentTheme: TypesThemes.ligth));
    }
    return Future.value(ThemeModel(currentTheme: TypesThemes.dark));
  }

  @override
  Future<ThemeModel> saveTheme() async {
    // bool isSaved = await sharedPreferences.setString("CURRENT_THEME", TypesThemes.dartk.toString());
    return Future.value(null);
  }

}