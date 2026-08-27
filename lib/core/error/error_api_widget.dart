import 'package:flutter/material.dart';
import 'package:scraapy_pro/core/error/api_exception.dart';

class ApiErrorWidget extends StatelessWidget {
  final ApiException exception;
  final VoidCallback? onRetry;

  const ApiErrorWidget({
    super.key,
    required this.exception,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final statusCode = exception.statusCode;

    String title;
    IconData icon;

    if (statusCode == 401) {
      title = 'Session expired';
      icon = Icons.lock_outline;
    } else if (statusCode == 403) {
      title = 'Access denied';
      icon = Icons.block;
    } else if (statusCode == 404) {
      title = 'Not found';
      icon = Icons.search_off;
    } else if (statusCode != null && statusCode >= 500) {
      title = 'Server error';
      icon = Icons.cloud_off;
    } else {
      title = 'Something went wrong';
      icon = Icons.error_outline;
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 56,
            ),

            const SizedBox(height: 16),

            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              exception.message,
              textAlign: TextAlign.center,
            ),

            if (onRetry != null) ...[
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: onRetry,
                child: const Text('Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}