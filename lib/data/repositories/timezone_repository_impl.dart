import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/timezone_entity.dart';
import '../../domain/repositories/timezone_repository.dart';
import '../datasources/local/timezone_local_data_source.dart';
import '../datasources/remote/timezone_remote_data_source.dart';

/// TimeZone Repository Implementation
/// Implements business logic for timezone operations

class TimeZoneRepositoryImpl implements TimeZoneRepository {
  final TimeZoneLocalDataSource localDataSource;
  final TimeZoneRemoteDataSource remoteDataSource;

  TimeZoneRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<TimeZoneEntity>>> getAllTimeZones() async {
    try {
      final timezones = await localDataSource.getAllTimeZones();
      return Right(timezones.map((tz) => tz.toEntity()).toList());
    } catch (e) {
      return Left(DatabaseFailure(message: 'Failed to load timezones'));
    }
  }

  @override
  Future<Either<Failure, DateTime>> getTimeInTimeZone(String timezoneName) async {
    try {
      final time = await remoteDataSource.getTimeInTimeZone(timezoneName);
      return Right(time);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to get time in timezone'));
    }
  }
}