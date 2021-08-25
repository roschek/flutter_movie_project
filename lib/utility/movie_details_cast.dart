import 'package:json_annotation/json_annotation.dart';

part 'movie_details_cast.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetailsCast {
   final List<Cast> cast;
   final List<Crew> crew;


    MovieDetailsCast({
     required this.cast,
     required this.crew});

   factory MovieDetailsCast.fromJson(Map<String, dynamic> json) =>
       _$MovieDetailsCastFromJson(json);
   Map<String, dynamic> toJson() => _$MovieDetailsCastToJson(this);

}
@JsonSerializable(fieldRename: FieldRename.snake)
class Cast {
   final bool adult;
   final int castId;
   final String character;
   final String creditId;
   final int? gender;
   final int id;
   final String knownForDepartment;
   final String name;
   final int order;
   final String originalName;
   final double popularity;
   final String? profilePath;

    Cast({
     required this.adult,
     required this.castId,
     required this.character,
     required this.creditId,
     required this.gender,
     required this.id,
     required this.knownForDepartment,
     required this.name,
     required this.order,
     required this.originalName,
     required this.popularity,
     required this.profilePath});

   factory Cast.fromJson(Map<String, dynamic> json) =>
       _$CastFromJson(json);
   Map<String, dynamic> toJson() => _$CastToJson(this);


}
@JsonSerializable(fieldRename: FieldRename.snake)
class Crew {
  final  bool adult;
  final  String creditId;
  final  String department;
  final  int gender;
  final  int id;
  final  String job;
  final  String knownForDepartment;
  final  String name;
  final  String originalName;
  final  double popularity;
  final  String? profilePath;

    Crew({
     required this.adult,
     required this.creditId,
     required this.department,
     required this.gender,
     required this.id,
     required this.job,
     required this.knownForDepartment,
     required this.name,
     required this.originalName,
     required this.popularity,
     required this.profilePath});

  factory Crew.fromJson(Map<String, dynamic> json) =>
      _$CrewFromJson(json);
  Map<String, dynamic> toJson() => _$CrewToJson(this);

}