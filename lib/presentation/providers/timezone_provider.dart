import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/local/timezone_local_data_source.dart';
import '../../data/datasources/remote/timezone_remote_data_source.dart';
import '../../data/repositories/timezone_repository_impl.dart';
import '../../domain/entities/timezone_entity.dart';
import '../../domain/repositories/timezone_repository.dart';
import '../../domain/usecases/timezone_usecase.dart';
import '../../service_locator.dart';

/// TimeZone Providers
/// Riverpod providers for timezone operations

// TimeZone Repository provider
final timeZoneRepositoryProvider = Provider<TimeZoneRepository>((ref) {
  return TimeZoneRepositoryImpl(
    localDataSource: TimeZoneLocalDataSourceImpl(),
    remoteDataSource: TimeZoneRemoteDataSourceImpl(),
  );
});

// TimeZone Use Cases provider
final timeZoneUseCasesProvider = Provider<TimeZoneUseCases>((ref) {
  return TimeZoneUseCases(
    timeZoneRepository: ref.watch(timeZoneRepositoryProvider),
  );
});

// Fetch all timezones
final fetchAllTimeZonesProvider = FutureProvider<List<TimeZoneEntity>>((ref) async {
  final useCases = ref.watch(timeZoneUseCasesProvider);
  final result = await useCases.getAllTimeZones();
  return result.fold(
    (failure) => throw Exception(failure.message),
    (timezones) => timezones,
  );
});

// Get time in specific timezone
final getTimeInTimeZoneProvider =
    FutureProvider.family<DateTime, String>((ref, timezone) async {
  final useCases = ref.watch(timeZoneUseCasesProvider);
  final result = await useCases.getTimeInTimeZone(timezone);
  return result.fold(
    (failure) => throw Exception(failure.message),
    (time) => time,
  );
});

// Current time provider that updates every second
final currentTimeProvider = StreamProvider<DateTime>((ref) {
  return Stream.periodic(
    const Duration(seconds: 1),
    (_) => DateTime.now(),
  ).startWith(DateTime.now());
});
