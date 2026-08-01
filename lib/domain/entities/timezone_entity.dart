import 'package:equatable/equatable.dart';

/// TimeZone Entity
/// Represents a timezone with its information

class TimeZoneEntity extends Equatable {
  final String name;
  final String timezone;
  final String offset;
  final String city;

  const TimeZoneEntity({
    required this.name,
    required this.timezone,
    required this.offset,
    required this.city,
  });

  @override
  List<Object> get props => [name, timezone, offset, city];
}