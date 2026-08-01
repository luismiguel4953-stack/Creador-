import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Digital Clock Widget
/// Displays time in a digital format for a specific timezone

class DigitalClockWidget extends StatelessWidget {
  final DateTime time;
  final String city;
  final String timezone;
  final String offset;

  const DigitalClockWidget({
    required this.time,
    required this.city,
    required this.timezone,
    required this.offset,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('HH:mm:ss');
    final timeString = formatter.format(time);
    final dateString = DateFormat('EEEE, MMMM d').format(time);

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              city,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              timezone,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey,
                  ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    timeString,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontFamily: 'monospace',
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    dateString,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              offset,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.amber,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}