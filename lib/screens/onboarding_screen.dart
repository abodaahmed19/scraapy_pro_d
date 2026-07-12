import 'package:flutter/material.dart';
import '../../widgets/responsive_layout.dart';
import 'main/main_layout.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveLayout(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Icon(Icons.recycling, size: 100, color: Theme.of(context).colorScheme.primary),
                const SizedBox(height: 32),
                Text(
                  'سكرابي برو',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'أول منصة رقمية مرخصة من "موان" لإدارة النفايات الصناعية والتجارية والخدمية. تعلّم إزاي تفصل النفايات وحدد نوعها علشان يتم إعادة تدويرها بشكل صحيح.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Theme.of(context).textTheme.bodyLarge?.color, height: 1.5),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MainLayout()),
                        );
                      },
                      child: Text('تخطي', style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MainLayout()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('البدء'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
