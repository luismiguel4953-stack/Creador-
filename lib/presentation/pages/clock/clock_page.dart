import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/utils/logger.dart';
import '../providers/timezone_provider.dart';
import '../widgets/digital_clock_widget.dart';

/// Clock Page
/// Displays digital clocks for multiple timezones

class ClockPage extends ConsumerWidget {
  const ClockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allTimezones = ref.watch(fetchAllTimeZonesProvider);
    final currentTime = ref.watch(currentTimeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('World Clock'),
        centerTitle: true,
      ),
      body: allTimezones.when(
        data: (timezones) => currentTime.when(
          data: (time) => ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: timezones.length,
            itemBuilder: (context, index) {
              final timezone = timezones[index];
              // Calculate offset in hours
              final offsetStr = timezone.offset;
              int hours = 0;
              if (offsetStr.contains('+')) {
                hours = int.parse(offsetStr.split('+')[1].split(':')[0]);
              } else if (offsetStr.contains('-')) {
                hours = -int.parse(offsetStr.split('-')[1].split(':')[0]);
              }

              final tzTime = time.add(Duration(hours: hours));

              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: DigitalClockWidget(
                  time: tzTime,
                  city: timezone.city,
                  timezone: timezone.name,
                  offset: timezone.offset,
                ),
              );
            },
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(
            child: Text('Error: $error'),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) {
          AppLogger.error('Error loading timezones', error, stackTrace);
          return Center(
            child: Text('Error loading timezones: $error'),
          );
        },
      ),
    );
  }
}