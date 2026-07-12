import 'package:flutter/material.dart';
import '../../widgets/responsive_layout.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الإشعارات'),
        centerTitle: true,
      ),
      body: ResponsiveLayout(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSectionHeader('اليوم'),
              const SizedBox(height: 8),
              _buildNotificationCard('حاوية فرز نفايات مكتبية 4x', 'Status changed to reviewing'),
              _buildNotificationCard('حاوية فرز نفايات مكتبية 4x', 'Status changed to reviewing'),
              const SizedBox(height: 24),
              _buildSectionHeader('الأمس'),
              const SizedBox(height: 8),
              _buildNotificationCard('حاوية فرز نفايات مكتبية 4x', 'Status changed to reviewing'),
              _buildNotificationCard('حاوية فرز نفايات مكتبية 4x', 'Status changed to reviewing'),
              _buildNotificationCard('حاوية فرز نفايات مكتبية 4x', 'Status changed to reviewing'),
              _buildNotificationCard('حاوية فرز نفايات مكتبية 4x', 'Status changed to reviewing'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'Cairo',
      ),
    );
  }

  Widget _buildNotificationCard(String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.black12),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.close, size: 20, color: Colors.grey),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(width: 12),
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Color(0xFF189491),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
