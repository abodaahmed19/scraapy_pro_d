import 'package:flutter/material.dart';
import 'package:scraapy_pro/screens/services/presenation/screens/service_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0,
        title: const Text('الحساب الشخصي', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blue[900],
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 24),
              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  Text('أحمد بن حماد', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('+966 55 123 4567', style: TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildProfileMenuItem(Icons.person_outline, 'معلومات الحساب',context),
            _buildProfileMenuItem(Icons.list_alt, 'قوائمي',context),
            _buildProfileMenuItem(Icons.sync_alt, 'العمليات',context),
            _buildProfileMenuItem(Icons.local_shipping_outlined, 'الخدمات اللوجستية',context),
            _buildProfileMenuItem(Icons.description_outlined, 'العقود والوثائق',context),
            _buildProfileMenuItem(Icons.search_outlined, 'الفحص والهدم',context),
            _buildProfileMenuItem(Icons.bar_chart_outlined, 'التقارير',context),
            _buildProfileMenuItem(Icons.settings_outlined, 'الإعدادات والقانونية',context),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.logout, color: Colors.red),
                  label: const Text('تسجيل الخروج', style: TextStyle(color: Colors.red)),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileMenuItem(IconData icon, String title,BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue[900]),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {

          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ServicesPage()),
          );
        },
      ),
    );
  }
}
