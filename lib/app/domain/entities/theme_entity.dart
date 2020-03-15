import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ThemeEntity extends Equatable{
  final TypesThemes currentTheme;

  ThemeEntity({
    @required this.currentTheme
  });

  @override
  List<Object> get props => [
    currentTheme
  ];

}

enum TypesThemes {
  dartk, ligth, custom
}