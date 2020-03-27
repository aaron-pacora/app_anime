import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class AnimeEntity extends Equatable{
  final int id;
  final String title;
  final String urlCover;

  AnimeEntity({
    @required this.id,
    @required this.title,
    @required this.urlCover,
  });

  @override
  List<Object> get props => [id, title, urlCover];
}