import 'package:app_anime/app/domain/entities/theme_entity.dart';
import 'package:meta/meta.dart';

class ThemeModel extends ThemeEntity{
  final TypesThemes currentTheme;

  ThemeModel({
    @required this.currentTheme
  });

  @override
  List<Object> get props => [
    currentTheme
  ];

}