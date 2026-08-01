import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/timezone_entity.dart';

/// TimeZone Repository Interface
/// Defines contract for timezone operations

abstract class TimeZoneRepository {
  /// Get all available timezones
  Future<Either<Failure, List<TimeZoneEntity>>> getAllTimeZones();

  /// Get current time in specific timezone
  Future<Either<Failure, DateTime>> getTimeInTimeZone(String timezoneName);
}
