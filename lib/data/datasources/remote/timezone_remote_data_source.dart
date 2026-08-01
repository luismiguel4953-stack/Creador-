import '../models/timezone_model.dart';

/// TimeZone Remote Data Source Interface
abstract class TimeZoneRemoteDataSource {
  Future<DateTime> getTimeInTimeZone(String timezoneName);
}

/// TimeZone Remote Data Source Implementation
class TimeZoneRemoteDataSourceImpl implements TimeZoneRemoteDataSource {
  @override
  Future<DateTime> getTimeInTimeZone(String timezoneName) async {
    // Get current time and convert to timezone
    final now = DateTime.now().toUtc();
    
    // Map timezone names to UTC offsets
    final tzOffsets = {
      'America/New_York': -5,
      'America/Chicago': -6,
      'America/Denver': -7,
      'America/Los_Angeles': -8,
      'Europe/London': 0,
      'Europe/Berlin': 1,
      'Asia/Dubai': 4,
      'Asia/Kolkata': 5.5,
      'Asia/Bangkok': 7,
      'Asia/Shanghai': 8,
      'Asia/Tokyo': 9,
      'Australia/Sydney': 10,
    };
    
    final offset = tzOffsets[timezoneName] ?? 0;
    return now.add(Duration(hours: offset.toInt()));
  }
}