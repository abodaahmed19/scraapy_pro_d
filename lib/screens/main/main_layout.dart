import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/app_cubit.dart';
import '../../cubit/app_state.dart';
import '../home/presentation/screens/home_screen.dart';
import '../market/presentation/screens/market_screen.dart';
import '../quotes/quotes_screen.dart';
import '../contracts/contracts_screen.dart';
import '../profile/profile_screen.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  final List<Widget> _screens = const [
    HomeScreen(),
    MarketScreen(),
    QuotesScreen(),
    ContractsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        int currentIndex = 0;
        if (state is NavigationState) {
          currentIndex = state.selectedIndex;
        }

        return Scaffold(
          body: _screens[currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                context.read<AppCubit>().changeBottomNavBar(index);
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: Theme.of(context).colorScheme.surface,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              unselectedItemColor: Colors.grey,
              elevation: 0,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'الصفحة الرئيسية'),
                BottomNavigationBarItem(icon: Icon(Icons.insights_outlined), activeIcon: Icon(Icons.insights), label: 'السوق'),
                BottomNavigationBarItem(icon: Icon(Icons.local_offer_outlined), activeIcon: Icon(Icons.local_offer), label: 'طلب عرض سعر'),
                BottomNavigationBarItem(icon: Icon(Icons.edit_document), activeIcon: Icon(Icons.edit_document), label: 'العقود'),
                BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'الحساب الشخصي'),
              ],
            ),
          ),
        );
      },
    );
  }
}
