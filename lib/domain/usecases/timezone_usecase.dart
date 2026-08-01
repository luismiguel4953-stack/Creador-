import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/timezone_entity.dart';
import '../repositories/timezone_repository.dart';

/// TimeZone Use Cases
/// Contains business logic for timezone operations

class TimeZoneUseCases {
  final TimeZoneRepository timeZoneRepository;

  TimeZoneUseCases({required this.timeZoneRepository});

  /// Get all available timezones
  Future<Either<Failure, List<TimeZoneEntity>>> getAllTimeZones() async {
    return timeZoneRepository.getAllTimeZones();
  }

  /// Get current time in specific timezone
  Future<Either<Failure, DateTime>> getTimeInTimeZone(
    String timezoneName,
  ) async {
    return timeZoneRepository.getTimeInTimeZone(timezoneName);
  }
}
