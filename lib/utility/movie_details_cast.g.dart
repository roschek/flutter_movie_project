// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsCast _$MovieDetailsCastFromJson(Map<String, dynamic> json) {
  return MovieDetailsCast(
    cast: (json['cast'] as List<dynamic>)
        .map((e) => Cast.fromJson(e as Map<String, dynamic>))
        .toList(),
    crew: (json['crew'] as List<dynamic>)
        .map((e) => Crew.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MovieDetailsCastToJson(MovieDetailsCast instance) =>
    <String, dynamic>{
      'cast': instance.cast.map((e) => e.toJson()).toList(),
      'crew': instance.crew.map((e) => e.toJson()).toList(),
    };

Cast _$CastFromJson(Map<String, dynamic> json) {
  return Cast(
    adult: json['adult'] as bool,
    castId: json['cast_id'] as int,
    character: json['character'] as String,
    creditId: json['credit_id'] as String,
    gender: json['gender'] as int?,
    id: json['id'] as int,
    knownForDepartment: json['known_for_department'] as String,
    name: json['name'] as String,
    order: json['order'] as int,
    originalName: json['original_name'] as String,
    popularity: (json['popularity'] as num).toDouble(),
    profilePath: json['profile_path'] as String?,
  );
}

Map<String, dynamic> _$CastToJson(Cast instance) => <String, dynamic>{
      'adult': instance.adult,
      'cast_id': instance.castId,
      'character': instance.character,
      'credit_id': instance.creditId,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'order': instance.order,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
    };

Crew _$CrewFromJson(Map<String, dynamic> json) {
  return Crew(
    adult: json['adult'] as bool,
    creditId: json['credit_id'] as String,
    department: json['department'] as String,
    gender: json['gender'] as int,
    id: json['id'] as int,
    job: json['job'] as String,
    knownForDepartment: json['known_for_department'] as String,
    name: json['name'] as String,
    originalName: json['original_name'] as String,
    popularity: (json['popularity'] as num).toDouble(),
    profilePath: json['profile_path'] as String?,
  );
}

Map<String, dynamic> _$CrewToJson(Crew instance) => <String, dynamic>{
      'adult': instance.adult,
      'credit_id': instance.creditId,
      'department': instance.department,
      'gender': instance.gender,
      'id': instance.id,
      'job': instance.job,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
    };
