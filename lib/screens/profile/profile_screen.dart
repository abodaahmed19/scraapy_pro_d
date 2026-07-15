import 'package:flutter/material.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/screens/personal_account_screen.dart';
import '../../widgets/responsive_layout.dart';
import '../address/add_address_screen.dart';
import '../checkout/checkout_screen.dart';
import '../inspection/inspection_request_screen.dart';
import '../notifications/notifications_screen.dart';
import '../favorites/presentation/screens/favorites_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        title: const Text('الحساب الشخصي', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.edit_outlined, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: ResponsiveLayout(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Theme.of(context).colorScheme.primary,
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 32, top: 16),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white.withValues(alpha: 0.2),
                          child: const CircleAvatar(
                            radius: 46,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person, size: 50, color: Colors.grey),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                          child: const Icon(Icons.check, size: 16, color: Colors.white),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text('أحمد بن حماد', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(20)),
                      child: const Text('+966 55 123 4567', style: TextStyle(color: Colors.white, fontSize: 14)),
                    ),
                  ],
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -20),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      _buildProfileMenuCard(
                        context,
                        [
                          _buildProfileMenuItem(context, Icons.person_outline, 'معلومات الحساب', destination: const PersonalAccountScreen()),
                          _buildProfileMenuItem(context, Icons.list_alt, 'قوائمي'),
                          _buildProfileMenuItem(context, Icons.location_on_outlined, 'إضافة عنوان (جديد)', destination: const AddAddressScreen()),
                          _buildProfileMenuItem(context, Icons.payment_outlined, 'الدفع (جديد)', destination: const CheckoutScreen()),
                          _buildProfileMenuItem(context, Icons.favorite_border, 'المفضلة (جديد)', destination: const FavoritesScreen()),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildProfileMenuCard(
                        context,
                        [
                          _buildProfileMenuItem(context, Icons.notifications_outlined, 'الإشعارات (جديد)', destination: const NotificationsScreen()),
                          _buildProfileMenuItem(context, Icons.search_outlined, 'الفحص والهدم (جديد)', destination: const InspectionRequestScreen()),
                          _buildProfileMenuItem(context, Icons.bar_chart_outlined, 'التقارير'),
                          _buildProfileMenuItem(context, Icons.settings_outlined, 'الإعدادات والقانونية', isLast: true),
                        ],
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.logout_rounded, color: Colors.redAccent),
                          label: const Text('تسجيل الخروج', style: TextStyle(color: Colors.redAccent, fontSize: 16, fontWeight: FontWeight.bold)),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.redAccent, width: 1.5),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 48),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileMenuCard(BuildContext context, List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 15, offset: const Offset(0, 8))],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildProfileMenuItem(BuildContext context, IconData icon, String title, {bool isLast = false, Widget? destination}) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, color: Theme.of(context).colorScheme.primary),
          ),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
          trailing: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Theme.of(context).dividerColor),
          onTap: () {
            if (destination != null) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => destination));
            }
          },
        ),
        if (!isLast) Divider(height: 1, indent: 64, color: Theme.of(context).dividerColor.withValues(alpha: 0.1)),
      ],
    );
  }
}
