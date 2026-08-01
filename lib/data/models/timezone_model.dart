import 'package:equatable/equatable.dart';

/// TimeZone Model
/// Data model for timezone with JSON serialization

class TimeZoneModel extends Equatable {
  final String name;
  final String timezone;
  final String offset;
  final String city;

  const TimeZoneModel({
    required this.name,
    required this.timezone,
    required this.offset,
    required this.city,
  });

  /// Create TimeZoneModel from JSON
  factory TimeZoneModel.fromJson(Map<String, dynamic> json) {
    return TimeZoneModel(
      name: json['name'] as String,
      timezone: json['timezone'] as String,
      offset: json['offset'] as String,
      city: json['city'] as String,
    );
  }

  /// Convert TimeZoneModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'timezone': timezone,
      'offset': offset,
      'city': city,
    };
  }

  /// Convert to Entity
  toEntity() {
    return TimeZoneEntity(
      name: name,
      timezone: timezone,
      offset: offset,
      city: city,
    );
  }

  @override
  List<Object> get props => [name, timezone, offset, city];
}

/// Import for convenience
import '../entities/timezone_entity.dart';

class TimeZoneEntity {
  final String name;
  final String timezone;
  final String offset;
  final String city;

  TimeZoneEntity({
    required this.name,
    required this.timezone,
    required this.offset,
    required this.city,
  });
}