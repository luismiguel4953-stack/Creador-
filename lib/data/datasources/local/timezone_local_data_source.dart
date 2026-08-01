import '../models/timezone_model.dart';

/// TimeZone Local Data Source Interface
abstract class TimeZoneLocalDataSource {
  Future<List<TimeZoneModel>> getAllTimeZones();
  Future<void> saveTimeZones(List<TimeZoneModel> timezones);
}

/// TimeZone Local Data Source Implementation
class TimeZoneLocalDataSourceImpl implements TimeZoneLocalDataSource {
  @override
  Future<List<TimeZoneModel>> getAllTimeZones() async {
    // Return hardcoded list of popular timezones
    return [
      const TimeZoneModel(
        name: 'Eastern Time',
        timezone: 'America/New_York',
        offset: 'UTC-5',
        city: 'New York',
      ),
      const TimeZoneModel(
        name: 'Central Time',
        timezone: 'America/Chicago',
        offset: 'UTC-6',
        city: 'Chicago',
      ),
      const TimeZoneModel(
        name: 'Mountain Time',
        timezone: 'America/Denver',
        offset: 'UTC-7',
        city: 'Denver',
      ),
      const TimeZoneModel(
        name: 'Pacific Time',
        timezone: 'America/Los_Angeles',
        offset: 'UTC-8',
        city: 'Los Angeles',
      ),
      const TimeZoneModel(
        name: 'London',
        timezone: 'Europe/London',
        offset: 'UTC+0',
        city: 'London',
      ),
      const TimeZoneModel(
        name: 'Central European Time',
        timezone: 'Europe/Berlin',
        offset: 'UTC+1',
        city: 'Berlin',
      ),
      const TimeZoneModel(
        name: 'Middle East Time',
        timezone: 'Asia/Dubai',
        offset: 'UTC+4',
        city: 'Dubai',
      ),
      const TimeZoneModel(
        name: 'India Standard Time',
        timezone: 'Asia/Kolkata',
        offset: 'UTC+5:30',
        city: 'Mumbai',
      ),
      const TimeZoneModel(
        name: 'Bangkok Time',
        timezone: 'Asia/Bangkok',
        offset: 'UTC+7',
        city: 'Bangkok',
      ),
      const TimeZoneModel(
        name: 'China Standard Time',
        timezone: 'Asia/Shanghai',
        offset: 'UTC+8',
        city: 'Shanghai',
      ),
      const TimeZoneModel(
        name: 'Japan Standard Time',
        timezone: 'Asia/Tokyo',
        offset: 'UTC+9',
        city: 'Tokyo',
      ),
      const TimeZoneModel(
        name: 'Sydney',
        timezone: 'Australia/Sydney',
        offset: 'UTC+10',
        city: 'Sydney',
      ),
    ];
  }

  @override
  Future<void> saveTimeZones(List<TimeZoneModel> timezones) async {
    // TODO: Implement local storage of timezones
  }
}