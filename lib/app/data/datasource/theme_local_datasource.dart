// import 'package:app_anime/app/domain/entities/theme_entity.dart';
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
    String isSaved = sharedPreferences.getString("CURRENT_THEME");
    print(isSaved);
    return Future.value(null);
  }

  @override
  Future<ThemeModel> saveTheme() async {
    // bool isSaved = await sharedPreferences.setString("CURRENT_THEME", TypesThemes.dartk.toString());
    return Future.value(null);
  }

}